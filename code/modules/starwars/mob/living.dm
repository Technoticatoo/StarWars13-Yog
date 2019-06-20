
/*/mob/living/proc/update_tracking(/obj/structure/S)
	return


/mob/living/proc/clear_tracking()
	return*/
/mob/living
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

