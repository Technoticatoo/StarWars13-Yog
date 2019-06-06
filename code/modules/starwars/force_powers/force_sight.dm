/obj/effect/proc_holder/spell/self/forcesight
	name = "Force Sight"
	desc = "Use the force to see."
	clothes_req = FALSE
	invocation = "Let me see."
	invocation_type = "whisper"
	cooldown_min = 1 //12 deciseconds reduction per rank
	charge_max = 100
	var/amt_knockdown = 0
	var/destroys = "none" //can be "none", "gib" or "disintegrate"

	var/summon_type = null //this will put an obj at the target's location

	var/check_anti_magic = TRUE
	var/check_holy = FALSE
	action_icon_state = "forcesight"

/obj/effect/proc_holder/spell/self/forcesight/cast(mob/user = usr)
	var/mob/living/carbon/mira = usr
	mira.dna.remove_mutation(BLINDMUT)
	to_chat(usr, "The force aids your sight")
	addtimer(CALLBACK(src, .proc/reset, usr), 200)


/obj/effect/proc_holder/spell/self/forcesight/proc/reset(mob/user = usr)
	var/mob/living/carbon/mira = usr
	mira.dna.add_mutation(BLINDMUT)
//	mira.dna.activate_mutation(BLINDMUT)
	to_chat(usr, "Your sight leaves you.")