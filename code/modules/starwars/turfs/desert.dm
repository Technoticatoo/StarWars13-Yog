/turf/open/floor/plating/desert //floor piece
	gender = PLURAL
	name = "desert"
	baseturfs = /turf/open/floor/plating/desert
	icon = 'icons/turf/floors/mars.dmi'
	icon_state = "mars"
	icon_plating = "mars"
	postdig_icon_change = TRUE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	var/environment_type = "mars"
	var/turf_type = /turf/open/floor/plating/desert //Because caves do whacky shit to revert to normal
	var/floor_variance = 40 //probability floor has a different icon state
	attachment_holes = FALSE
	var/obj/item/stack/digResult = /obj/item/stack/ore/glass/basalt
	var/dug
	slowdown = .5
	planetary_atmos = TRUE
	initial_gas_mix = DESERT_ATMOS

/turf/open/floor/plating/desert/Initialize()
	var/proper_name = name
	. = ..()
	name = proper_name
	if(prob(floor_variance))
		icon_state = "[environment_type][rand(0,11)]"

/turf/open/floor/plating/desert/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plating/desert/temperatre
	initial_gas_mix = "o2=22;n2=82;TEMP=313.15"

/turf/open/floor/plating/desert/atmosphere
	initial_gas_mix = DESERT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/plating/desert/planetary
	icon_state = "sandglass"
	initial_gas_mix = "o2=22;n2=82;TEMP=313.15"
	planetary_atmos = TRUE









/turf/open/floor/starwars/desert
	gender = PLURAL
	name = "desert"		//"desert"
	desc = "Looks hot."
	icon = 	'icons/turf/floors/mars.dmi'		//'icons/turf/desert.dmi'
	baseturfs = /turf/open/floor/starwars/desert
	icon_state = "mars_1"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
/*	light_range = 2
	light_power = 0.75
	light_color = LIGHT_COLOR_SUN*/
	initial_gas_mix = DESERT_ATMOS
	slowdown = 2
//	environment_type = "desert"
	flags_1 = NONE
	planetary_atmos = TRUE
	burnt_states = list("desert")
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	//digResult = /obj/item/stack/sheet/mineral/desert




/turf/open/floor/starwars/desert/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/starwars/desert/temperatre
	initial_gas_mix = "o2=22;n2=82;TEMP=313.15"

/turf/open/floor/plating/desert/atmosphere
	initial_gas_mix = DESERT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/starwars/desert/planetary
	icon_state = "sandglass"
	initial_gas_mix = "o2=22;n2=82;TEMP=313.15"
	planetary_atmos = TRUE
