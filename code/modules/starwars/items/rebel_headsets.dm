/obj/item/radio/headset/heads/rebels/general
	name = "\proper the rebel general's headset"
	desc = "The headset of the Rebel General.\nChannels are as follows: :f - rebel command, :g - rebel military, :h - rebel medical, :j - rebel agents, :k - rebel squadron, :l - rebel broadcast."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebcom

/obj/item/radio/headset/heads/rebels/general/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/heads/rebels/commander
	name = "\proper the rebel commander's headset"
	desc = "The headset of a Rebel Commander.\nChannels are as follows: :f - rebel command, :g - rebel military, :h - rebel medical, :j - rebel agents, :k - rebel squadron, :l - rebel broadcast."
	icon_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_rebcom

/obj/item/radio/headset/heads/rebels/commander/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/rebels/military
	name = "rebel military radio headset"
	desc = "This is used by the rebel military.\nChannels are as follows: :g - rebel military, :l - rebel broadcast."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebmil

/obj/item/radio/headset/rebels/medical
	name = "rebel medical radio headset"
	desc = "A headset for the rebel medical personnel.\nChannels are as follows: :h - rebel medical, :l - rebel broadcast."
	icon_state = "med_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebmed

/obj/item/radio/headset/rebels/squadron
	name = "rebel pilot squadron radio headset"
	desc = "Headset for rebel pilots.\nChannels are as follows: :k - rebel squadron, :l - rebel broadcast."
	icon_state = "sci_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebsqd

/obj/item/radio/headset/rebels/agent
	name = "\improper Rebel Agent headset"
	desc = "A headset used by the elite rebel agents.\nChannels are as follows: :j - rebel agents, :l - rebel broadcast."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebsec

/obj/item/radio/headset/rebels/support
	name = "rebel support radio headset"
	desc = "Headset used by the rebel support staff, tasked with support and service tasks.\nChannels are as follows: :l - rebel broadcast."
	icon_state = "srv_headset"
	keyslot = new /obj/item/encryptionkey/headset_rebsup