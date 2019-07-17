/obj/effect/proc_holder/spell/self/forcejump //This spell exists mainly for debugging purposes, and also to show how casting works
	name = "Force Jump"
	desc = "Use the Force to jump a long distance."
	human_req = TRUE
	clothes_req = FALSE
	charge_max = 100
	cooldown_min = 50
	invocation = "Force Jump!"
	invocation_type = "whisper"
//	school = "alteration"
//	sound = 'sound/magic/staff_healing.ogg'
	action_icon = 'icons/starwars/force_powers.dmi'
	action_icon_state = "force_jump"


/obj/effect/proc_holder/spell/self/forcejump/cast(mob/living/carbon/human/user) //Note the lack of "list/targets" here. Instead, use a "user" var depending on mob requirements.
	//Also, notice the lack of a "for()" statement that looks through the targets. This is, again, because the spell can only have a single target.
	user.visible_message("<span class='warning'>[user] jumps with the aid of the force!</span>", "<span class='notice'>You jump with the aid of the force!</span>")
	for(var/i = 0,i < 4,i++)
		//user.forceMove(get_step(user,user.dir))
		step(user,user.dir)

