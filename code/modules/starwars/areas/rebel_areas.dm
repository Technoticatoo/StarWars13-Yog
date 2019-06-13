/area/rebels
	name = "Rebels"
	icon_state = "rebels"
	has_gravity = STANDARD_GRAVITY

/area/rebels/command
	name = "Command"
	icon_state = "rebels_command"

/area/rebels/military
	name = "Military"
	icon_state = "rebels_military"

/area/rebels/medical
	name = "Medical"
	icon_state = "rebels_medical"

/area/rebels/squadron
	name = "Squadron"
	icon_state = "rebels_squadron"

/area/rebels/agents
	name = "Agents"
	icon_state = "rebels_agents"

/area/rebels/support
	name = "Support"
	icon_state = "rebels_support"

/area/rebels/general
	name = "General"
	icon_state = "rebels_general"

/area/rebels/latejoin
	name = "lateJoin"
	icon_state = "rebels_latejoin"

// Telecommunications Satellite

/area/tcommsatrebels
	clockwork_warp_allowed = FALSE
	clockwork_warp_fail = "For safety reasons, warping here is disallowed; the radio and bluespace noise could cause catastrophic results."
	ambientsounds = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambitech.ogg',\
											'sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg', 'sound/ambience/ambimystery.ogg')

/area/tcommsatrebels/computer
	name = "Telecomms Control Room"
	icon_state = "tcomsatcomp"

/area/tcommsatrebels/server
	name = "Telecomms Server Room"
	icon_state = "tcomsatcham"