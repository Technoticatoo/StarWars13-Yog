/obj/effect/proc_holder/spell/targeted/forceteach
	name = "Teach"
	desc = "Teach others in the use of the Force."
	clothes_req = FALSE
	invocation = "Now listen closely..."
	invocation_type = "say"
	charge_max = 100
	cooldown_min = 50
	school = "teaching"
//	sound = 'sound/magic/staff_healing.ogg'
	action_icon = 'icons/starwars/force_powers.dmi'
	action_icon_state = "force_teach"
//	var/mutation

/obj/effect/proc_holder/spell/targeted/forceteach/cast(list/targets, mob/living/carbon/human/user = usr)
	for(var/mob/living/carbon/human/target in targets)
		if(!target)
			continue
		target.taught = target.taught + 1
		if(target.dna.get_mutation(FORCE_SENSITIVE_0)  && user.dna.get_mutation(FORCE_SENSITIVE_SITH) && target.taught == 9)
			target = target.dna.add_mutation(FORCE_SENSITIVE_SITH, MUT_OTHER)
			target.taught = 0
			target.visible_message("<span class='warning'>[target] has joined the dark side!</span>", "<span class='notice'>You feel the dark side of the force taking you into its cloying embrace!</span>")
		if(target.dna.get_mutation(FORCE_SENSITIVE_2) && user.dna.get_mutation(FORCE_SENSITIVE_3) && target.taught == 12)
			target = target.dna.add_mutation(FORCE_SENSITIVE_3, MUT_OTHER)
			target.taught = 0
			target.visible_message("<span class='warning'>[target] has learned the deepest secrets of the force!</span>", "<span class='notice'>You have learned the deepest secrets of the force!</span>")
		if(target.dna.get_mutation(FORCE_SENSITIVE_1) && user.dna.get_mutation(FORCE_SENSITIVE_2) && target.taught == 8)
			target = target.dna.add_mutation(FORCE_SENSITIVE_2, MUT_OTHER)
			target.taught = 0
			target.visible_message("<span class='warning'>[target] has learned deep secrets of the force!</span>", "<span class='notice'>You have learned deep secrets of the force!</span>")
		if(target.dna.get_mutation(FORCE_SENSITIVE_0) && user.dna.get_mutation(FORCE_SENSITIVE_1)  && target.taught == 6)
			target = target.dna.add_mutation(FORCE_SENSITIVE_1, MUT_OTHER)
			target.taught = 0
			target.visible_message("<span class='warning'>[target] has learned secrets of the force!</span>", "<span class='notice'>You have learned secrets of the force!</span>")
		if(!target.dna.get_mutation(FORCE_SENSITIVE_0) && (user.dna.get_mutation(FORCE_SENSITIVE_1) || user.dna.get_mutation(FORCE_SENSITIVE_SITH)) &&  target.taught == 4)
			target = target.dna.add_mutation(FORCE_SENSITIVE_0, MUT_OTHER)
			target.taught = 0
			target.visible_message("<span class='warning'>[target] has begun their path to the force!</span>", "<span class='notice'>You have taken the first step on the path to the force!</span>")