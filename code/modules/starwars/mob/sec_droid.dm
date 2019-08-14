/mob/living/simple_animal/bot/secbot/sec_droid
	name = "Security Droid"
	desc = "It's a security droid! Protects faction areas against enemies."
	model= "Security Droid"
	icon = 'icons/starwars/mob/droids.dmi'
	icon_state = "om_battledroid"
	idcheck = FALSE
	weaponscheck = FALSE
	auto_patrol = TRUE
	var/area/factions/src_area = ""
	var/obj/item/worn_id = ""


/mob/living/simple_animal/bot/secbot/sec_droid/Initialize()
	. = ..()
	update_icon()
	var/datum/job/detective/J = new/datum/job/detective
	access_card.access += J.get_access()
	prev_access = access_card.access

	//SECHUD
	var/datum/atom_hud/secsensor = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	secsensor.add_hud_to(src)


/mob/living/simple_animal/bot/secbot/sec_droid/get_controls(mob/user)
	var/dat
	dat += hack(user)
	dat += showpai(user)
	dat += text({"
<TT><B>Security droid controls</B></TT><BR><BR>
Status: []<BR>
Behaviour controls are [locked ? "locked" : "unlocked"]<BR>
Maintenance panel panel is [open ? "opened" : "closed"]"},

"<A href='?src=[REF(src)];power=1'>[on ? "On" : "Off"]</A>" )

	if(!locked || issilicon(user) || IsAdminGhost(user))
		dat += text({"<BR>
Arrest Unidentifiable Persons: []<BR>
Arrest for Unauthorized Weapons: []<BR>
Arrest for Warrant: []<BR>
Operating Mode: []<BR>
Report Arrests[]<BR>
Auto Patrol: []"},

"<A href='?src=[REF(src)];operation=idcheck'>[idcheck ? "Yes" : "No"]</A>",
"<A href='?src=[REF(src)];operation=weaponscheck'>[weaponscheck ? "Yes" : "No"]</A>",
"<A href='?src=[REF(src)];operation=ignorerec'>[check_records ? "Yes" : "No"]</A>",
"<A href='?src=[REF(src)];operation=switchmode'>[arrest_type ? "Detain" : "Arrest"]</A>",
"<A href='?src=[REF(src)];operation=declarearrests'>[declare_arrests ? "Yes" : "No"]</A>",
"<A href='?src=[REF(src)];operation=patrol'>[auto_patrol ? "On" : "Off"]</A>" )

	return	dat

/mob/living/simple_animal/bot/secbot/sec_droid/Topic(href, href_list)
	if(..())
		return 1

	switch(href_list["operation"])
		if("idcheck")
			idcheck = !idcheck
			update_controls()
		if("weaponscheck")
			weaponscheck = !weaponscheck
			update_controls()
		if("ignorerec")
			check_records = !check_records
			update_controls()
		if("switchmode")
			arrest_type = !arrest_type
			update_controls()
		if("declarearrests")
			declare_arrests = !declare_arrests
			update_controls()

/mob/living/simple_animal/bot/secbot/sec_droid/retaliate(mob/living/carbon/human/H)
	if(assess_enemy(H) >= 4)
		target = H
		mode = BOT_HUNT

/mob/living/simple_animal/bot/secbot/sec_droid/judgement_criteria()
    var/final = FALSE
    if(idcheck)
        final = final|JUDGE_IDCHECK
    if(check_records)
        final = final|JUDGE_RECORDCHECK
    if(weaponscheck)
        final = final|JUDGE_WEAPONCHECK
    if(emagged == 2)
        final = final|JUDGE_EMAGGED
    return final

/mob/living/simple_animal/bot/secbot/sec_droid/special_retaliate_after_attack(mob/user) //allows special actions to take place after being attacked.
	return

/mob/living/simple_animal/bot/secbot/attack_hand(mob/living/carbon/human/H)
	if((H.a_intent == INTENT_HARM) || (H.a_intent == INTENT_DISARM))
		retaliate(H)
		if(special_retaliate_after_attack(H))
			return

	return ..()



/mob/living/simple_animal/bot/secbot/sec_droid/handle_automated_action()
	if(!..())
		return

	switch(mode)

		if(BOT_IDLE)		// idle

			walk_to(src,0)
			look_for_perp()	// see if any criminals are in range
			if(!mode && auto_patrol)	// still idle, and set to patrol
				mode = BOT_START_PATROL	// switch to patrol mode

		if(BOT_HUNT)		// hunting for perp

			// if can't reach perp for long enough, go idle
			if(frustration >= 8)
				walk_to(src,0)
				back_to_idle()
				return

			if(target)		// make sure target exists
				if(Adjacent(target) && isturf(target.loc))	// if right next to perp
					stun_attack(target)

					mode = BOT_PREP_ARREST
					anchored = TRUE
					target_lastloc = target.loc
					return

				else								// not next to perp
					var/turf/olddist = get_dist(src, target)
					walk_to(src, target,1,4)
					if((get_dist(src, target)) >= (olddist))
						frustration++
					else
						frustration = 0
			else
				back_to_idle()

		if(BOT_PREP_ARREST)		// preparing to arrest target

			// see if he got away. If he's no no longer adjacent or inside a closet or about to get up, we hunt again.
			if( !Adjacent(target) || !isturf(target.loc) ||  target.AmountParalyzed() < 40)
				back_to_hunt()
				return

			if(iscarbon(target) && target.canBeHandcuffed())
				if(!arrest_type)
					if(!target.handcuffed)  //he's not cuffed? Try to cuff him!
						cuff(target)
					else
						back_to_idle()
						return
			else
				back_to_idle()
				return

		if(BOT_ARREST)
			if(!target)
				anchored = FALSE
				mode = BOT_IDLE
				last_found = world.time
				frustration = 0
				return

			if(target.handcuffed) //no target or target cuffed? back to idle.
				back_to_idle()
				return

			if(!Adjacent(target) || !isturf(target.loc) || (target.loc != target_lastloc && target.AmountParalyzed() < 40)) //if he's changed loc and about to get up or not adjacent or got into a closet, we prep arrest again.
				back_to_hunt()
				return
			else //Try arresting again if the target escapes.
				mode = BOT_PREP_ARREST
				anchored = FALSE

		if(BOT_START_PATROL)
			look_for_perp()
			start_patrol()

		if(BOT_PATROL)
			look_for_perp()
			bot_patrol()


	return

/mob/living/simple_animal/bot/secbot/sec_droid/look_for_perp()
	anchored = FALSE
	for (var/mob/living/carbon/C in view(7,src)) //Let's find us a criminal

		if((C.name == oldtarget_name) && (world.time < last_found + 100))
			continue

		threatlevel = assess_enemy(C)

		if(!threatlevel)
			continue

		else if(threatlevel >= 4)
			target = C
			oldtarget_name = C.name
			speak("Level [threatlevel] infraction alert!")
			playsound(loc, pick('sound/voice/beepsky/criminal.ogg', 'sound/voice/beepsky/justice.ogg', 'sound/voice/beepsky/freeze.ogg'), 50, FALSE)
			visible_message("<b>[src]</b> points at [C.name]!")
			mode = BOT_HUNT
			INVOKE_ASYNC(src, .proc/handle_automated_action)
			break
		else
			continue


/mob/living/simple_animal/bot/secbot/sec_droid/proc/assess_enemy(mob/living/carbon/human/perp)
	worn_id = perp.wear_id
	if(istype(get_area(src), /area/factions))
		src_area = get_area(src)
		if(src_area.swfaction)
			if(!worn_id || worn_id.swfaction != src_area.swfaction )
				return 10

/mob/living/simple_animal/bot/secbot/sec_droid/retaliate(mob/living/carbon/human/H)
	threatlevel = assess_enemy(H)
	if(threatlevel >= 4)
		target = H
		mode = BOT_HUNT

/mob/living/simple_animal/bot/secbot/sec_droid/stun_attack(mob/living/carbon/C)
	playsound(src, 'sound/weapons/egloves.ogg', 50, TRUE, -1)
	icon_state = "om_battledroid"
	addtimer(CALLBACK(src, .proc/update_icon), 2)
	var/threat = 5
	if(ishuman(C))
		C.stuttering = 5
		C.Paralyze(100)
		var/mob/living/carbon/human/H = C
		threat = assess_enemy(H)
	else
		C.Paralyze(100)
		C.stuttering = 5
		threat = assess_enemy(C)

	log_combat(src,C,"stunned")
	if(declare_arrests)
		var/area/location = get_area(src)
		speak("[arrest_type ? "Detaining" : "Arresting"] level [threat] scumbag <b>[C]</b> in [location].", radio_channel)
	C.visible_message("<span class='danger'>[src] has stunned [C]!</span>",\
							"<span class='userdanger'>[src] has stunned you!</span>")




/mob/living/simple_animal/bot/secbot/sec_droid/update_icon()
	..()
	if(mode == BOT_HUNT)
		icon_state = "om_battledroid"
		return
