//BAY TURFS!

/turf/open/mask
	name = "mask"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"
	initial_gas_mix = "o2=22;n2=82;TEMP=255.37"

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

/turf/open/wall/away/blueriver/livingwall
	name = "alien wall"
	desc = "You feel a sense of dread from just looking at this wall. Its surface seems to be constantly moving, as if it were breathing."
	icon = 'icons/starwars/riverturfs.dmi'
	icon_state = "evilwall_1"
	opacity = 1
	density = 1
	temperature = 233

/turf/open/wall/away/blueriver/livingwall/Initialize()
	.=..()

	if(prob(80))
		icon_state = "evilwall_[rand(1,8)]"

/turf/open/floor/away/blueriver/alienfloor
	name = "glowing floor"
	desc = "The floor glows without any apparent reason"
	icon = 'icons/starwars/riverturfs.dmi'
	icon_state = "floor"
	temperature = 233

/turf/open/floor/away/blueriver/alienfloor/Initialize()
	.=..()

/turf/open/wall/supermatter/no_spread
	name = "weird liquid"
	desc = "The viscous liquid glows and moves as if it were alive."
	icon='icons/starwars/blueriver.dmi'
	icon_state = "bluespacecrystal1"
	layer = GASFIRE_LAYER
	plane = BYOND_LIGHTING_PLANE
	opacity = 0
	dynamic_lighting = 0

/turf/open/wall/supermatter/no_spread/Initialize()
	.=..()

	icon_state = "bluespacecrystal[rand(1,3)]"
	set_light(0.7, 1, 5, l_color = "#0066ff")




