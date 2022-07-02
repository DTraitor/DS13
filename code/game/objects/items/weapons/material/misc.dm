/obj/item/weapon/material/harpoon
	name = "harpoon"
	sharp = 1
	edge = 1
	desc = "Tharr she blows!"
	icon_state = "harpoon"
	item_state = "harpoon"
	force_divisor = 0.4 // 18 with hardness 60 (steel)
	attack_verb = list("jabbed","stabbed","ripped")
	unbreakable = 1

/obj/item/weapon/material/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fibremetal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hatchet"
	force_divisor = 0.3 // 12 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_SMALL
	sharp = 1
	edge = 1
	tool_qualities = list(QUALITY_SAWING = 35, QUALITY_WIRE_CUTTING = 15)
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 1)
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = 0
	hitsound = "chop"
	unbreakable = 1

/obj/item/weapon/material/hatchet/tacknife
	name = "tactical knife"
	desc = "You'd be killing loads of people if this was Medal of Valor: Heroes of Space."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacknife"
	item_state = "knife"
	tool_qualities = list(QUALITY_CUTTING = 45, QUALITY_WIRE_CUTTING = 20)
	attack_verb = list("stabbed", "chopped", "cut")
	applies_material_colour = 1
	unbreakable = 1

/obj/item/weapon/material/hatchet/machete
	name = "machete"
	desc = "A long, sturdy blade with a rugged handle. Leading the way to cursed treasures since before space travel."
	item_state = "machete"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	default_material = MATERIAL_TITANIUM
	base_parry_chance = 50
	attack_cooldown_modifier = 1
	unbreakable = 1
	tool_qualities = list(QUALITY_SAWING = 30, QUALITY_CUTTING = 40, QUALITY_WIRE_CUTTING = 15)

/obj/item/weapon/material/hatchet/machete/Initialize()
	icon_state = "machete[pick("","_red","_blue", "_black", "_olive")]"
	. = ..()

/obj/item/weapon/material/hatchet/machete/deluxe
	name = "deluxe machete"
	desc = "A fine example of a machete, with a polished blade, wooden handle and a leather cord loop."
	tool_qualities = list(QUALITY_SAWING = 40, QUALITY_CUTTING = 45, , QUALITY_WIRE_CUTTING = 20)

/obj/item/weapon/material/hatchet/machete/deluxe/Initialize()
	. = ..()
	icon_state = "machetedx"

/obj/item/weapon/material/minihoe // -- Numbers
	name = "mini hoe"
	desc = "It's used for removing weeds or scratching your back."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hoe"
	item_state = "hoe"
	force_divisor = 0.25 // 5 with weight 20 (steel)
	thrown_force_divisor = 0.25 // as above
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("slashed", "sliced", "cut", "clawed")
	unbreakable = 1

/obj/item/weapon/material/scythe
	icon_state = "scythe0"
	name = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	force_divisor = 0.45 // 16 with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 with weight 20 (steel)
	sharp = 1
	edge = 1

	throw_range = 3
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 55, QUALITY_WIRE_CUTTING = 5)
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	unbreakable = 1


