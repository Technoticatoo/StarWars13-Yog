/datum/job/jedi/equip(mob/living/carbon/human/M, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	..()
	if (visualsOnly)
		return
	var/add_mutations = list(FORCE_SENSITIVE_1, FORCE_SENSITIVE_2, FORCE_SENSITIVE_3)

	for(var/mutation in add_mutations)
		if(M.dna.get_mutation(mutation))
			continue //Skip permanent mutations we already have.
		if(mutation == RACEMUT && ishuman(M))
			M = M.dna.add_mutation(mutation, MUT_OTHER)
		else
			M.dna.add_mutation(mutation, MUT_OTHER)


/datum/job/jedi
	title = "Jedi Knight"
	flag = JEDI
	department_head = list("General")
	department_flag = REBELS
	faction = "Rebels"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Force"
	selection_color = "#afafaf"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 180
	exp_type = EXP_TYPE_COMMAND
	var/hud_version = "wizard"

	outfit = /datum/outfit/job/jedi

	access = list(ACCESS_REBELS_COMMAND, ACCESS_REBELS_MILITARY, ACCESS_REBELS_MEDICAL, ACCESS_REBELS_SQUADRON, ACCESS_REBELS_AGENTS, ACCESS_REBELS_SUPPORT, ACCESS_REBELS_GENERAL, ACCESS_FACTION_REBELS)
	minimal_access = list(ACCESS_REBELS_COMMAND, ACCESS_REBELS_MILITARY, ACCESS_REBELS_MEDICAL, ACCESS_REBELS_SQUADRON, ACCESS_REBELS_AGENTS, ACCESS_REBELS_SUPPORT, ACCESS_REBELS_GENERAL, ACCESS_FACTION_REBELS)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_JEDI

/datum/outfit/job/jedi
	name= "Jedi"
	uniform = /obj/item/clothing/under/rebels/jedi
	shoes = /obj/item/clothing/shoes/rebels/jedi
	ears = /obj/item/radio/headset/heads/rebel_jedi
	head = /obj/item/clothing/head/helmet/rebels/jedi
	back = /obj/item/storage/backpack/starwars/rebels
	backpack_contents = list(/obj/item/melee/transforming/energy/sword/saber/blue=1, /obj/item/storage/box=1)


