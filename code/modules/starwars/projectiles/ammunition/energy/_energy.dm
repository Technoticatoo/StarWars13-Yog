/obj/item/ammo_casing/energy
	name = "energy weapon lens"
	desc = "The part of the gun that makes the laser go pew."
	caliber = "energy"
	projectile_type = /obj/item/projectile/energy
	var/e_cost = 100 //The amount of energy a cell needs to expend to create this shot.
	var/select_name = "energy"
	fire_sound = 'sound/weapons/laser.ogg'
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/energy
	heavy_metal = FALSE

///obj/item/ammo_casing
//	name = "bullet casing"
//	desc = "A bullet casing."
//	icon = 'icons/obj/ammo.dmi'
//	icon_state = "s-casing"
//	flags_1 = CONDUCT_1
//	slot_flags = ITEM_SLOT_BELT
//	throwforce = 0
//	w_class = WEIGHT_CLASS_TINY
//	materials = list(MAT_METAL = 500)
//	var/fire_sound = null						//What sound should play when this ammo is fired
//	var/caliber = null							//Which kind of guns it can be loaded into
//	var/projectile_type = null					//The bullet type to create when New() is called
//	var/obj/item/projectile/BB = null 			//The loaded bullet
//	var/pellets = 1								//Pellets for spreadshot
//	var/variance = 0							//Variance for inaccuracy fundamental to the casing
//	var/randomspread = 0						//Randomspread for automatics
//	var/delay = 0								//Delay for energy weapons
//	var/click_cooldown_override = 0				//Override this to make your gun have a faster fire rate, in tenths of a second. 4 is the default gun cooldown.
//	var/firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect	//the visual effect appearing when the ammo is fired.
//	var/heavy_metal = TRUE
//	var/harmful = TRUE //pacifism check for boolet, set to FALSE if bullet is non-lethal

///obj/item/ammo_casing/energy/disabler
//	projectile_type = /obj/item/projectile/beam/disabler
//	select_name  = "disable"
//	e_cost = 50
//	fire_sound = 'sound/weapons/taser2.ogg'
//	harmful = FALSE

///obj/item/ammo_casing/energy/laser
//	projectile_type = /obj/item/projectile/beam/laser
//	select_name = "kill"

///obj/item/ammo_casing/energy/ion
//	projectile_type = /obj/item/projectile/ion
//	select_name = "ion"
//	fire_sound = 'sound/weapons/ionrifle.ogg'


/obj/item/ammo_casing/energy/laser/e11
	projectile_type = /obj/item/projectile/beam/laser
	select_name = "kill"
	e_cost = 30
	fire_sound = 'sound/starwars/e11.ogg'
	delay = 5

/obj/item/ammo_casing/energy/disabler/e11
	projectile_type = /obj/item/projectile/beam/disabler
	select_name  = "stun"
	e_cost = 30
	fire_sound = 'sound/starwars/e11stun.ogg'
	harmful = FALSE
	delay = 7

/obj/item/ammo_casing/energy/laser/a280
	projectile_type = /obj/item/projectile/beam/laser
	select_name = "kill"
	e_cost = 20
	fire_sound = 'sound/starwars/a280.ogg'
	delay = 3

/obj/item/ammo_casing/energy/ion/e12d
	projectile_type = /obj/item/projectile/ion
	select_name = "ion"
	fire_sound = 'sound/starwars/e12d.ogg'

/obj/item/ammo_casing/energy/laser/dl44
	projectile_type = /obj/item/projectile/beam/laser
	select_name = "kill"
	e_cost = 15
	fire_sound = 'sound/starwars/dl44.ogg'
	delay = 7

/obj/item/ammo_casing/energy/laser/dc15a
	projectile_type = /obj/item/projectile/beam/laser
	select_name = "kill"
	e_cost = 25
	fire_sound = 'sound/starwars/dc15a.ogg'
	delay = 3

/obj/item/ammo_casing/energy/disabler/dc15a
	projectile_type = /obj/item/projectile/beam/disabler
	select_name  = "stun"
	e_cost = 25
	fire_sound = 'sound/starwars/dc15astun.ogg'
	harmful = FALSE
	delay = 5

/obj/item/ammo_casing/energy/laser/dc17
	projectile_type = /obj/item/projectile/beam/laser
	select_name = "kill"
	e_cost = 25
	fire_sound = 'sound/starwars/dc17.ogg'
	delay = 5

/obj/item/ammo_casing/energy/laser/dc17s
	projectile_type = /obj/item/projectile/beam/laser
	select_name = "kill"
	e_cost = 25
	fire_sound = 'sound/starwars/dc17s.ogg'
	delay = 5

/obj/item/ammo_casing/energy/laser/dlt19
	projectile_type = /obj/item/projectile/beam/laser
	select_name = "kill"
	e_cost = 25
	fire_sound = 'sound/starwars/dlt19.ogg'
	delay = 2