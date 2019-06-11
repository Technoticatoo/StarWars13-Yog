// ORIGINAL START LANDMARKS FOLLOW. Don't change the names unless
// you are refactoring shitty landmark code.
/obj/effect/landmark/start/assistant
	name = "Assistant"
	icon_state = "Assistant"

/obj/effect/landmark/start/assistant/override
	jobspawn_override = TRUE
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/janitor
	name = "Janitor"
	icon_state = "Janitor"

/obj/effect/landmark/start/cargo_technician
	name = "Cargo Technician"
	icon_state = "Cargo Technician"

/obj/effect/landmark/start/bartender
	name = "Bartender"
	icon_state = "Bartender"

/obj/effect/landmark/start/clown
	name = "Clown"
	icon_state = "Clown"

/obj/effect/landmark/start/mime
	name = "Mime"
	icon_state = "Mime"

/obj/effect/landmark/start/quartermaster
	name = "Quartermaster"
	icon_state = "Quartermaster"

/obj/effect/landmark/start/atmospheric_technician
	name = "Atmospheric Technician"
	icon_state = "Atmospheric Technician"

/obj/effect/landmark/start/cook
	name = "Cook"
	icon_state = "Cook"

/obj/effect/landmark/start/shaft_miner
	name = "Shaft Miner"
	icon_state = "Shaft Miner"

/obj/effect/landmark/start/security_officer
	name = "Security Officer"
	icon_state = "Security Officer"

/obj/effect/landmark/start/botanist
	name = "Botanist"
	icon_state = "Botanist"

/obj/effect/landmark/start/head_of_security
	name = "Head of Security"
	icon_state = "Head of Security"

/obj/effect/landmark/start/captain
	name = "Captain"
	icon_state = "Captain"

/obj/effect/landmark/start/detective
	name = "Detective"
	icon_state = "Detective"

/obj/effect/landmark/start/warden
	name = "Warden"
	icon_state = "Warden"

/obj/effect/landmark/start/chief_engineer
	name = "Chief Engineer"
	icon_state = "Chief Engineer"

/obj/effect/landmark/start/head_of_personnel
	name = "Head of Personnel"
	icon_state = "Head of Personnel"

/obj/effect/landmark/start/librarian
	name = "Curator"
	icon_state = "Curator"

/obj/effect/landmark/start/lawyer
	name = "Lawyer"
	icon_state = "Lawyer"

/obj/effect/landmark/start/station_engineer
	name = "Station Engineer"
	icon_state = "Station Engineer"

/obj/effect/landmark/start/medical_doctor
	name = "Medical Doctor"
	icon_state = "Medical Doctor"

/obj/effect/landmark/start/scientist
	name = "Scientist"
	icon_state = "Scientist"

/obj/effect/landmark/start/chemist
	name = "Chemist"
	icon_state = "Chemist"

/obj/effect/landmark/start/roboticist
	name = "Roboticist"
	icon_state = "Roboticist"

/obj/effect/landmark/start/research_director
	name = "Research Director"
	icon_state = "Research Director"

/obj/effect/landmark/start/geneticist
	name = "Geneticist"
	icon_state = "Geneticist"

/obj/effect/landmark/start/chief_medical_officer
	name = "Chief Medical Officer"
	icon_state = "Chief Medical Officer"

/obj/effect/landmark/start/virologist
	name = "Virologist"
	icon_state = "Virologist"

/obj/effect/landmark/start/chaplain
	name = "Chaplain"
	icon_state = "Chaplain"

/obj/effect/landmark/start/cyborg
	name = "Cyborg"
	icon_state = "Cyborg"

/obj/effect/landmark/start/ai
	name = "AI"
	icon_state = "AI"
	delete_after_roundstart = FALSE
	var/primary_ai = TRUE
	var/latejoin_active = TRUE

/obj/effect/landmark/start/ai/after_round_start()
	if(latejoin_active && !used)
		new /obj/structure/AIcore/latejoin_inactive(loc)
	return ..()

/obj/effect/landmark/start/ai/secondary
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "ai_spawn"
	primary_ai = FALSE
	latejoin_active = FALSE

//Department Security spawns

/obj/effect/landmark/start/depsec
	name = "department_sec"
	icon_state = "Security Officer"

/obj/effect/landmark/start/depsec/New()
	..()
	GLOB.department_security_spawns += src

/obj/effect/landmark/start/depsec/Destroy()
	GLOB.department_security_spawns -= src
	return ..()

/obj/effect/landmark/start/depsec/supply
	name = "supply_sec"

/obj/effect/landmark/start/depsec/medical
	name = "medical_sec"

/obj/effect/landmark/start/depsec/engineering
	name = "engineering_sec"

/obj/effect/landmark/start/depsec/science
	name = "science_sec"

//Antagonist spawns

/obj/effect/landmark/start/wizard
	name = "wizard"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "wiznerd_spawn"

/obj/effect/landmark/start/wizard/Initialize()
	..()
	GLOB.wizardstart += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/nukeop
	name = "nukeop"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_spawn"

/obj/effect/landmark/start/nukeop/Initialize()
	..()
	GLOB.nukeop_start += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/nukeop_leader
	name = "nukeop leader"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_leader_spawn"

/obj/effect/landmark/start/nukeop_leader/Initialize()
	..()
	GLOB.nukeop_leader_start += loc
	return INITIALIZE_HINT_QDEL

// Must be immediate because players will
// join before SSatom initializes everything.
INITIALIZE_IMMEDIATE(/obj/effect/landmark/start/new_player)

/obj/effect/landmark/start/new_player
	name = "New Player"

/obj/effect/landmark/start/new_player/Initialize()
	..()
	GLOB.newplayer_start += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/latejoin
	name = "JoinLate"

/obj/effect/landmark/latejoin/Initialize(mapload)
	..()
	SSjob.latejoin_trackers += loc
	return INITIALIZE_HINT_QDEL

//space carps, magicarps, lone ops, slaughter demons, possibly revenants spawn here
/obj/effect/landmark/carpspawn
	name = "carpspawn"
	icon_state = "carp_spawn"

//observer start
/obj/effect/landmark/observer_start
	name = "Observer-Start"
	icon_state = "observer_start"

//xenos, morphs and nightmares spawn here
/obj/effect/landmark/xeno_spawn
	name = "xeno_spawn"
	icon_state = "xeno_spawn"

/obj/effect/landmark/xeno_spawn/Initialize(mapload)
	..()
	GLOB.xeno_spawn += loc
	return INITIALIZE_HINT_QDEL

//STAR WARS LANDMARKS

/obj/effect/landmark/start/imperial
	name = "Imperial"
	icon = 'icons/starwars/spawnpoints.dmi'
	icon_state = "imperial"

//PRISONER

/obj/effect/landmark/start/imperial/prisoner
	name = "Prisoner"
	icon_state = "prisoner"

//ARMY

/obj/effect/landmark/start/imperial/cotg
	name = "Captain of the Guard"
	icon_state = "cotg"

/obj/effect/landmark/start/imperial/asergeant
	name = "Alpha Squad Sergeant"
	icon_state = "asergeant"

/obj/effect/landmark/start/imperial/atrooper
	name = "Alpha Squad Stormtrooper"
	icon_state = "atrooper"

/obj/effect/landmark/start/imperial/bsergeant
	name = "Bravo Squad Sergeant"
	icon_state = "bsergeant"

/obj/effect/landmark/start/imperial/btrooper
	name = "Bravo Squad Stormtrooper"
	icon_state = "btrooper"

/obj/effect/landmark/start/imperial/tie_pilot
	name = "Tie Pilot"
	icon_state = "tie_pilot"

//ENGINEERING

/obj/effect/landmark/start/imperial/chief_engineer
	name = "Chief Engineer"
	icon_state = "chief_engineer"

/obj/effect/landmark/start/imperial/engineer_sergeant
	name = "Engineer Sergeant"
	icon_state = "engineer_sergeant"

/obj/effect/landmark/start/imperial/engineer_corporal
	name = "Engineer Corporal"
	icon_state = "engineer_corporal"

/obj/effect/landmark/start/imperial/engineer_private
	name = "Engineer Private"
	icon_state = "engineer_private"

//EMPEROR

/obj/effect/landmark/start/imperial/emperor
	name = "Emperor"
	icon_state = "emperor"

//SITH

/obj/effect/landmark/start/imperial/sith
	name = "Sith"
	icon_state = "sith"

/obj/effect/landmark/start/imperial/acolyte
	name = "Sith Acolyte"
	icon_state = "acolyte"

//NAVY & SUPPLY

/obj/effect/landmark/start/imperial/captain
	name = "Captain"
	icon_state = "captain"

/obj/effect/landmark/start/imperial/lieutenant
	name = "Lieutenant"
	icon_state = "lieutenant"

/obj/effect/landmark/start/imperial/crewman
	name = "Crewman"
	icon_state = "crewman"

/obj/effect/landmark/start/imperial/navy_guard
	name = "Navy Guard"
	icon_state = "navy_guard"

/obj/effect/landmark/start/imperial/qm
	name = "Quartermaster"
	icon_state = "qm"

/obj/effect/landmark/start/imperial/away_lead
	name = "Away Team Leader"
	icon_state = "away_lead"

/obj/effect/landmark/start/imperial/cargo_tech
	name = "Cargo Technician"
	icon_state = "cargo_tech"

/obj/effect/landmark/start/imperial/req_off
	name = "Requisitions Officer"
	icon_state = "req_off"


/obj/effect/landmark/start/imperial/shipwarden
	name = "The Ships Warden"
	icon_state = "shipwarden"

//MEDICAL

/obj/effect/landmark/start/imperial/cmo
	name = "Chief Medical Officer"
	icon_state = "cmo"

/obj/effect/landmark/start/imperial/head_surgeon
	name = "Head Surgeon"
	icon_state = "head_surgeon"

/obj/effect/landmark/start/imperial/storm_surgeon
	name = "Stormtrooper Surgeon"
	icon_state = "storm_surgeon"

/obj/effect/landmark/start/imperial/imperial_medic
	name = "Imperial Medic"
	icon_state = "imperial_medic"

/obj/effect/landmark/start/imperial/geneticist
	name = "Geneticist"
	icon_state = "geneticist"


//SCIENCE

/obj/effect/landmark/start/imperial/cao
	name = "Coalition Administrative Officer"
	icon_state = "cao"

/obj/effect/landmark/start/imperial/rd
	name = "Research Director"
	icon_state = "rd"

/obj/effect/landmark/start/imperial/researcher
	name = "Researcher"
	icon_state = "researcher"

/obj/effect/landmark/start/imperial/roboticist
	name = "Roboticist"
	icon_state = "roboticist"

/obj/effect/landmark/start/imperial/clerk
	name = "Clerk"
	icon_state = "clerk"

//CIVILIAN

/obj/effect/landmark/start/imperial/miner
	name = "Miner"
	icon_state = "miner"

/obj/effect/landmark/start/imperial/bartender
	name = "Bartender"
	icon_state = "bartender"


/obj/effect/landmark/start/imperial/cook
	name = "Cook"
	icon_state = "cook"

/obj/effect/landmark/start/imperial/janitor
	name = "Janitor"
	icon_state = "janitor"

/obj/effect/landmark/start/imperial/ai
	name = "AI"
	icon_state = "ai"

/obj/effect/landmark/start/imperial/cyborg
	name = "Cyborg"
	icon_state = "cyborg"

/obj/effect/landmark/start/imperial/assistant
	name = "Assistant"
	icon_state = "assistant"


//REBELS

/obj/effect/landmark/start/rebels
	name = "Rebels"
	icon = 'icons/starwars/spawnpoints.dmi'
	icon_state = "rebels"


/obj/effect/landmark/start/rebels/general
	name = "General"
	icon_state = "rebel_general"

/obj/effect/landmark/start/rebels/commander
	name = "Commander"
	icon_state = "rebel_commander"

/obj/effect/landmark/start/rebels/agent
	name = "Agent"
	icon_state = "rebel_agent"

/obj/effect/landmark/start/rebels/soldier
	name = "Soldier"
	icon_state = "rebel_soldier"

/obj/effect/landmark/start/rebels/medic
	name = "Medic"
	icon_state = "rebel_medic"

/obj/effect/landmark/start/rebels/pilot
	name = "Fighter Pilot"
	icon_state = "rebel_fighter_pilot"

/obj/effect/landmark/start/rebels/support
	name = "Support"
	icon_state = "rebel_support"






