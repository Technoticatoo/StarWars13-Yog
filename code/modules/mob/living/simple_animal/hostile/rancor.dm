/obj/item/projectile/rancorbullet
	damage = 10
	damage_type = BRUTE

/mob/living/simple_animal/hostile/rancor
	name = "Rancor"
	desc = "A very large creature... You should probably run."
	icon = 'icons/starwars/mob/Giant Creatures.dmi'
	icon_state = "Rancor_living"
	icon_living = "Rancor_living"
	icon_dead = "Rancor_dead"
	gender = NEUTER
	mob_biotypes = list(MOB_ROBOTIC)
	health = 55
	maxHealth = 55
	healable = 0
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "claws"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	projectilesound = 'sound/weapons/gunshot.ogg'
	projectiletype = /obj/item/projectile/rancorbullet
	faction = list("rancor")
	check_friendly_fire = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speak_emote = list("states")
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = 1
	loot = list(/obj/effect/decal/cleanable/robot_debris)

	do_footstep = TRUE

/mob/living/simple_animal/hostile/rancor/Initialize()
	. = ..()
	deathmessage = "[src] lets out a death wail!"

/mob/living/simple_animal/hostile/rancor/strong
	name = "strong rancor"
	icon_state = "Rancor_living"
	icon_living = "Rancor_living"
	icon_dead = "Rancor_dead"
	desc = "A extremely large creature... if you weren't already running, goodbye."
	health = 125
	maxHealth = 125
	melee_damage_lower = 30
	melee_damage_upper = 30
	attacktext = "shreds"

/mob/living/simple_animal/hostile/rancor/death(gibbed)
	do_sparks(3, TRUE, src)
	..(1)
