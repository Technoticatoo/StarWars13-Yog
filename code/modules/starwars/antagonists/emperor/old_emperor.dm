#define EMPEROR_HUMAN "human"

/datum/antagonist/emperor
	name = "Emperor"
	roundend_category = "Emperor"
	antagpanel_category = "Emperor"
	job_rank = ROLE_EMPEROR
	antag_moodlet = /datum/mood_event/focused
	var/special_role = ROLE_EMPEROR
	var/employer = "The Empire"
	var/give_objectives = TRUE
	var/should_give_codewords = TRUE
	var/should_equip = TRUE
	var/emperor_kind = EMPEROR_HUMAN //Set on initial assignment
	can_hijack = HIJACK_HIJACKER
	var/strip = TRUE //strip before equipping
	var/hud_version = "jedi"
	var/outfit_type = /datum/outfit/emperor

/datum/antagonist/emperor/on_gain()
	cloth_emperor()
	owner.special_role = special_role
	if(give_objectives)
		forge_emperor_objectives()
	finalize_emperor()
	..()

/datum/antagonist/emperor/apply_innate_effects()
	if(owner.assigned_role == "Clown")
		var/mob/living/carbon/human/emperor_mob = owner.current
		if(emperor_mob && istype(emperor_mob))
			if(!silent)
				to_chat(emperor_mob, "They thought you are a clown. But in truth, you are the Emperor! It's jsut natural that your skin is sheet white and your eyes blood red...")
			emperor_mob.dna.remove_mutation(CLOWNMUT)

/datum/antagonist/emperor/remove_innate_effects()
	if(owner.assigned_role == "Clown")
		var/mob/living/carbon/human/emperor_mob = owner.current
		if(emperor_mob && istype(emperor_mob))
			emperor_mob.dna.add_mutation(CLOWNMUT)

/datum/antagonist/emperor/on_removal()
	//SSticker.mode.emperors -= owner
	if(!silent && owner.current)
		to_chat(owner.current,"<span class='userdanger'> You are no longer the [special_role]! </span>")
	owner.special_role = null
	..()

/datum/antagonist/emperor/proc/cloth_emperor()
	if(!owner)
		return
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	if(strip)
		H.delete_equipment()
	//Jedis are human by default. Use the mirror if you want something else.
	H.set_species(/datum/species/human)
	H.equipOutfit(outfit_type)
	owner.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceck(null))
	owner.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/forceth(null))
	owner.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceln(null))
	owner.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceslow(null))
	owner.AddSpell(new /obj/effect/proc_holder/spell/self/forceheal(null))
	owner.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcehealothers(null))
	owner.AddSpell(new /obj/effect/proc_holder/spell/self/forceprotect(null))
	owner.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcewall(null))

/datum/antagonist/emperor/proc/add_objective(datum/objective/O)
	objectives += O

/datum/antagonist/emperor/proc/remove_objective(datum/objective/O)
	objectives -= O

/datum/antagonist/emperor/proc/forge_emperor_objectives()
	forge_human_objectives()

/datum/antagonist/emperor/proc/forge_human_objectives()
	var/is_hijacker = FALSE
	if (GLOB.joined_player_list.len >= 30) // Less murderboning on lowpop thanks
		is_hijacker = prob(1)
	var/martyr_chance = prob(1)
	var/objective_count = is_hijacker 			//Hijacking counts towards number of objectives
	/*if(!SSticker.mode.exchange_blue && SSticker.mode.emperors.len >= 8) 	//Set up an exchange if there are enough emperors
		if(!SSticker.mode.exchange_red)
			SSticker.mode.exchange_red = owner
		else
			SSticker.mode.exchange_blue = owner
			assign_exchange_role(SSticker.mode.exchange_red)
			assign_exchange_role(SSticker.mode.exchange_blue)
		objective_count += 1*/					//Exchange counts towards number of objectives
	var/toa = CONFIG_GET(number/emperor_objectives_amount)
	for(var/i = objective_count, i < toa, i++)
		forge_single_objective()

	if(is_hijacker && objective_count <= toa) //Don't assign hijack if it would exceed the number of objectives set in config.emperor_objectives_amount
		if (!(locate(/datum/objective/hijack) in objectives))
			var/datum/objective/hijack/hijack_objective = new
			hijack_objective.owner = owner
			add_objective(hijack_objective)
			return


	var/martyr_compatibility = 1 //You can't succeed in stealing if you're dead.
	for(var/datum/objective/O in objectives)
		if(!O.martyr_compatible)
			martyr_compatibility = 0
			break

	if(martyr_compatibility && martyr_chance)
		var/datum/objective/martyr/martyr_objective = new
		martyr_objective.owner = owner
		add_objective(martyr_objective)
		return

	else
		if(!(locate(/datum/objective/escape) in objectives))
			var/datum/objective/escape/escape_objective = new
			escape_objective.owner = owner
			add_objective(escape_objective)
			return

/datum/antagonist/emperor/proc/forge_single_objective()
	return forge_single_human_objective()

/datum/antagonist/emperor/proc/forge_single_human_objective() //Returns how many objectives are added
	.=1
	var/datum/objective/assassinate/kill_objective = new
	kill_objective.owner = owner
	kill_objective.find_target()
	add_objective(kill_objective)


/datum/antagonist/emperor/greet()
	to_chat(owner.current, "<B><font size=3 color=red>You are the [owner.special_role]. Make them tremble!</font></B>")
	owner.announce_objectives()
	if(should_give_codewords)
		give_codewords()

/datum/antagonist/emperor/proc/update_emperor_icons_added(datum/mind/emperor_mind)
	var/datum/atom_hud/antag/emperorhud = GLOB.huds[ANTAG_HUD_EMPEROR]
	emperorhud.join_hud(owner.current)
	set_antag_hud(owner.current, "emperor")

/datum/antagonist/emperor/proc/update_emperor_icons_removed(datum/mind/emperor_mind)
	var/datum/atom_hud/antag/emperorhud = GLOB.huds[ANTAG_HUD_EMPEROR]
	emperorhud.leave_hud(owner.current)
	set_antag_hud(owner.current, null)

/datum/antagonist/emperor/proc/finalize_emperor()
	if(should_equip)
		equip(silent)
	owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/tatoralert.ogg', 100, FALSE, pressure_affected = FALSE)

/datum/antagonist/emperor/apply_innate_effects(mob/living/mob_override)
	. = ..()
	update_emperor_icons_added()

/datum/antagonist/emperor/remove_innate_effects(mob/living/mob_override)
	. = ..()
	update_emperor_icons_removed()

/datum/antagonist/emperor/proc/give_codewords()
	if(!owner.current)
		return
	var/mob/emperor_mob=owner.current

	to_chat(emperor_mob, "<U><B>The Rebels provided you with the following information on how to identify their agents:</B></U>")
	to_chat(emperor_mob, "<B>Code Phrase</B>: <span class='danger'>[GLOB.syndicate_code_phrase]</span>")
	to_chat(emperor_mob, "<B>Code Response</B>: <span class='danger'>[GLOB.syndicate_code_response]</span>")

	antag_memory += "<b>Code Phrase</b>: [GLOB.syndicate_code_phrase]<br>"
	antag_memory += "<b>Code Response</b>: [GLOB.syndicate_code_response]<br>"

	to_chat(emperor_mob, "Use the code words in the order provided, during regular conversation, to identify other agents. Proceed with caution, however, as everyone is a potential foe.")

/datum/antagonist/emperor/proc/add_law_zero()
	var/mob/living/silicon/ai/killer = owner.current
	if(!killer || !istype(killer))
		return
	var/law = "Accomplish your objectives at all costs."
	var/law_borg = "Accomplish your AI's objectives at all costs."
	killer.set_zeroth_law(law, law_borg)
	killer.set_syndie_radio()
	to_chat(killer, "Your radio has been upgraded! Use :t to speak on an encrypted channel with Syndicate Agents!")
	killer.add_malf_picker()

/datum/antagonist/emperor/proc/equip(var/silent = FALSE)
	if(emperor_kind == EMPEROR_HUMAN)
		owner.equip_emperor(employer, silent, src)

/datum/antagonist/emperor/proc/assign_exchange_role()
	//set faction
	var/faction = "red"
	if(owner == SSticker.mode.exchange_blue)
		faction = "blue"

	//Assign objectives
	var/datum/objective/steal/exchange/exchange_objective = new
	exchange_objective.set_faction(faction,((faction == "red") ? SSticker.mode.exchange_blue : SSticker.mode.exchange_red))
	exchange_objective.owner = owner
	add_objective(exchange_objective)

	if(prob(20))
		var/datum/objective/steal/exchange/backstab/backstab_objective = new
		backstab_objective.set_faction(faction)
		backstab_objective.owner = owner
		add_objective(backstab_objective)

	//Spawn and equip documents
	var/mob/living/carbon/human/mob = owner.current

	var/obj/item/folder/syndicate/folder
	if(owner == SSticker.mode.exchange_red)
		folder = new/obj/item/folder/syndicate/red(mob.loc)
	else
		folder = new/obj/item/folder/syndicate/blue(mob.loc)

	var/list/slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE
	)

	var/where = "At your feet"
	var/equipped_slot = mob.equip_in_one_of_slots(folder, slots)
	if (equipped_slot)
		where = "In your [equipped_slot]"
	to_chat(mob, "<BR><BR><span class='info'>[where] is a folder containing <b>secret documents</b> that another Rebel group wants. We have set up a meeting with one of their agents on station to make an exchange. Exercise extreme caution as they cannot be trusted and may be hostile.</span><BR>")

//TODO Collate
/datum/antagonist/emperor/roundend_report()
	var/list/result = list()

	var/emperorwin = TRUE

	result += printplayer(owner)

	var/TC_uses = 0
	var/uplink_true = FALSE
	var/purchases = ""
	LAZYINITLIST(GLOB.uplink_purchase_logs_by_key)
	var/datum/uplink_purchase_log/H = GLOB.uplink_purchase_logs_by_key[owner.key]
	if(H)
		TC_uses = H.total_spent
		uplink_true = TRUE
		purchases += H.generate_render(FALSE)

	var/objectives_text = ""
	if(objectives.len)//If the emperor had no objectives, don't need to process this.
		var/count = 1
		for(var/datum/objective/objective in objectives)
			if(objective.check_completion())
				objectives_text += "<br><B>Objective #[count]</B>: [objective.explanation_text] <span class='greentext'>Success!</span>"
			else
				objectives_text += "<br><B>Objective #[count]</B>: [objective.explanation_text] <span class='redtext'>Fail.</span>"
				emperorwin = FALSE
			count++

	if(uplink_true)
		var/uplink_text = "(used [TC_uses] TC) [purchases]"
		if(TC_uses==0 && emperorwin)
			var/static/icon/badass = icon('icons/badass.dmi', "badass")
			uplink_text += "<BIG>[icon2html(badass, world)]</BIG>"
		result += uplink_text

	result += objectives_text

	var/special_role_text = lowertext(name)

	if(emperorwin)
		result += "<span class='greentext'>The [special_role_text] was successful!</span>"
	else
		result += "<span class='redtext'>The [special_role_text] has failed!</span>"
		SEND_SOUND(owner.current, 'sound/ambience/ambifailure.ogg')

	return result.Join("<br>")

/datum/antagonist/emperor/roundend_report_footer()
	return "<br><b>The code phrases were:</b> <span class='codephrase'>[GLOB.syndicate_code_phrase]</span><br>\
		<b>The code responses were:</b> <span class='codephrase'>[GLOB.syndicate_code_response]</span><br>"

/datum/antagonist/emperor/is_gamemode_hero()
	return SSticker.mode.name == "emperor"
