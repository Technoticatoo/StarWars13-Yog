/obj/docking_port/mobile/rebels
	name = "rebels shuttle"
	id = "rebels"

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

/obj/machinery/computer/shuttle/rebels
	name = "White Ship Console"
	desc = "Used to control the White Ship."
	circuit = /obj/item/circuitboard/computer/rebels
	shuttleId = "rebels"
	possible_destinations = "rebels_away;rebels_home;rebels_z4;rebels_lavaland;rebels_custom"

/obj/machinery/computer/shuttle/rebels/pod
	name = "Salvage Pod Console"
	desc = "Used to control the Salvage Pod."
	circuit = /obj/item/circuitboard/computer/rebels/pod
	shuttleId = "rebels_pod"
	possible_destinations = "rebels_pod_home;rebels_pod_custom"

/obj/machinery/computer/shuttle/rebels/pod/recall
	name = "Salvage Pod Recall Console"
	desc = "Used to recall the Salvage Pod."
	circuit = /obj/item/circuitboard/computer/rebels/pod/recall
	possible_destinations = "rebels_pod_home"

/obj/machinery/computer/camera_advanced/shuttle_docker/rebels
	name = "White Ship Navigation Computer"
	desc = "Used to designate a precise transit location for the White Ship."
	shuttleId = "rebels"
	lock_override = NONE
	shuttlePortId = "rebels_custom"
	jumpto_ports = list("rebels_away" = 1, "rebels_home" = 1, "rebels_z4" = 1)
	view_range = 18
	x_offset = -6
	y_offset = -10
	designate_time = 100

/obj/machinery/computer/camera_advanced/shuttle_docker/rebels/pod
	name = "Salvage Pod Navigation Computer"
	desc = "Used to designate a precise transit location for the Salvage Pod."
	shuttleId = "rebels_pod"
	shuttlePortId = "rebels_pod_custom"
	jumpto_ports = list("rebels_pod_home" = 1)
	view_range = 7
	x_offset = -2
	y_offset = 0
	designate_time = 0

/obj/machinery/computer/camera_advanced/shuttle_docker/rebels/Initialize()
	. = ..()
	GLOB.jam_on_wardec += src

/obj/machinery/computer/camera_advanced/shuttle_docker/rebels/Destroy()
	GLOB.jam_on_wardec -= src
	return ..()

/obj/effect/spawner/lootdrop/rebels_cere_ripley
	name = "25% mech 75% wreckage ripley spawner"
	loot = list(/obj/mecha/working/ripley/mining = 1,
				/obj/structure/mecha_wreckage/ripley = 5)
	lootdoubles = FALSE

/obj/item/circuitboard/computer/rebels
	name = "White Ship (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/rebels

/obj/item/circuitboard/computer/rebels/pod
	name = "Salvage Pod (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/rebels/pod

/obj/item/circuitboard/computer/rebels/pod/recall
	name = "Salvage Pod Recall (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/rebels/pod/recall