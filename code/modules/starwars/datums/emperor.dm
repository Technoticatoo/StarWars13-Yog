/datum/mind/proc/equip_emperor(employer = "The Empire", silent = FALSE, datum/antagonist/uplink_owner)
	if(!current)
		return
	var/mob/living/carbon/human/emperor_mob = current
	if (!istype(emperor_mob))
		return

	var/list/all_contents = emperor_mob.GetAllContents()
	var/obj/item/pda/PDA = locate() in all_contents
	var/obj/item/radio/R = locate() in all_contents
	var/obj/item/pen/P

	if (PDA) // Prioritize PDA pen, otherwise the pocket protector pens will be chosen, which causes numerous ahelps about missing uplink
		P = locate() in PDA
	if (!P) // If we couldn't find a pen in the PDA, or we didn't even have a PDA, do it the old way
		P = locate() in all_contents
		if(!P) // I do not have a pen.
			var/obj/item/pen/inowhaveapen
			if(istype(emperor_mob.back,/obj/item/storage)) //ok buddy you better have a backpack!
				inowhaveapen = new /obj/item/pen(emperor_mob.back)
			else
				inowhaveapen = new /obj/item/pen(emperor_mob.loc)
				emperor_mob.put_in_hands(inowhaveapen) // I hope you don't have arms and your emperor pen gets stolen for all this trouble you've caused.
			P = inowhaveapen

	var/obj/item/uplink_loc

	if(emperor_mob.client && emperor_mob.client.prefs)
		switch(emperor_mob.client.prefs.uplink_spawn_loc)
			if(UPLINK_PDA)
				uplink_loc = PDA
				if(!uplink_loc)
					uplink_loc = R
				if(!uplink_loc)
					uplink_loc = P
			if(UPLINK_RADIO)
				uplink_loc = R
				if(!uplink_loc)
					uplink_loc = PDA
				if(!uplink_loc)
					uplink_loc = P
			if(UPLINK_PEN)
				uplink_loc = P
				if(!uplink_loc)
					uplink_loc = PDA
				if(!uplink_loc)
					uplink_loc = R

	if (!uplink_loc)
		if(!silent)
			to_chat(emperor_mob, "Unfortunately, [employer] wasn't able to get you an Uplink, please punish them to your content, Emperor.")
		. = 0
	else
		. = uplink_loc
		var/datum/component/uplink/U = uplink_loc.AddComponent(/datum/component/uplink, emperor_mob.key)
		if(!U)
			CRASH("Uplink creation failed.")
		U.setup_unlock_code()
		if(!silent)
			if(uplink_loc == R)
				to_chat(emperor_mob, "[employer] proudly serves you by giving you an Uplink, Emperor [R.name]. Simply dial the frequency [format_frequency(U.unlock_code)] to unlock its hidden features.")
			else if(uplink_loc == PDA)
				to_chat(emperor_mob, "[employer] proudly serves you by giving you an Uplink, Emperor [PDA.name]. Simply enter the code \"[U.unlock_code]\" into the ringtone select to unlock its hidden features.")
			else if(uplink_loc == P)
				to_chat(emperor_mob, "[employer] proudly serves you by giving you an Uplink, Emperor [P.name]. Simply twist the top of the pen [U.unlock_code] from its starting position to unlock its hidden features.")

		if(uplink_owner)
			uplink_owner.antag_memory += U.unlock_note + "<br>"
		else
			emperor_mob.mind.store_memory(U.unlock_note)

