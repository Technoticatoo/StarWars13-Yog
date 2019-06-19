//MELEE
GLOBAL_VAR_INIT(thrown_weapon, FALSE)

/obj/item/melee/transforming/energy
	hitsound_on = 'sound/weapons/blade1.ogg'
	heat = 3500
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 30)
	resistance_flags = FIRE_PROOF
	var/brightness_on = 3

/obj/item/melee/transforming/energy/Initialize()
	. = ..()
	if(active)
		set_light(brightness_on)
		START_PROCESSING(SSobj, src)

/obj/item/melee/transforming/energy/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/melee/transforming/energy/suicide_act(mob/user)
	if(!active)
		transform_weapon(user, TRUE)
	user.visible_message("<span class='suicide'>[user] is [pick("slitting [user.p_their()] stomach open with", "falling on")] [src]! It looks like [user.p_theyre()] trying to commit seppuku!</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/melee/transforming/energy/add_blood_DNA(list/blood_dna)
	return FALSE

/obj/item/melee/transforming/energy/is_sharp()
	return active * sharpness

/obj/item/melee/transforming/energy/process()
	open_flame()

/obj/item/melee/transforming/energy/transform_weapon(mob/living/user, supress_message_text)
	. = ..()
	if(.)
		if(active)
			if(item_color)
				icon_state = "sword[item_color]"
			START_PROCESSING(SSobj, src)
			set_light(brightness_on)
		else
			STOP_PROCESSING(SSobj, src)
			set_light(0)

/obj/item/melee/transforming/energy/is_hot()
	return active * heat

/obj/item/melee/transforming/energy/ignition_effect(atom/A, mob/user)
	if(!active)
		return ""

	var/in_mouth = ""
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.wear_mask)
			in_mouth = ", barely missing [C.p_their()] nose"
	. = "<span class='warning'>[user] swings [user.p_their()] [name][in_mouth]. [user.p_they(TRUE)] light[user.p_s()] [user.p_their()] [A.name] in the process.</span>"
	playsound(loc, hitsound, get_clamped_volume(), 1, -1)
	add_fingerprint(user)

/obj/item/melee/transforming/energy/sword
	name = "Lightsaber"
	desc = "May the force be within you."
	icon_state = "sword0"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	force = 3
	throwforce = 5
	hitsound = "swing_hit" //it starts deactivated
	attack_verb_off = list("tapped", "poked")
	throw_speed = 3
	throw_range = 5
	sharpness = IS_SHARP
	embedding = list("embed_chance" = 75, "embedded_impact_pain_multiplier" = 10)
	armour_penetration = 35
	block_chance = 50


/obj/item/melee/transforming/energy/sword/transform_weapon(mob/living/user, supress_message_text)
	. = ..()
	if(. && active && item_color)
		icon_state = "sword[item_color]"

/obj/item/melee/transforming/energy/sword/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(active)
		return ..()
	return 0

/obj/item/melee/transforming/energy/sword/saber
	var/list/possible_colors = list("red" = LIGHT_COLOR_RED, "blue" = LIGHT_COLOR_LIGHT_CYAN, "green" = LIGHT_COLOR_GREEN, "purple" = LIGHT_COLOR_LAVENDER)
	var/hacked = FALSE
	var/colorchanged = 0

/obj/item/melee/transforming/energy/sword/saber/Initialize(mapload)
	. = ..()
	if(LAZYLEN(possible_colors))
		var/set_color = pick(possible_colors)
		item_color = set_color
		light_color = possible_colors[set_color]

/obj/item/melee/transforming/energy/sword/saber/process()
	. = ..()
	if(hacked)
		var/set_color = pick(possible_colors)
		light_color = possible_colors[set_color]
		update_light()

/obj/item/melee/transforming/energy/sword/saber/safe_throw_at(atom/target, range, speed, mob/thrower, spin=1)
	..()
	GLOB.thrown_weapon = src

/obj/item/melee/transforming/energy/sword/saber/red
	possible_colors = list("red" = LIGHT_COLOR_RED)

/obj/item/melee/transforming/energy/sword/saber/blue
	possible_colors = list("blue" = LIGHT_COLOR_LIGHT_CYAN)

/obj/item/melee/transforming/energy/sword/saber/green
	possible_colors = list("green" = LIGHT_COLOR_GREEN)

/obj/item/melee/transforming/energy/sword/saber/purple
	possible_colors = list("purple" = LIGHT_COLOR_LAVENDER)

/obj/item/melee/transforming/energy/sword/saber/attackby(obj/item/W, mob/living/user, params)
	if(W.tool_behaviour == TOOL_MULTITOOL)
		if(!hacked)
			hacked = TRUE
			item_color = "rainbow"
			to_chat(user, "<span class='warning'>RNBW_ENGAGE</span>")

			if(active)
				icon_state = "swordrainbow"
				user.update_inv_hands()
		else
			to_chat(user, "<span class='warning'>It's already fabulous!</span>")
	else
		return ..()

/obj/item/melee/transforming/energy/sword/saber/AltClick(user)
	if(colorchanged == 0)
		item_color = input(user, "Choose your lightsaber color:", "Color") as null|anything in GLOB.lightsaber_color
		if(item_color)
			light_color = possible_colors[item_color]
			//icon_state = "sword[item_color]"
			transform_weapon(user, TRUE)
			update_light()
			colorchanged = 1


// STUN KILL TOGGLE WEAPONS
/obj/item/gun/energy/e_gun/starwars
	icon = 'icons/starwars/weapons.dmi'
	item_state = null	//so the human update icon uses the icon_state instead.
	modifystate = 1
	can_flashlight = 1
	ammo_x_offset = -3
	flight_x_offset = 15
	flight_y_offset = 10

//E11
/obj/item/gun/energy/e_gun/starwars/e11
	name = "E-11 Blaster Rifle"
	desc = "Combined lethal firepower with impressive range and a versatile design, an advanced cooling system resulted in this blaster's superior performance. Contains two settings: Stun and Kill!"
	icon_state = "e11"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/e11, /obj/item/ammo_casing/energy/laser/e11)

//DC-15A
/obj/item/gun/energy/e_gun/starwars/dc15a
	name = "DC-15A Blaster Rifle"
	desc = "The weapon of choice for the Galactic Republic's clone troopers in the Grand Army of the Republic. Contains two settings: Stun and Kill!"
	icon_state = "dc15a"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/dc15a, /obj/item/ammo_casing/energy/laser/dc15a)

// KILL ONLY WEAPONS
/obj/item/gun/energy/laser/starwars
	icon = 'icons/starwars/weapons.dmi'
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
	desc = "A model of blaster rifle manufactured by BlasTech Industries. They were used by stormtroopers of the Galactic Empire,"
	icon_state = "dlt19"
	item_state = "dlt19"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/dlt19)

// DISRUPTOR WEAPONS
/obj/item/gun/energy/ionrifle/starwars
	icon = 'icons/starwars/weapons.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	ammo_x_offset = 4
	flight_x_offset = 18
	flight_y_offset = 11

//E12D
/obj/item/gun/energy/ionrifle/starwars/e12d
	name = "E-12D Ion Disruptor"
	desc = "Based of the original E-11's design, this Ion Disruptor will short out any and all electrical circuits caught in the blast."
	icon_state = "e12d"
	ammo_type = list(/obj/item/ammo_casing/energy/ion/e12d)