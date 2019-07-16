/*
### This file contains a list of all the areas in your station. Format is as follows:
/area/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = 'ICON FILENAME' 			(defaults to 'icons/turf/areas.dmi')
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = FALSE 				(defaults to true)
	music = null					(defaults to nothing, look in sound/ambience for music)

carajam areas
*/



//carajam imperial outpost



/area/carajam/imperial/hallway
	name = "Hallway"
	icon_state = "security"

/area/carajam/imperial/command_hall
	name = "Command Hall"
	icon_state = "bridge_hallway"

/area/carajam/imperial/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/carajam/imperial/captains_quarters
	name = "Captains Quarters"
	icon_state = "captain"

/area/carajam/imperial/bridge_armory
	name = "Armory"
	icon_state = "armory"

/area/carajam/imperial/checkpoint
	name = "Checkpoint"
	icon_state = "checkpoint_aux"

/area/carajam/imperial/sec_room
	name = "Security Room"
	icon_state = "security"

/area/carajam/imperial/janitor
	name = "Custodial Closet"
	icon_state = "janitor"
	flags_1 = NONE

/area/carajam/imperial/morgue
	name = "Morgue"
	icon_state = "morgue"
	ambientsounds = SPOOKY

/area/carajam/imperial/medical
	name = "Medbay"
	icon_state = "medbay"

/area/carajam/imperial/bunks
	name = "Bunks"
	icon_state = "cargo_delivery"

/area/carajam/imperial/storage
	name = "Storage"
	icon_state = "cargo_warehouse"

/area/carajam/imperial/canteen
	name = "Canteen"
	icon_state = "Sleep"
	safe = TRUE

/area/carajam/imperial/meeting_room
	name = "Meeting Roon"
	icon_state = "meeting"

/area/carajam/imperial/tcomms
	name = "Telecomms Server Room"
	icon_state = "tcomsatcham"

/area/carajam/imperial/engineering
	name = "Engineering"
	icon_state = "engi_storage"

/area/carajam/imperial/engineering/garage
	name = "Imperial Garage"
	icon_state = "maint_engi"