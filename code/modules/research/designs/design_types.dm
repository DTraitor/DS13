/*
Lis of designs (+ means it's researchable):
+	power node
Stock parts:
+	basic capacitor
+	matter bin
+	micro-manipulator
+	micro-laser
+	scanning module
+	advanced capacitor
+	advanced matter bin
+	nano-manipulator
+	high-power micro-laser
+	advanced scanning module
+	super capacitor
+	super matter bin
+	pico-manipulator
+	ultra-high-power micro-laser
+	phasic scanning module
+	Rapid Part Exchange Device
Security Equipment:
+	Megaphone
+	stunbaton
+	handcuffs
Power cell:
+	basic power cell
+	advanced power cell
+	enhanced power cell
+	hyper-capacity power cell
+	device power cell
+	advanced device power cell
HUD and goggles:
+	health scanner hud
+	security scanner hud
+	meson goggles
+	material goggles
+	tactical goggles
Mining:
+	Rock Saw
+	Excavation Drill
+	Diamond Excavation Drill
+	depth scanner
+	Alden-Saraspova counter
Medical:
+	health analyzer
+	advanced health analyzer
+	Defibrillators
+	Compact Defibrillators
+	mass spectrometer
+	advanced mass spectrometer
+	reagent scanner
+	advanced reagent scanner
+	nanopaste
+	hypospray
+	Basic Laser Scalpel
+	Improved Laser Scalpel
+	Advanced Laser Scalpel
+	Incision Management System
Beaker:
+	beaker
+	large beaker
+	cryostasis beaker
+	bluespace beaker
Implants:
+	implanter
+	chemical implant
+	death alarm
+	tracking implant
+	imprinting implant
+	freedom implant
+	explosive implant
Telecomm:
+	subspace ansible
+	hyperwave filter
+	subspace amplifier
+	subspace treatment disk
+	subspace wavelength analyzer
+	ansible crystal
+	subspace transmitter
Tracking:
+	tracking beacon
+	triangulating device
+	beacon tracking pinpointer
Engineering:
+	welding mask
+	light replacer
+	pneumatic crowbar
+	combi driver
+	airlock brace
+	maintenance jack
+	stasis clamp
+	price scanner
+	advanced welding tool
+	oxycandle
+	SH-B1 Plasma Saw
SMES coils:
+	superconductive magnetic coil
+	superconductive capacitance coil
+	superconductive transmission coil
Modular computers, PDAs etc:
+	micro hard drive
+	small hard drive
+	basic hard drive
+	advanced hard drive
+	super hard drive
+	cluster hard drive
+	basic network card
+	advanced network card
+	wired network card
+	basic data crystal
+	advanced data crystal
+	super data crystal
+	RFID card slot
+	nano printer
+	tesla link
+	reagent scanner module
+	paper scanner module
+	atmospheric scanner module
+	medical scanner module
+	standard battery module
+	advanced battery module
+	super battery module
+	ultra battery module
+	nano battery module
+	micro battery module
+	computer microprocessor unit
+	computer processor unit
+	computer photonic processor unit
+	computer photonic microprocessor unit
+	PDA Frame
+	Tablet Frame
+	Laptop Frame
+	Telescreen Frame
IC:
+	Integrated Circuit Printer
+	Integrated Circuit Printer Upgrade Disk
+	Integrated Circuit Printer Clone Disk
Botany:
+	Flora Data Disk
*/


/datum/design/item
	build_type = PROTOLATHE | STORE_ROUNDSTART

/datum/design/item/powernode
	name = "power node"
	id = "powernode"
	materials = list(MATERIAL_GOLD = 4000, MATERIAL_SILVER = 4000)
	build_path = /obj/item/stack/power_node
	price = 10000

/datum/design/item/stock_part
	category = "Parts"
	build_type = PROTOLATHE | STORE_ROUNDSTART

/datum/design/item/stock_part/basic_capacitor
	name = "basic capacitor"
	id = "basic_capacitor"
	materials = list(MATERIAL_STEEL = 50, MATERIAL_GLASS = 50)
	build_path = /obj/item/weapon/stock_parts/capacitor
	price = 100

/datum/design/item/stock_part/basic_matter_bin
	name = "matter bin"
	id = "basic_matter_bin"
	materials = list(MATERIAL_STEEL = 80)
	build_path = /obj/item/weapon/stock_parts/matter_bin
	price = 100

/datum/design/item/stock_part/micro_mani
	name = "micro-manipulator"
	id = "micro_mani"
	materials = list(MATERIAL_STEEL = 30)
	build_path = /obj/item/weapon/stock_parts/manipulator
	price = 100

/datum/design/item/stock_part/basic_micro_laser
	name = "micro-laser"
	id = "basic_micro_laser"
	materials = list(MATERIAL_STEEL = 10, MATERIAL_GLASS = 20)
	build_path = /obj/item/weapon/stock_parts/micro_laser
	price = 100

/datum/design/item/stock_part/basic_sensor
	name = "scanning module"
	id = "basic_sensor"
	materials = list(MATERIAL_STEEL = 50, MATERIAL_GLASS = 20)
	build_path = /obj/item/weapon/stock_parts/scanning_module
	price = 100

/datum/design/item/stock_part/console_screen
	name = "Console Screen"
	id = "console_screen"
	materials = list(MATERIAL_GLASS = 50)
	build_path = /obj/item/weapon/stock_parts/console_screen
	price = 75

/datum/design/item/stock_part/adv_capacitor
	name = "advanced capacitor"
	id = "adv_capacitor"
	materials = list(MATERIAL_STEEL = 50, MATERIAL_GLASS = 50)
	build_path = /obj/item/weapon/stock_parts/capacitor/adv
	price = 500

/datum/design/item/stock_part/adv_matter_bin
	name = "advanced matter bin"
	id = "adv_matter_bin"
	materials = list(MATERIAL_STEEL = 80)
	build_path = /obj/item/weapon/stock_parts/matter_bin/adv
	price = 500

/datum/design/item/stock_part/nano_mani
	name = "nano-manipulator"
	id = "nano_mani"
	materials = list(MATERIAL_STEEL = 30)
	build_path = /obj/item/weapon/stock_parts/manipulator/nano
	price = 500

/datum/design/item/stock_part/high_micro_laser
	name = "high-power micro-laser"
	id = "high_micro_laser"
	materials = list(MATERIAL_STEEL = 10, MATERIAL_GLASS = 20)
	build_path = /obj/item/weapon/stock_parts/micro_laser/high
	price = 500

/datum/design/item/stock_part/adv_sensor
	name = "advanced scanning module"
	id = "adv_sensor"
	materials = list(MATERIAL_STEEL = 50, MATERIAL_GLASS = 20)
	build_path = /obj/item/weapon/stock_parts/scanning_module/adv
	price = 500

/datum/design/item/stock_part/super_capacitor
	name = "super capacitor"
	id = "super_capacitor"
	materials = list(MATERIAL_STEEL = 50, MATERIAL_GLASS = 50, MATERIAL_GOLD = 20)
	build_path = /obj/item/weapon/stock_parts/capacitor/super

/datum/design/item/stock_part/super_matter_bin
	name = "super matter bin"
	id = "super_matter_bin"
	materials = list(MATERIAL_STEEL = 80)
	build_path = /obj/item/weapon/stock_parts/matter_bin/super

/datum/design/item/stock_part/pico_mani
	name = "pico-manipulator"
	id = "pico_mani"
	materials = list(MATERIAL_STEEL = 30)
	build_path = /obj/item/weapon/stock_parts/manipulator/pico

/datum/design/item/stock_part/ultra_micro_laser
	name = "ultra-high-power micro-laser"
	id = "ultra_micro_laser"
	materials = list(MATERIAL_STEEL = 10, MATERIAL_GLASS = 20, "uranium" = 10)
	build_path = /obj/item/weapon/stock_parts/micro_laser/ultra

/datum/design/item/stock_part/phasic_sensor
	name = "phasic scanning module"
	id = "phasic_sensor"
	materials = list(MATERIAL_STEEL = 50, MATERIAL_GLASS = 20, MATERIAL_SILVER = 10)
	build_path = /obj/item/weapon/stock_parts/scanning_module/phasic

/datum/design/item/stock_part/RPED
	name = "Rapid Part Exchange Device"
	id = "rped"
	materials = list(MATERIAL_STEEL = 15000, MATERIAL_GLASS = 5000)
	build_path = /obj/item/weapon/storage/part_replacer
	price = 500

/datum/design/item/sec_eq
	category = "Security Equipment"

/datum/design/item/sec_eq/megaphone
	name = "Megaphone"
	id = "megaphone"
	materials = list(MATERIAL_STEEL = 500, MATERIAL_PLASTIC = 750)
	build_path = /obj/item/device/megaphone
	price = 100

/datum/design/item/sec_eq/stunbaton
	name = "stunbaton"
	id = "stunbaton"
	materials = list(MATERIAL_STEEL = 3000, MATERIAL_GLASS = 500)
	build_path = /obj/item/weapon/melee/baton/loaded

/datum/design/item/sec_eq/handcuffs
	name = "handcuffs"
	id = "handcuffs"
	materials = list(MATERIAL_STEEL = 1000)
	build_path = /obj/item/weapon/handcuffs

/datum/design/item/powercell
	build_type = PROTOLATHE | STORE_ROUNDSTART
	category = "Power"

/datum/design/item/powercell/basic
	name = "basic power cell"
	id = "basic_cell"
	materials = list(MATERIAL_STEEL = 700, MATERIAL_GLASS = 50)
	build_path = /obj/item/weapon/cell
	price = 100

/datum/design/item/powercell/high
	name = "advanced power cell"
	id = "high_cell"
	materials = list(MATERIAL_STEEL = 700, MATERIAL_GLASS = 60)
	build_path = /obj/item/weapon/cell/high
	price = 500

/datum/design/item/powercell/super
	name = "enhanced power cell"
	id = "super_cell"
	materials = list(MATERIAL_STEEL = 700, MATERIAL_GLASS = 70)
	build_path = /obj/item/weapon/cell/super
	price = 1000

/datum/design/item/powercell/hyper
	name = "hyper-capacity power cell"
	id = "hyper_cell"
	materials = list(MATERIAL_STEEL = 400, MATERIAL_GOLD = 150, MATERIAL_SILVER = 150, MATERIAL_GLASS = 70)
	build_path = /obj/item/weapon/cell/hyper
	price = 1500

/datum/design/item/powercell/device/standard
	name = "device power cell"
	id = "device_cell_standard"
	materials = list(MATERIAL_STEEL = 70, MATERIAL_GLASS = 5)
	build_path = /obj/item/weapon/cell/device/standard
	price = 50

/datum/design/item/powercell/device/high
	name = "advanced device power cell"
	id = "device_cell_high"
	materials = list(MATERIAL_STEEL = 70, MATERIAL_GLASS = 6)
	build_path = /obj/item/weapon/cell/device/high
	price = 100

/datum/design/item/optical
	materials = list(MATERIAL_STEEL = 50, MATERIAL_GLASS = 50)
	build_type = PROTOLATHE | STORE_SCHEMATICS
	category = "Optics"

/datum/design/item/optical/health
	name = "health scanner hud"
	id = "health_hud"
	build_path = /obj/item/clothing/glasses/hud/health
	price = 500

/datum/design/item/optical/security
	name = "security scanner hud"
	id = "security_hud"
	build_path = /obj/item/clothing/glasses/hud/security
	price = 500

/datum/design/item/optical/mesons
	name = "meson goggles"
	id = "mesons"
	build_path = /obj/item/clothing/glasses/meson
	price = 750

/datum/design/item/optical/material
	name = "material goggles"
	id = "mesons_material"
	build_path = /obj/item/clothing/glasses/material
	price = 750

/datum/design/item/optical/tactical
	name = "tactical goggles"
	id = "tactical_goggles"
	build_path = /obj/item/clothing/glasses/tacgoggles
	price = 750

/datum/design/item/mining
	build_type = PROTOLATHE | STORE_SCHEMATICS
	category = "Mining"

/datum/design/item/mining/rocksaw
	name = "Rock Saw"
	id = "Rock_Saw"
	materials = list(MATERIAL_STEEL = 2000, MATERIAL_PLASTEEL = 1300, MATERIAL_GLASS = 500, MATERIAL_DIAMOND = 750)
	build_path = /obj/item/weapon/tool/pickaxe/laser
	price = 2000

/datum/design/item/mining/excavation_drill
	name = "Excavation Drill"
	id = "excavation_drill"
	build_type = PROTOLATHE
	materials = list(MATERIAL_STEEL = 5000, MATERIAL_GLASS = 1000)
	build_path = /obj/item/weapon/tool/pickaxe/xeno/excavationdrill

/datum/design/item/mining/excavation_drill_diamond
	name = "Diamond Excavation Drill"
	id = "excavation_drill_diamond"
	build_type = PROTOLATHE
	materials = list(MATERIAL_STEEL = 3000, MATERIAL_GLASS = 1000, MATERIAL_DIAMOND = 3750)
	build_path = /obj/item/weapon/tool/pickaxe/xeno/excavationdrill/adv

/datum/design/item/mining/depth_scanner
	name = "depth scanner"
	id = "depth_scanner"
	materials = list(MATERIAL_STEEL = 1000,MATERIAL_GLASS = 1000)
	build_path = /obj/item/device/depth_scanner
	price = 300

/datum/design/item/mining/ano_scanner
	name = "Alden-Saraspova counter"
	id = "ano_scanner"
	materials = list(MATERIAL_STEEL = 10000,MATERIAL_GLASS = 5000)
	build_path = /obj/item/device/ano_scanner
	price = 300

/datum/design/item/medical
	build_type = PROTOLATHE | STORE_ROUNDSTART
	materials = list(MATERIAL_STEEL = 30, MATERIAL_GLASS = 20)
	category = "Medical"

/datum/design/item/medical/health_analyzer
	name = "health analyzer"
	id = "health_analyzer"
	materials = list(MATERIAL_STEEL = 1000, MATERIAL_GLASS = 300)
	build_path = /obj/item/device/healthanalyzer
	price = 250

/datum/design/item/medical/adv_health_analyzer
	name = "Advanced Health Analyzer"
	id = "adv_health_analyzer"
	materials = list(MATERIAL_STEEL = 2000, MATERIAL_GLASS = 800, MATERIAL_GOLD = 300)
	build_path = /obj/item/device/adv_health_analyzer
	price = 1500

/datum/design/item/medical/defibrillators_back
	name = "Defibrillators"
	id = "defibrillators_back"
	materials = list(MATERIAL_STEEL = 2000, MATERIAL_GLASS = 50)
	build_path = /obj/item/weapon/defibrillator

/datum/design/item/medical/defibrillators_belt
	name = "Compact Defibrillators"
	id = "defibrillators_compact"
	materials = list(MATERIAL_STEEL = 2000, MATERIAL_GLASS = 50)
	build_path = /obj/item/weapon/defibrillator/compact

/datum/design/item/medical/mass_spectrometer
	name = "mass spectrometer"
	id = "mass_spectrometer"
	build_path = /obj/item/device/mass_spectrometer
	price = 300

/datum/design/item/medical/adv_mass_spectrometer
	name = "advanced mass spectrometer"
	id = "adv_mass_spectrometer"
	build_path = /obj/item/device/mass_spectrometer/adv
	price = 500

/datum/design/item/medical/reagent_scanner
	name = "reagent scanner"
	id = "reagent_scanner"
	build_path = /obj/item/device/reagent_scanner
	price = 300

/datum/design/item/medical/adv_reagent_scanner
	name = "advanced reagent scanner"
	id = "adv_reagent_scanner"
	build_path = /obj/item/device/reagent_scanner/adv
	price = 500

/datum/design/item/medical/nanopaste
	name = "nanopaste"
	id = "nanopaste"
	materials = list(MATERIAL_STEEL = 7000, MATERIAL_GLASS = 7000)
	build_path = /obj/item/stack/nanopaste
	price = 750

/datum/design/item/medical/hypospray
	name = "hypospray"
	id = "hypospray"
	materials = list(MATERIAL_STEEL = 8000, MATERIAL_GLASS = 8000, MATERIAL_SILVER = 2000)
	build_path = /obj/item/weapon/reagent_containers/hypospray/vial
	build_type = PROTOLATHE	//No appearing in store

/datum/design/item/surgery
	build_type = PROTOLATHE | STORE_SCHEMATICS
	category = "Medical"

/datum/design/item/surgery/scalpel_laser1
	name = "Basic Laser Scalpel"
	id = "scalpel_laser1"
	materials = list(MATERIAL_STEEL = 12500, MATERIAL_GLASS = 7500)
	build_path = /obj/item/weapon/tool/scalpel/advanced
	price = 750

/datum/design/item/surgery/scalpel_laser2
	name = "Improved Laser Scalpel"
	id = "scalpel_laser2"
	materials = list(MATERIAL_STEEL = 12500, MATERIAL_GLASS = 7500)
	build_path = /obj/item/weapon/tool/scalpel/laser
	price = 750

/datum/design/item/surgery/scalpel_laser3
	name = "Advanced Laser Scalpel"
	id = "scalpel_laser3"
	materials = list(MATERIAL_STEEL = 12500, MATERIAL_GLASS = 7500, MATERIAL_SILVER = 2000, MATERIAL_GOLD = 1500)
	build_path = /obj/item/weapon/tool/scalpel/laser
	price = 1500

/datum/design/item/surgery/scalpel_manager
	name = "Incision Management System"
	id = "scalpel_manager"
	materials = list (MATERIAL_STEEL = 12500, MATERIAL_GLASS = 7500, MATERIAL_SILVER = 1500, MATERIAL_GOLD = 1500, MATERIAL_DIAMOND = 750)
	build_path = /obj/item/weapon/tool/scalpel/manager
	price = 2500

/datum/design/item/beaker
	name = "beaker"
	id = "beaker"
	materials = list(MATERIAL_GLASS = 250)
	build_path = /obj/item/weapon/reagent_containers/glass/beaker
	category = "Beakers"
	price = 150

/datum/design/item/beaker/large
	name = "large beaker"
	id = "large_beaker"
	materials = list(MATERIAL_GLASS = 500)
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/large
	price = 300

/datum/design/item/beaker/noreact
	name = "cryostasis beaker"
	id = "splitbeaker"
	materials = list(MATERIAL_STEEL = 3000)
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/noreact


/datum/design/item/beaker/bluespace
	name = "bluespace beaker"
	id = "bluespacebeaker"
	materials = list(MATERIAL_STEEL = 3000, MATERIAL_PHORON = 3000, MATERIAL_DIAMOND = 500)
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/bluespace
	price = 1500

/datum/design/item/implant
	materials = list(MATERIAL_STEEL = 50, MATERIAL_GLASS = 50)
	category = "Implants"
	build_type = PROTOLATHE

/datum/design/item/implant/implanter
	name = "Implanter"
	id = "implanter"
	build_path = /obj/item/weapon/implanter
	materials = list(MATERIAL_STEEL = 1000, MATERIAL_GLASS = 1000)

/datum/design/item/implant/chemical
	name = "chemical implant"
	id = "implant_chem"
	build_path = /obj/item/weapon/implantcase/chem

/datum/design/item/implant/death_alarm
	name = "death alarm"
	id = "implant_death"
	build_path = /obj/item/weapon/implantcase/death_alarm

/datum/design/item/implant/tracking
	name = "tracking implant"
	id = "implant_tracking"
	build_path = /obj/item/weapon/implantcase/tracking

/datum/design/item/implant/imprinting
	name = "imprinting implant"
	id = "implant_imprinting"
	build_path = /obj/item/weapon/implantcase/imprinting

/datum/design/item/implant/freedom
	name = "freedom implant"
	id = "implant_free"
	build_path = /obj/item/weapon/implantcase/freedom

/datum/design/item/implant/explosive
	name = "explosive implant"
	id = "implant_explosive"
	build_path = /obj/item/weapon/implantcase/explosive

/datum/design/item/tcomm
	category = "Telecommuncations"
	build_type = PROTOLATHE

/datum/design/item/tcomm/subspace_ansible
	name = "subspace ansible"
	id = "s-ansible"
	materials = list(MATERIAL_STEEL = 80, MATERIAL_SILVER = 20)
	build_path = /obj/item/weapon/stock_parts/subspace/ansible

/datum/design/item/tcomm/hyperwave_filter
	name = "hyperwave filter"
	id = "s-filter"
	materials = list(MATERIAL_STEEL = 40, MATERIAL_SILVER = 10)
	build_path = /obj/item/weapon/stock_parts/subspace/filter

/datum/design/item/tcomm/subspace_amplifier
	name = "subspace amplifier"
	id = "s-amplifier"
	materials = list(MATERIAL_STEEL = 10, MATERIAL_GOLD = 30, "uranium" = 15)
	build_path = /obj/item/weapon/stock_parts/subspace/amplifier

/datum/design/item/tcomm/subspace_treatment
	name = "subspace treatment disk"
	id = "s-treatment"
	materials = list(MATERIAL_STEEL = 10, MATERIAL_SILVER = 20)
	build_path = /obj/item/weapon/stock_parts/subspace/treatment

/datum/design/item/tcomm/subspace_analyzer
	name = "subspace wavelength analyzer"
	id = "s-analyzer"
	materials = list(MATERIAL_STEEL = 10, MATERIAL_GOLD = 15)
	build_path = /obj/item/weapon/stock_parts/subspace/analyzer

/datum/design/item/tcomm/subspace_crystal
	name = "ansible crystal"
	id = "s-crystal"
	materials = list(MATERIAL_GLASS = 1000, MATERIAL_SILVER = 20, MATERIAL_GOLD = 20)
	build_path = /obj/item/weapon/stock_parts/subspace/crystal

/datum/design/item/tcomm/subspace_transmitter
	name = "subspace transmitter"
	id = "s-transmitter"
	materials = list(MATERIAL_GLASS = 100, MATERIAL_SILVER = 10, "uranium" = 15)
	build_path = /obj/item/weapon/stock_parts/subspace/transmitter

/datum/design/item/tracking
	category = "Tracking"

/datum/design/item/tracking/beacon
	name = "tracking beacon"
	id = "beacon"
	materials = list (MATERIAL_STEEL = 20, MATERIAL_GLASS = 10)
	build_path = /obj/item/device/radio/beacon
	price = 100

/datum/design/item/tracking/gps
	name = "triangulating device"
	id = "gps"
	materials = list(MATERIAL_STEEL = 500)
	build_path = /obj/item/device/gps
	price = 100

/datum/design/item/tracking/beacon_locator
	name = "beacon tracking pinpointer"
	id = "beacon_locator"
	materials = list(MATERIAL_STEEL = 1000,MATERIAL_GLASS = 500)
	build_path = /obj/item/weapon/pinpointer/radio
	price = 200

/datum/design/item/tool
	category = "Tools"

/datum/design/item/tool/welding_mask
	name = "Welding Mask"
	id = "weldingmask"
	build_type = PROTOLATHE | STORE_ROUNDSTART
	materials = list(MATERIAL_STEEL = 4000, MATERIAL_GLASS = 1000)
	build_path = /obj/item/clothing/head/welding

/datum/design/item/tool/light_replacer
	name = "light replacer"
	id = "light_replacer"
	materials = list(MATERIAL_STEEL = 1500, MATERIAL_SILVER = 150, MATERIAL_GLASS = 3000)
	build_path = /obj/item/device/lightreplacer
	price = 500

/datum/design/item/tool/pneum_crow
	name = "pneumatic crowbar"
	id = "pneum_crow"
	materials = list(MATERIAL_STEEL = 3200, MATERIAL_PLASTIC = 600, MATERIAL_SILVER = 50)
	build_type = PROTOLATHE
	build_path = /obj/item/weapon/tool/crowbar/pneumatic

/datum/design/item/tool/combi_driver
	name = "combi driver"
	id = "combi_driver"
	materials = list(MATERIAL_STEEL = 1600, MATERIAL_PLASTIC = 1000, MATERIAL_SILVER = 50)
	build_type = PROTOLATHE
	build_path = /obj/item/weapon/tool/screwdriver/combi_driver

/datum/design/item/tool/airlock_brace
	name = "airlock brace"
	id = "brace"
	materials = list(MATERIAL_STEEL = 2000, MATERIAL_GLASS = 50)
	build_path = /obj/item/weapon/airlock_brace

/datum/design/item/tool/brace_jack
	name = "maintenance jack"
	id = "bracejack"
	materials = list(MATERIAL_STEEL = 120)
	build_path = /obj/item/weapon/tool/crowbar/brace_jack
	price = 1500

/datum/design/item/tool/clamp
	name = "stasis clamp"
	id = "stasis_clamp"
	materials = list(MATERIAL_STEEL = 500, MATERIAL_GLASS = 500)
	build_path = /obj/item/clamp
	price = 600

/datum/design/item/tool/price_scanner
	name = "price scanner"
	id = "price_scanner"
	materials = list(MATERIAL_STEEL = 3000, MATERIAL_GLASS = 3000, MATERIAL_SILVER = 250)
	build_path = /obj/item/device/price_scanner
	price = 750

/datum/design/item/tool/advanced_welder
	name = "advanced welding tool"
	id = "experimental_welder"
	materials = list(MATERIAL_STEEL = 120, MATERIAL_GLASS = 50)
	build_path = /obj/item/weapon/tool/weldingtool/advanced
	price = 250

/datum/design/item/tool/oxycandle
	name = "oxycandle"
	id = "oxycandle"
	materials = list(MATERIAL_STEEL = 3000)
	chemicals = list(/datum/reagent/sodiumchloride = 20, /datum/reagent/acetone = 20)
	build_path = /obj/item/device/oxycandle
	price = 500

/datum/design/item/tool/plasmasaw
	name = "SH-B1 Plasma Saw"
	id = "SH-B1_Plasma_Saw"
	materials = list(MATERIAL_STEEL = 1500, MATERIAL_GLASS = 500, MATERIAL_DIAMOND = 500)
	build_path = /obj/item/weapon/tool/saw/plasma
	price = 1000

/datum/design/item/smes_coil
	build_type = PROTOLATHE
	category = "SMES Coils"
	materials = list(MATERIAL_STEEL = 2000, MATERIAL_GLASS = 2000, MATERIAL_GOLD = 1000, MATERIAL_SILVER = 1000)

/datum/design/item/smes_coil/standard
	name = "superconductive magnetic coil"
	id = "smes_coil_standard"
	build_path = /obj/item/weapon/smes_coil

/datum/design/item/smes_coil/super_capacity
	name = "superconductive capacitance coil"
	id = "smes_coil_super_capacity"
	build_path = /obj/item/weapon/smes_coil/super_capacity

/datum/design/item/smes_coil/super_io
	name = "superconductive transmission coil"
	id = "smes_coil_super_io"
	build_path = /obj/item/weapon/smes_coil/super_io

/datum/design/item/modularcomponent
	category = "Modular Computers"

/datum/design/item/modularcomponent/disk/micro
	name = "micro hard drive"
	id = "hdd_micro"
	materials = list(MATERIAL_STEEL = 400, MATERIAL_GLASS = 100)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/micro
	price = 100

/datum/design/item/modularcomponent/disk/small
	name = "small hard drive"
	id = "hdd_small"
	materials = list(MATERIAL_STEEL = 800, MATERIAL_GLASS = 200)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/small
	price = 150

/datum/design/item/modularcomponent/disk/normal
	name = "basic hard drive"
	id = "hdd_basic"
	materials = list(MATERIAL_STEEL = 400, MATERIAL_GLASS = 100)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/
	price = 100

/datum/design/item/modularcomponent/disk/advanced
	name = "advanced hard drive"
	id = "hdd_advanced"
	materials = list(MATERIAL_STEEL = 800, MATERIAL_GLASS = 200)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/advanced
	price = 250

/datum/design/item/modularcomponent/disk/super
	name = "super hard drive"
	id = "hdd_super"
	materials = list(MATERIAL_STEEL = 1600, MATERIAL_GLASS = 400)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/super
	price = 500

/datum/design/item/modularcomponent/disk/cluster
	name = "cluster hard drive"
	id = "hdd_cluster"
	materials = list(MATERIAL_STEEL = 3200, MATERIAL_GLASS = 800)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/cluster

/datum/design/item/modularcomponent/netcard/basic
	name = "basic network card"
	id = "netcard_basic"
	materials = list(MATERIAL_STEEL = 250, MATERIAL_GLASS = 100)
	build_path = /obj/item/weapon/computer_hardware/network_card
	price = 250

/datum/design/item/modularcomponent/netcard/advanced
	name = "advanced network card"
	id = "netcard_advanced"
	materials = list(MATERIAL_STEEL = 500, MATERIAL_GLASS = 200)
	build_path = /obj/item/weapon/computer_hardware/network_card/advanced
	price = 500

/datum/design/item/modularcomponent/netcard/wired
	name = "wired network card"
	id = "netcard_wired"
	materials = list(MATERIAL_STEEL = 2500, MATERIAL_GLASS = 400)
	build_path = /obj/item/weapon/computer_hardware/network_card/wired
	price = 250

/datum/design/item/modularcomponent/portabledrive/basic
	name = "basic data crystal"
	id = "portadrive_basic"
	materials = list(MATERIAL_GLASS = 800)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/portable
	price = 100

/datum/design/item/modularcomponent/portabledrive/advanced
	name = "advanced data crystal"
	id = "portadrive_advanced"
	materials = list(MATERIAL_GLASS = 1600)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/portable/advanced
	price = 250

/datum/design/item/modularcomponent/portabledrive/super
	name = "super data crystal"
	id = "portadrive_super"
	materials = list(MATERIAL_GLASS = 3200)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/portable/super
	price = 500

/datum/design/item/modularcomponent/accessory/cardslot
	name = "RFID card slot"
	id = "cardslot"
	materials = list(MATERIAL_STEEL = 600)
	build_path = /obj/item/weapon/computer_hardware/card_slot
	price = 250

// Nano printer
/datum/design/item/modularcomponent/accessory/nanoprinter
	name = "nano printer"
	id = "nanoprinter"
	materials = list(MATERIAL_STEEL = 600)
	build_path = /obj/item/weapon/computer_hardware/nano_printer
	price = 250

// Tesla Link
/datum/design/item/modularcomponent/accessory/teslalink
	name = "tesla link"
	id = "teslalink"
	materials = list(MATERIAL_STEEL = 2000)
	build_path = /obj/item/weapon/computer_hardware/tesla_link
	price = 400

//Scanners
/datum/design/item/modularcomponent/accessory/reagent_scanner
	name = "reagent scanner module"
	id = "scan_reagent"
	materials = list(MATERIAL_STEEL = 600, MATERIAL_GLASS = 200)
	build_path = /obj/item/weapon/computer_hardware/scanner/reagent
	price = 250

/datum/design/item/modularcomponent/accessory/paper_scanner
	name = "paper scanner module"
	id = "scan_paper"
	materials = list(MATERIAL_STEEL = 600, MATERIAL_GLASS = 200)
	build_path = /obj/item/weapon/computer_hardware/scanner/paper
	price = 250

/datum/design/item/modularcomponent/accessory/atmos_scanner
	name = "atmospheric scanner module"
	id = "scan_atmos"
	materials = list(MATERIAL_STEEL = 600, MATERIAL_GLASS = 200)
	build_path = /obj/item/weapon/computer_hardware/scanner/atmos
	price = 250

/datum/design/item/modularcomponent/accessory/medical_scanner
	name = "medical scanner module"
	id = "scan_medical"
	materials = list(MATERIAL_STEEL = 600, MATERIAL_GLASS = 200)
	build_path = /obj/item/weapon/computer_hardware/scanner/medical
	price = 250

/datum/design/item/modularcomponent/battery/normal
	name = "standard battery module"
	id = "bat_normal"
	materials = list(MATERIAL_STEEL = 400)
	build_path = /obj/item/weapon/computer_hardware/battery_module
	price = 50

/datum/design/item/modularcomponent/battery/advanced
	name = "advanced battery module"
	id = "bat_advanced"
	materials = list(MATERIAL_STEEL = 800)
	build_path = /obj/item/weapon/computer_hardware/battery_module/advanced
	price = 75

/datum/design/item/modularcomponent/battery/super
	name = "super battery module"
	id = "bat_super"
	materials = list(MATERIAL_STEEL = 1600)
	build_path = /obj/item/weapon/computer_hardware/battery_module/super
	price = 100

/datum/design/item/modularcomponent/battery/ultra
	name = "ultra battery module"
	id = "bat_ultra"
	materials = list(MATERIAL_STEEL = 3200)
	build_path = /obj/item/weapon/computer_hardware/battery_module/ultra
	price = 125

/datum/design/item/modularcomponent/battery/nano
	name = "nano battery module"
	id = "bat_nano"
	materials = list(MATERIAL_STEEL = 200)
	build_path = /obj/item/weapon/computer_hardware/battery_module/nano
	price = 40

/datum/design/item/modularcomponent/battery/micro
	name = "micro battery module"
	id = "bat_micro"
	materials = list(MATERIAL_STEEL = 400)
	build_path = /obj/item/weapon/computer_hardware/battery_module/micro
	price = 50

/datum/design/item/modularcomponent/cpu/small
	name = "computer microprocessor unit"
	id = "cpu_small"
	materials = list(MATERIAL_STEEL = 800)
	build_path = /obj/item/weapon/computer_hardware/processor_unit/small
	price = 90

/datum/design/item/modularcomponent/cpu/
	name = "computer processor unit"
	id = "cpu_normal"
	materials = list(MATERIAL_STEEL = 1600)
	build_path = /obj/item/weapon/computer_hardware/processor_unit
	price = 100

/datum/design/item/modularcomponent/cpu/photonic
	name = "computer photonic processor unit"
	id = "pcpu_normal"
	materials = list(MATERIAL_STEEL = 6400, MATERIAL_GLASS = 2000)
	build_path = /obj/item/weapon/computer_hardware/processor_unit/photonic
	price = 250

/datum/design/item/modularcomponent/cpu/photonic/small
	name = "computer photonic microprocessor unit"
	id = "pcpu_small"
	materials = list(MATERIAL_STEEL = 3200, MATERIAL_GLASS = 1000)
	build_path = /obj/item/weapon/computer_hardware/processor_unit/photonic/small
	price = 500

/datum/design/item/modularcomponent/pda_frame
	name = "PDA Frame"
	id = "pda_frame"
	materials = list(MATERIAL_STEEL = 750, MATERIAL_GLASS = 250)
	build_path = /obj/item/modular_computer/pda

/datum/design/item/modularcomponent/tablet_frame
	name = "Tablet Frame"
	id = "tablet_frame"
	materials = list(MATERIAL_STEEL = 1500, MATERIAL_GLASS = 500)
	build_path = /obj/item/modular_computer/tablet

/datum/design/item/modularcomponent/laptop_frame
	name = "Laptop Frame"
	id = "laptop_frame"
	materials = list(MATERIAL_STEEL = 3000, MATERIAL_GLASS = 1000)
	build_path = /obj/item/modular_computer/laptop

/datum/design/item/modularcomponent/telescreen_frame
	name = "Telescreen Frame"
	id = "telescreen_frame"
	materials = list(MATERIAL_STEEL = 2000, MATERIAL_GLASS = 1500)
	build_path = /obj/item/modular_computer/telescreen

/datum/design/item/integrated_printer
	name = "Integrated Circuit Printer"
	id = "icprinter"
	materials = list(MATERIAL_STEEL = 10000, MATERIAL_GLASS = 5000)
	category = "Integrated Circuits"
	build_type = PROTOLATHE
	build_path = /obj/item/device/integrated_circuit_printer

/datum/design/item/integrated_printer/integrated_printer_upgrade_advanced
	name = "Integrated Circuit Printer Upgrade Disk"
	id = "icupgradv"
	materials = list(MATERIAL_STEEL = 10000, MATERIAL_GLASS = 10000)
	build_type = PROTOLATHE
	build_path = /obj/item/disk/integrated_circuit/upgrade/advanced

/datum/design/item/integrated_printer/integrated_printer_upgrade_clone
	name = "Integrated Circuit Printer Clone Disk"
	id = "icupclo"
	materials = list(MATERIAL_STEEL = 10000, MATERIAL_GLASS = 10000)
	build_type = PROTOLATHE
	build_path = /obj/item/disk/integrated_circuit/upgrade/clone

/datum/design/item/botany
	category = "Botany"

/datum/design/item/botany/disk
	name = "Flora Data Disk"
	id = "disk_botany"
	materials = list(MATERIAL_PLASTIC = 750, MATERIAL_GLASS = 250)
	build_type = PROTOLATHE
	build_path = /obj/item/weapon/disk/botany

/datum/design/item/misc
	category = "Misc"

/datum/design/item/misc/boombox
	name = "Boombox"
	id = "boombox"
	materials = list(MATERIAL_PLASTIC = 1500, MATERIAL_GLASS = 250)
	build_type = PROTOLATHE
	build_path = /obj/item/device/boombox
