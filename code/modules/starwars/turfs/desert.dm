/turf/open/floor/plating/asteroid/desert
	gender = PLURAL
	name = "desert"
	desc = "Looks hot."
	icon = 'icons/starwars/desert_turfs.dmi'
	baseturfs = /turf/open/floor/plating/asteroid/desert
	icon_state = "desert"
	icon_plating = "desert"
	light_range = 2
	light_power = 0.75
	light_color = LIGHT_COLOR_SUN
	initial_gas_mix = DESERT_ATMOS
	slowdown = 2
	environment_type = "desert"
	flags_1 = NONE
	planetary_atmos = TRUE
	burnt_states = list("54,5")
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	//digResult = /obj/item/stack/sheet/mineral/desert


/turf/open/floor/plating/asteroid/desert/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plating/asteroid/desert/temperatre
	initial_gas_mix = "o2=22;n2=82;TEMP=313.15"

/turf/open/floor/plating/asteroid/desert/atmosphere
	initial_gas_mix = DESERT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/plating/asteroid/desert/planetary
	initial_gas_mix = "o2=22;n2=82;TEMP=313.15"
	planetary_atmos = TRUE

