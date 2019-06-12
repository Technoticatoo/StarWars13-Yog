/obj/structure/warpfield
	name = "warpfield"
	icon = 'icons/starwars/effects.dmi'
	icon_state = "warpfield"
	invisibility = INVISIBILITY_MAXIMUM
	density = FALSE
	anchored = TRUE
	move_resist = INFINITY
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var warpsound = 'sound/effects/bamf.ogg'

/obj/structure/warpfield/Crossed(atom/movable/AM) //A mob moving on a tile with a projectile is hit by it.
	do_teleport(AM, pick(get_area_turfs(/area/planets/sector)), forceMove = TRUE, channel = TELEPORT_CHANNEL_MAGIC, asoundin = warpsound, asoundout= warpsound,  forced = TRUE)

/obj/structure/warpfield/rebel_underground
	name = "rebel_underground"
	icon_state = "warp_rebel_underground"

/obj/structure/warpfield/rebel_underground/Crossed(atom/movable/AM) //A mob moving on a tile with a projectile is hit by it.
	do_teleport(AM, pick(get_area_turfs(/area/warpto/rebel_underground)), forceMove = TRUE, channel = TELEPORT_CHANNEL_MAGIC, no_effects=TRUE, forced = TRUE)
	to_chat(usr , "Warped!")

/obj/structure/warpfield/rebel_base
	name = "rebel_base"
	icon_state = "warp_rebel_base"

/obj/structure/warpfield/rebel_base/Crossed(atom/movable/AM) //A mob moving on a tile with a projectile is hit by it.
	do_teleport(AM, pick(get_area_turfs(/area/warpto/rebel_base)), forceMove = TRUE, channel = TELEPORT_CHANNEL_MAGIC, no_effects=TRUE, forced = TRUE)
	to_chat(usr , "Warped!")

//Bump(atom/A)