/obj/docking_port/mobile/mercenaries
	name = "mercenaries shuttle"
	id = "mercenaries"

	dwidth = 3
	width = 7
	height = 15
	dir = WEST
	port_direction = SOUTH

	callTime = INFINITY
	ignitionTime = 50

	movement_force = list("KNOCKDOWN" = 3, "THROW" = 0)

	var/sound_played
	var/damaged	//too damaged to undock?
	var/list/areas	//areas in our shuttle
	var/list/queued_announces	//people coming in that we have to announce
	var/obj/machinery/requests_console/console
	var/force_depart = FALSE
	var/perma_docked = FALSE	//highlander with RESPAWN??? OH GOD!!!
	var/obj/docking_port/stationary/target_dock  // for badminry

/obj/docking_port/stationary/mercenaries
	name = "mercenaries dock"
	id = "mercenaries" //The Aux Base has to leave before this can be used as a dock.
	//Should be checked on the map to ensure it matchs the mining shuttle dimensions.
	dwidth = 3
	width = 7
	height = 15
	dir = WEST
	roundstart_template = /datum/map_template/shuttle/mercenaries/box
	//area_type = /area/construction/mining/aux_base

/obj/machinery/computer/shuttle/mercenaries
	name = "Mercenaries Console"
	desc = "Used to control the White Ship."
	circuit = /obj/item/circuitboard/computer/mercenaries
	shuttleId = "mercenaries"
	possible_destinations = "mercenaries_away;mercenaries_home;mercenaries_z4;mercenaries_lavaland;mercenaries_custom"

/obj/machinery/computer/shuttle/mercenaries/pod
	name = "Salvage Pod Console"
	desc = "Used to control the Salvage Pod."
	circuit = /obj/item/circuitboard/computer/mercenaries/pod
	shuttleId = "mercenaries_pod"
	possible_destinations = "mercenaries_pod_home;mercenaries_pod_custom"

/obj/machinery/computer/shuttle/mercenaries/pod/recall
	name = "Salvage Pod Recall Console"
	desc = "Used to recall the Salvage Pod."
	circuit = /obj/item/circuitboard/computer/mercenaries/pod/recall
	possible_destinations = "mercenaries_pod_home"

/obj/machinery/computer/camera_advanced/shuttle_docker/mercenaries
	name = "Mercenaries Navigation Computer"
	desc = "Used to designate a precise transit location for the White Ship."
	shuttleId = "mercenaries"
	lock_override = NONE
	shuttlePortId = "mercenaries_custom"
	jumpto_ports = list("mercenaries_away" = 1, "mercenaries_home" = 1, "mercenaries_z4" = 1)
	view_range = 18
	x_offset = -6
	y_offset = -10
	designate_time = 100

/obj/machinery/computer/camera_advanced/shuttle_docker/mercenaries/pod
	name = "Salvage Pod Navigation Computer"
	desc = "Used to designate a precise transit location for the Salvage Pod."
	shuttleId = "mercenaries_pod"
	shuttlePortId = "mercenaries_pod_custom"
	jumpto_ports = list("mercenaries_pod_home" = 1)
	view_range = 7
	x_offset = -2
	y_offset = 0
	designate_time = 0

/obj/machinery/computer/camera_advanced/shuttle_docker/mercenaries/Initialize()
	. = ..()
	GLOB.jam_on_wardec += src

/obj/machinery/computer/camera_advanced/shuttle_docker/mercenaries/Destroy()
	GLOB.jam_on_wardec -= src
	return ..()

/obj/effect/spawner/lootdrop/mercenaries_cere_ripley
	name = "25% mech 75% wreckage ripley spawner"
	loot = list(/obj/mecha/working/ripley/mining = 1,
				/obj/structure/mecha_wreckage/ripley = 5)
	lootdoubles = FALSE


/obj/item/circuitboard/computer/mercenaries
	name = "White Ship (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/mercenaries

/obj/item/circuitboard/computer/mercenaries/pod
	name = "Salvage Pod (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/mercenaries/pod

/obj/item/circuitboard/computer/mercenaries/pod/recall
	name = "Salvage Pod Recall (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/mercenaries/pod/recall

/datum/map_template/shuttle/mercenaries
	port_id = "mercenaries"

/datum/map_template/shuttle/mercenaries/box
	suffix = "box"
	name = "Mercenary Ship"