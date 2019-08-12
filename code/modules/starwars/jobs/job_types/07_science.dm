/*
Coalition Administrative Officer
*/
/datum/job/cao
	title = "Coalition Administrative Officer"
	flag = CAO
	department_head = list("Lieutenant")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Lieutenant"
	selection_color = "#AAFAFF"
	exp_type_department = EXP_TYPE_SCIENCE
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/cao

	access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
			            ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
			            ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
			            ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
			            ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK, ACCESS_FACTION_EMPIRE)
	minimal_access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
			            ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
			            ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
			            ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
			            ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK, ACCESS_FACTION_EMPIRE)

	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_CAO

/datum/outfit/job/cao
	name = "Coalition Administrative Officer"
	jobtype = /datum/job/cao

	id = /obj/item/card/id/empire
	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	belt = /obj/item/pda/bar
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/imperial/cao
	head = /obj/item/clothing/head/helmet/imperial/cao
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/modular_computer/tablet/preset/advanced=1, /obj/item/card/id/departmental_budget/sci=1)
	shoes = /obj/item/clothing/shoes/imperial


/*
Science Director
*/
/datum/job/rd
	title = "Research Director"
	flag = RD_JF
	department_head = list("Coalition Administrative Officer")
	department_flag = MEDSCI
	head_announce = list("Science")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Coalition Administrative Officer"
	selection_color = "#ddfbff"
	req_admin_notify = 1
	minimal_player_age = 7
	//exp_type_department = EXP_TYPE_SCIENCE
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/rd

	access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
			            ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
			            ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
			            ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
			            ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK, ACCESS_FACTION_EMPIRE)
	minimal_access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
			            ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
			            ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
			            ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
			            ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK, ACCESS_FACTION_EMPIRE)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SCI
	display_order = JOB_DISPLAY_ORDER_RD

/datum/outfit/job/rd
	name = "Research Director"
	jobtype = /datum/job/rd

	id = /obj/item/card/id/empire
	belt = /obj/item/pda/heads/rd
	ears = /obj/item/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/research_director
	shoes = /obj/item/clothing/shoes/imperial
	suit = /obj/item/clothing/suit/toggle/labcoat
	l_hand = /obj/item/clipboard
	l_pocket = /obj/item/laser_pointer
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/modular_computer/tablet/preset/advanced=1, /obj/item/card/id/departmental_budget/sci=1)

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox

	chameleon_extras = /obj/item/stamp/rd

/datum/outfit/job/rd/rig
	name = "Research Director (Hardsuit)"

	l_hand = null
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/hardsuit/rd
	suit_store = /obj/item/tank/internals/oxygen
	internals_slot = SLOT_S_STORE

/*
Scientist
*/
/datum/job/scientist
	title = "Researcher"
	flag = SCIENTIST
	department_head = list("Research Director")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Research Director"
	selection_color = "#ebfdff"
	exp_requirements = 60
	exp_type = EXP_TYPE_CREW


	outfit = /datum/outfit/job/scientist

	access = list(ACCESS_ROBOTICS, ACCESS_TOX, ACCESS_TOX_STORAGE, ACCESS_RESEARCH, ACCESS_XENOBIOLOGY, ACCESS_MECH_SCIENCE, ACCESS_MINERAL_STOREROOM, ACCESS_TECH_STORAGE, ACCESS_GENETICS, ACCESS_FACTION_EMPIRE)
	minimal_access = list(ACCESS_TOX, ACCESS_TOX_STORAGE, ACCESS_RESEARCH, ACCESS_XENOBIOLOGY, ACCESS_MECH_SCIENCE, ACCESS_MINERAL_STOREROOM, ACCESS_FACTION_EMPIRE)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_SCI
	display_order = JOB_DISPLAY_ORDER_RS

/datum/outfit/job/scientist
	name = "Researcher"
	jobtype = /datum/job/scientist

	id = /obj/item/card/id/empire
	belt = /obj/item/pda/toxins
	ears = /obj/item/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit = /obj/item/clothing/suit/toggle/labcoat/science

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox

/*
Roboticist
*/
/datum/job/roboticist
	title = "Roboticist"
	flag = ROBOTICIST
	department_head = list("Research Director")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Research Director"
	selection_color = "#ebfdff"
	exp_requirements = 60
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/roboticist

	access = list(ACCESS_ROBOTICS, ACCESS_TOX, ACCESS_TOX_STORAGE, ACCESS_TECH_STORAGE, ACCESS_MORGUE, ACCESS_MECH_SCIENCE, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_XENOBIOLOGY, ACCESS_GENETICS, ACCESS_FACTION_EMPIRE)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_TECH_STORAGE, ACCESS_MORGUE, ACCESS_RESEARCH, ACCESS_MECH_SCIENCE, ACCESS_MINERAL_STOREROOM, ACCESS_FACTION_EMPIRE)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_SCI
	display_order = JOB_DISPLAY_ORDER_RB

/datum/outfit/job/roboticist
	name = "Roboticist"
	jobtype = /datum/job/roboticist

	id = /obj/item/card/id/empire
	belt = /obj/item/storage/belt/utility/full
	l_pocket = /obj/item/pda/roboticist
	ears = /obj/item/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/roboticist
	suit = /obj/item/clothing/suit/toggle/labcoat

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox

	pda_slot = SLOT_L_STORE

/datum/job/clerk
	title = "Clerk"
	flag = CLERK
	department_head = list("Research Director")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Research Director"
	selection_color = "#ebfdff"

	outfit = /datum/outfit/job/clerk

	access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
			            ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
			            ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
			            ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
			            ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK, ACCESS_FACTION_EMPIRE)
	minimal_access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
			            ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
			            ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
			            ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
			            ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK, ACCESS_FACTION_EMPIRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_CLERK


/datum/outfit/job/clerk
	name = "Clerk"
	jobtype = /datum/job/clerk

	id = /obj/item/card/id/empire
	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	belt = /obj/item/pda/bar
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/armor/vest
	//backpack_contents = list(/obj/item/storage/box/beanbag=1,/obj/item/book/granter/action/drink_fling=1)
	shoes = /obj/item/clothing/shoes/laceup
