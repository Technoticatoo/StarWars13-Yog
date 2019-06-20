/obj/item/radio/headset/heads/rebel_general
	name = "\proper the rebel general's headset"
	desc = "The headset of the Rebel General.\nChannels are as follows: :1 - rebel command, :2 - rebel military, :3 - rebel medical, :4 - rebel agents, :5 - rebel squadron, :6 - rebel broadcast."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebcom

/obj/item/radio/headset/heads/rebel_general/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/heads/rebel_jedi
	name = "\proper the jedi knight's headset"
	desc = "The headset of the Jedi Knight.\nChannels are as follows: :1 - rebel command, :2 - rebel military, :3 - rebel medical, :4 - rebel agents, :5 - rebel squadron, :6 - rebel broadcast."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebcom

/obj/item/radio/headset/heads/rebel_jedi/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))


/obj/item/radio/headset/heads/rebel_commander
	name = "\proper the rebel commander's headset"
	desc = "The headset of a Rebel Commander.\nChannels are as follows: :1 - rebel command, :2 - rebel military, :3 - rebel medical, :4 - rebel agents, :5 - rebel squadron, :6 - rebel broadcast."
	icon_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_rebcom

/obj/item/radio/headset/heads/rebel_commander/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/rebel_military
	name = "rebel military radio headset"
	desc = "This is used by the rebel military.\nChannels are as follows: :2 - rebel military, :6 - rebel broadcast."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebmil

/obj/item/radio/headset/rebel_medical
	name = "rebel medical radio headset"
	desc = "A headset for the rebel medical personnel.\nChannels are as follows: :3 - rebel medical, :6 - rebel broadcast."
	icon_state = "med_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebmed

/obj/item/radio/headset/rebel_squadron
	name = "rebel pilot squadron radio headset"
	desc = "Headset for rebel pilots.\nChannels are as follows: :5 - rebel squadron, :6 - rebel broadcast."
	icon_state = "sci_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebsqd

/obj/item/radio/headset/rebel_agent
	name = "\improper Rebel Agent headset"
	desc = "A headset used by the elite rebel agents.\nChannels are as follows: :4 - rebel agents, :6 - rebel broadcast."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebsec

/obj/item/radio/headset/rebel_support
	name = "rebel support radio headset"
	desc = "Headset used by the rebel support staff, tasked with support and service tasks.\nChannels are as follows: :6 - rebel broadcast."
	icon_state = "srv_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebbrd


//TODO
/*
/obj/item/radio/headset/dropped(mob/living/carbon/human/user)
			user.hud_used.SL_locator.alpha = 0
	return ..()

/obj/item/radio/headset/proc/toggle_sl_direction(mob/living/carbon/human/user)
	if(!headset_hud_on)
		to_chat(user, "<span class='warning'>You need to turn the HUD on first!</span>")
		return
	if(sl_direction)
		if(user.mind && user.assigned_squad && user.hud_used?.SL_locator)
			user.hud_used.SL_locator.alpha = 0

		if(is_squadleader)
			SSdirection.clear_leader(tracking_id)
			SSdirection.stop_tracking("marine-sl", user)
		else
			SSdirection.stop_tracking(tracking_id, user)
		sl_direction = FALSE
		to_chat(user, "<span class='notice'>You toggle the SL directional display off.</span>")
		playsound(loc, 'sound/machines/click.ogg', 15, 0, 1)
	else
		if(user.mind && user.assigned_squad && user.hud_used?.SL_locator)
			user.hud_used.SL_locator.alpha = 128
			if(is_squadleader)
				SSdirection.set_leader(tracking_id, user)
				SSdirection.start_tracking("marine-sl", user)
			else
				SSdirection.start_tracking(tracking_id, user)

		sl_direction = TRUE
		to_chat(user, "<span class='notice'>You toggle the SL directional display on.</span>")
		playsound(loc, 'sound/machines/click.ogg', 15, 0, 1)*/