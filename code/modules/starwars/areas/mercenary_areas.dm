
//TO BE REFINED


/area/mercenaries
	name = "mercenaries"
	icon_state = "mercenaries"
	has_gravity = STANDARD_GRAVITY

/area/mercenaries/command
	name = "Command"
	icon_state = "mercenaries_command"

/area/mercenaries/military
	name = "Military"
	icon_state = "mercenaries_military"

/area/mercenaries/medical
	name = "Medical"
	icon_state = "mercenaries_medical"

/area/mercenaries/squadron
	name = "Squadron"
	icon_state = "mercenaries_squadron"

/area/mercenaries/agents
	name = "Agents"
	icon_state = "mercenaries_agents"

/area/mercenaries/support
	name = "Support"
	icon_state = "mercenaries_support"

/area/mercenaries/general
	name = "General"
	icon_state = "mercenaries_general"

/area/mercenaries/latejoin
	name = "lateJoin"
	icon_state = "mercenaries_latejoin"

/area/mercenaries/shuttle
	name = "mercs shuttle"
	icon_state = "mercenaries_shuttle"

// Telecommunications Satellite

/area/tcommsatmercenaries
	clockwork_warp_allowed = FALSE
	clockwork_warp_fail = "For safety reasons, warping here is disallowed; the radio and bluespace noise could cause catastrophic results."
	ambientsounds = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambitech.ogg',\
											'sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg', 'sound/ambience/ambimystery.ogg')

/area/tcommsatmercenaries/computer
	name = "Telecomms Control Room"
	icon_state = "tcomsatcomp"

/area/tcommsatmercenaries/server
	name = "Telecomms Server Room"
	icon_state = "tcomsatcham"