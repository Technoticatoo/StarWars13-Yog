
/*/mob/living/proc/update_tracking(/obj/structure/S)
	return


/mob/living/proc/clear_tracking()
	return*/
/mob/living
	var/static/duel = image(icon = 'icons/starwars/lightsabers.dmi', icon_state = "duel")
	var/static/list/radial_options = list("duel" = duel)
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
	if(!stat && mind && iscarbon(A) && A != src)
		if(src.is_holding_item_of_type(/obj/item/melee/transforming/energy/sword/saber))
			var/choice = show_radial_menu(src, A, radial_options, null, 48, null, TRUE)
			switch(choice)
				if("duel")
					src.visible_message("Entering Duel!")
	..()