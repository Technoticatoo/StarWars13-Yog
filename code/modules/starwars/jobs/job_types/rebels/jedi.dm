/datum/job/jedi/equip(mob/living/carbon/human/H, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	..()
	if (visualsOnly)
		return

	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/forceheal(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcehealothers(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/forceprotect(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcewall(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceslow(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/saber_return(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/force_control(null))


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

	outfit = /datum/outfit/jedi

	access = list(ACCESS_REBELS_COMMAND, ACCESS_REBELS_MILITARY, ACCESS_REBELS_MEDICAL, ACCESS_REBELS_SQUADRON, ACCESS_REBELS_AGENTS, ACCESS_REBELS_SUPPORT, ACCESS_REBELS_GENERAL)
	minimal_access = list(ACCESS_REBELS_COMMAND, ACCESS_REBELS_MILITARY, ACCESS_REBELS_MEDICAL, ACCESS_REBELS_SQUADRON, ACCESS_REBELS_AGENTS, ACCESS_REBELS_SUPPORT, ACCESS_REBELS_GENERAL)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_JEDI


