
/*/mob/living/proc/update_tracking(/obj/structure/S)
	return


/mob/living/proc/clear_tracking()
	return*/
/mob/living
	var/static/duel = image(icon = 'icons/starwars/lightsabers.dmi', icon_state = "duel")
	var/static/dont_duel = image(icon = 'icons/starwars/lightsabers.dmi', icon_state = "dont_duel")
	var/static/list/radial_options = list("duel" = duel, "Denied" = dont_duel)
	var/stoptracking = FALSE
	..()

/mob/living/proc/start_tracking()
	stoptracking = FALSE

/mob/living/proc/update_tracking(var/turf/open/space/P)
	var/obj/screen/LL_dir = hud_used.turf_locator
	if(get_dist(src, P) < 1)
		LL_dir.icon_state = ""
	else
		LL_dir.icon_state = "turf_locator"
		LL_dir.transform = 0 //Reset and 0 out
		LL_dir.transform = turn(LL_dir.transform, Get_Angle(src.loc, P.loc))
		if(!stoptracking)
			addtimer(CALLBACK(src, .proc/update_tracking, P), 20)

//	to_chat(usr, "1: [Get_Angle(src.loc, P.loc)], 2:[P], 3: [get_dist(src, P)]")

/mob/living/proc/clear_tracking()
	stoptracking = TRUE
	var/obj/screen/LL_dir = hud_used.turf_locator
	LL_dir.icon_state = "turf_locator_off"


/mob/living/carbon/AltClickOn(atom/A)
	if(!incapacitated() && A != src  && ismob(A) && is_holding_item_of_type(/obj/item/melee/transforming/energy/sword/saber))
		var/choice = show_radial_menu(src, A, radial_options, null, 48, null, TRUE)
		if(choice == "duel")
			var/enemy = show_radial_menu(A, src, radial_options, null, 48, null, TRUE)
			if(enemy == "duel")
				src.visible_message("Entering Duel!")
				A.visible_message("Entering Duel!")
				duel_wall(src, A, choice)
			if(enemy == "dont_duel")
				return
		if(choice == "dont_duel")
			return

	..()

/mob/living/proc/duel_wall(mob/living/carbon/duelist, mob/living/carbon/duelee, choice)
//	var/distance = get_dist(duelist, duelee)

	var/duelee_dir = get_dir(duelist, duelee)
	var/duelist_dir = get_dir(duelee, duelist)
	duelist.visible_message("Dir! [duelee_dir]")
	duelee.visible_message("Dir! [duelist_dir]")
	while((!incapacitated(duelee) && !incapacitated() && duelee != duelist  && ismob(duelee)) && choice == "duel")
		while(get_dist(duelist,duelee) < 4)
			sleep(20)
		while(get_dist(duelist, duelee) > 4)
			duelee_dir = get_dir(duelist, duelee)
			duelist_dir = get_dir(duelee, duelist)
			duelist.visible_message("Dir 2! [duelee_dir]")
			duelee.visible_message("Dir 2! [duelist_dir]")
			if(duelee.dir != duelist_dir)
				duelee.apply_status_effect(STATUS_EFFECT_SLOW)
			//	duelee.Knockdown(20)
			if(duelist.dir != duelee_dir)
				duelist.apply_status_effect(STATUS_EFFECT_SLOW)
		//	duelist.Knockdown(20)
			sleep(20)
