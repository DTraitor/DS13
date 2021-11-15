/*
Research and Development (R&D) Console
This is the main work horse of the R&D system. It contains the menus/controls for the Destructive Analyzer, Protolathe, and Circuit
imprinter. It also contains the /datum/research holder with all the known/possible technology paths and device designs.
Basic use: When it first is created, it will attempt to link up to related devices within 3 squares. It'll only link up if they
aren't already linked to another console. Any consoles it cannot link up with (either because all of a certain type are already
linked or there aren't any in range), you'll just not have access to that menu. In the settings menu, there are menu options that
allow a player to attempt to re-sync with nearby consoles. You can also force it to disconnect from a specific console.
The imprinting and construction menus do NOT require toxins access to access but all the other menus do. However, if you leave it
on a menu, nothing is to stop the person from using the options on that menu (although they won't be able to change to a different
one). You can also lock the console on the settings menu if you're feeling paranoid and you don't want anyone messing with it who
doesn't have toxins access.
When a R&D console is destroyed or even partially disassembled, you lose all research data on it. However, there is a way around
this dire fate:
- Go to the settings menu and select "Sync Database with Network." That causes it to upload (but not download)
it's data to every other device in the game. Each console has a "disconnect from network" option that'll will cause data base sync
operations to skip that console. This is useful if you want to make a "public" R&D console or, for example, give the engineers
a circuit imprinter with certain designs on it and don't want it accidentally updating. The downside of this method is that you have
to have physical access to the other console to send data back. Note: An R&D console is on CentCom so if a random griffan happens to
cause a ton of data to be lost, an admin can go send it back.
*/

/obj/machinery/computer/rdconsole
	name = "fabrication control console"
	desc = "Console controlling the various fabrication devices. Uses self-learning matrix to hold and optimize blueprints. Prone to corrupting said matrix, so back up often."
	icon_keyboard = "rd_key"
	icon_screen = "rdcomp"
	light_color = "#a97faa"
	circuit = /obj/item/weapon/circuitboard/rdconsole
	var/datum/research/files							//Stores all the collected research data.

	var/obj/machinery/r_n_d/destructive_analyzer/linked_destroy = null	//Linked Destructive Analyzer
	var/obj/machinery/r_n_d/protolathe/linked_lathe = null				//Linked Protolathe
	var/obj/machinery/r_n_d/circuit_imprinter/linked_imprinter = null	//Linked Circuit Imprinter

	var/id = 0				//ID of the computer (for server restrictions).
	var/sync = TRUE			//If sync = 0, it doesn't show up on Server Control Console
	var/can_research = TRUE	//Is this console capable of researching
	var/category = 4		//Stores current console category
	var/list/cats = list("Misc", "Misc", TECH_ENGINEERING)	//Stores protolathe, imprinter design category and tech tree tab

	req_access = list(access_research)	//Data and setting manipulation requires scientist access.

/obj/machinery/computer/rdconsole/proc/CallReagentName(var/reagent_type)
	var/datum/reagent/R = reagent_type
	return ispath(reagent_type, /datum/reagent) ? initial(R.name) : "Unknown"

/obj/machinery/computer/rdconsole/proc/SyncRDevices() //Makes sure it is properly sync'ed up with the devices attached to it (if any).
	for(var/obj/machinery/r_n_d/D in range(4, src))
		if(D.linked_console != null || D.panel_open)
			continue
		if(istype(D, /obj/machinery/r_n_d/destructive_analyzer))
			if(linked_destroy == null)
				linked_destroy = D
				D.linked_console = src
		else if(istype(D, /obj/machinery/r_n_d/protolathe))
			if(linked_lathe == null)
				linked_lathe = D
				D.linked_console = src
		else if(istype(D, /obj/machinery/r_n_d/circuit_imprinter))
			if(linked_imprinter == null)
				linked_imprinter = D
				D.linked_console = src
	return

/obj/machinery/computer/rdconsole/Initialize()
	.=..()
	files = new /datum/research(src) //Setup the research data holder
	SyncRDevices()
	sync_tech()

/obj/machinery/computer/rdconsole/Destroy()
	sync_tech()
	QDEL_NULL(files)
	if(linked_destroy)
		linked_destroy.linked_console = null
		linked_destroy = null
	if(linked_lathe)
		linked_lathe.linked_console = null
		linked_destroy = null
	if(linked_imprinter)
		linked_imprinter.linked_console = null
		linked_destroy = null
	.=..()

/obj/machinery/computer/rdconsole/attackby(var/obj/item/weapon/D as obj, var/mob/user as mob)
	if(istype(D, /obj/item/weapon/disk/research_points))
		var/obj/item/weapon/disk/research_points/disk = D
		to_chat(user, "<span class='notice'>[name] received [disk.stored_points] research points from [disk.name]</span>")
		files.research_points += disk.stored_points
		user.remove_from_mob(disk)
		qdel(disk)

	else
		.=..()

	var/list/uis = SStgui.get_open_uis(src)
	for(var/another_ui in uis)
		update_static_data(ui = another_ui)

/obj/machinery/computer/rdconsole/attack_hand(mob/user as mob)
	if(..())
		return
	if(linked_destroy?.loaded_item)
		var/icon/I = getFlatIcon(linked_destroy.loaded_item)
		user << browse_rsc(I, "da-[sanitizeFileName("[linked_destroy.loaded_item.type]")].png")
		qdel(I) // We don't want to make infinite amount of icons
	tgui_interact(user)

/obj/machinery/computer/rdconsole/attack_ai(mob/user)
	attack_hand(user)

/obj/machinery/computer/rdconsole/attack_ghost(mob/ghost)
	tgui_interact(ghost)

/obj/machinery/computer/rdconsole/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet/simple/rnd_designs),
		get_asset_datum(/datum/asset/spritesheet/simple/research_technologies)
	)

/obj/machinery/computer/rdconsole/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "RDConsole", "Research & Development Console")
		ui.open()

/obj/machinery/computer/rdconsole/ui_data(mob/user)
	var/list/data = list()
	data["sync"] = sync

	data["has_imprinter"] = linked_imprinter ? TRUE : FALSE
	data["has_protolathe"] = linked_lathe ? TRUE : FALSE
	data["has_destroy"] = linked_destroy ? TRUE : FALSE

	return data

/obj/machinery/computer/rdconsole/ui_static_data(mob/user)
	var/list/data = list()
	data["can_research"] = can_research

	data["research_points"] = files.research_points

	data["console_tab"] = category

	if(linked_lathe && category == PROTOLATHE)
		data["lathe_data"] = get_protolathe_data()

		data["lathe_queue_data"] = list()
		data["lathe_can_restart_queue"] = (linked_lathe.queue.len && !linked_lathe.busy)
		for(var/RNDD in linked_lathe.queue)
			data["lathe_queue_data"] += linked_lathe.queue[RNDD]["name"]

		data["lathe_possible_designs"] = get_possible_designs_data(PROTOLATHE)
		data["lathe_all_cats"] = files.design_categories_protolathe
		data["lathe_cat"] = cats[PROTOLATHE]

	if(linked_imprinter && category == IMPRINTER)
		data["imprinter_data"] = get_imprinter_data()

		data["imprinter_queue_data"] = list()
		data["imprinter_can_restart_queue"] = (linked_imprinter.queue.len && !linked_imprinter.busy)
		for(var/RNDD in linked_imprinter.queue)
			data["imprinter_queue_data"] += linked_imprinter.queue[RNDD]["name"]

		data["imprinter_possible_designs"] = get_possible_designs_data(IMPRINTER)
		data["imprinter_all_cats"] = files.design_categories_imprinter
		data["imprinter_cat"] = cats[IMPRINTER]

	if(category == 4)
		var/list/tech_tree_list = list()
		for(var/tech_tree_id in files.tech_trees_shown)
			var/datum/tech/Tech_Tree = SSresearch.tech_trees[tech_tree_id]
			var/list/tech_tree_data = list(
				"id" =			Tech_Tree.id,
				"name" =		capitalize(Tech_Tree.name),
				"shortname" =	capitalize(Tech_Tree.shortname),
				"level" =		files.tech_trees_shown[tech_tree_id],
				"maxlevel" =	Tech_Tree.maxlevel,
			)
			tech_tree_list += list(tech_tree_data)

		data["tech_trees"] = tech_tree_list

		if(linked_destroy)
			var/list/destroy_list = list(
				"has_item" = FALSE,
				"is_processing" = FALSE,
				"loading_item" = linked_destroy.loading
			)
			if(linked_destroy.loaded_item)
				var/list/tech_names = list(TECH_MATERIAL = "Materials", TECH_ENGINEERING = "Engineering", TECH_PHORON = "Phoron", TECH_POWER = "Power", TECH_BLUESPACE = "Blue-space", TECH_BIO = "Biotech", TECH_COMBAT = "Combat", TECH_MAGNET = "Electromagnetic", TECH_DATA = "Programming", TECH_ILLEGAL = "Illegal", TECH_NECRO = "Marker", TECH_ROBOT = "Roboticist")

				var/list/temp_tech = linked_destroy.loaded_item.origin_tech
				var/list/item_data = list()

				for(var/T in temp_tech)
					var/tech_name = tech_names[T]
					if(!tech_name)
						tech_name = T

					item_data += list(list(
						"id" =		T,
						"name" =	tech_name,
						"level" =	temp_tech[T],
					))

				// This calculates how much research points we missed because we already researched items with such orig_tech levels
				var/tech_points_mod = files.experiments.get_object_research_value(linked_destroy.loaded_item) / files.experiments.get_object_research_value(linked_destroy.loaded_item, ignoreRepeat = TRUE)

				destroy_list = list(
					"has_item" =			TRUE,
					"item_name" =			capitalize(linked_destroy.loaded_item.name),
					"item_desc" =			linked_destroy.loaded_item.desc,
					"icon_path" =			sanitizeFileName("[linked_destroy.loaded_item.type]"),
					"item_tech_points" =	files.experiments.get_object_research_value(linked_destroy.loaded_item),
					"item_tech_mod" = 		round(tech_points_mod*100),
					"is_processing" =		linked_destroy.busy,
					"loading_item" = 		linked_destroy.loading,
					"tech_data" = 			item_data
				)

			data["destroy_data"] = destroy_list

	if(category == 3)
		var/list/line_list = list()
		var/list/tech_list = list()
		var/list/tech_tree_list = list()

		for(var/tech_tree_id in files.tech_trees_shown)
			var/datum/tech/Tech_Tree = SSresearch.tech_trees[tech_tree_id]
			var/list/tech_tree_data = list(
				"id" =			Tech_Tree.id,
				"shortname" =	capitalize(Tech_Tree.shortname),
			)
			tech_tree_list += list(tech_tree_data)
		data["tech_trees"] = tech_tree_list
		data["tech_cat"] = cats[3]

		for(var/tech_id in files.all_technologies)
			var/datum/technology/Tech = SSresearch.all_technologies[tech_id]
			if(Tech.tech_type != cats[3])
				continue
			var/unlocks = list()
			var/req_techs_lock = list()
			var/req_techs_unlock = list()
			for(var/A in Tech.unlocks_designs)
				var/datum/design/temp = SSresearch.designs_by_id[A]
				unlocks |= capitalize(temp.name)
			for(var/A in Tech.required_technologies)
				var/datum/technology/temp = SSresearch.all_technologies[A]
				if(files.IsResearched(temp))
					req_techs_unlock |= capitalize(temp.name)
				else
					req_techs_lock |= capitalize(temp.name)
			var/list/tech_data = list(
				"id" =				Tech.id,
				"name" =			capitalize(Tech.name),
				"desc" =			Tech.desc,
				"tech_type" =		Tech.tech_type,
				"x" =				round(Tech.x*100),
				"y" =				round(Tech.y*100),
				"cost" =			Tech.cost,
				"isresearched" =	files.IsResearched(Tech),
				"canresearch" = 	files.CanResearch(Tech),
				"req_techs_lock" =	req_techs_lock,
				"req_techs_unlock" =req_techs_unlock,
				"unlocks_design" =	unlocks,
			)
			tech_list += list(tech_data)

			for(var/req_tech_id in Tech.required_technologies)
				if(req_tech_id in files.all_technologies)
					var/datum/technology/OTech = SSresearch.all_technologies[req_tech_id]
					if(OTech.tech_type == Tech.tech_type && !Tech.no_lines)
						var/line_x = (min(round(OTech.x*100), round(Tech.x*100)))
						var/line_y = (min(round(OTech.y*100), round(Tech.y*100)))
						var/width = (abs(round(OTech.x*100) - round(Tech.x*100)))
						var/height = (abs(round(OTech.y*100) - round(Tech.y*100)))

						var/istop = FALSE
						if(OTech.y > Tech.y)
							istop = TRUE
						var/isright = FALSE
						if(OTech.x < Tech.x)
							isright = TRUE

						var/list/line_data = list(
							"category" =	OTech.tech_type,
							"line_x" =		line_x,
							"line_y" =		line_y,
							"width" =		width,
							"height" =		height,
							"istop" =		istop,
							"isright" =		isright,
						)
						line_list += list(line_data)

		data["techs"] = tech_list
		data["lines"] = line_list

	return data

/obj/machinery/computer/rdconsole/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	if(..())
		return
	switch(action)
		if("change_tab")
			category = text2num(params["tab"])

		if("change_design_cat")
			if(text2num(params["machine"]) == PROTOLATHE)
				cats[PROTOLATHE] = params["tab"]

			else if(text2num(params["machine"]) == IMPRINTER)
				cats[IMPRINTER] = params["tab"]

			else if(text2num(params["machine"]) == 3)
				cats[3] = params["tab"]

		if("eject")
			var/amount = text2num(params["amount"])
			if(!amount)
				to_chat(usr, "<span class=\"alert\">[src] only accepts a numerical amount!</span>")
				return

			if(text2num(params["machine"]) == PROTOLATHE)
				linked_lathe?.eject_sheet(params["id"], round(amount))

			else if(text2num(params["machine"]) == IMPRINTER)
				linked_imprinter?.eject_sheet(params["id"], round(amount))

		if("build")
			var/amount=text2num(params["amount"])
			if(params["id"] in files.known_designs)
				var/datum/design/being_built = SSresearch.designs_by_id[params["id"]]
				if(amount)
					switch(text2num(params["machine"]))
						if(PROTOLATHE)
							linked_lathe?.queue_design(being_built, amount)
						if(IMPRINTER)
							linked_imprinter?.queue_design(being_built, amount)
			else
				log_and_message_admins("Possible hacker detected. User tried to print research design that wasn't yet researched. Design id: [params["id"]]", usr, usr.loc)

		if("research_tech")
			if(params["tech_id"] in files.all_technologies && can_research)
				var/datum/technology/T = SSresearch.all_technologies[params["tech_id"]]
				files.UnlockTechology(T)

		if("resync_machines")
			SyncRDevices()

		if("togglesync") //Prevents the console from being synced by other consoles. Can still send data.
			sync = !sync
			SStgui.update_uis(src)
			return // We dont need to send static data again

		if("disconnect")
			switch(text2num(params["machine"]))
				if(IMPRINTER)
					linked_imprinter.linked_console = null
					linked_imprinter = null
					if(category == IMPRINTER)
						category = 1

				if(PROTOLATHE)
					linked_lathe.linked_console = null
					linked_lathe = null
					if(category == PROTOLATHE)
						category = 1

				// Destructive analyzer
				if(3)
					linked_destroy.linked_console = null
					linked_destroy = null

		if("purge")
			var/amount = text2num(params["volume"])
			if(!amount)
				to_chat(usr, "<span class=\"alert\">[src] only accepts a numerical volume!</span>")
				return

			switch(params["machine"])
				if(PROTOLATHE)
					linked_lathe?.reagents.remove_reagents_of_type(text2path(params["type"]), round(amount))
				if(IMPRINTER)
					linked_imprinter?.reagents.remove_reagents_of_type(text2path(params["type"]), round(amount))

		if("deconstruct")
			linked_destroy?.deconstruct_item()

		if("eject_decon")
			linked_destroy?.eject_item(usr)

	var/list/uis = SStgui.get_open_uis(src)
	for(var/another_ui in uis)
		update_static_data(ui = another_ui)

/obj/machinery/computer/rdconsole/emp_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		playsound(src.loc, 'sound/effects/sparks4.ogg', 75, 1)
		emagged = 1
		to_chat(user, "<span class='notice'>You you disable the security protocols.</span>")
		return 1

/obj/machinery/computer/rdconsole/proc/find_devices()
	SyncRDevices()
	SStgui.update_uis(src)

/obj/machinery/computer/rdconsole/proc/sync_tech()
	for(var/obj/machinery/r_n_d/server/S in SSresearch.servers)
		var/server_processed = FALSE
		if((id in S.id_with_upload))
			S.files.download_from(files)
			server_processed = TRUE
		if(((id in S.id_with_download)))
			files.download_from(S.files)
			server_processed = TRUE
		if(server_processed)
			S.produce_heat(100)
	SStgui.update_uis(src)

/obj/machinery/computer/rdconsole/proc/get_protolathe_data()
	var/list/protolathe_list = list(
		"machine_id" =				PROTOLATHE,
		"max_material_storage" =	linked_lathe.max_material_storage,
		"total_materials" =			linked_lathe.TotalMaterials(),
		"total_volume" =			linked_lathe.reagents.total_volume,
		"maximum_volume" =			linked_lathe.reagents.maximum_volume,
	)
	var/list/protolathe_reagent_list = list()
	for(var/datum/reagent/R in linked_lathe.reagents.reagent_list)
		protolathe_reagent_list += list(list(
			"name" =	R.name,
			"volume" =	R.volume,
			"type" =	R.type
		))
	protolathe_list["reagents"] = protolathe_reagent_list
	var/list/material_list = list()
	for(var/M in linked_lathe.materials)
		if(linked_lathe.materials[M]["amount"])
			material_list += list(list(
				"id" =		M,
				"name" =	linked_lathe.materials[M]["name"],
				"amount" =	linked_lathe.materials[M]["amount"],
			))
	protolathe_list["materials"] = material_list
	return protolathe_list

/obj/machinery/computer/rdconsole/proc/get_imprinter_data()
	var/list/imprinter_list = list(
		"machine_id" =				IMPRINTER,
		"max_material_storage" =	linked_imprinter.max_material_storage,
		"total_materials" =			linked_imprinter.TotalMaterials(),
		"total_volume" =			linked_imprinter.reagents.total_volume,
		"maximum_volume" =			linked_imprinter.reagents.maximum_volume,
	)
	var/list/printer_reagent_list = list()
	for(var/datum/reagent/R in linked_imprinter.reagents.reagent_list)
		printer_reagent_list += list(list(
			"name" =	R.name,
			"volume" =	R.volume,
			"type" =	R.type,
		))
	imprinter_list["reagents"] = printer_reagent_list
	var/list/material_list = list()
	for(var/M in linked_imprinter.materials)
		if(linked_imprinter.materials[M]["amount"])
			material_list += list(list(
				"id" =		M,
				"name" =	linked_imprinter.materials[M]["name"],
				"amount" =	linked_imprinter.materials[M]["amount"],
			))
	imprinter_list["materials"] = material_list
	return imprinter_list

/obj/machinery/computer/rdconsole/proc/get_possible_designs_data(build_type)
	var/coeff = 1
	if(build_type == PROTOLATHE)
		coeff = linked_lathe.efficiency_coeff
	if(build_type == IMPRINTER)
		coeff = linked_imprinter.efficiency_coeff

	var/list/designs_list = list()
	for(var/I in files.known_designs)
		var/datum/design/D = SSresearch.designs_by_id[I]
		if(D.build_type & build_type && D.category == cats[build_type])
			var/cat = "Unspecified"
			if(D.category)
				cat = D.category
			var/materials = list()
			var/chemicals = list()
			var/c = 50
			var/t
			for(var/M in D.materials)
				if(build_type == PROTOLATHE)
					t = linked_lathe.check_mat(D, M)
				if(build_type == IMPRINTER)
					t = linked_imprinter.check_mat(D, M)

				materials += list(list("name" = capitalize(M), "amount" = D.materials[M]*coeff, "id" = M, "can_make" = t >= 1 ? TRUE:FALSE))
				c = min(t,c)

			if(D.chemicals.len)
				for(var/R as anything in D.chemicals)
					if(build_type == PROTOLATHE)
						t = linked_lathe.check_mat(D, R)
					if(build_type == IMPRINTER)
						t = linked_imprinter.check_mat(D, R)

					chemicals += list(list("name" = CallReagentName(R), "amount" = D.chemicals[R]*coeff, "id" = R))
					c = min(t,c)

			designs_list += list(list(
				"id" =			D.id,
				"name" =		D.name,
				"desc" =		D.desc,
				"full_desc" =	D.full_desc,
				"category" =	cat,
				"can_create" =	c,
				"mats" =		materials,
				"chems" =		chemicals,
				"icon_width" =	D.ui_data["icon_width"]*2,
				"icon_height" = D.ui_data["icon_height"]*2
			))
	return designs_list

/obj/machinery/computer/rdconsole/core
	name = "R&D Console"
	id = 1
	can_research = TRUE
