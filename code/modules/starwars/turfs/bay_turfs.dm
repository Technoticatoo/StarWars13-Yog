//BAY TURFS!

/turf/open/mineral
	name = "impassable rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock-dark"
	blocks_air = 1
	density = 1
	opacity = 1

/turf/open/mask
	name = "mask"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"

/turf/open/floor/exoplanet
	name = "space land"
	icon = 'icons/turf/desert.dmi'
	icon_state = "desert"
	//has_resources = 1
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	var/diggable = 1
	var/mudpit = 0	//if pits should not take turf's color

/turf/open/floor/exoplanet/snow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"

/turf/open/floor/exoplanet/snow/New()
	icon_state = pick("snow[rand(1,12)]","snow0")
	..()

/turf/open/floor/exoplanet/snow/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	name = "permafrost"
	icon_state = "permafrost"

/turf/open/floor/tiled
	name = "steel floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel"
	//initial_flooring = /decl/flooring/tiling

