/obj/structure/starwars/buoy
	name = "tracking buoy"
	desc = "A tracking buoy."
	icon = 'icons/starwars/obj/buoys.dmi'
	icon_state = "buoy"
	anchored = TRUE

/obj/structure/starwars/buoy/Initialize()
	. = ..()
	GLOB.hyperspace_targets += src

/obj/structure/starwars/buoy/rebels
	name = "rebel tracking buoy"
	desc = "A tracking buoy with rebel insignia painted on it."
	icon_state = "buoy"
	anchored = TRUE

/obj/structure/starwars/buoy/empire
	name = "imperial tracking buoy"
	desc = "A tracking buoy with imperial insignia painted on it."
	icon_state = "buoy"
	anchored = TRUE

/obj/structure/starwars/buoy/mercs
	name = "mercenary tracking buoy"
	desc = "A tracking buoy with rebel mercenary painted on it."
	icon_state = "buoy"
	anchored = TRUE
