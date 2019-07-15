/obj/effect/proc_holder/spell/targeted/forcepull
	name = "Force Pull"
	desc = "Use the force to pull people and objects to you."
	clothes_req = FALSE
	invocation = "Force Pull!"
	invocation_type = "shout"
	charge_max = 100
	cooldown_min = 50
	school = "alteration"
//	sound = 'sound/magic/staff_healing.ogg'
	action_icon = 'icons/starwars/force_powers.dmi'
	action_icon_state = "force_pull"
	var/maxthrow = 5
	var/obj/item/I
	var/mob/living/L
	var/distfromcaster
	var/sparkle_path = /obj/effect/temp_visual/gravpush

/obj/effect/proc_holder/spell/targeted/forcepull/choose_targets(mob/user = usr)
	var/list/targets = list()

	switch(max_targets)
		if(0) //unlimited
			for(var/atom/target in view_or_range(range, user, selection_type))
				if (ismob(target) || istype(target, /obj/item))
					if(!can_target(target))
						continue
					targets += target
		if(1) //single target can be picked
			if(range < 0)
				targets += user
			else
				var/possible_targets = list()

				for(var/atom/M in view_or_range(range, user, selection_type))
					if (ismob(M) || istype(M, /obj/item))
						if(!include_user && user == M)
							continue
						if(!can_target(M))
							continue
						possible_targets += M

				//targets += input("Choose the target for the spell.", "Targeting") as mob in possible_targets
				//Adds a safety check post-input to make sure those targets are actually in range.
				var/atom/M
				if(!random_target)
					M = input("Choose the target for the spell.", "Targeting") as null|anything in possible_targets
				else
					switch(random_target_priority)
						if(TARGET_RANDOM)
							M = pick(possible_targets)
						if(TARGET_CLOSEST)
							for(var/atom/L in possible_targets)
								if (ismob(L) || istype(L, /obj/item))
									if(M)
										if(get_dist(user,L) < get_dist(user,M))
											if(los_check(user,L))
												M = L
									else
										if(los_check(user,L))
											M = L
				if(M in view_or_range(range, user, selection_type))
					targets += M

		else
			var/list/possible_targets = list()
			for(var/atom/target in view_or_range(range, user, selection_type))
				if(!can_target(target))
					continue
				possible_targets += target
			for(var/i=1,i<=max_targets,i++)
				if(!possible_targets.len)
					break
				if(target_ignore_prev)
					var/target = pick(possible_targets)
					possible_targets -= target
					targets += target
				else
					targets += pick(possible_targets)

	if(!include_user && (user in targets))
		targets -= user

	if(!targets.len) //doesn't waste the spell
		revert_cast(user)
		return

	perform(targets,user=user)

/obj/effect/proc_holder/spell/targeted/forcepull/cast(list/targets,mob/user = usr)
	for (var/t in targets)
		if (ismob(t))
			L = t
			distfromcaster = get_dist(user, L)
			// stuff with mob as target here.
		else if (istype(t, /obj/item))
			I = t
			distfromcaster = get_dist(user, I)
			// stuff with item as target here

		if(!L && !I)
			continue
		//damage/healing
		if(L)
			new sparkle_path(get_turf(L), get_dir(L, user)) //created sparkles will disappear on their own
			user.visible_message("<span class='warning'>The force pulls [L] to [user]!</span>", "<span class='notice'>You pull [L] with the force!</span>")
			L.throw_at(user, ((CLAMP((maxthrow - (CLAMP(distfromcaster - 2, 0, distfromcaster))), 3, maxthrow))), 1,user)
		if(I)
			new sparkle_path(get_turf(I), get_dir(I, user)) //created sparkles will disappear on their own
			user.visible_message("<span class='warning'>The force pulls [I] to [user]!</span>", "<span class='notice'>You pull [I] with the force!</span>")
			I.throw_at(user, ((CLAMP((maxthrow - (CLAMP(distfromcaster - 2, 0, distfromcaster))), 3, maxthrow))), 1,user)