/datum/antagonist/rebel_prisoner
	name = "Rebel Prisoner"
	roundend_category = "Rebel Prisoners" //just in case
	antagpanel_category = "NukeOp"
	job_rank = ROLE_REBEL_PRISONER
	antag_moodlet = /datum/mood_event/focused
	var/datum/team/rebel_destruction/prisoner_team
	var/always_new_team = FALSE //If not assigned a team by default ops will try to join existing ones, set this to TRUE to always create new team.
	var/send_to_spawnpoint = TRUE //Should the user be moved to default spawnpoint.
	var/rebel_prisoner_outfit = /datum/outfit/job/prisoner
	can_hijack = HIJACK_HIJACKER //Alternative way to wipe out the station.

/datum/antagonist/rebel_prisoner/proc/update_synd_icons_added(mob/living/M)
	var/datum/atom_hud/antag/opshud = GLOB.huds[ANTAG_HUD_OPS]
	opshud.join_hud(M)
	set_antag_hud(M, "synd")

/datum/antagonist/rebel_prisoner/proc/update_synd_icons_removed(mob/living/M)
	var/datum/atom_hud/antag/opshud = GLOB.huds[ANTAG_HUD_OPS]
	opshud.leave_hud(M)
	set_antag_hud(M, null)

/datum/antagonist/rebel_prisoner/apply_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	update_synd_icons_added(M)
	owner.add_trait(TRAIT_DISK_VERIFIER, NUKEOP_TRAIT)

/datum/antagonist/rebel_prisoner/remove_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	update_synd_icons_removed(M)
	owner.remove_trait(TRAIT_DISK_VERIFIER, NUKEOP_TRAIT)

/datum/antagonist/rebel_prisoner/proc/equip_op()
	//if(!ishuman(owner.current))
	//	return
	//var/mob/living/carbon/human/H = owner.current

	//H.set_species(/datum/species/human) //Plasamen burn up otherwise, and lizards are vulnerable to asimov AIs

	//H.equipOutfit(rebel_prisoner_outfit )
	return TRUE

/datum/antagonist/rebel_prisoner/greet()
	owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/ops.ogg',100,0)
	to_chat(owner, "<span class='notice'>You are a [prisoner_team ? prisoner_team.rebel_prisoner_name : "rebel"] agent!</span>")
	owner.announce_objectives()

/datum/antagonist/rebel_prisoner/on_gain()
	give_alias()
	forge_objectives()
	. = ..()
	equip_op()
	memorize_code()
	if(send_to_spawnpoint)
		move_to_spawnpoint()

/datum/antagonist/rebel_prisoner/get_team()
	return prisoner_team

/datum/antagonist/rebel_prisoner/proc/give_alias()
	if(prisoner_team && prisoner_team.rebel_prisoner_name)
		var/number = 1
		number = prisoner_team.members.Find(owner)
		owner.current.real_name = "[prisoner_team.rebel_prisoner_name] Prisoner #[number]"

/datum/antagonist/rebel_prisoner/proc/memorize_code()
	if(prisoner_team && prisoner_team.tracked_nuke && prisoner_team.memorized_code)
		antag_memory += "<B>[prisoner_team.tracked_nuke] Code</B>: [prisoner_team.memorized_code]<br>"
		to_chat(owner, "The secret rebel code is: <B>[prisoner_team.memorized_code]</B>")
	else
		to_chat(owner, "Unfortunately the rebellion was unable to provide you with the secret codes.")

/datum/antagonist/rebel_prisoner/proc/forge_objectives()
	if(prisoner_team)
		objectives |= prisoner_team.objectives

/datum/antagonist/rebel_prisoner/proc/move_to_spawnpoint()
	var/team_number = 1
	if(prisoner_team)
		team_number = prisoner_team.members.Find(owner)
	owner.current.forceMove(GLOB.rebel_destruction_start[((team_number - 1) % GLOB.rebel_destruction_start.len) + 1])

/datum/antagonist/rebel_prisoner/leader/move_to_spawnpoint()
	owner.current.forceMove(pick(GLOB.rebel_destruction_leader_start))

/datum/antagonist/rebel_prisoner/create_team(datum/team/rebel_destruction/new_team)
	if(!new_team)
		if(!always_new_team)
			for(var/datum/antagonist/rebel_prisoner/N in GLOB.antagonists)
				if(!N.owner)
					continue
				if(N.prisoner_team)
					prisoner_team = N.prisoner_team
					return
		prisoner_team = new /datum/team/rebel_destruction
		prisoner_team.update_objectives()
		//assign_nuke() //This is bit ugly
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	prisoner_team = new_team

/datum/antagonist/rebel_prisoner/admin_add(datum/mind/new_owner,mob/admin)
	new_owner.assigned_role = ROLE_REBEL_PRISONER
	new_owner.add_antag_datum(src)
	message_admins("[key_name_admin(admin)] has rebel destruction'ed [key_name_admin(new_owner)].")
	log_admin("[key_name(admin)] has rebel destruction'ed [key_name(new_owner)].")

/datum/antagonist/rebel_prisoner/get_admin_commands()
	. = ..()
	.["Send to base"] = CALLBACK(src,.proc/admin_send_to_base)
	.["Tell code"] = CALLBACK(src,.proc/admin_tell_code)

/datum/antagonist/rebel_prisoner/proc/admin_send_to_base(mob/admin)
	owner.current.forceMove(pick(GLOB.rebel_destruction_start))

/datum/antagonist/rebel_prisoner/proc/admin_tell_code(mob/admin)
	var/code
	for (var/obj/machinery/nuclearbomb/bombue in GLOB.machines)
		if (length(bombue.r_code) <= 5 && bombue.r_code != initial(bombue.r_code))
			code = bombue.r_code
			break
	if (code)
		antag_memory += "<B>Secret Rebel Code</B>: [code]<br>"
		to_chat(owner.current, "The secret rebel code is: <B>[code]</B>")
	else
		to_chat(admin, "<span class='danger'>No valid code found!</span>")

/datum/antagonist/rebel_prisoner/leader
	name = "Rebel Prisoner Leader"
	rebel_prisoner_outfit = /datum/outfit/job/prisoner
	always_new_team = TRUE
	var/title

/datum/antagonist/rebel_prisoner/leader/memorize_code()
	..()
	if(prisoner_team && prisoner_team.memorized_code)
		var/obj/item/paper/P = new
		P.info = "The secret rebel code is: <b>[prisoner_team.memorized_code]</b>"
		P.name = "secret rebel code"
		var/mob/living/carbon/human/H = owner.current
		if(!istype(H))
			P.forceMove(get_turf(H))
		else
			H.put_in_hands(P, TRUE)
			H.update_icons()

/datum/antagonist/rebel_prisoner/leader/give_alias()
	title = pick("Commander", "Chief", "Agent", "SpecialOps")
	if(prisoner_team && prisoner_team.rebel_prisoner_name)
		owner.current.real_name = "[prisoner_team.rebel_prisoner_name] [title]"
	else
		owner.current.real_name = "Rebel [title]"

/datum/antagonist/rebel_prisoner/leader/greet()
	owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/ops.ogg',100,0)
	to_chat(owner, "<B>You are the Rebel [title] for this mission. You and your team need to survive, escape the imperials. Do not let them get their hands on the codes. Either escape, kill the enemy or die.</B>")
	to_chat(owner, "<B>If you feel you are not up to this task, give your ID to another operative.</B>")
	to_chat(owner, "<B>In your hand you will find a special item capable of triggering a greater challenge for your team. Examine it carefully and consult with your fellow operatives before activating it.</B>")
	owner.announce_objectives()
	addtimer(CALLBACK(src, .proc/rebelteam_name_assign), 1)


/datum/antagonist/rebel_prisoner/leader/proc/rebelteam_name_assign()
	if(!prisoner_team)
		return
	prisoner_team.rename_team(ask_name())

/datum/team/rebel_destruction/proc/rename_team(new_name)
	rebel_prisoner_name = new_name
	name = "[rebel_prisoner_name] Team"
	for(var/I in members)
		var/datum/mind/synd_mind = I
		var/mob/living/carbon/human/H = synd_mind.current
		if(!istype(H))
			continue
		var/chosen_name = H.dna.species.random_name(H.gender,0,rebel_prisoner_name)
		H.fully_replace_character_name(H.real_name,chosen_name)

/datum/antagonist/rebel_prisoner/leader/proc/ask_name()
	var/randomname = pick(GLOB.last_names)
	var/newname = stripped_input(owner.current,"You are the rebel operative [title]. Please choose a last name for your family.", "Name change",randomname)
	if (!newname)
		newname = randomname
	else
		newname = reject_bad_name(newname)
		if(!newname)
			newname = randomname

	return capitalize(newname)

/datum/antagonist/rebel_prisoner/lone
	name = "Lone Operative"
	always_new_team = TRUE
	send_to_spawnpoint = FALSE //Handled by event
	rebel_prisoner_outfit  = /datum/outfit/job/prisoner

/datum/antagonist/rebel_prisoner/reinforcement
	send_to_spawnpoint = FALSE
	rebel_prisoner_outfit  = /datum/outfit/job/prisoner

/datum/team/rebel_destruction
	var/rebel_prisoner_name
	var/obj/machinery/nuclearbomb/tracked_nuke
	var/core_objective = /datum/objective/rebel_destruction
	var/memorized_code

/datum/team/rebel_destruction/New()
	..()
	rebel_prisoner_name = rebel_prisoner_name()

/datum/team/rebel_destruction/proc/update_objectives()
	if(core_objective)
		var/datum/objective/O = new core_objective
		O.team = src
		objectives += O

/datum/team/rebel_destruction/proc/operatives_dead()
	for(var/I in members)
		var/datum/mind/operative_mind = I
		if(ishuman(operative_mind.current) && (operative_mind.current.stat != DEAD))
			return FALSE
	return TRUE

/datum/team/rebel_destruction/proc/syndies_escaped()
	var/obj/docking_port/mobile/S = SSshuttle.getShuttle("syndicate")
	var/obj/docking_port/stationary/transit/T = locate() in S.loc
	return S && (is_centcom_level(S.z) || T)

/datum/team/rebel_destruction/proc/get_result()
	var/evacuation = EMERGENCY_ESCAPED_OR_ENDGAMED
	var/syndies_didnt_escape = !syndies_escaped()
	var/station_was_nuked = SSticker.mode.station_was_nuked

	if(station_was_nuked && !syndies_didnt_escape)
		return REBEL_DESTRUCTION_RESULT_REBEL_WIN
	else if (station_was_nuked && syndies_didnt_escape)
		return REBEL_DESTRUCTION_RESULT_NOSURVIVORS
	else if (evacuation && operatives_dead())
		return REBEL_DESTRUCTION_RESULT_CREW_WIN_SYNDIES_DEAD
	else if (evacuation)
		return REBEL_DESTRUCTION_RESULT_CREW_WIN
	else
		return	//Undefined result

/datum/team/rebel_destruction/roundend_report()
	var/list/parts = list()
	parts += "<span class='header'>[rebel_prisoner_name] Operatives:</span>"

	switch(get_result())
		if(REBEL_DESTRUCTION_RESULT_REBEL_WIN)
			parts += "<span class='greentext big'>Rebel Major Victory!</span>"
			parts += "<B>[rebel_prisoner_name] operatives have escaped the [station_name()]!</B>"
		if(REBEL_DESTRUCTION_RESULT_NOSURVIVORS)
			parts += "<span class='neutraltext big'>Total Annihilation</span>"
			parts +=  "<B>[rebel_prisoner_name] operatives destroyed [station_name()] but did not leave the area in time and got caught in the explosion.</B> Next time, don't lose the disk!"
		if(REBEL_DESTRUCTION_RESULT_CREW_WIN_SYNDIES_DEAD)
			parts += "<span class='redtext big'>Crew Major Victory!</span>"
			parts += "<B>The Research Staff has extracted the rebel codes and killed the [rebel_prisoner_name] Operatives</B>"
		if(REBEL_DESTRUCTION_RESULT_CREW_WIN)
			parts += "<span class='redtext big'>Crew Major Victory</span>"
			parts += "<B>The Research Staff has extracted the rebel codes and stopped the [rebel_prisoner_name] Operatives!</B>"
		else
			parts += "<span class='neutraltext big'>Neutral Victory</span>"
			parts += "<B>Mission aborted!</B>"

	var/text = "<br><span class='header'>The rebel operatives were:</span>"
	var/purchases = ""
	var/TC_uses = 0
	LAZYINITLIST(GLOB.uplink_purchase_logs_by_key)
	for(var/I in members)
		var/datum/mind/rebel_prisoner = I
		var/datum/uplink_purchase_log/H = GLOB.uplink_purchase_logs_by_key[rebel_prisoner.key]
		if(H)
			TC_uses += H.total_spent
			purchases += H.generate_render(show_key = FALSE)
	text += printplayerlist(members)
	text += "<br>"
	text += "(Rebels used [TC_uses] TC) [purchases]"
	if(TC_uses == 0 && SSticker.mode.station_was_nuked && !operatives_dead())
		text += "<BIG>[icon2html('icons/badass.dmi', world, "badass")]</BIG>"

	parts += text

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"

/datum/team/rebel_destruction/antag_listing_name()
	if(rebel_prisoner_name)
		return "[rebel_prisoner_name] Rebels"
	else
		return "Rebels"

/datum/team/rebel_destruction/antag_listing_entry()
	var/disk_report = "<b>Rebel Code(s)</b><br>"
	disk_report += "<table cellspacing=5>"
	disk_report += "</table>"
	var/common_part = ..()
	return common_part + disk_report

/datum/team/rebel_destruction/is_gamemode_hero()
	return SSticker.mode.name == "rebel destruction"
