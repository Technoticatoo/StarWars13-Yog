/obj/machinery/vending/imperial
	name = "Imperial Stormtrooper Armory Dispenser"
	desc = "An equipment vendor for all Imperial Stormtroopers."
	product_ads = "For the Empire!;For the Emperor!;Crack rebel skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Stun them, bro.;Why not have a dethstick?"
	icon = 'icons/starwars/vending.dmi'
	icon_state = "stormtrooper"
	icon_deny = "stormtrooper-deny"
	req_access = list(ACCESS_SECURITY)
	products = list(/obj/item/gun/energy/e_gun/starwars/e11 = 3,
					/obj/item/gun/energy/ionrifle/starwars/e12d = 1,
		            /obj/item/clothing/shoes/imperial = 3,
		            /obj/item/clothing/under/imperial = 3,
		            /obj/item/clothing/under/imperial/stormtrooper = 3,
		            /obj/item/clothing/suit/space/hardsuit/imperial/stormtrooper = 3,
		            /obj/item/grenade/flashbang = 10,
		            /obj/item/restraints/handcuffs = 20,
		            /obj/item/storage/backpack/security = 3,
		            /obj/item/radio/headset/headset_sec = 3,
		            /obj/item/clothing/gloves/combat = 3,
		            /obj/item/tank/internals/oxygen/red = 3)
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	default_price = 100
	extra_price = 150
	payment_department = ACCOUNT_SEC

/obj/machinery/vending/imperial/alpha
	name = "Imperial Stormtrooper Armory Dispenser (Alpha)"
	desc = "An equipment vendor for Alpha Squad Stormtroopers."
	icon_state = "stormtrooper-alpha"
	products = list(/obj/item/gun/energy/e_gun/starwars/e11 = 1,
		            /obj/item/clothing/shoes/imperial = 1,
		            /obj/item/clothing/under/imperial = 1,
		            /obj/item/clothing/under/imperial/stormtrooper = 1,
		            /obj/item/clothing/suit/space/hardsuit/imperial/stormtrooper = 1,
		            /obj/item/grenade/flashbang = 5,
		            /obj/item/restraints/handcuffs = 5,
		            /obj/item/storage/backpack/security = 1,
		            /obj/item/radio/headset/headset_sec = 1,
		            /obj/item/clothing/gloves/combat = 1,
		            /obj/item/tank/internals/oxygen/red = 1)

/obj/machinery/vending/imperial/alpha/specalist
	name = "Specialist Stormtrooper Armory Dispenser (Alpha)"
	desc = "An equipment vendor for Specialist Alpha Squad Stormtroopers."
	icon_state = "stormtrooper-alphaspec"
	products = list(/obj/item/gun/energy/ionrifle/starwars/e12d = 1,
		            /obj/item/clothing/shoes/imperial = 1,
		            /obj/item/clothing/under/imperial = 1,
		            /obj/item/clothing/under/imperial/stormtrooper = 1,
		            /obj/item/clothing/suit/space/hardsuit/imperial/stormtrooper = 1,
		            /obj/item/grenade/flashbang = 5,
		            /obj/item/restraints/handcuffs = 5,
		            /obj/item/storage/backpack/security = 1,
		            /obj/item/radio/headset/headset_sec = 1,
		            /obj/item/clothing/gloves/combat = 1,
		            /obj/item/tank/internals/oxygen/red = 1)

/obj/machinery/vending/imperial/alpha/leader
	name = "Squad Lead Stormtrooper Armory Dispenser (Alpha)"
	desc = "An equipment vendor for Alpha Squad Leader."
	icon_state = "stormtrooper-alphaleader"
	products = list(/obj/item/gun/energy/laser/starwars/dlt19 = 1,
		            /obj/item/clothing/shoes/imperial = 1,
		            /obj/item/clothing/under/imperial = 1,
		            /obj/item/clothing/under/imperial/stormtrooper = 1,
		            /obj/item/clothing/suit/space/hardsuit/imperial/stormtrooper = 1,
		            /obj/item/grenade/flashbang = 5,
		            /obj/item/restraints/handcuffs = 5,
		            /obj/item/storage/backpack/security = 1,
		            /obj/item/radio/headset/headset_sec = 1,
		            /obj/item/clothing/gloves/combat = 1,
		            /obj/item/tank/internals/oxygen/red = 1)

/obj/machinery/vending/imperial/bravo
	name = "Imperial Stormtrooper Armory Dispenser (Bravo)"
	desc = "An equipment vendor for Bravo Squad Stormtroopers."
	icon_state = "stormtrooper-bravo"
	products = list(/obj/item/gun/energy/e_gun/starwars/e11 = 1,
		            /obj/item/clothing/shoes/imperial = 1,
		            /obj/item/clothing/under/imperial = 1,
		            /obj/item/clothing/under/imperial/stormtrooper = 1,
		            /obj/item/clothing/suit/space/hardsuit/imperial/stormtrooper = 1,
		            /obj/item/grenade/flashbang = 5,
		            /obj/item/restraints/handcuffs = 5,
		            /obj/item/storage/backpack/security = 1,
		            /obj/item/radio/headset/headset_sec = 1,
		            /obj/item/clothing/gloves/combat = 1,
		            /obj/item/tank/internals/oxygen/red = 1)

/obj/machinery/vending/imperial/bravo/specalist
	name = "Specialist Stormtrooper Armory Dispenser (Bravo)"
	desc = "An equipment vendor for Specialist Bravo Squad Stormtroopers."
	icon_state = "stormtrooper-bravospec"
	products = list(/obj/item/gun/energy/ionrifle/starwars/e12d = 1,
		            /obj/item/clothing/shoes/imperial = 1,
		            /obj/item/clothing/under/imperial = 1,
		            /obj/item/clothing/under/imperial/stormtrooper = 1,
		            /obj/item/clothing/suit/space/hardsuit/imperial/stormtrooper = 1,
		            /obj/item/grenade/flashbang = 5,
		            /obj/item/restraints/handcuffs = 5,
		            /obj/item/storage/backpack/security = 1,
		            /obj/item/radio/headset/headset_sec = 1,
		            /obj/item/clothing/gloves/combat = 1,
		            /obj/item/tank/internals/oxygen/red = 1)

/obj/machinery/vending/imperial/bravo/leader
	name = "Squad Lead Stormtrooper Armory Dispenser (Bravo)"
	desc = "An equipment vendor for Bravo Squad Leader."
	icon_state = "stormtrooper-bravoleader"
	products = list(/obj/item/gun/energy/laser/starwars/dlt19 = 1,
		            /obj/item/clothing/shoes/imperial = 1,
		            /obj/item/clothing/under/imperial = 1,
		            /obj/item/clothing/under/imperial/stormtrooper = 1,
		            /obj/item/clothing/suit/space/hardsuit/imperial/stormtrooper = 1,
		            /obj/item/grenade/flashbang = 5,
		            /obj/item/restraints/handcuffs = 5,
		            /obj/item/storage/backpack/security = 1,
		            /obj/item/radio/headset/headset_sec = 1,
		            /obj/item/clothing/gloves/combat = 1,
		            /obj/item/tank/internals/oxygen/red = 1)
//used for zombie mode

/obj/machinery/vending/imperial/alpha/weapons
	name = "Imperial Weapons Dispenser"
	desc = "A weapon vendor for Stormtroopers."
	icon_state = "stormtrooper-alphaspec"
	products = list(/obj/item/gun/energy/e_gun/starwars/e11 = 20,
		            /obj/item/gun/energy/laser/starwars/dlt19 = 10)