/turf/open/floor/starwars/desert
	gender = PLURAL
	name = "desert"
	desc = "Looks hot."
	icon = 'icons/turf/desert.dmi'
	baseturfs = /turf/open/floor/starwars/desert
	icon_state = "desert"
	light_range = 2
	light_power = 0.75
	light_color = LIGHT_COLOR_SUN
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
