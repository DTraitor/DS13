/datum/technology/power
	tech_type = TECH_POWER
	icon_file = 'icons/obj/power.dmi'
/datum/technology/power/basic
	name = "Basic Power"
	desc = "Basic Power"
	id = "basic_power"

	x = 0.6
	y = 0.8
	icon = "cell"

	required_technologies = list()
	cost = 0

	unlocks_designs = list("basic_capacitor", "basic_cell", "device_cell_standard", "powermonitor", "pacman")

/datum/technology/power/basic/generate_icon()
	.=..()
	I.Blend(icon('icons/obj/power.dmi', "cell-o2"), ICON_OVERLAY)

/datum/technology/power/adv_power
	name = "Advanced Power"
	desc = "Advanced Power"
	id = "adv_power"

	x = 0.6
	y = 0.6
	icon = "hcell"

	required_technologies = list("basic_power")
	cost = 500

	unlocks_designs = list("high_cell", "device_cell_high", "adv_capacitor")

/datum/technology/power/adv_power/generate_icon()
	.=..()
	I.Blend(icon('icons/obj/power.dmi', "cell-o2"), ICON_OVERLAY)

/datum/technology/power/sup_power
	name = "Super Power"
	desc = "Super Power"
	id = "sup_power"

	x = 0.6
	y = 0.375
	icon = "scell"

	required_technologies = list("adv_power")
	cost = 1000

	unlocks_designs = list("super_cell", "super_capacitor")

/datum/technology/power/sup_power/generate_icon()
	.=..()
	I.Blend(icon('icons/obj/power.dmi', "cell-o2"), ICON_OVERLAY)

/datum/technology/power/hyp_power
	name = "Hyper Power"
	desc = "Hyper Power"
	id = "hyp_power"

	x = 0.8
	y = 0.375
	icon = "hpcell"

	required_technologies = list("sup_power")
	cost = 1500

	unlocks_designs = list("hyper_cell")

/datum/technology/power/hyp_power/generate_icon()
	.=..()
	I.Blend(icon('icons/obj/power.dmi', "cell-o2"), ICON_OVERLAY)

/datum/technology/power/sol_power
	name = "Solar Power"
	desc = "Solar Power"
	id = "sol_power"

	x = 0.8
	y = 0.6
	// special way to generate an icon

	required_technologies = list("adv_power")
	cost = 750

	unlocks_designs = list("solarcontrol")

/datum/technology/power/sol_power/generate_icon()
	I = getFlatTypeIcon(/obj/machinery/power/solar_control)

/datum/technology/power/adv_power_gen
	name = "Advanced Power Generation"
	desc = "Advanced Power Generation"
	id = "adv_power_gen"

	x = 0.4
	y = 0.6
	icon = "portgen1"

	required_technologies = list("adv_power")
	cost = 1250

	unlocks_designs = list("superpacman")

/datum/technology/power/power_storage
	name = "Power Storage"
	desc = "Power Storage"
	id = "power_storage"

	x = 0.2
	y = 0.6
	icon_file = 'icons/obj/cellrack.dmi'
	icon = "rack"

	required_technologies = list("adv_power_gen")
	cost = 1750

	unlocks_designs = list("batteryrack")

/datum/technology/power/adv_power_storage
	name = "Advanced Power Storage"
	desc = "Advanced Power Storage"
	id = "adv_power_storage"

	x = 0.2
	y = 0.4875
	icon = "smes"

	required_technologies = list("power_storage")
	cost = 2500

	unlocks_designs = list("smes_cell", "smes_coil_standard", "smes_coil_super_capacity", "smes_coil_super_io")

/datum/technology/power/adv_power_storage/generate_icon()
	.=..()
	I.Blend(icon('icons/obj/power.dmi', "smes-og5"), ICON_OVERLAY)
	I.Blend(icon('icons/obj/power.dmi', "smes-op2"), ICON_OVERLAY)

/datum/technology/power/sup_power_gen
	name = "Super Power Generation"
	desc = "Super Power Generation"
	id = "sup_power_gen"

	x = 0.4
	y = 0.375
	icon = "portgen2"

	required_technologies = list("adv_power_gen", "sup_power")
	cost = 2000

	unlocks_designs = list("mrspacman")

/datum/technology/power/fusion
	name = "R-UST Generator"
	desc = "R-UST Generator"
	id = "fusion"

	x = 0.2
	y = 0.375
	icon_file = 'icons/obj/machines/power/fusion.dmi'
	icon = "core"

	required_technologies = list("sup_power_gen")
	cost = 2500

	unlocks_designs = list("fusion_core_control", "fusion_fuel_compressor", "fusion_fuel_control", "gyrotron_control", "fusion_core", "fusion_injector")
