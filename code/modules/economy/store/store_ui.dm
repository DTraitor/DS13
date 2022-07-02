/obj/machinery/store
	var/current_design_id
	var/current_category

/obj/machinery/store/attack_hand(var/mob/user)
	if (user == occupant)
		tgui_interact(user)
	playsound(src, 'sound/machines/deadspace/menu_negative.ogg', VOLUME_MID, TRUE)

	//TODO: Fix transferring to box contents

/obj/machinery/store/proc/get_designs_data()
	. = list()
	for(var/A in SSdatabase.known_design_ids)
		var/datum/design/D = SSresearch.designs_by_id[A]
		if(D.category == current_category)
			. += list(D.ui_data)

	for(var/A in GLOB.limited_store_designs)
		var/datum/design/D = SSresearch.designs_by_id[A]
		if (D.PI?.can_buy_in_store(occupant) && D.category == current_category)
			. += list(D.ui_data)

/obj/machinery/store/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Store", "Store")
		ui.open()

// Make sure that user is on the same tile as Store, if not - close UI
/obj/machinery/store/ui_state(mob/user)
	if(get_dist(user, src))
		. = UI_CLOSE
	else
		. = ..()


/obj/machinery/store/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet/research_designs)
		)

/obj/machinery/store/ui_data(mob/user)
	var/list/data = list()

	var/datum/money_account/ECA = occupant?.get_account()
	data["credits_account"] = (ECA ? ECA.money : "No ECA found")

	var/credits_rig = (occupant ? occupant.get_rig_balance() : 0)
	data["credits_rig"] = credits_rig

	data["chip"] = FALSE
	data["chip_worth"] = 0
	if (chip)
		data["chip"] = TRUE
		data["chip_worth"] = chip.worth

	data["credits_total"] = data["chip_worth"] + credits_rig

	return data

/obj/machinery/store/ui_static_data(mob/user)
	var/list/data = list()

	data["selected_category"] = current_category
	data["categories"] = GLOB.store_categories.Copy()
	for(var/A in GLOB.limited_store_designs)
		var/datum/design/D = SSresearch.designs_by_id[A]
		if(D.PI?.can_buy_in_store(occupant) && D.category == current_category)
			data["categories"] |= D.category

		if(ispath(current_design.build_path, /obj/item/rig_module) || ispath(current_design.build_path, /obj/item/weapon/rig))
			data["transfer_enabled"] = TRUE

		if(D.store_transfer)
			data["selected_design"]["transfer_enabled"] = TRUE

	data["designs"] = get_designs_data()

	//This is null if the deposit box is empty
	if (deposit_box.ui_data)
		data["deposit"] = deposit_box.ui_data

	return data

/*
	Called whenever a new occupant enters
*/
/obj/machinery/store/proc/update_occupant_data()
	combined_store_data = list()
	var/existing_categories = list()

	for(var/list/L in list(GLOB.unlimited_store_designs, GLOB.limited_store_designs, GLOB.public_store_designs))
		for(var/id in L)
			var/datum/design/D = SSresearch.design_ids[id]
			if(!(D.category in existing_categories))
				existing_categories += D.category
				combined_store_data[D.category] = list()
			if(!D.PI || D.PI.can_buy_in_store(occupant))
				LAZYADD(combined_store_data[D.category], list(D.ui_data()))


/obj/machinery/store/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null)
	var/list/data = ui_data(user, ui_key)
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data)
	if (!ui)
		var/datum/asset/assets = get_asset_datum(/datum/asset/simple/research_designs)
		assets.send(user)
		// the ui does not exist, so we'll create a new() one
		// for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "store.tmpl", "Store", 900, 600)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()


/obj/machinery/store/OnTopic(var/mob/user, var/href_list, var/datum/topic_state/state)
	.= TOPIC_REFRESH


	if (busy)
		playsound(src, 'sound/machines/deadspace/menu_negative.ogg', VOLUME_MID, TRUE)
		return

	if (busy || usr != occupant)
		playsound(src, 'sound/machines/deadspace/menu_negative.ogg', VOLUME_MID, TRUE)
		return

	switch(action)
		if("category")
			current_category = params["category"]
			playsound(src, 'sound/machines/deadspace/menu_positive.ogg', VOLUME_MID, TRUE)
			SStgui.update_uis(src, TRUE)

		if("select_item")
			var/datum/design/D = SSresearch.designs_by_id[params["select_item"]]
			// Add some check here (without for() loop)
			if(D.build_type & STORE)
				current_design_id = D.id
			playsound(src, 'sound/machines/deadspace/menu_neutral.ogg', VOLUME_MID, TRUE)
			SStgui.update_uis(src, TRUE)

		if("buy")
			//Nosound because buying plays a vending sound
			switch(text2num(params["buy"]))
				if (1)
					buy_to_occupant()
					return TRUE
				if (2)
					buy_to_deposit()
					return TRUE
				if (3)
					buy_and_transfer()
					return TRUE

		if("withdraw")
			playsound(src, 'sound/machines/deadspace/menu_neutral.ogg', VOLUME_MID, TRUE)
			handle_withdraw(occupant)
			return TRUE

		if("eject")
			playsound(src, 'sound/machines/deadspace/menu_negative.ogg', VOLUME_MID, TRUE)
			eject_item_by_name(params["eject"])
			SStgui.update_uis(src, TRUE)

		if("eject_all")
			playsound(src, 'sound/machines/deadspace/menu_negative.ogg', VOLUME_MID, TRUE)
			eject_all(params["eject"])
			SStgui.update_uis(src, TRUE)

		if("eject_chip")
			if(chip)
				playsound(src, 'sound/machines/deadspace/menu_negative.ogg', VOLUME_MID, TRUE)
				eject_chip()
				return TRUE
