/mob/living/simple_animal/hostile/spawner
	name = "monster nest"
	icon = 'icons/mob/animal.dmi'
	anchored = FALSE
	health = 100
	maxHealth = 100
	gender = NEUTER
	var/list/spawned_mobs = list()
	var/max_mobs = 5
	var/spawn_delay = 0
	var/spawn_time = 300 //30 seconds default
	var/mob_types = list(/mob/living/simple_animal/hostile/carp)
	var/spawn_text = "emerges from"
	status_flags = 0
	move_resist = MOVE_FORCE_VERY_STRONG
	AIStatus = AI_OFF
	a_intent = INTENT_HARM
	stop_automated_movement = 1
	wander = 0
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 350
	layer = BELOW_OPEN_DOOR_LAYER//BELOW_MOB_LAYER
	sentience_type = SENTIENCE_BOSS

/mob/living/simple_animal/hostile/spawner/Destroy()
	for(var/mob/living/simple_animal/L in spawned_mobs)
		if(L.nest == src)
			L.nest = null
	spawned_mobs = null
	return ..()

/mob/living/simple_animal/hostile/spawner/Life()
	. = ..()
	if(!.) // dead
		return
	spawn_mob()

/mob/living/simple_animal/hostile/spawner/proc/spawn_mob()
	if(spawned_mobs.len >= max_mobs)
		return 0
	if(spawn_delay > world.time)
		return 0
	spawn_delay = world.time + spawn_time
	var/chosen_mob_type = pick(mob_types)
	var/mob/living/simple_animal/L = new chosen_mob_type(src.loc)
	L.flags_1 |= (flags_1 & ADMIN_SPAWNED_1)	//If we were admin spawned, lets have our children count as that as well.
	spawned_mobs += L
	L.nest = src
	L.faction = src.faction
	visible_message("<span class='danger'>[L] [spawn_text] [src].</span>")

/mob/living/simple_animal/hostile/spawner/syndicate
	name = "warp beacon"
	icon = 'icons/obj/device.dmi'
	icon_state = "syndbeacon"
	spawn_text = "warps in from"
	mob_types = list(/mob/living/simple_animal/hostile/syndicate/ranged)
	faction = list(ROLE_SYNDICATE)

/mob/living/simple_animal/hostile/spawner/skeleton
	name = "bone pit"
	desc = "A pit full of bones, and some still seem to be moving..."
	icon_state = "hole"
	icon_living = "hole"
	icon = 'icons/mob/nest.dmi'
	health = 150
	maxHealth = 150
	max_mobs = 15
	spawn_time = 150
	mob_types = list(/mob/living/simple_animal/hostile/skeleton)
	spawn_text = "climbs out of"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	faction = list("skeleton")

/mob/living/simple_animal/hostile/spawner/mining
	name = "monster den"
	desc = "A hole dug into the ground, harboring all kinds of monsters found within most caves or mining asteroids."
	icon_state = "hole"
	icon_living = "hole"
	health = 200
	maxHealth = 200
	max_mobs = 3
	icon = 'icons/mob/nest.dmi'
	spawn_text = "crawls out of"
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/goldgrub, /mob/living/simple_animal/hostile/asteroid/goliath, /mob/living/simple_animal/hostile/asteroid/hivelord, /mob/living/simple_animal/hostile/asteroid/basilisk, /mob/living/simple_animal/hostile/asteroid/fugu)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	faction = list("mining")

/mob/living/simple_animal/hostile/spawner/mining/goldgrub
	name = "goldgrub den"
	desc = "A den housing a nest of goldgrubs, annoying but arguably much better than anything else you'll find in a nest."
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/goldgrub)

/mob/living/simple_animal/hostile/spawner/mining/goliath
	name = "goliath den"
	desc = "A den housing a nest of goliaths, oh god why?"
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/goliath)

/mob/living/simple_animal/hostile/spawner/mining/hivelord
	name = "hivelord den"
	desc = "A den housing a nest of hivelords."
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/hivelord)

/mob/living/simple_animal/hostile/spawner/mining/basilisk
	name = "basilisk den"
	desc = "A den housing a nest of basilisks, bring a coat."
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/basilisk)

/mob/living/simple_animal/hostile/spawner/mining/wumborian
	name = "wumborian fugu den"
	desc = "A den housing a nest of wumborian fugus, how do they all even fit in there?"
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/fugu)
/*
//star wars spawners

/mob/living/simple_animal/hostile/spawner/starwars/npc/droid_dispenser
	name = "droid dispenser"
	desc = "A clone wars era droid dispenser. Warning, this is a parent type and not an actual spawner. Yell at admins."
	icon_state = "hole"
	icon_living = "hole"
	icon = 'icons/mob/nest.dmi'
	health = 150
	maxHealth = 150
	max_mobs = 15
	spawn_time = 150	// 150
	mob_types = list(/mob/living/simple_animal/hostile/buzzdroid)
	spawn_text = "climbs out of"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	faction = list("droid")
	sentience_type = SENTIENCE_BOSS

/mob/living/simple_animal/hostile/spawner/starwars/npc/droid_dispenser/buzzdroid
	name = "buzz droid dispenser"
	desc = "A clone wars era droid dispenser. This one is carrying buzz droids."
	icon_state = "droid_dispenser"
	icon_living = "droid_dispenser"
	icon = 'icons/mob/robots.dmi'
	health = 25
	maxHealth = 25
	max_mobs = 10
	spawn_time = 300
	mob_types = list(/mob/living/simple_animal/hostile/buzzdroid)
	spawn_text = "is dispensed from"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	sentience_type = SENTIENCE_BOSS
*/


/mob/living/simple_animal/hostile/spawner/starwars/trash/trash_dispenser
	anchored = TRUE
	name = "trash dispenser"
	desc = "A dispenser. Warning, this is a parent type and not an actual spawner. Yell at admins."
	icon_state = "grinder-o0"
	icon_living = "grinder-o0"
	icon = 'icons/obj/recycling.dmi'
	health = 150
	maxHealth = 150
	max_mobs = 15
	spawn_time = 25	// 150
	mob_types = list(/obj/item/paper/crumpled,/obj/item/shard,/obj/item/trash/raisins)
	spawn_text = "shoots out of"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	faction = list("droid")
	sentience_type = SENTIENCE_BOSS

/mob/living/simple_animal/hostile/spawner/starwars/trash/trash_dispenser/trash
	anchored = TRUE
	name = "trash dispenser"
	desc = "A trash dispenser. Oh boy, I wonder whats in it."
	icon_state = "grinder-o0"
	icon_living = "grinder-o0"
	icon = 'icons/obj/recycling.dmi'
	health = 25
	maxHealth = 25
	max_mobs = 10
	spawn_time = 25
	mob_types = list(/obj/item/paper/crumpled,/obj/item/shard,/obj/item/trash/raisins)
	spawn_text = "drops from"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	sentience_type = SENTIENCE_BOSS

//zombie

/mob/living/simple_animal/hostile/spawner/starwars/zombiespawner
	anchored = TRUE
	name = "trash dispenser"
	desc = "Zombie Spawner. Parent Object. Yell at admins."
	icon_state = "grinder-o0"
	icon_living = "grinder-o0"
	icon = 'icons/obj/recycling.dmi'
	health = 25
	maxHealth = 25
	max_mobs = 10
	spawn_time = 25
	mob_types = list()
	spawn_text = "drops from"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	sentience_type = SENTIENCE_BOSS

/mob/living/simple_animal/hostile/spawner/starwars/zombiespawner/zombie
	anchored = TRUE
	name = "stinking crate"
	desc = "A crate full of... something."
	icon_state = "grinder-o0"
	icon_living = "grinder-o0"
	icon = 'icons/obj/recycling.dmi'
	health = 30
	maxHealth = 30
	max_mobs = 20
	spawn_time = 5
	mob_types = list(/mob/living/simple_animal/hostile/star_zombie)
	spawn_text = "crawls out from"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	sentience_type = SENTIENCE_BOSS