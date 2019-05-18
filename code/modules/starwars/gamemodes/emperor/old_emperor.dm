/datum/game_mode/traitor/emperor
	name = "emperor"
	config_tag = "emperor"
	false_report_weight = 10
	traitors_possible = 3 //hard limit on traitors if scaling is turned off
	restricted_jobs = list("AI", "Cyborg", "Sith", "Prisoner")
	protected_jobs = list("Captain")
	required_players = 1	// how many of each type are required
	required_enemies = 1	// how many of each type are required
	recommended_enemies = 3
	reroll_friendly = 1
	enemy_minimum_age = 14

	var/list/possible_emperors = list()
	var/list/emperors = list()
	var/const/emperor_amount = 1 //hard limit on emperors if scaling is turned off

/datum/game_mode/traitor/emperor/announce()
	to_chat(world, "<B>The current game mode is - The Emperor visits!</B>")
	to_chat(world, "<B>The Emperor is visiting, the Rebel scum has send assassins to the station, do not let the Emperor die!</B>")

/datum/game_mode/traitor/emperor/can_start()
	if(!..())
		return 0
	possible_emperors = get_players_for_role(ROLE_EMPEROR)
	if(possible_emperors.len < required_enemies)
		//to_chat(world, "<B>Not enough!!!!</B>")
		return 0
	return 1

/datum/game_mode/traitor/emperor/pre_setup()
	if(CONFIG_GET(flag/protect_roles_from_antagonist))
		restricted_jobs += protected_jobs

	if(CONFIG_GET(flag/protect_assistant_from_antagonist))
		restricted_jobs += "Assistant"

	var/list/datum/mind/possible_emperors = get_players_for_role(ROLE_EMPEROR)

	var/num_emperors = 1

	//var/csc = 1

	if(possible_emperors.len>0)
		for(var/j = 0, j < num_emperors, j++)
			if(!possible_emperors.len)
				break
			var/datum/mind/emperor = antag_pick(possible_emperors)
			antag_candidates -= emperor
			possible_emperors -= emperor
			emperor.special_role = ROLE_EMPEROR
			emperors += emperor
			emperor.restricted_roles = restricted_jobs
		return 1
	else
		return 0
	return 1

/datum/game_mode/traitor/emperor/post_setup()
	for(var/datum/mind/emperor in emperors)
		emperor.add_antag_datum(/datum/antagonist/emperor)
	return ..()

/datum/game_mode/traitor/emperor/make_antag_chance(mob/living/carbon/human/character) //Assigns emperor to latejoiners
//	var/csc = 1
	var/emperorcap = 1
	if(emperors.len >= emperorcap) //Caps number of latejoin antagonists
		..()
		return
	if(emperors.len < 1)
		if(ROLE_EMPEROR in character.client.prefs.be_special)
			if(!is_banned_from(character.ckey, list(ROLE_EMPEROR)) && !QDELETED(character))
				if(age_check(character.client))
					if(!(character.job in restricted_jobs))
						character.mind.make_Changeling()
						emperors += character.mind
	if(QDELETED(character))
		return
	..()

/datum/game_mode/traitor/emperor/generate_report()
	return "The Emperor has come to visit the station, Rebel specialists have arrived to assassinate him and fullfill secondary objectives."
