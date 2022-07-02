/datum/craft_recipe/tool
	category = "Tools"

/*************************
	REPAIR KIT
*************************/
//Assembled using several tools of any sort. You can be quite economical by using nearly-broken junk to make this,
//	without affecting the quality of the final product

/datum/craft_recipe/tool/repairkit
	name = "Repair Kit"
	result = /obj/item/weapon/tool/repairkit
	steps = list(
		list(CRAFT_MATERIAL, MATERIAL_STEEL),
		list(CRAFT_OBJECT, /obj/item/weapon/tool),
		list(CRAFT_OBJECT, /obj/item/weapon/tool),
		list(CRAFT_OBJECT, /obj/item/weapon/tool),
		list(CRAFT_STACK, /obj/item/stack/cable_coil, 5)
	)

/*************************
	TOOL EXPANSION
*************************/
/*
	A special recipe. This takes a tool, and outputs the same tool, but with one extra modification slot
*/
/datum/craft_recipe/tool/expansion
	name = "Tool expansion"
	desc = "This recipe is used to upgrade a tool's potential, unlocking an extra modification slot to allow more toolmods to be fitted onto it."
	result = /obj/item/craft
	steps = list(
		list(CRAFT_OBJECT, /obj/item/weapon/tool),
		list(CRAFT_STACK, /obj/item/stack/power_node, 1)
	)

/*
	Tools which have no mod slots to begin with, cannot be modificationd.
	This only applies to consumables like duct tape
*/
/datum/craft_recipe/tool/expansion/try_step(step, I, user, obj/item/craft/target)
	if (istool(I))
		var/obj/item/weapon/tool/T = I
		if (T.max_modifications <= 0)
			to_chat(user, SPAN_DANGER("The [I] cannot be modified."))
			return FALSE

	.=..()


/*
	To complete, we move the tool out of the craft object, then delete that object.
*/
/datum/craft_recipe/tool/expansion/spawn_result(obj/item/craft/C, mob/living/user)
	var/obj/item/weapon/tool/T = locate() in C
	if (!T)
		return FALSE

	T.base_max_modifications++
	T.refresh_modifications()

	var/slot = user.get_inventory_slot(C)

	if(! (flags & CRAFT_ON_FLOOR) && (slot in list(slot_r_hand, slot_l_hand)))
		user.put_in_hands(T)
	else
		T.forceMove(get_turf(C))

	qdel(C)




/*************************
	MAKESHIFT TOOLS
*************************/
/datum/craft_recipe/tool/webtape
	name = "Web tape"
	result = /obj/item/weapon/tool/tape_roll/web
	steps = list(
		list(CRAFT_STACK, /obj/item/stack/medical/bruise_pack/handmade, 3),
		list(CRAFT_OBJECT, /obj/effect/spider/stickyweb)
	)

//A shard of glass wrapped in tape makes a crude sort of knife
/datum/craft_recipe/tool/shiv
	name = "Shiv"
	result = /obj/item/weapon/tool/shiv
	steps = list(
		list(CRAFT_OBJECT, /obj/item/weapon/material/shard),
		list(CRAFT_TOOL, QUALITY_ADHESIVE, 15, 70)
	)

//A rod wrapped in tape makes a crude screwthing
/datum/craft_recipe/tool/screwpusher
	name = "Screwpusher"
	result = /obj/item/weapon/tool/screwdriver/improvised
	steps = list(
		list(CRAFT_STACK, /obj/item/stack/rods),
		list(CRAFT_TOOL, QUALITY_ADHESIVE, 15, 70)
	)

//Rods bent into wierd shapes and held together with a screw
/datum/craft_recipe/tool/wiremanglers
	name = "Wiremanglers"
	result = /obj/item/weapon/tool/wirecutters/improvised
	steps = list(
		list(CRAFT_STACK, /obj/item/stack/rods, 1),
		list(CRAFT_TOOL, QUALITY_PRYING, 10, 70),
		list(CRAFT_STACK, /obj/item/stack/rods, 1),
		list(CRAFT_TOOL, QUALITY_PRYING, 10, 70),
		list(CRAFT_TOOL, QUALITY_SCREW_DRIVING, 10, 70)
	)


//A pair of rods laboriously twisted into a useful shape
/datum/craft_recipe/tool/rebar
	name = "Rebar"
	result = /obj/item/weapon/tool/crowbar/improvised
	steps = list(
		list(CRAFT_STACK, /obj/item/stack/rods, 2, "time" = 300)
	)


//A metal sheet with some holes cut in it
/datum/craft_recipe/tool/sheetspanner
	name = "Sheet spanner"
	result = /obj/item/weapon/tool/wrench/improvised
	steps = list(
		list(CRAFT_MATERIAL, MATERIAL_STEEL),
		list(CRAFT_TOOL,QUALITY_SAWING, 10, 70)
	)


//A rod and a sheet bound together with ducks
/datum/craft_recipe/tool/junkshovel
	name = "Junk shovel"
	result = /obj/item/weapon/tool/shovel/improvised
	steps = list(
		list(CRAFT_MATERIAL, MATERIAL_STEEL),
		list(CRAFT_STACK,/obj/item/stack/rods, 1, 30),
		list(CRAFT_TOOL,QUALITY_ADHESIVE, 15, 150)
	)


//A rod with bits of pointy shrapnel stuck to it. Good weapon
/datum/craft_recipe/tool/choppa
	name = "Choppa"
	result = /obj/item/weapon/tool/saw/improvised
	steps = list(
		list(CRAFT_STACK, /obj/item/stack/rods, 1, 30),
		list(CRAFT_STACK, /obj/item/stack/material/steel, 2, 30),
		list(CRAFT_TOOL, QUALITY_ADHESIVE, 15, 150)
	)

//Some pipes duct taped together, attached to a tank and an igniter
/datum/craft_recipe/tool/jurytorch
	name = "Jury-rigged torch"
	result = /obj/item/weapon/tool/weldingtool/improvised
	steps = list(
		list(CRAFT_OBJECT,/obj/item/pipe, "time" = 60),
		list(CRAFT_OBJECT,/obj/item/pipe, "time" = 60),
		list(CRAFT_TOOL, QUALITY_ADHESIVE, 15, 150),
		list(CRAFT_OBJECT,/obj/item/device/assembly/igniter),
		list(CRAFT_OBJECT,/obj/item/weapon/tank/emergency/oxygen, 1)
	)

/*************************
	Tool Ammunition and Consumables
*************************/
/datum/craft_recipe/tool/rivets
	name = "Rivet refill"
	desc = "Takes a (preferably empty) rivet magazine, and fills it with new rivets"
	result = /obj/item/ammo_magazine/rivet

	steps = list(
		list(CRAFT_OBJECT,/obj/item/ammo_magazine/rivet, "time" = 60),
		list(CRAFT_STACK, /obj/item/stack/rods, 4),
		list(CRAFT_TOOL,QUALITY_SAWING, 10, 120)
	)

/datum/craft_recipe/tool/rivet_mag
	name = "Rivet Magazine"
	desc = "Creates an empty magazine designed to fit the 711-MarkCL Rivet Gun. Rivets to fill it are created seperately"
	result = /obj/item/ammo_magazine/rivet/empty
	steps = list(
		list(CRAFT_MATERIAL, MATERIAL_PLASTIC, 4),
		list(CRAFT_OBJECT, /obj/item/weapon/cell)
	)




/*************************
	TOOL MODS
*************************/
//Metal rods reinforced with fiber tape
/datum/craft_recipe/tool/brace
	name = "Tool mod: Brace bar"
	result = /obj/item/weapon/tool_modification/reinforcement/stick
	steps = list(
		list(CRAFT_STACK, /obj/item/stack/rods, 1, 30),
		list(CRAFT_STACK, /obj/item/stack/rods, 1, 30),
		list(CRAFT_TOOL, QUALITY_ADHESIVE, 50, 150)
	)



//A metal plate with bolts drilled and wrenched into it
/datum/craft_recipe/tool/plate
	name = "Tool mod: reinforcement plate"
	result = /obj/item/weapon/tool_modification/reinforcement/plating
	steps = list(
		list(CRAFT_MATERIAL, MATERIAL_STEEL, 2),
		list(CRAFT_TOOL,QUALITY_DRILLING, 10, 150),
		list(CRAFT_STACK, /obj/item/stack/rods, 4, 30),
		list(CRAFT_TOOL,QUALITY_BOLT_TURNING, 10, 150),
	)


//An array of sharpened bits of metal to turn a tool into more of a weapon
/datum/craft_recipe/tool/spikes
	name = "Tool mod: Spikes"
	result = /obj/item/weapon/tool_modification/augment/spikes
	steps = list(
		list(CRAFT_STACK, /obj/item/stack/rods, 2, 30),
		list(CRAFT_TOOL, QUALITY_WELDING, 10, 150),
		list(CRAFT_STACK, /obj/item/stack/material/steel, 2, 30),
		list(CRAFT_TOOL, QUALITY_SAWING, 15, 50),
		list(CRAFT_TOOL,QUALITY_WELDING, 10, 150),
	)



