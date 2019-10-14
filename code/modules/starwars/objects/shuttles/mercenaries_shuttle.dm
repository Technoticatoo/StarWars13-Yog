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