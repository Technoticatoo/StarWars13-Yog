/datum/game_mode/rebel_destruction
	name = "rebel destruction"
	config_tag = "rebel_destruction"
	report_type = "rebel_destruction"
	false_report_weight = 10
	required_players = 30 // 30 players - 3 players to be the nuke ops = 27 players remaining
	required_enemies = 2
	recommended_enemies = 5
	antag_flag = ROLE_REBEL_PRISONER
	enemy_minimum_age = 14

	announce_span = "danger"
	announce_text = "Imperial Agents confirm the presence of a or multiple rebel prisoners with sensitive information within the prison population. Find them!\n\
	<span class='danger'>Prisoners</span>: Keep the rebels hidden, do not let the codes fall into imperial hands.\n\
	<span class='notice'>Crew</span>: Find the prisoner, extract the information."

	var/const/prisoners_possible = 5 //If we ever need more syndicate agents.
	var/codes_left = 1 // Call 3714-PRAY right now and order more nukes! Limited offer!
	var/list/pre_destructionops = list()

	var/datum/team/rebel_destruction/prisoner_team

	var/prisoner_antag_datum_type = /datum/antagonist/rebel_prisoner
	var/leader_antag_datum_type = /datum/antagonist/rebel_prisoner/leader

/datum/game_mode/rebel_destruction/pre_setup()
	var/n_agents = min(round(num_players() / 10), antag_candidates.len, prisoners_possible)
	if(n_agents >= required_enemies)
		for(var/i = 0, i < n_agents, ++i)
			var/datum/mind/new_op = pick_n_take(antag_candidates)
			pre_destructionops += new_op
			new_op.assigned_role = "Rebel Prisoner"
			new_op.special_role = "Rebel Prisoner"
			//log_game("[key_name(new_op)] has been selected as a Rebel Prisoner") | yogs - redundant
		return TRUE
	else
		setup_error = "Not enough rebel destruction candidates"
		return FALSE
////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

/datum/game_mode/rebel_destruction/post_setup()
	//Assign leader
	var/datum/mind/leader_mind = pre_destructionops[1]
	var/datum/antagonist/rebel_prisoner/L = leader_mind.add_antag_datum(leader_antag_datum_type)
	prisoner_team = L.prisoner_team
	//Assign the remaining operatives
	for(var/i = 2 to pre_destructionops.len)
		var/datum/mind/prisoner_mind = pre_destructionops[i]
		prisoner_mind.add_antag_datum(prisoner_antag_datum_type)
	return ..()

/datum/game_mode/rebel_destruction/OnNukeExplosion(off_station)
	..()
	codes_left--

/datum/game_mode/rebel_destruction/check_win()
	if (codes_left == 0)
		return TRUE
	return ..()

/datum/game_mode/rebel_destruction/check_finished()
	//Keep the round going if ops are dead but bomb is ticking.
	if(prisoner_team.operatives_dead())
		for(var/obj/machinery/nuclearbomb/N in GLOB.nuke_list)
			if(N.proper_bomb && (N.timing || N.exploding))
				return FALSE
	return ..()

/datum/game_mode/rebel_destruction/set_round_result()
	..()
	var result = prisoner_team.get_result()
	switch(result)
		if(REBEL_DESTRUCTION_RESULT_REBEL_WIN)
			SSticker.mode_result = "win - rebels won"
			SSticker.news_report = STATION_NUKED
		if(REBEL_DESTRUCTION_RESULT_NOSURVIVORS)
			SSticker.mode_result = "halfwin - everyone dead"
			SSticker.news_report = STATION_NUKED
		if(REBEL_DESTRUCTION_RESULT_CREW_WIN_SYNDIES_DEAD)
			SSticker.mode_result = "loss - evacuation - rebel team dead"
			SSticker.news_report = OPERATIVES_KILLED
		if(REBEL_DESTRUCTION_RESULT_CREW_WIN)
			SSticker.mode_result = "loss - evacuation - rebel codes safe"
			SSticker.news_report = OPERATIVES_KILLED
		else
			SSticker.mode_result = "halfwin - interrupted"
			SSticker.news_report = OPERATIVE_SKIRMISH

/datum/game_mode/rebel_destruction/generate_report()
	return "Imperial Agents have reliable information that one or multiple members of the prison population are rebels who have vital information required for the destruction of a rebel base. Find them!"

/proc/is_rebel_operative(mob/M)
	return M && istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/rebel_prisoner)

