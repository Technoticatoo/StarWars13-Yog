/mob/living/simple_animal/hostile/star_zombie
	name = "zombie trooper"
	desc = "Something horrible happened to this trooper... wait its moving!"
	icon = 'icons/starwars/mob/deathtrooper.dmi'
	icon_state = "deathtrooper"
	icon_living = "deathtrooper"
	icon_dead = "deathtrooper_d"
	gender = NEUTER
	speak_chance = 0
	turns_per_move = 7
	maxHealth = 50
	health = 50
	see_in_dark = 3
	butcher_results = list()
	response_help  = "prods"
	response_disarm = "pushes aside"
	response_harm   = "claws"
	melee_damage_lower = 12
	melee_damage_upper = 24
	attacktext = "ravages"
	attack_sound = 'sound/weapons/punch1.ogg'
	ventcrawler = VENTCRAWLER_ALWAYS
	faction = list("Szombie")

	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 150
	maxbodytemp = 500
	gold_core_spawnable = HOSTILE_SPAWN