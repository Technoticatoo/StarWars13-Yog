/obj/effect/proc_holder/spell/targeted/wookiecharge
	name = "Charge"
	desc = "Charge your target, giving you a speed boost!"
	clothes_req = FALSE
	invocation = "GrraWwwhrraaaahh!"
	invocation_type = "shout"
	cooldown_min = 1 //12 deciseconds reduction per rank
	charge_max = 100
	var/amt_knockdown = 0
	var/destroys = "none" //can be "none", "gib" or "disintegrate"

	var/summon_type = null //this will put an obj at the target's location

	var/check_anti_magic = TRUE
	var/check_holy = FALSE
	action_icon_state = "wookiecharge"

/obj/effect/proc_holder/spell/targeted/wookiecharge/cast(list/targets, mob/user = usr)
	user.add_movespeed_modifier("wookiespeed", update=TRUE, priority=100, multiplicative_slowdown=-2, blacklisted_movetypes=(FLYING|FLOATING))
	to_chat(user, "You fly into a rage, boosting your speed")
	addtimer(CALLBACK(src, .proc/reset, user), 100)


/obj/effect/proc_holder/spell/targeted/wookiecharge/proc/reset(mob/user)
	user.remove_movespeed_modifier("wookiespeed")
	to_chat(user, "Your rage dissipates and you slow down again.")