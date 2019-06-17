/obj/effect/proc_holder/spell/force_control
	name = "Force Control"
	desc = "Use the force to make listeners obey your commands."
	charge_max = 1200 //variable
	cooldown_min = 0
	level_max = 1
	clothes_req = FALSE
	antimagic_allowed = TRUE
	action_icon = 'icons/starwars/force_powers.dmi'
	action_icon_state = "force_control"
	var/command
	var/cooldown_mod = 1
	var/power_mod = 1
	var/list/spans = list("the force","yell")
	var/speech_sound = 'sound/magic/clockwork/invoke_general.ogg'

/obj/effect/proc_holder/spell/force_control/can_cast(mob/user = usr)
	if(!user.can_speak())
		to_chat(user, "<span class='warning'>You are unable to speak!</span>")
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/force_control/choose_targets(mob/user = usr)
	perform(user=user)

/obj/effect/proc_holder/spell/force_control/perform(list/targets, recharge = 1, mob/user = usr)
	command = input(user, "Let the force aid your voice and make the listener obey", "Command")
	if(QDELETED(src) || QDELETED(user))
		return
	if(!command)
		revert_cast(user)
		return
	..()

/obj/effect/proc_holder/spell/force_control/cast(list/targets, mob/user = usr)
	playsound(get_turf(user), speech_sound, 300, 1, 5)
	var/cooldown = force_control_proc(uppertext(command), user, spans, base_multiplier = power_mod)
	charge_max = (cooldown * cooldown_mod)




