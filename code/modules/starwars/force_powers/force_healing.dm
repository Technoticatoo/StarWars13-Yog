/obj/effect/proc_holder/spell/self/forceheal //This spell exists mainly for debugging purposes, and also to show how casting works
	name = "Force Healing"
	desc = "Heals a small amount of brute and burn damage."
	human_req = TRUE
	clothes_req = FALSE
	charge_max = 100
	cooldown_min = 50
	invocation = "May the Force aid me!"
	invocation_type = "whisper"
	school = "restoration"
	sound = 'sound/magic/staff_healing.ogg'
	action_icon = 'icons/starwars/force_powers.dmi'
	action_icon_state = "force_heal"


/obj/effect/proc_holder/spell/self/forceheal/cast(mob/living/carbon/human/user) //Note the lack of "list/targets" here. Instead, use a "user" var depending on mob requirements.
	//Also, notice the lack of a "for()" statement that looks through the targets. This is, again, because the spell can only have a single target.
	user.visible_message("<span class='warning'>A wreath of gentle light passes over [user]!</span>", "<span class='notice'>You wreath yourself in healing light!</span>")
	addtimer(CALLBACK(src, .proc/healing, user), 30)
	addtimer(CALLBACK(src, .proc/healing, user), 60)
	addtimer(CALLBACK(src, .proc/healing, user), 90)

/obj/effect/proc_holder/spell/self/forceheal/proc/healing(mob/living/carbon/human/user)
	user.visible_message("<span class='warning'>[user] is healed slightly by the force!</span>", "<span class='notice'>The force heals you slightly.</span>")
	user.adjustBruteLoss(-5)
	user.adjustFireLoss(-5)
