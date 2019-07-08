/obj/item/radio/headset/heads/merc_leader
	name = "\proper the mercenaries' leader's headset"
	desc = "The headset of a Mercenary Leader.\nChannels are as follows: :7 - mercenary command, :8 - mercenary overwatch, :9 - mercenary broadcast."
	icon_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_merccom

/obj/item/radio/headset/heads/merc_leader/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/merc_support
	name = "mercenary overwatch radio headset"
	desc = "This is used by the mercenaries' overwatch.\nChannels are as follows: :8 - mercenary overwatch, :9 - mercenary broadcast."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_mercsup

/obj/item/radio/headset/merc_broadcast
	name = "mercenary radio headset"
	desc = "Headset used by mercenaries.\nChannels are as follows: :9 - mercenary broadcast."
	icon_state = "srv_headset"
	keyslot = new /obj/item/encryptionkey/headset_mercbrd