/mob/living/simple_animal/hostile/rancor
	name = "Rancor"
	desc = "A very large creature... you should probably run."
	icon = 'icons/starwars/mob/Giant Creatures.dmi'
	icon_state = "Rancor_living"
	icon_living = "Rancor_living"
	icon_dead = "Rancor_dead"
	bound_height = 66
	bound_height = 68
	gender = NEUTER
	mob_biotypes = list(MOB_ORGANIC)
	health = 1000
	maxHealth = 1000
	healable = 1
	melee_damage_lower = 15
	melee_damage_upper = 15
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	attacktext = "claws"
	attack_sound = 'sound/weapons/bladeslice.ogg'
//	projectilesound = 'sound/weapons/gunshot.ogg'
//	projectiletype = /obj/item/projectile/rancorbullet
	faction = list("rancor")
	check_friendly_fire = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speak_emote = list("states")
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = 0
	loot = list(/obj/effect/decal/cleanable/robot_debris)

	do_footstep = TRUE

/mob/living/simple_animal/hostile/rancor/Initialize()
	. = ..()
	deathmessage = "[src] lets out a death wail!"

//strong boi

/mob/living/simple_animal/hostile/rancor/strong
	name = "Rancor"
	desc = "A extremely large creature... if you weren't already running, goodbye."
	icon = 'icons/starwars/mob/Giant Creatures.dmi'
	icon_state = "Rancor_living"
	icon_living = "Rancor_living"
	icon_dead = "Rancor_dead"
	bound_height = 66
	bound_height = 68
	gender = NEUTER
	mob_biotypes = list(MOB_ORGANIC)
	health = 2000
	maxHealth = 2000
	healable = 1
	melee_damage_lower = 20
	melee_damage_upper = 20
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	attacktext = "shreds"
	attack_sound = 'sound/weapons/bladeslice.ogg'
//	projectilesound = 'sound/weapons/gunshot.ogg'
//	projectiletype = /obj/item/projectile/rancorbullet
	faction = list("rancor")
	check_friendly_fire = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speak_emote = list("states")
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = 0
	loot = list(/obj/effect/decal/cleanable/robot_debris)

	do_footstep = TRUE

/mob/living/simple_animal/hostile/rancor/strong/Initialize()
	. = ..()
	deathmessage = "[src] lets out a loud death wail!"