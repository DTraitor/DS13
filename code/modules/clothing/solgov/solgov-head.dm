/obj/item/clothing/head/solgov
	name = "master solgov hat"
	icon = 'icons/obj/clothing/solgov-head.dmi'
	item_icons = list(slot_head_str = 'icons/mob/onmob/solgov-head.dmi')
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

//Utility
/obj/item/clothing/head/soft/solgov
	name = "\improper Sol Central Government cap"
	desc = "It's a ballcap in SCG colors."
	icon_state = "solsoft"
	icon = 'icons/obj/clothing/solgov-head.dmi'
	item_icons = list(slot_head_str = 'icons/mob/onmob/solgov-head.dmi')

/obj/item/clothing/head/soft/solgov/veteranhat
	name = "veteran hat"
	desc = "It's a tacky black ballcap bearing the yellow service ribbon of the Gaia Conflict."
	icon_state = "cap_veteran"

/obj/item/clothing/head/soft/solgov/expedition
	name = "\improper Expeditionary Corps cap"
	desc = "It's a black ballcap bearing the Expeditonary Corps crest."
	icon_state = "expeditionsoft"

/obj/item/clothing/head/soft/solgov/expedition/co
	name = "\improper Expeditionary Corps command cap"
	desc = "It's a black ballcap bearing the Expeditonary Corps crest. The brim has gold trim."
	icon_state = "expeditioncomsoft"

/obj/item/clothing/head/soft/solgov/fleet
	name = "fleet cap"
	desc = "It's a navy blue field cap with the SCG Fleet crest in a silver colour."
	icon_state = "fleetsoft"

/obj/item/clothing/head/solgov/utility
	name = "utility cover"
	desc = "An eight-point utility cover."
	icon_state = "greyutility"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	body_parts_covered = 0

/obj/item/clothing/head/solgov/utility/fleet
	name = "fleet utility cover"
	desc = "A navy blue utility cover bearing the crest of the SCG Fleet."
	icon_state = "navyutility"

/obj/item/clothing/head/solgov/utility/marine
	name = "marine utility cover"
	desc = "A green utility cover bearing the crest of the SCG Marine Corps."
	icon_state = "greenutility"

/obj/item/clothing/head/solgov/utility/marine/tan
	name = "tan utility cover"
	desc = "A tan utility cover bearing the crest of the SCG Marine Corps."
	icon_state = "tanutility"

/obj/item/clothing/head/solgov/utility/marine/urban
	name = "urban utility cover"
	desc = "A grey utility cover bearing the crest of the SCG Marine Corps."
	icon_state = "greyutility"

//Service

/obj/item/clothing/head/solgov/service
	name = "service cover"
	desc = "A service uniform cover."
	icon_state = "greenwheelcap"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet")
	body_parts_covered = 0

/obj/item/clothing/head/solgov/service/expedition
	name = "expedition peaked cap"
	desc = "A peaked grey uniform cap belonging to the SCG Expeditionary Corps."
	icon_state = "greydresscap"

/obj/item/clothing/head/solgov/service/expedition/command
	name = "expedition officer's peaked cap"
	desc = "A peaked grey uniform cap belonging to the SCG Expeditionary Corps. This one is trimmed in gold."
	icon_state = "greydresscap_com"

/obj/item/clothing/head/solgov/service/marine
	name = "marine wheel cover"
	desc = "A green service uniform cover with an SCG Marine Corps crest."
	icon_state = "greenwheelcap"

/obj/item/clothing/head/solgov/service/marine/command
	name = "marine officer's wheel cover"
	desc = "A green service uniform cover with an SCG Marine Corps crest and gold stripe."
	icon_state = "greenwheelcap_com"

/obj/item/clothing/head/solgov/service/marine/garrison
	name = "marine garrison cap"
	desc = "A green garrison cap belonging to the SCG Marine Corps."
	icon_state = "greengarrisoncap"

/obj/item/clothing/head/solgov/service/marine/garrison/command
	name = "marine officer's garrison cap"
	desc = "A green garrison cap belonging to the SCG Marine Corps. This one has a gold pin."
	icon_state = "greengarrisoncap_com"

/obj/item/clothing/head/solgov/service/marine/campaign
	name = "campaign cover"
	desc = "A green campaign cover with an SCG Marine Corps crest. Only found on the heads of Drill Instructors."
	icon_state = "greendrill"

//Dress

/obj/item/clothing/head/solgov/dress
	name = "dress cover"
	desc = "A dress uniform cover."
	icon_state = "greenwheelcap"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet")
	body_parts_covered = 0

/obj/item/clothing/head/solgov/dress/fleet/garrison
	name = "fleet garrison cap"
	desc = "A white dress uniform cap. The classic sailor's choice."
	icon_state = "whitegarrisoncap"

/obj/item/clothing/head/solgov/dress/fleet
	name = "fleet dress wheel cover"
	desc = "A white dress uniform cover. This one has an SCG Fleet crest."
	icon_state = "whitepeakcap"

/obj/item/clothing/head/solgov/dress/fleet/command
	name = "fleet officer's dress wheel cover"
	desc = "A white dress uniform cover. This one has a gold stripe and an SCG Fleet crest."
	icon_state = "whitepeakcap_com"

/obj/item/clothing/head/solgov/dress/marine
	name = "marine dress wheel cover"
	desc = "A white dress uniform cover with an SCG Marine Corps crest."
	icon_state = "whitewheelcap"

/obj/item/clothing/head/solgov/dress/marine/command
	name = "marine officer's dress wheel cover"
	desc = "A white dress uniform cover with an SCG Marine Corps crest and gold stripe."
	icon_state = "whitewheelcap_com"

//Berets

/obj/item/clothing/head/beret/solgov
	name = "peacekeeper beret"
	desc = "A beret in Sol Central Government colors. For peacekeepers that are more inclined towards style than safety."
	icon_state = "beret_lightblue"
	icon = 'icons/obj/clothing/solgov-head.dmi'
	item_icons = list(slot_head_str = 'icons/mob/onmob/solgov-head.dmi')

/obj/item/clothing/head/beret/solgov/diplomatic
	name = "diplomatic security beret"
	desc = "A tan beret denoting service in the SCG Marine Corps Diplomatic Security Group. For security personnel who are more inclined towards style than safety."
	icon_state = "beret_tan"

/obj/item/clothing/head/beret/solgov/borderguard
	name = "border security beret"
	desc = "A green beret with a silver emblem, denoting service in the Bureau of Border Security. For border guards who are more inclined towards style than safety."
	icon_state = "beret_greensilver"

/obj/item/clothing/head/beret/solgov/expedition
	name = "expeditionary beret"
	desc = "A black beret belonging to the SCG Expeditionary Corps. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black"

/obj/item/clothing/head/beret/solgov/expedition/security
	name = "expeditionary security beret"
	desc = "An SCG Expeditionary Corps beret with a security crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_security"

/obj/item/clothing/head/beret/solgov/expedition/medical
	name = "expeditionary medical beret"
	desc = "An SCG Expeditionary Corps beret with a medical crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_medical"

/obj/item/clothing/head/beret/solgov/expedition/engineering
	name = "expeditionary engineering beret"
	desc = "An SCG Expeditionary Corps beret with an engineering crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_engineering"

/obj/item/clothing/head/beret/solgov/expedition/supply
	name = "expeditionary supply beret"
	desc = "An SCG Expeditionary Corps beret with a supply crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_supply"

/obj/item/clothing/head/beret/solgov/expedition/service
	name = "expeditionary service beret"
	desc = "An SCG Expeditionary Corps beret with a service crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_service"

/obj/item/clothing/head/beret/solgov/expedition/exploration
	name = "expeditionary exploration beret"
	desc = "An SCG Expeditionary Corps beret with an exploration crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_exploration"

/obj/item/clothing/head/beret/solgov/expedition/command
	name = "expeditionary officer's beret"
	desc = "An SCG Expeditionary Corps beret with a golden crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_command"

/obj/item/clothing/head/beret/solgov/fleet
	name = "fleet beret"
	desc = "A navy blue beret belonging to the SCG Fleet. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy"

/obj/item/clothing/head/beret/solgov/fleet/security
	name = "fleet security beret"
	desc = "An SCG Fleet beret with a security crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_security"

/obj/item/clothing/head/beret/solgov/fleet/medical
	name = "fleet medical beret"
	desc = "An SCG Fleet beret with a medical crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_medical"

/obj/item/clothing/head/beret/solgov/fleet/engineering
	name = "fleet engineering beret"
	desc = "An SCG Fleet with an engineering crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_engineering"

/obj/item/clothing/head/beret/solgov/fleet/supply
	name = "fleet supply beret"
	desc = "An SCG Fleet beret with a supply crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_supply"

/obj/item/clothing/head/beret/solgov/fleet/service
	name = "fleet service beret"
	desc = "An SCG Fleet beret with a service crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_service"

/obj/item/clothing/head/beret/solgov/fleet/exploration
	name = "fleet exploration beret"
	desc = "An SCG Fleet beret with an exploration crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_exploration"

/obj/item/clothing/head/beret/solgov/fleet/command
	name = "fleet officer's beret"
	desc = "An SCG Fleet beret with a golden crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_command"