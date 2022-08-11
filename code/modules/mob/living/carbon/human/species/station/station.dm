/datum/species/human
	name = SPECIES_HUMAN
	name_plural = "Humans"
	primitive_form = "Monkey"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "Humanity in the 26th century is facing an energy and resource crisis on an unprecedented scale. Brutal wars have been fought for control of Earth and her colonies. \
	Out of the darkness, came a light however when in the early 25th century the Concordance Extraction Corporation unveiled plans to mine large swathes of planets using huge ships fitted with gravitational tethers to literally pull planets apart piece by piece, process their mineral contents, and dump the waste.<br/><br/> \
	This discovery proved vital for the survival of mankind and the CEC grew rapidly, becoming one of the largest mining corporations in history and quickly dwarfing the competition. Several dozen planet cracking ships were created and crewed with over a thousand people each, sent to the far reaches of the galaxy to harvest resources to bring back to Earth to ensure their way of life could continue. <br/><br/> \
	However, in the early 26th century the CEC discovered a world teeming with untapped potential, rich in every resource known to man with survey probes returning with incredible results from mere surface scratchings. There was only one setback, this planet - Aegis VII - was within the restricted Cygnus system, a system kept under military quarantine for over 200 years, and thus this warning was largely ignored by the CEC, who set up an illegal mining colony on Aegis VII in 2506. <br/><br/> \
	Aegis VII represents mankind's last, best hope in a desperate bid to hold off the coming darkness, as resources burn up and people starve back home, humanity remains on the clock to survive even just a few more years and so you take your part in this operation. As one of the many CEC employees sent to the Cygnus system or Aegis VII itself, your actions may very well shape the future of mankind. Either leading to the temporary salvation of all humanity, or extinction."
	name_language = LANGUAGE_GALCOM
	min_age = 16
	max_age = 65

	limb_health_factor = 1.1
	pain_shock_threshold = 55

	gluttonous = GLUT_TINY

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_NO_LACE
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE_NORMAL | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

	sexybits_location = BP_GROIN

	inherent_verbs = list(
		/mob/living/carbon/human/proc/tie_hair)

	slowdown = 1.5

	pain_audio_threshold = 20//humans can take a bit before something starts to hurt terribly
	species_audio = list(SOUND_PAIN_MALE = list(
	'sound/voice/human/male_pain_1.ogg',
	'sound/voice/human/male_pain_2.ogg',
	'sound/voice/human/male_pain_3.ogg',
	'sound/voice/human/male_pain_4.ogg',
	'sound/voice/human/male_pain_5.ogg',
	'sound/voice/human/male_pain_6.ogg',
	'sound/voice/human/male_pain_7.ogg',
	'sound/voice/human/male_pain_8.ogg'),
	 SOUND_PAIN_FEMALE = list('sound/voice/human/female_pain_1.ogg',
	'sound/voice/human/female_pain_2.ogg',
	'sound/voice/human/female_pain_3.ogg',
	'sound/voice/human/female_pain_4.ogg',
	'sound/voice/human/female_pain_5.ogg',
	'sound/voice/human/female_pain_6.ogg',
	'sound/voice/human/female_pain_7.ogg',
	'sound/voice/human/female_pain_8.ogg'))

/datum/species/human/get_bodytype(var/mob/living/carbon/human/H)
	return SPECIES_HUMAN

/datum/species/human/handle_npc(var/mob/living/carbon/human/H)
	if(H.stat != CONSCIOUS)
		return

	if(H.get_shock() && H.shock_stage < 40 && prob(3))
		H.emote(pick("moan","groan"))

	if(H.shock_stage > 10 && prob(3))
		H.emote(pick("cry","whimper"))

	if(H.shock_stage >= 40 && prob(3))
		H.emote("scream", "pain")

	if(!H.restrained() && H.lying && H.shock_stage >= 60 && prob(3))
		H.custom_emote(VISIBLE_MESSAGE, "thrashes in agony")

	if(!H.restrained() && H.shock_stage < 40 && prob(3))
		var/maxdam = 0
		var/obj/item/organ/external/damaged_organ = null
		for(var/obj/item/organ/external/E in H.organs)
			if(!E.can_feel_pain()) continue
			var/dam = E.get_damage()
			// make the choice of the organ depend on damage,
			// but also sometimes use one of the less damaged ones
			if(dam > maxdam && (maxdam == 0 || prob(50)) )
				damaged_organ = E
				maxdam = dam
		var/datum/gender/T = gender_datums[H.get_gender()]
		if(damaged_organ)
			if(damaged_organ.status & ORGAN_BLEEDING)
				H.custom_emote(VISIBLE_MESSAGE, "clutches [T.his] [damaged_organ.name], trying to stop the blood.")
			else if(damaged_organ.status & ORGAN_BROKEN)
				H.custom_emote(VISIBLE_MESSAGE, "holds [T.his] [damaged_organ.name] carefully.")
			else if(damaged_organ.burn_dam > damaged_organ.brute_dam && damaged_organ.organ_tag != BP_HEAD)
				H.custom_emote(VISIBLE_MESSAGE, "blows on [T.his] [damaged_organ.name] carefully.")
			else
				H.custom_emote(VISIBLE_MESSAGE, "rubs [T.his] [damaged_organ.name] carefully.")

		for(var/obj/item/organ/I in H.internal_organs)
			if((I.status & ORGAN_DEAD) || BP_IS_ROBOTIC(I)) continue
			if(I.damage > 2) if(prob(2))
				var/obj/item/organ/external/parent = H.get_organ(I.parent_organ)
				H.custom_emote(VISIBLE_MESSAGE, "clutches [T.his] [parent.name]!")

/datum/species/human/get_ssd(var/mob/living/carbon/human/H)
	if(H.stat == CONSCIOUS)
		return "staring blankly, not reacting to your presence"
	return ..()

/datum/species/human/handle_organ_external_damage(var/obj/item/organ/external/organ, brute, burn, damage_flags, used_weapon)
	SEND_SIGNAL(organ.owner, COMSIG_MOB_DAMAGE_HIT, organ, brute, burn, damage_flags, used_weapon)

	var/mob/living/L = organ.owner
	//Here we'll handle pain audio
	if (pain_audio_threshold)
		var/total_damage = brute+burn
		if (total_damage >= (total_health * pain_audio_threshold))
			if (!L.incapacitated(INCAPACITATION_KNOCKOUT) && L.check_audio_cooldown(SOUND_PAIN)) //Must be conscious to scream
				if(MALE)
					play_species_audio(L, SOUND_PAIN_MALE, 60, 1)
					L.set_audio_cooldown(SOUND_PAIN_MALE, 3 SECONDS)
				if(FEMALE)
					play_species_audio(L, SOUND_PAIN_FEMALE, 60, 1)
					L.set_audio_cooldown(SOUND_PAIN_FEMALE, 3 SECONDS)
			L.custom_emote(AUDIBLE_MESSAGE, "screams in pain!")
	return args.Copy(2)

/datum/species/tajaran
	name = SPECIES_TAJARA
	name_plural = "Tajaran"
	icobase = 'icons/mob/human_races/species/tajara/body.dmi'
	deform =  'icons/mob/human_races/species/tajara/deformed_body.dmi'
	preview_icon = 'icons/mob/human_races/species/tajara/preview.dmi'
	default_h_style = "Tajaran Ears"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp)
	lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
	slowdown = -0.5
	brute_mod = 1.15
	burn_mod =  1.15
	flash_mod = 1.4
	gluttonous = GLUT_TINY
	num_alternate_languages = 1
	language = LANGUAGE_GUTTER
	additional_langs = list(LANGUAGE_GUTTER)
	assisted_langs = list(LANGUAGE_GUTTER)
	//secondary_langs =
	name_language = LANGUAGE_GUTTER
	health_hud_intensity = 1.75

	min_age = 19
	max_age = 140

	blurb = "The Tajaran are a species of furred mammalian bipeds hailing from the chilly planet of Ahdomai \
	in the Zamsiin-lr system. They are a naturally superstitious species, with the new generations growing up with tales \
	of the heroic struggles of their forebears against the Overseers. This spirit has led them forward to the \
	reconstruction and advancement of their society to what they are today. Their pride for the struggles they \
	went through is heavily tied to their spiritual beliefs. Recent discoveries have jumpstarted the progression \
	of highly advanced cybernetic technology, causing a culture shock within Tajaran society."

	cold_level_1 = 200 //Default 260
	cold_level_2 = 140 //Default 200
	cold_level_3 = 80  //Default 120

	heat_level_1 = 330 //Default 360
	heat_level_2 = 380 //Default 400
	heat_level_3 = 800 //Default 1000

	primitive_form = "Farwa"

	spawn_flags = SPECIES_IS_RESTRICTED | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#afa59e"
	base_color = "#333333"
	blood_color = "#862a51"
	organs_icon = 'icons/mob/human_races/species/tajara/organs.dmi'
	reagent_tag = IS_TAJARA

	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw

	heat_discomfort_level = 292
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)
	cold_discomfort_level = 275

	sexybits_location = BP_GROIN

/datum/species/tajaran/equip_survival_gear(var/mob/living/carbon/human/H)
	..()
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes)

/datum/species/skrell
	name = SPECIES_SKRELL
	name_plural = SPECIES_SKRELL
	icobase = 'icons/mob/human_races/species/skrell/body.dmi'
	deform = 'icons/mob/human_races/species/skrell/deformed_body.dmi'
	preview_icon = 'icons/mob/human_races/species/skrell/preview.dmi'
	primitive_form = "Neaera"
	unarmed_types = list(/datum/unarmed_attack/punch)
	blurb = "An amphibious species, Skrell come from the star system known as Qerr'Vallis, which translates to 'Star of \
	the royals' or 'Light of the Crown'.<br/><br/>Skrell are a highly advanced and logical race who live under the rule \
	of the Qerr'Katish, a caste within their society which keeps the empire of the Skrell running smoothly. Skrell are \
	herbivores on the whole and tend to be co-operative with the other species of the galaxy, although they rarely reveal \
	the secrets of their empire to their allies."
	num_alternate_languages = 2
	secondary_langs = list(LANGUAGE_GUTTER)
	assisted_langs = list(LANGUAGE_GUTTER)
	name_language = null
	health_hud_intensity = 1.75

	min_age = 19
	max_age = 90

	burn_mod = 0.9
	oxy_mod = 1.3
	flash_mod = 1.2
	toxins_mod = 0.8
	siemens_coefficient = 1.3
	warning_low_pressure = WARNING_LOW_PRESSURE * 1.4
	hazard_low_pressure = HAZARD_LOW_PRESSURE * 2
	warning_high_pressure = WARNING_HIGH_PRESSURE / 0.8125
	hazard_high_pressure = HAZARD_HIGH_PRESSURE / 0.84615

	body_temperature = null // cold-blooded, implemented the same way nabbers do it

	lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT

	spawn_flags = SPECIES_IS_RESTRICTED | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR

	flesh_color = "#8cd7a3"
	blood_color = "#1d2cbf"
	base_color = "#006666"
	organs_icon = 'icons/mob/human_races/species/skrell/organs.dmi'

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

	reagent_tag = IS_SKRELL

	override_limb_types = list(BP_HEAD = /obj/item/organ/external/head/skrell)

/datum/species/diona
	name = SPECIES_DIONA
	name_plural = "Dionaea"
	icobase = 'icons/mob/human_races/species/diona/body.dmi'
	deform = 'icons/mob/human_races/species/diona/deformed_body.dmi'
	preview_icon = 'icons/mob/human_races/species/diona/preview.dmi'
	move_intents = list(/decl/move_intent/walk, /decl/move_intent/stalk)
	language = LANGUAGE_GUTTER
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/diona)
	//primitive_form = "Nymph"
	slowdown = 5
	rarity_value = 3
	hud_type = /datum/hud_data/diona
	siemens_coefficient = 0.3
	show_ssd = "completely quiescent"
	num_alternate_languages = 2
	strength = STR_VHIGH
	secondary_langs = list(LANGUAGE_GUTTER)
	assisted_langs = list(LANGUAGE_GUTTER)
	name_language = LANGUAGE_GUTTER
	spawns_with_stack = 0
	health_hud_intensity = 2
	hunger_factor = 3

	min_age = 1
	max_age = 300

	blurb = "Commonly referred to (erroneously) as 'plant people', the Dionaea are a strange space-dwelling collective \
	species hailing from Epsilon Ursae Minoris. Each 'diona' is a cluster of numerous cat-sized organisms called nymphs; \
	there is no effective upper limit to the number that can fuse in gestalt, and reports exist	of the Epsilon Ursae \
	Minoris primary being ringed with a cloud of singing space-station-sized entities.<br/><br/>The Dionaea coexist peacefully with \
	all known species, especially the Skrell. Their communal mind makes them slow to react, and they have difficulty understanding \
	even the simplest concepts of other minds. Their alien physiology allows them survive happily off a diet of nothing but light, \
	water and other radiation."

	has_organ = list(
		BP_NUTRIENT = /obj/item/organ/internal/diona/nutrients,
		BP_STRATA =   /obj/item/organ/internal/diona/strata,
		BP_RESPONSE = /obj/item/organ/internal/diona/node,
		BP_GBLADDER = /obj/item/organ/internal/diona/bladder,
		BP_POLYP =    /obj/item/organ/internal/diona/polyp,
		BP_ANCHOR =   /obj/item/organ/internal/diona/ligament
		)

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/diona/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/diona/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/diona),
		BP_L_ARM =  list("path" = /obj/item/organ/external/diona/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/diona/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/diona/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/diona/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/diona/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/diona/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/diona/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/diona/foot/right)
		)

	base_auras = list(
		/obj/aura/regenerating/human/diona
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/diona_heal_toggle
		)

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 2000
	heat_level_2 = 3000
	heat_level_3 = 4000

	body_temperature = T0C + 15		//make the plant people have a bit lower body temperature, why not

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_IS_PLANT | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_SLIP
	appearance_flags = 0
	spawn_flags = SPECIES_IS_RESTRICTED | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION

	blood_color = "#004400"
	flesh_color = "#907e4a"

	reagent_tag = IS_DIONA
	genders = list(PLURAL)


/datum/unarmed_attack/diona
	attack_verb = list("lashed", "bludgeoned")
	attack_noun = list("tendril")
	eye_attack_text = "a tendril"
	eye_attack_text_victim = "a tendril"

/proc/spawn_diona_nymph(var/turf/target)
	if(!istype(target))
		return 0

	//This is a terrible hack and I should be ashamed.
	var/datum/seed/diona = plant_controller.seeds["diona"]
	if(!diona)
		return 0

	spawn(1) // So it has time to be thrown about by the gib() proc.
		var/mob/living/carbon/alien/diona/D = new(target)
		var/datum/ghosttrap/plant/P = get_ghost_trap("living plant")
		P.request_player(D, "A diona nymph has split off from its gestalt. ")
		spawn(60)
			if(D)
				if(!D.ckey || !D.client)
					D.death()
		return

#define DIONA_LIMB_DEATH_COUNT 9
/datum/species/diona/handle_death_check(var/mob/living/carbon/human/H)
	var/lost_limb_count = has_limbs.len - H.organs.len
	if(lost_limb_count >= DIONA_LIMB_DEATH_COUNT)
		return TRUE
	for(var/thing in H.bad_external_organs)
		var/obj/item/organ/external/E = thing
		if(E && E.is_stump())
			lost_limb_count++
	return (lost_limb_count >= DIONA_LIMB_DEATH_COUNT)
#undef DIONA_LIMB_DEATH_COUNT

/datum/species/diona/can_understand(var/mob/other)
	var/mob/living/carbon/alien/diona/D = other
	if(istype(D))
		return 1
	return 0

/datum/species/diona/equip_survival_gear(var/mob/living/carbon/human/H)
	if(istype(H.get_equipped_item(slot_back), /obj/item/storage/backpack))
		H.equip_to_slot_or_del(new /obj/item/flashlight/flare(H.back), slot_in_backpack)
	else
		H.equip_to_slot_or_del(new /obj/item/flashlight/flare(H), slot_r_hand)

// Dionaea spawned by hand or by joining will not have any
// nymphs passed to them. This should take care of that.
/datum/species/diona/handle_post_spawn(var/mob/living/carbon/human/H)
	H.gender = NEUTER
	. = ..()
	INVOKE_ASYNC(src, .proc/fill_with_nymphs, H)

/datum/species/diona/proc/fill_with_nymphs(var/mob/living/carbon/human/H)

	if(!H || H.species.name != name) return

	var/nymph_count = 0
	for(var/mob/living/carbon/alien/diona/nymph in H)
		nymph_count++
		if(nymph_count >= 3) return

	while(nymph_count < 3)
		new /mob/living/carbon/alien/diona/sterile(H)
		nymph_count++

/datum/species/diona/handle_death(var/mob/living/carbon/human/H)

	if(H.isSynthetic())
		var/mob/living/carbon/alien/diona/S = new(get_turf(H))

		if(H.mind)
			H.mind.transfer_to(S)
		H.visible_message("<span class='danger'>\The [H] collapses into parts, revealing a solitary diona nymph at the core.</span>")
		return
	else
		split_into_nymphs(H)

/datum/species/diona/get_blood_name()
	return "sap"

/datum/species/diona/handle_environment_special(var/mob/living/carbon/human/H)
	if(!H.InStasis() && H.stat != DEAD && H.nutrition < 10)
		H.take_overall_damage(2,0)
