/datum/game_mode/rebel
	name = "rebel"
	config_tag = "rebel"
	report_type = "rebel"
	antag_flag = ROLE_REBEL
	false_report_weight = 20 //Reports of rebels are pretty common.
	restricted_jobs = list("Cyborg")//They are part of the AI if he is rebel so are they, they use to get double chances
	protected_jobs = list("Alpha Squad Sergeant", "Bravo Squad Sergeant", "Alpha Squad Stormtrooper", "Bravo Squad Stormtrooper", "Warden", "Detective", "Captain of the Guard", "Captain", "Lieutenant", "Sith", "Enperor") //YOGS -  added the hop
	required_players = 1
	required_enemies = 1
	recommended_enemies = 4
	reroll_friendly = 1
	enemy_minimum_age = 0
	var/rebel_name = "rebel"
	//var/list/datum/mind/rebels = list()

	announce_span = "danger"
	announce_text = "There are rebel agents on the station!\n\
	<span class='danger'>Rebels</span>: Accomplish your objectives.\n\
	<span class='notice'>Crew</span>: Do not let the traitors succeed!"

	var/list/datum/mind/pre_rebels = list()
	var/rebels_possible = 4 //hard limit on rebels if scaling is turned off
	var/num_modifier = 0 // Used for gamemodes, that are a child of rebel, that need more than the usual.
	var/antag_datum = /datum/antagonist/rebel //what type of antag to create
	var/rebels_required = TRUE //Will allow no rebels


/datum/game_mode/rebel/pre_setup()

	if(CONFIG_GET(flag/protect_roles_from_antagonist))
		restricted_jobs += protected_jobs

	if(CONFIG_GET(flag/protect_assistant_from_antagonist))
		restricted_jobs += "Assistant"

	var/num_rebels = 1

	var/tsc = CONFIG_GET(number/traitor_scaling_coeff)
	if(tsc)
		num_rebels = max(1, min(round(num_players() / (tsc * 2)) + 2 + num_modifier, round(num_players() / tsc) + num_modifier))
	else
		num_rebels = max(1, min(num_players(), rebels_possible))

	for(var/j = 0, j < num_rebels, j++)
		if (!antag_candidates.len)
			break
		var/datum/mind/rebel = antag_pick(antag_candidates)
		pre_rebels += rebel
		rebel.special_role = rebel_name
		rebel.restricted_roles = restricted_jobs
		//log_game("[key_name(rebel)] has been selected as a [rebel_name]") | yogs - redundant
		antag_candidates.Remove(rebel)

	var/enough_tators = !rebels_required || pre_rebels.len > 0

	if(!enough_tators)
		setup_error = "Not enough rebel candidates"
		return FALSE
	else
		return TRUE


/datum/game_mode/rebel/post_setup()
	for(var/datum/mind/rebel in pre_rebels)
		var/datum/antagonist/rebel/new_antag = new antag_datum()
		addtimer(CALLBACK(rebel, /datum/mind.proc/add_antag_datum, new_antag), rand(10,100))
	if(!exchange_blue)
		exchange_blue = -1 //Block latejoiners from getting exchange objectives
	..()

	//We're not actually ready until all rebels are assigned.
	gamemode_ready = FALSE
	addtimer(VARSET_CALLBACK(src, gamemode_ready, TRUE), 101)
	return TRUE

/datum/game_mode/rebel/make_antag_chance(mob/living/carbon/human/character) //Assigns rebel to latejoiners
	var/tsc = CONFIG_GET(number/traitor_scaling_coeff)
	var/rebelcap = min(round(GLOB.joined_player_list.len / (tsc * 2)) + 2 + num_modifier, round(GLOB.joined_player_list.len / tsc) + num_modifier)
	if((SSticker.mode.rebels.len + pre_rebels.len) >= rebelcap) //Upper cap for number of latejoin antagonists
		return
	if((SSticker.mode.rebels.len + pre_rebels.len) <= (rebelcap - 2) || prob(100 / (tsc * 2)))
		if(antag_flag in character.client.prefs.be_special)
			if(!is_banned_from(character.ckey, list(ROLE_TRAITOR, ROLE_SYNDICATE)) && !QDELETED(character))
				if(age_check(character.client))
					if(!(character.job in restricted_jobs))
						add_latejoin_rebel(character.mind)

/datum/game_mode/rebel/proc/add_latejoin_rebel(datum/mind/character)
	var/datum/antagonist/rebel/new_antag = new antag_datum()
	character.add_antag_datum(new_antag)

/datum/game_mode/rebel/generate_report()
	return "Although more specific threats are commonplace, you should always remain vigilant for rebel agents aboard your station. Rebel communications have implied that many \
		Imperial citizens are rebel agents."
