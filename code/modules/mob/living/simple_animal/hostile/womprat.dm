//Space womp_rats!
/mob/living/simple_animal/hostile/womp_rat
	name = "womp_rat"
	desc = "A small robot."
	icon = 'icons/starwars/obj/fence.dmi'
	icon_state = "womprat_living"
	icon_living = "womprat_living"
	icon_dead = "womprat_dead"
	gender = NEUTER
	mob_biotypes = list(MOB_ROBOTIC)
	health = 20
	maxHealth = 20
	healable = 0
	melee_damage_lower = 5
	melee_damage_upper = 5
	attacktext = "scratches"
	attack_sound = 'sound/weapons/bladeslice.ogg'
//	projectilesound = 'sound/weapons/gunshot.ogg'
//	projectiletype = /obj/item/projectile/womp_ratbullet
	faction = list("womp_rat")
	check_friendly_fire = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speak_emote = list("states")
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = 1
	loot = list(/obj/effect/decal/cleanable/robot_debris)

	do_footstep = TRUE

/mob/living/simple_animal/hostile/womp_rat/Initialize()
	. = ..()
	deathmessage = "[src] dies!"

























