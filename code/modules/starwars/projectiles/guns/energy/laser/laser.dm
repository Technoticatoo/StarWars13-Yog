// KILL ONLY WEAPONS
/obj/item/gun/energy/laser/starwars
	icon = 'icons/starwars/weapons.dmi'
	lefthand_file = 'icons/starwars/guns/guns_lefthand.dmi'
	righthand_file = 'icons/starwars/guns/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(MAT_METAL=2000)
	ammo_x_offset = 1
	shaded_charge = 1

//a280
/obj/item/gun/energy/laser/starwars/a280
	name = "A280 Blaster Rifle"
	desc = "It is highly effective in piercing through armor and provides more power than other blaster rifles at long range. It features a power charge system and integrated muzzle compensator."
	icon_state = "a280"
	item_state = "a280"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/a280)

//DL-44
/obj/item/gun/energy/laser/starwars/dl44
	name = "DL-44 Blaster Pistol"
	desc = "Considered one of the most powerful blaster pistols in the galaxy, delivering massive damage at close range. The DL-44, however, overheated quickly."
	icon_state = "dl44"
	item_state = "dl44"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/dl44)

//DC-17
/obj/item/gun/energy/laser/starwars/dc17
	name = "DC-17 Blaster Pistol"
	desc = "A heavy blaster pistol wielded by the clone troopers of the Grand Army of the Galactic Republic during the Clone Wars. An advanced firearm, it was fielded to elite soldiers in the army."
	icon_state = "dc17"
	item_state = "dc17"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/dc17)

//DC-17s
/obj/item/gun/energy/laser/starwars/dc17s
	name = "DC-17s Blaster Pistol"
	desc = "A variant of the heavy blaster pistol wielded by the clone troopers of the Grand Army of the Galactic Republic during the Clone Wars. An advanced firearm, it was fielded to the top, elite, soldiers in the army."
	icon_state = "dc17s"
	item_state = "dc17s"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/dc17s)

//DLT-19
/obj/item/gun/energy/laser/starwars/dlt19
	name = "DLT-19 Heavy Blaster Rifle"
	desc = "A model of blaster rifle manufactured by BlasTech Industries. They were used by stormtroopers of the Galactic Empire."
	icon_state = "dlt19"
	item_state = "dlt19"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/dlt19)

// STUN KILL TOGGLE WEAPONS
/obj/item/gun/energy/e_gun/starwars
	icon = 'icons/starwars/weapons.dmi'
	lefthand_file = 'icons/starwars/guns/guns_lefthand.dmi'
	righthand_file = 'icons/starwars/guns/guns_righthand.dmi'
	item_state = null	//so the human update icon uses the icon_state instead.
	modifystate = 1
	can_flashlight = 1
	ammo_x_offset = -3
	flight_x_offset = 15
	flight_y_offset = 10

//E11
/obj/item/gun/energy/e_gun/starwars/e11
	icon = 'icons/starwars/weapons.dmi'
	name = "E-11 Blaster Rifle"
	desc = "Combined lethal firepower with impressive range and a versatile design, an advanced cooling system resulted in this blaster's superior performance. Contains two settings: Stun and Kill!"
	icon_state = "e11"
	item_state = "e11"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/e11, /obj/item/ammo_casing/energy/laser/e11)

//DC-15A
/obj/item/gun/energy/e_gun/starwars/dc15a
	icon = 'icons/starwars/weapons.dmi'
	name = "DC-15A Blaster Rifle"
	desc = "The weapon of choice for the Galactic Republic's clone troopers in the Grand Army of the Republic. Contains two settings: Stun and Kill!"
	icon_state = "dc15a"
	item_state = "dc15a"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/dc15a, /obj/item/ammo_casing/energy/laser/dc15a)