/obj/effect/proc_holder/spell/aoe_turf/forceth
	name = "Force Thrown"
	desc = "Violently push everything around the Sith away."
	charge_max = 400
	clothes_req = FALSE
	invocation = "Force Throw!"
	invocation_type = "shout"
	range = 5
	cooldown_min = 150
	selection_type = "view"
	sound = 'sound/magic/repulse.ogg'
	var/maxthrow = 5
	var/sparkle_path = /obj/effect/temp_visual/gravpush
	var/anti_magic_check = TRUE

	action_icon_state = "repulse"

/obj/effect/proc_holder/spell/aoe_turf/forceth/cast(list/targets,mob/user = usr, var/stun_amt = 40)
	var/list/thrownatoms = list()
	var/atom/throwtarget
	var/distfromcaster
	playMagSound()
	for(var/turf/T in targets) //Done this way so things don't get thrown all around hilariously.
		for(var/atom/movable/AM in T)
			thrownatoms += AM

	for(var/am in thrownatoms)
		var/atom/movable/AM = am
		if(AM == user || AM.anchored)
			continue

		if(ismob(AM))
			var/mob/M = AM
			if(M.anti_magic_check(anti_magic_check, FALSE))
				continue

		throwtarget = get_edge_target_turf(user, get_dir(user, get_step_away(AM, user)))
		distfromcaster = get_dist(user, AM)
		if(distfromcaster == 0)
			if(isliving(AM))
				var/mob/living/M = AM
				M.Knockdown(100)
				M.adjustBruteLoss(5)
				to_chat(M, "<span class='userdanger'>You're slammed into the floor by [user]!</span>")
		else
			new sparkle_path(get_turf(AM), get_dir(user, AM)) //created sparkles will disappear on their own
			if(isliving(AM))
				var/mob/living/M = AM
				M.Knockdown(stun_amt)
				to_chat(M, "<span class='userdanger'>You're thrown back by [user]!</span>")
			AM.throw_at(throwtarget, ((CLAMP((maxthrow - (CLAMP(distfromcaster - 2, 0, distfromcaster))), 3, maxthrow))), 1,user)//So stuff gets tossed around at the same time.
