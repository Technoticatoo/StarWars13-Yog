/datum/techweb_node/guns
	id = "guns"
	starting_node = TRUE
	display_name = "Guns Research Technology"
	description = "Guns research technologies."
	// Default research tech, prevents bricking
	design_ids = list("a280","dl44","dc17","dc17s","dlt19")

/datum/design/a280
	name = "A280 Blaster Rifle"
	desc = "It is highly effective in piercing through armor and provides more power than other blaster rifles at long range. It features a power charge system and integrated muzzle compensator."
	id = "a280"
	build_type = GUNLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 5000, MAT_DIAMOND = 5000, MAT_URANIUM = 8000, MAT_SILVER = 4500, MAT_GOLD = 5000)
	build_path = /obj/item/gun/energy/laser/starwars/a280
	category = list("Weapons")
	//departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/dl44
	name = "DL-44 Blaster Pistol"
	desc = "Considered one of the most powerful blaster pistols in the galaxy, delivering massive damage at close range. The DL-44, however, overheated quickly."
	id = "dl44"
	build_type = GUNLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 5000, MAT_DIAMOND = 5000, MAT_URANIUM = 8000, MAT_SILVER = 4500, MAT_GOLD = 5000)
	build_path = /obj/item/gun/energy/laser/starwars/dl44
	category = list("Weapons")
	//departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/dc17
	name = "DC-17 Blaster Pistol"
	desc = "A heavy blaster pistol wielded by the clone troopers of the Grand Army of the Galactic Republic during the Clone Wars. An advanced firearm, it was fielded to elite soldiers in the army."
	id = "dc17"
	build_type = GUNLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 5000, MAT_DIAMOND = 5000, MAT_URANIUM = 8000, MAT_SILVER = 4500, MAT_GOLD = 5000)
	build_path = /obj/item/gun/energy/laser/starwars/dc17
	category = list("Weapons")
	//departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/dc17s
	name = "DC-17s Blaster Pistol"
	desc = "A variant of the heavy blaster pistol wielded by the clone troopers of the Grand Army of the Galactic Republic during the Clone Wars. An advanced firearm, it was fielded to the top, elite, soldiers in the army."
	id = "dc17s"
	build_type = GUNLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 5000, MAT_DIAMOND = 5000, MAT_URANIUM = 8000, MAT_SILVER = 4500, MAT_GOLD = 5000)
	build_path = /obj/item/gun/energy/laser/starwars/dc17s
	category = list("Weapons")
	//departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/dlt19
	name = "DLT-19 Heavy Blaster Rifle"
	desc = "A model of blaster rifle manufactured by BlasTech Industries. They were used by stormtroopers of the Galactic Empire."
	id = "dlt19"
	build_type = GUNLATHE
	materials = list(MAT_METAL = 10000, MAT_GLASS = 5000, MAT_DIAMOND = 5000, MAT_URANIUM = 8000, MAT_SILVER = 4500, MAT_GOLD = 5000)
	build_path = /obj/item/gun/energy/laser/starwars/dlt19
	category = list("Weapons")
	//departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/techweb/specialized/autounlocking/gunlathe
	design_autounlock_buildtypes = GUNLATHE
	allowed_buildtypes = GUNLATHE