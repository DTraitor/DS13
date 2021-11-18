/datum/technology/tcom
	tech_type = TECH_BLUESPACE
	icon_file = 'icons/obj/stationobjs.dmi'

/datum/technology/tcom/parts
	name = "Telecommuncation Parts"
	desc = "Telecommuncation Parts"
	id = "telecomm_parts"
	tech_type = TECH_BLUESPACE

	x = 0.5
	y = 0.275
	icon_file = 'icons/obj/stock_parts.dmi'
	icon = "subspace_ansible"

	required_technologies = list("super_parts")
	cost = 750

	unlocks_designs = list("s-ansible", "s-filter", "s-amplifier", "s-treatment", "s-analyzer", "s-crystal", "s-transmitter")

/datum/technology/tcom/monitoring
	name = "Monitoring Consoles"
	desc = "Monitoring Consoles"
	id = "tcom_monitoring"

	x = 0.5
	y = 0.4
	//special way to generate an icon

	required_technologies = list("telecomm_parts")
	cost = 1250

	unlocks_designs = list("comm_monitor", "comm_server", "comm_traffic", "message_monitor", "shield_generator", "shield_diffuser")

/datum/technology/tcom/monitoring/generate_icon()
	I = icon('icons/obj/computer.dmi', "computer")
	I.Blend(icon('icons/obj/computer.dmi', "comm_logs"), ICON_OVERLAY)
	I.Blend(icon('icons/obj/computer.dmi', "generic_key"), ICON_OVERLAY)

/datum/technology/tcom/rcon
	name = "RCON"
	desc = "RCON"
	id = "rcon"

	x = 0.5
	y = 0.525
	//special way to generate an icon

	required_technologies = list("tcom_monitoring", "adv_power_storage")
	cost = 750

	unlocks_designs = list("rcon_console")

/datum/technology/tcom/rcon/generate_icon()
	I = icon('icons/obj/computer.dmi', "computer")
	I.Blend(icon('icons/obj/computer.dmi', "ai-fixer"), ICON_OVERLAY)
	I.Blend(icon('icons/obj/computer.dmi', "power_key"), ICON_OVERLAY)

/datum/technology/tcom/mainframes
	name = "Mainframes"
	desc = "Mainframes"
	id = "mainframes"

	x = 0.4
	y = 0.4
	icon = "relay"

	required_technologies = list("telecomm_parts")
	cost = 1500

	unlocks_designs = list("tcom-server", "tcom-bus", "tcom-hub", "tcom-relay")

/datum/technology/tcom/solnet_relay
	name = "SolNet Quantum Relay"
	desc = "SolNet Quantum Relay"
	id = "solnet_relay"

	x = 0.3
	y = 0.4
	icon = "bus"

	required_technologies = list("telecomm_parts")
	cost = 1750

	unlocks_designs = list("ntnet_relay")

/datum/technology/tcom/subspace
	name = "Subspace Broadcaster/Reciever"
	desc = "Subspace Broadcaster/Reciever"
	id = "subspace"

	x = 0.6
	y = 0.4
	icon = "broadcaster"

	required_technologies = list("telecomm_parts")
	cost = 1500

	unlocks_designs = list("tcom-broadcaster", "tcom-receiver")

/datum/technology/tcom/processor
	name = "Processor Unit"
	desc = "Processor Unit"
	id = "processor"

	x = 0.7
	y = 0.4
	icon = "processor"

	required_technologies = list("telecomm_parts")
	cost = 1500

	unlocks_designs = list("tcom-processor")
