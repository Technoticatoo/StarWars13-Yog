/mob/living/carbon/proc/update_tracking(/obj/structure/S)
	var/obj/screen/LL_dir = hud_used.tlocator

	if(get_dist(src, S) < 1)
		LL_dir.icon_state = ""
	else
		LL_dir.icon_state = "turf_locator"
		LL_dir.transform = 0 //Reset and 0 out
		LL_dir.transform = turn(LL_dir.transform, Get_Angle(src, S))

/mob/living/carbon/proc/clear_tracking()
	var/obj/screen/LL_dir = hud_used.tlocator
	LL_dir.icon_state = "turf_locator_off"

/*/mob/living/carbon/xenomorph/update_leader_tracking(mob/living/carbon/xenomorph/X)
	if(!hud_used?.locate_leader)
		return

	var/obj/screen/LL_dir = hud_used.locate_leader
	if(xeno_caste.caste_flags & CASTE_IS_INTELLIGENT)
		LL_dir.icon_state = "trackoff"
		return

	if(X.z != src.z || get_dist(src,X) < 1 || src == X)
		LL_dir.icon_state = "trackondirect"
	else
		var/area/A = get_area(src.loc)
		var/area/QA = get_area(X.loc)
		if(A.fake_zlevel == QA.fake_zlevel)
			LL_dir.icon_state = "trackon"
			LL_dir.setDir(get_dir(src, X))
		else
			LL_dir.icon_state = "trackondirect"

/mob/living/carbon/xenomorph/clear_leader_tracking()
	if(!hud_used?.locate_leader)
		return

	var/obj/screen/LL_dir = hud_used.locate_leader
	LL_dir.icon_state = "trackoff"*/