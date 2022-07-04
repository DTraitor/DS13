/obj/machinery/r_n_d/destructive_analyzer
	name = "Destructive Analyzer"
	icon_state = "d_analyzer"
	var/obj/item/weapon/loaded_item = null
	var/loading = FALSE
	circuit = /obj/item/weapon/circuitboard/destructive_analyzer

/obj/machinery/r_n_d/destructive_analyzer/Destroy()
	. = ..()
	if(linked_console)
		linked_console.linked_destroy = null
		SStgui.update_uis(linked_console)
		linked_console = null

/obj/machinery/r_n_d/destructive_analyzer/update_icon()
	if(panel_open)
		icon_state = "d_analyzer_t"
	else if(busy)
		icon_state = "d_analyzer_process"
	else if(loading)
		icon_state = "d_analyzer_la"
	else if(loaded_item)
		icon_state = "d_analyzer_l"
	else
		icon_state = "d_analyzer"

/obj/machinery/r_n_d/destructive_analyzer/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if (user.a_intent == I_HURT && istype(O, /obj/item/weapon/tool/screwdriver))
		default_deconstruction_screwdriver(user, O)
		update_icon()
		if(linked_console)
			linked_console.linked_destroy = null
			if(linked_console.cats[4] == 4)
				SStgui.update_uis(linked_console, TRUE)
			linked_console = null
		return

	if(default_part_replacement(user, O))
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(panel_open)
		to_chat(user, "<span class='notice'>You can't load \the [src] while it's opened.</span>")
		return 1
	if(!linked_console)
		to_chat(user, "<span class='notice'>\The [src] must be linked to an R&D console first.</span>")
		return
	if (busy||loading)
		to_chat(user, "<span class='warning'> The [src] is busy right now.</span>")
		return
	if (istype(O, /obj/item) && !loaded_item)
		if(isrobot(user)) //Don't put your module items in there!
			return
		if(!O.origin_tech || !O.origin_tech.len)
			to_chat(user, "<span class='warning'> This doesn't seem to have a tech origin!</span>")
			return
		if (O.holographic)
			to_chat(user, "<span class='warning'> You cannot deconstruct this item!</span>")
			return
		loaded_item = O
		user.drop_item()
		O.loc = src
		loading = TRUE
		if(linked_console?.cats[4] == 4)
			SStgui.update_uis(linked_console, TRUE)
		to_chat(user, "<span class='notice'>You add the [O.name] to the [src]!</span>")
		update_icon()
		sleep(10)
		loading = FALSE
		update_icon()
		if(linked_console)
			SStgui.update_uis(linked_console, TRUE)
		return TRUE
	return FALSE

/obj/machinery/r_n_d/destructive_analyzer/proc/deconstruct_item()
	if(busy||loading)
		to_chat(usr, "<span class='warning'>The destructive analyzer is busy at the moment.</span>")
		return
	if(!loaded_item)
		return

	busy = TRUE
	update_icon()
	if(linked_console)
		SStgui.update_uis(linked_console, TRUE)
	addtimer(CALLBACK(src, .proc/finish_deconstructing), 24)

/obj/machinery/r_n_d/destructive_analyzer/proc/finish_deconstructing()
	busy = FALSE

	if(linked_console)
		linked_console.files.check_item_for_tech(loaded_item)
		linked_console.files.research_points += linked_console.files.experiments.get_object_research_value(loaded_item)
		linked_console.files.experiments.do_research_object(loaded_item)

	if(istype(loaded_item, /obj/item/stack))
		var/obj/item/stack/S = loaded_item
		if(S.amount == 1)
			S.use(1)
			loaded_item = null
			update_icon()
		else
			S.use(1)
			update_icon()
	else
		qdel(loaded_item)
		loaded_item = null
		update_icon()

	use_power(250)
	if(linked_console)
		SStgui.update_uis(linked_console, TRUE)

/obj/machinery/r_n_d/destructive_analyzer/eject_item(mob/user)
	if(busy||loading)
		to_chat(usr, "<span class='warning'>The destructive analyzer is busy at the moment.</span>")
		return

	if(loaded_item)
		loaded_item.forceMove(get_turf(src))
		if(Adjacent(user) && !issilicon(user))
			user.put_in_hands(loaded_item)
		loaded_item = null
		update_icon()
		SStgui.update_uis(linked_console, TRUE)
