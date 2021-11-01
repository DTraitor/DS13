/datum/technology/combat
	tech_type = TECH_COMBAT
	icon_file = 'icons/obj/ammo.dmi'

/datum/technology/combat/security
	name = "Security Equipment"
	desc = "Security Equipment"
	id = "sec_eq"

	x = 0.1
	y = 0.5
	icon_file = 'icons/obj/weapons.dmi'
	icon = "stunbaton_active"

	required_technologies = list()
	cost = 0

	unlocks_designs = list("stunbaton", "handcuffs")

/datum/technology/combat/pris_man
	name = "Prisoner Managment"
	desc = "Prisoner Managment"
	id = "pris_man"

	x = 0.1
	y = 0.6
	//special way to generate an icon

	required_technologies = list("sec_eq")
	cost = 250

	unlocks_designs = list("prisonmanage")

/datum/technology/combat/pris_man/generate_icon()
	I = icon('icons/obj/computer.dmi', "computer")
	I.Blend(icon('icons/obj/computer.dmi', "explosive"), ICON_OVERLAY)
	I.Blend(icon('icons/obj/computer.dmi', "security_key"), ICON_OVERLAY)

/datum/technology/combat/add_eq
	name = "Additional Security Equipment"
	desc = "Additional Security Equipment"
	id = "add_eq"

	x = 0.2
	y = 0.5
	icon_file = 'icons/obj/clothing/glasses.dmi'
	icon = "securityhud"

	required_technologies = list("sec_eq")
	cost = 500

	unlocks_designs = list("security_hud", "megaphone")

/datum/technology/combat/nleth_eq
	name = "Non-lethal Eqiupment"
	desc = "Additional Security Equipment"
	id = "nleth_eq"

	x = 0.3
	y = 0.5
	icon_file = 'icons/obj/rig_modules.dmi'
	icon = "taser"

	required_technologies = list("add_eq")
	cost = 750

	unlocks_designs = list("rig_flash", "rig_taser")

/datum/technology/combat/recharger
	name = "Recharger"
	desc = "Recharger"
	id = "recharger"

	x = 0.4
	y = 0.5
	icon_file = 'icons/obj/stationobjs.dmi'
	icon = "recharger0"

	required_technologies = list("nleth_eq", "sup_power")
	cost = 1250

	unlocks_designs = list("recharger", "force_energy")

/datum/technology/combat/shield
	name = "Advanced Combat"
	desc = "Advanced Combat"
	id = "shield"

	x = 0.4
	y = 0.4
	icon_file = 'icons/obj/weapons.dmi'
	icon = "advanced"

	required_technologies = list("recharger")
	cost = 1000

	unlocks_designs = list("advancedcombatshield", "tactical_goggles")

/datum/technology/combat/divet
	name = "Winchester NK Divet Pistol"
	desc = "Winchester NK Divet Pistol"
	id = "divet"

	x = 0.5
	y = 0.5
	icon_file = 'icons/obj/gun.dmi'
	icon = "divet"

	required_technologies = list("recharger")
	cost = 1500

	unlocks_designs = list("divet", "divetslug")

/datum/technology/combat/speedloader
	name = "Speed Loader (.44 Magnum)"
	desc = "Speed Loader (.44 Magnum)"
	id = "speedloader"

	x = 0.5
	y = 0.6
	icon = "38"

	required_technologies = list("divet")
	cost = 750

	unlocks_designs = list("44cal")

/datum/technology/combat/pulse
	name = "SWS Motorized Pulse Rifle"
	desc = "SWS Motorized Pulse Rifle"
	id = "pulse"

	x = 0.6
	y = 0.5
	icon = "pulse_rounds"

	required_technologies = list("divet")
	cost = 2500

	unlocks_designs = list("pulserifle", "pulseslug")

/datum/technology/combat/pulsehv
	name = "High Velocity Pulse Rounds"
	desc = "High Velocity Pulse Rounds"
	id = "pulsehv"

	x = 0.6
	y = 0.6
	icon = "pulse_rounds_hv"

	required_technologies = list("pulse")
	cost = 1500

	unlocks_designs = list("pulsehighvel")

/datum/technology/combat/ripper
	name = "RC-DS Remote Control Disc Ripper"
	desc = "RC-DS Remote Control Disc Ripper"
	id = "ripper"

	x = 0.6
	y = 0.4
	icon_file = 'icons/obj/gun.dmi'
	icon = "ripper"

	required_technologies = list("pulse")
	cost = 1500

	unlocks_designs = list("ripper", "ripper_blades")

/datum/technology/combat/dblades
	name = "Diamond Blades"
	desc = "Diamond Blades"
	id = "dblades"

	x = 0.7
	y = 0.4
	icon = "diamondblade"

	required_technologies = list("ripper")
	cost = 750

	unlocks_designs = list("diamond_blades")

/datum/technology/combat/javeline
	name = "T15 Javelin Gun"
	desc = "T15 Javelin Gun"
	id = "javeline"

	x = 0.7
	y = 0.6
	icon = "javelin-6"

	required_technologies = list("pulse")
	cost = 2000

	unlocks_designs = list("javgun", "javelin_rack")

/datum/technology/combat/seeker
	name = "Seeker Rifle"
	desc = "Seeker Rifle"
	id = "seeker"

	x = 0.8
	y = 0.5
	icon = "seekerclip"

	required_technologies = list("pulse")
	cost = 3500

	unlocks_designs = list("seeker", "seeker_ammo")

/datum/technology/combat/seeker/generate_icon()
	.=..()
	I.Blend(icon('icons/obj/ammo.dmi', "sc-5"), ICON_OVERLAY)
