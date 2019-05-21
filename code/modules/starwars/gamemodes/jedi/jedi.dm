/datum/game_mode
	var/list/datum/mind/jedis = list()

/datum/game_mode/jedi
	name = "jedi"
	config_tag = "jedi"
	antag_flag = ROLE_JEDI
	false_report_weight = 10
	required_players = 20
	required_enemies = 1
	recommended_enemies = 1
	enemy_minimum_age = 14
	round_ends_with_antag_death = 1
	announce_span = "danger"
	announce_text = "There is a Jedi attacking the station!\n\
	<span class='danger'>Jedi</span>: Accomplish your objectives and cause mayhem on the station.\n\
	<span class='notice'>Crew</span>: Eliminate the jedi before they can succeed!"
	var/finished = 0

/datum/game_mode/jedi/pre_setup()
	var/datum/mind/jedi = antag_pick(antag_candidates)
	jedis += jedi
	jedi.assigned_role = ROLE_JEDI
	jedi.special_role = ROLE_JEDI
	log_game("[key_name(jedi)] has been selected as a Jedi") //TODO: Move these to base antag datum
	if(GLOB.jedistart.len == 0)
		setup_error = "No jedi starting location found"
		return FALSE
	for(var/datum/mind/wiz in jedis)
		wiz.current.forceMove(pick(GLOB.jedistart))
	return TRUE


/datum/game_mode/jedi/post_setup()
	for(var/datum/mind/jedi in jedis)
		jedi.add_antag_datum(/datum/antagonist/jedi)
	return ..()

/datum/game_mode/jedi/generate_report()
	return "A dangerous Jedi individual by the name of [pick(GLOB.jedi_first)] [pick(GLOB.jedi_second)] has recently escaped confinement from an unlisted prison facility. This \
		man is a dangerous mutant with the ability to alter himself and the world around him by what he and his leaders believe to be magic. If this man attempts an attack on your station, \
		his execution is highly encouraged, as is the preservation of his body for later study."


/datum/game_mode/jedi/are_special_antags_dead()
	for(var/datum/mind/jedi in jedis)
		if(isliving(jedi.current) && jedi.current.stat!=DEAD)
			return FALSE

	for(var/obj/item/phylactery/P in GLOB.poi_list) //TODO : IsProperlyDead()
		if(P.mind && P.mind.has_antag_datum(/datum/antagonist/jedi))
			return FALSE

	if(SSevents.jedimode) //If summon events was active, turn it off
		SSevents.toggleJedimode()
		SSevents.resetFrequency()

	return TRUE

/datum/game_mode/jedi/set_round_result()
	..()
	if(finished)
		SSticker.mode_result = "loss - jedi killed"
		SSticker.news_report = JEDI_KILLED

/datum/game_mode/jedi/special_report()
	if(finished)
		return "<span class='redtext big'>The jedi[(jedis.len>1)?"s":""] has been killed by the crew! The Jedi has been taught a lesson they will not soon forget!</span>"

//returns whether the mob is a jedi (or apprentice)
/proc/isjedi(mob/living/M)
	return M.mind && M.mind.has_antag_datum(/datum/antagonist/jedi,TRUE)
