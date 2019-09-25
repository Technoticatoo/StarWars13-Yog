/datum/job/emperor/equip(mob/living/carbon/human/M, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	..()
	if (visualsOnly)
		return
	var/add_mutations = list(FORCE_SENSITIVE_SITH_1, FORCE_SENSITIVE_SITH_2, FORCE_SENSITIVE_SITH_3, FORCE_SENSITIVE_SITH_4)

	for(var/mutation in add_mutations)
		if(M.dna.get_mutation(mutation))
			continue //Skip permanent mutations we already have.
		if(mutation == RACEMUT && ishuman(M))
			M = M.dna.add_mutation(mutation, MUT_OTHER)
		else
			M.dna.add_mutation(mutation, MUT_OTHER)

	/*H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceck(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/forceth(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceln(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceslow(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/forceheal(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcehealothers(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/forceprotect(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcewall(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/saber_return(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/force_control(null))*/



/datum/job/emperor
	title = "Emperor"
	flag = EMPEROR
	department_head = list("CentCom")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 0
	supervisors = "None"
	selection_color = "#afafaf"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 180
	exp_type = EXP_TYPE_COMMAND
	var/hud_version = "wizard"

	outfit = /datum/outfit/job/emperor

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
			            ACCESS_MEDICAL, ACCESS_ENGINE, ACCESS_CHANGE_IDS, ACCESS_AI_UPLOAD, ACCESS_EVA, ACCESS_HEADS,
			            ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
			            ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_CARGO, ACCESS_MAILSORTING, ACCESS_QM, ACCESS_HYDROPONICS, ACCESS_LAWYER,
			            ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_MINING, ACCESS_VAULT, ACCESS_MINING_STATION,
						ACCESS_MECH_MINING, ACCESS_MECH_ENGINE, ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY, ACCESS_MECH_MEDICAL,
			            ACCESS_HOP, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM, ACCESS_MANUFACTURING, ACCESS_FACTION_EMPIRE) //yogs - added ACCESS_MANUFACTURING
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
			            ACCESS_MEDICAL, ACCESS_ENGINE, ACCESS_CHANGE_IDS, ACCESS_AI_UPLOAD, ACCESS_EVA, ACCESS_HEADS,
			            ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
			            ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_CARGO, ACCESS_MAILSORTING, ACCESS_QM, ACCESS_HYDROPONICS, ACCESS_LAWYER,
						ACCESS_MECH_MINING, ACCESS_MECH_ENGINE, ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY, ACCESS_MECH_MEDICAL,
			            ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_MINING, ACCESS_VAULT, ACCESS_MINING_STATION,
			            ACCESS_HOP, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM, ACCESS_MANUFACTURING, ACCESS_FACTION_EMPIRE) //yogs - added ACCESS_MANUFACTURING as it's the clerk's
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_EMPEROR


/datum/outfit/job/emperor
	name = "Emperor"
	jobtype = /datum/job/emperor

	id = /obj/item/card/id/empire
	belt = /obj/item/pda/emperor
	ears = /obj/item/radio/headset/heads/sith/alt
	gloves = /obj/item/clothing/gloves/color/sith
	uniform =  /obj/item/clothing/under/imperial/sith
	//suit = /obj/item/clothing/suit/armor/vest/sithcarapace
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/sithat
	backpack_contents = list(/obj/item/melee/transforming/energy/sword/saber/red=1, /obj/item/card/id/departmental_budget/civ=1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/emperor/hardsuit
	name = "Emperor (Hardsuit)"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/imperial/sith
	suit_store = /obj/item/tank/internals/oxygen

/datum/job/emperor/announce(mob/living/carbon/human/H)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/minor_announce, "The Emperor, [H.real_name] on deck, tremble in fear, and perish before him, you who disobey him!"))

/datum/job/sith/equip(mob/living/carbon/human/M, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	..()
	if (visualsOnly)
		return
	var/add_mutations = list(FORCE_SENSITIVE_SITH_1, FORCE_SENSITIVE_SITH_2, FORCE_SENSITIVE_SITH_3 )

	for(var/mutation in add_mutations)
		if(M.dna.get_mutation(mutation))
			continue //Skip permanent mutations we already have.
		if(mutation == RACEMUT && ishuman(M))
			M = M.dna.add_mutation(mutation, MUT_OTHER)
		else
			M.dna.add_mutation(mutation, MUT_OTHER)
    /*H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceck(null))
    H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/forceth(null))
    H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceln(null))
    H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceslow(null))
    H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/saber_return(null))
    H.mind.AddSpell(new /obj/effect/proc_holder/spell/force_control(null))*/

/datum/job/sith
	title = "Sith"
	flag = SITH
	department_head = list("CentCom")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Emperor"
	selection_color = "#afafaf"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 180
	exp_type = EXP_TYPE_COMMAND
	var/hud_version = "wizard"

	outfit = /datum/outfit/job/sith

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
			            ACCESS_MEDICAL, ACCESS_ENGINE, ACCESS_CHANGE_IDS, ACCESS_AI_UPLOAD, ACCESS_EVA, ACCESS_HEADS,
			            ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
			            ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_CARGO, ACCESS_MAILSORTING, ACCESS_QM, ACCESS_HYDROPONICS, ACCESS_LAWYER,
			            ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_MINING, ACCESS_VAULT, ACCESS_MINING_STATION,
						ACCESS_MECH_MINING, ACCESS_MECH_ENGINE, ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY, ACCESS_MECH_MEDICAL,
			            ACCESS_HOP, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM, ACCESS_MANUFACTURING, ACCESS_FACTION_EMPIRE) //yogs - added ACCESS_MANUFACTURING
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
			            ACCESS_MEDICAL, ACCESS_ENGINE, ACCESS_CHANGE_IDS, ACCESS_AI_UPLOAD, ACCESS_EVA, ACCESS_HEADS,
			            ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
			            ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_CARGO, ACCESS_MAILSORTING, ACCESS_QM, ACCESS_HYDROPONICS, ACCESS_LAWYER,
						ACCESS_MECH_MINING, ACCESS_MECH_ENGINE, ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY, ACCESS_MECH_MEDICAL,
			            ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_MINING, ACCESS_VAULT, ACCESS_MINING_STATION,
			            ACCESS_HOP, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM, ACCESS_MANUFACTURING, ACCESS_FACTION_EMPIRE) //yogs - added ACCESS_MANUFACTURING as it's the clerk's	//See get_access()
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_SITH


/datum/outfit/job/sith
	name = "Sith"
	jobtype = /datum/job/sith

	id = /obj/item/card/id/empire
	belt = /obj/item/pda/sith
	ears = /obj/item/radio/headset/heads/sith/alt
	gloves = /obj/item/clothing/gloves/color/sith
	uniform =  /obj/item/clothing/under/imperial/sith
	//suit = /obj/item/clothing/suit/armor/vest/sithcarapace
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/sithat
	backpack_contents = list(/obj/item/melee/transforming/energy/sword/saber/red=1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/sith/hardsuit
	name = "Sith (Hardsuit)"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/imperial/sith
	suit_store = /obj/item/tank/internals/oxygen

/datum/job/sith/announce(mob/living/carbon/human/H)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/minor_announce, "Sith Lord [H.real_name] on deck, tremble in fear, you who are disloyal!"))

/*
Sith Acolyte
*/
/datum/job/chaplain
	title = "Sith Acolyte"
	flag = CHAPLAIN
	department_head = list("Sith")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Sith Lord"
	selection_color = "#d9d9d9"

	outfit = /datum/outfit/job/chaplain

	access = list(ACCESS_MORGUE, ACCESS_CHAPEL_OFFICE, ACCESS_CREMATORIUM, ACCESS_THEATRE, ACCESS_FACTION_EMPIRE)
	minimal_access = list(ACCESS_MORGUE, ACCESS_CHAPEL_OFFICE, ACCESS_CREMATORIUM, ACCESS_THEATRE, ACCESS_FACTION_EMPIRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_SITH_ACOLYTE


/datum/job/chaplain/after_spawn(mob/living/H, mob/M)
	if(H.mind)
		H.mind.isholy = TRUE

	var/obj/item/storage/book/bible/booze/B = new

	if(SSreligion.religion)
		B.deity_name = SSreligion.deity
		B.name = SSreligion.bible_name
		B.icon_state = SSreligion.bible_icon_state
		B.item_state = SSreligion.bible_item_state
		to_chat(H, "There is already an established religion onboard the station. You are an acolyte of [SSreligion.deity]. Defer to the Sith Acolyte.")
		H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)
		var/nrt = SSreligion.holy_weapon_type || /obj/item/nullrod
		var/obj/item/nullrod/N = new nrt(H)
		H.put_in_hands(N)
		return

	var/new_religion = "Dark Side of the Force"
	if(M.client && M.client.prefs.custom_names["religion"])
		new_religion = M.client.prefs.custom_names["religion"]

	var/new_deity = "The Dark Side"
	if(M.client && M.client.prefs.custom_names["deity"])
		new_deity = M.client.prefs.custom_names["deity"]

	B.deity_name = new_deity


	switch(lowertext(new_religion))
		if("Dark Side of the Force")
			B.name = pick("The Sith Code","The Dark Side Scrolls")
		else
			B.name = "The Sith Code"

	SSreligion.religion = new_religion
	SSreligion.bible_name = B.name
	SSreligion.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)

/datum/outfit/job/chaplain
	name = "Sith Acolyte"
	jobtype = /datum/job/chaplain

	belt = /obj/item/pda/chaplain
	uniform = /obj/item/clothing/under/rank/chaplain
	backpack_contents = list(/obj/item/camera/spooky = 1)
	backpack = /obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack

