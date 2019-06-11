/obj/item/radio/headset/heads/sith
	name = "\proper the sith's headset"
	desc = "The headset of the Sith.\nChannels are as follows: :c - command, :s - security, :e - engineering, :u - supply, :v - service, :m - medical, :n - science."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/heads/sith/alt
	name = "\proper the sith's bowman headset"
	desc = "The headset of the sith. Protects ears from flashbangs.\nChannels are as follows: :c - command, :s - security, :e - engineering, :u - supply, :v - service, :m - medical, :n - science."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"

/obj/item/radio/headset/heads/sith/alt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

