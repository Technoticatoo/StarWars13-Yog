/obj/effect/proc_holder/spell/self/saber_return
	name = "Recall Lightsaber"
	desc = "Recall your lightsaber into your hand."
	invocation_type = "none"
	clothes_req = FALSE
	range = -1
	var/thrown_weapon = FALSE

	school = "conjuration"
	charge_max = 100
	cooldown_min = 50
	action_icon_state = "saber_return"

/obj/effect/proc_holder/spell/self/saber_return/cast(mob/living/carbon/human/user)
	if(GLOB.thrown_weapon)
		user.put_in_hands(GLOB.thrown_weapon)