/obj/effect/proc_holder/spell/targeted/forcesensing
	name = "Force Sensing"
	desc = "Use the Force to sense force users."
	clothes_req = FALSE
	invocation = "Show me those empowered by the force!"
	invocation_type = "whisper"
	charge_max = 100
	cooldown_min = 50
	school = "alteration"
//	sound = 'sound/magic/staff_healing.ogg'
	action_icon = 'icons/starwars/force_powers.dmi'
	action_icon_state = "force_sensing"

/obj/effect/proc_holder/spell/targeted/forcesensing/choose_targets(mob/user = usr)
	var/list/targets = list()

	switch(max_targets)
		if(0) //unlimited
			for(var/mob/living/carbon/human/target in view_or_range(range, user, selection_type))
				if(!can_target(target))
					continue
				if(target.dna.get_mutation(FORCE_SENSITIVE_0) || target.dna.get_mutation(FORCE_SENSITIVE_1) || target.dna.get_mutation(FORCE_SENSITIVE_2) || target.dna.get_mutation(FORCE_SENSITIVE_3) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_0) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_1) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_2) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_3) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_4))
					targets += target
		if(1) //single target can be picked
			if(range < 0)
				targets += user
			else
				var/possible_targets = list()
				for(var/mob/living/carbon/human/M in view_or_range(range, user, selection_type))
					if(!include_user && user == M)
						continue
					if(!can_target(M))
						continue
					if(M.dna.get_mutation(FORCE_SENSITIVE_0) || M.dna.get_mutation(FORCE_SENSITIVE_1) || M.dna.get_mutation(FORCE_SENSITIVE_2) || M.dna.get_mutation(FORCE_SENSITIVE_3) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_0) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_1) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_2) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_3) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_4))
						possible_targets += M

				//targets += input("Choose the target for the spell.", "Targeting") as mob in possible_targets
				//Adds a safety check post-input to make sure those targets are actually in range.
				var/mob/living/carbon/human/M
				if(!random_target)
					M = input("Choose the target for the spell.", "Targeting") as null|mob in possible_targets
				else
					switch(random_target_priority)
						if(TARGET_RANDOM)
							M = pick(possible_targets)
						if(TARGET_CLOSEST)
							for(var/mob/living/L in possible_targets)
								if(M)
									if(get_dist(user,L) < get_dist(user,M))
										if(los_check(user,L))
											M = L
								else
									if(los_check(user,L))
										M = L
				if(M in view_or_range(range, user, selection_type))
					if(M.dna.get_mutation(FORCE_SENSITIVE_0) || M.dna.get_mutation(FORCE_SENSITIVE_1) || M.dna.get_mutation(FORCE_SENSITIVE_2) || M.dna.get_mutation(FORCE_SENSITIVE_3) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_0) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_1) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_2) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_3) || M.dna.get_mutation(FORCE_SENSITIVE_SITH_4))
						targets += M

		else
			var/list/possible_targets = list()
			for(var/mob/living/carbon/human/target in view_or_range(range, user, selection_type))
				if(!can_target(target))
					continue
				if(target.dna.get_mutation(FORCE_SENSITIVE_0) || target.dna.get_mutation(FORCE_SENSITIVE_1) || target.dna.get_mutation(FORCE_SENSITIVE_2) || target.dna.get_mutation(FORCE_SENSITIVE_3) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_0) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_1) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_2) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_3) || target.dna.get_mutation(FORCE_SENSITIVE_SITH_4))
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

/obj/effect/proc_holder/spell/targeted/forcesensing/cast(list/targets,mob/user = usr)
	for (var/target in targets)
		if(!target)
			continue
		//damage/healing