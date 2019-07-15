/obj/effect/proc_holder/spell/targeted/forcedrain
	name = "Drain Life"
	desc = "Use the force to drain the life of others."
	clothes_req = FALSE
	invocation = "Feed my power!"
	invocation_type = "shout"
	charge_max = 100
	cooldown_min = 50
	//school = "restoration"
	//sound = 'sound/magic/staff_healing.ogg'
	action_icon = 'icons/starwars/force_powers.dmi'
	action_icon_state = "force_drain"

/obj/effect/proc_holder/spell/targeted/forcedrain/cast(list/targets,mob/living/carbon/human/user = usr)
	for(var/mob/living/target in targets)
		if(!target)
			continue
		//damage/healing
		user.visible_message("<span class='warning'>The force steals health from [target]!</span>", "<span class='notice'>You drain [target] using the force!</span>")
		target.visible_message("<span class='warning'>The force steals health from [target]!</span>", "<span class='notice'>[user] drains your health using the force!</span>")
		target.adjustBruteLoss(10)
		target.adjustFireLoss(10)
		user.adjustBruteLoss(-5)
		user.adjustFireLoss(-5)




