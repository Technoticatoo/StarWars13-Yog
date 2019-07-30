/obj/machinery/door/Initialize()
	if(istype(get_area(src), /area/factions))
		var/area/factions/src_area = get_area(src)
		src_area.doors += src
	. = ..()


/obj/machinery/door/Destroy()
	if(istype(get_area(src), /area/factions))
		var/area/factions/src_area = get_area(src)
		src_area.doors -= src
	. = ..()