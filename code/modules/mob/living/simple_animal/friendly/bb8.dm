//BB8
/mob/living/simple_animal/pet/bb8
	name = "bb8"
	desc = "BB8!!"
	icon = 'icons/starwars/mob/droids.dmi'
	icon_state = "bb8"
	icon_living = "bb8"
	icon_dead = "bb8_gib"
	speak = list("BeepBeep!", "Bzzt!", "Bing!", "Boing")
	speak_emote = list("beeps", "humms")
	emote_hear = list("beeps.", "humms.")
	emote_see = list("twirls.", "bounces.")
	speak_chance = 1
	turns_per_move = 5
	status_flags = CANPUSH
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = list(MOB_ROBOTIC)
	maxHealth = 25
	health = 25
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 0
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	var/turns_since_scan = 0
	var/mob/living/simple_animal/mouse/movement_target
	gold_core_spawnable = FRIENDLY_SPAWN
	loot = list(/obj/item/assembly/prox_sensor,/obj/effect/decal/cleanable/oil)
	faction = list("droid")

	do_footstep = TRUE

