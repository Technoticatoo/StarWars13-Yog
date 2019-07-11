/turf/open/space/arrival_sector
	gender = PLURAL
	name = "sector"
	desc = "A sector in space."
	icon = 'icons/turf/space.dmi'
	icon_state = "0"
	intact = 0
	baseturfs = /turf/open/space
	planetary_atmos = FALSE

/turf/open/space/home_sector
	gender = PLURAL
	name = "home"
	desc = "The arrival area of the Purge."
	icon = 'icons/turf/space.dmi'
	icon_state = "0"
	intact = 0
	baseturfs = /turf/open/space
	planetary_atmos = FALSE


/turf/open/floor/arrival/rebel_base
	gender = PLURAL
	name = "snow"
	desc = "Looks cold."
	icon = 'icons/turf/snow.dmi'
	baseturfs = /turf/open/floor/plating/asteroid/snow
	icon_state = "snow"
	icon_plating = "snow"
	initial_gas_mix = "o2=22;n2=82;TEMP=255.37"
	planetary_atmos = TRUE
	slowdown = 2
//	environment_type = "snow"
	flags_1 = NONE
	burnt_states = list("snow_dug")
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
//	digResult = /obj/item/stack/sheet/mineral/snow


/turf/open/floor/arrival/rebel_underground
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/plasteel
	broken_states = list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")
	burnt_states = list("floorscorched1", "floorscorched2")

/turf/open/floor/plasteel/arrival/arrival_rebelbase
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/plasteel
	broken_states = list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")
	burnt_states = list("floorscorched1", "floorscorched2")

/turf/open/space/arrival_rebelsector
	gender = PLURAL
	name = "sector"
	desc = "A sector in space."
	icon = 'icons/turf/space.dmi'
	icon_state = "0"
	intact = 0
	baseturfs = /turf/open/space
	planetary_atmos = FALSE


/turf/open/space/arrival_mercsector
	gender = PLURAL
	name = "sector"
	desc = "A sector in space."
	icon = 'icons/turf/space.dmi'
	icon_state = "0"
	intact = 0
	baseturfs = /turf/open/space
	planetary_atmos = FALSE



/turf/open/floor/plasteel/arrival/arrival_mercbase
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/plasteel
	broken_states = list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")
	burnt_states = list("floorscorched1", "floorscorched2")