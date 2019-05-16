/obj/machinery/vending/armory/weapon_vendor
	name = "\improper Armory Weapon Vender"
	desc = "A vending machine which sells guns."
	icon_state = "syndi"
	product_slogans = "Arm up!;We got guns!;Guns, Guns, Guns!"
	product_ads = "Please use responsibly!"
	vend_reply = "Come back for more!"
	circuit = /obj/item/circuitboard/machine/vending/armory/weapon_vendor
	products = list(/obj/item/gun/energy/laser/retro/old = 50,
					/obj/item/gun/energy/pulse/pistol/m1911 = 50)

	contraband = list() //Gambling and it hurts, making it a +18 item
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/donksoft
	default_price = 25
	extra_price = 50
	payment_department = ACCOUNT_SRV