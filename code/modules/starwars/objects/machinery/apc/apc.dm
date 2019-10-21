/obj/machinery/power/apc/Initialize(mapload)
	if(istype(get_area(src), /area/factions))
		var/area/factions/src_area = get_area(src)
		src_area.apcs += src
	. = ..()