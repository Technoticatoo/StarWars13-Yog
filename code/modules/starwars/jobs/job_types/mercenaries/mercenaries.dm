/datum/job/mleader
	title = "Leader"
	flag = LEADER
	department_head = list("Mercenaries")
	department_flag = MERCENARIES
	faction = "Mercenaries"
	total_positions = 1
	spawn_positions = 1
	supervisors = "None"
	selection_color = "#dc5a5a"
	req_admin_notify = 1
	minimal_player_age = 30
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/mleader

	access = list()
	minimal_access = list() //SEE /DATUM/JOB/WARDEN/GET_ACCESS()
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_LEADER

/datum/job/mleader/get_access()
	return get_all_accesses()

/datum/outfit/job/mleader
	name = "Leader"
	jobtype = /datum/job/mleader

	/*belt = /obj/item/pda/mleader
	ears = /obj/item/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/imperial/warden
	shoes = /obj/item/clothing/shoes/imperial
	//suit = /obj/item/clothing/suit/armor/vest/warden/alt
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/imperial/warden
	r_pocket = /obj/item/assembly/flash/handheld
	l_pocket = /obj/item/restraints/handcuffs
	suit_store = /obj/item/gun/energy/e_gun/advtaser
	backpack_contents = list(/obj/item/melee/baton/loaded=1)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/security

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = /obj/item/gun/ballistic/shotgun/automatic/combat/compact*/

/datum/job/mercenary
	title = "Mercenary"
	flag = MERCENARY
	department_head = list("Leader")
	department_flag = MERCENARIES
	faction = "Mercenaries"
	total_positions = 12
	spawn_positions = 12
	supervisors = "the Leader"
	selection_color = "#de6666"
//	req_admin_notify = 1
//	minimal_player_age = 14
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY

	outfit = /datum/outfit/job/mercenary

	access = list(ACCESS_REBELS_MILITARY, ACCESS_REBELS_SQUADRON, ACCESS_REBELS_SUPPORT, ACCESS_REBELS_GENERAL)
	minimal_access = list(ACCESS_REBELS_MILITARY, ACCESS_REBELS_SQUADRON, ACCESS_REBELS_SUPPORT, ACCESS_REBELS_GENERAL)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_MERCENARY

/datum/outfit/job/mercenary
	name = "Mercenary"
	jobtype = /datum/job/mercenary

/*
//	id = /obj/item/card/id/silver
//	belt = /obj/item/pda/heads/hos
	ears = /obj/item/radio/headset/rebel_military
	uniform = /obj/item/clothing/under/rebels/green
	shoes = /obj/item/clothing/shoes/rebels
	suit = /obj/item/clothing/suit/space/hardsuit/rebel/commando
	gloves = /obj/item/clothing/gloves/color/black/hos
	head = /obj/item/clothing/head/helmet/rebels/visor
//	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
//	suit_store = /obj/item/gun/energy/e_gun
	r_pocket = /obj/item/assembly/flash/handheld
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/card/id/departmental_budget/sec=1, /obj/item/clothing/suit/armor/blastarmorblack=1)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/security

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/energy/e_gun/hos, /obj/item/stamp/hos)*/

/datum/outfit/job/mercenary/hardsuit
	name = "Mercenary (Hardsuit)"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/rebel/commando
	suit_store = /obj/item/tank/internals/oxygen
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/gun/energy/e_gun=1)

/datum/job/paylord
	title = "Paylord"
	flag = PAYLORD
	department_head = list("Leader")
	department_flag = MERCENARIES
	faction = "Mercenaries"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Leader"
	selection_color = "#d7b088"

	outfit = /datum/outfit/job/paylord

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_VAULT)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_VAULT)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CAR
	display_order = JOB_DISPLAY_ORDER_QM

/datum/outfit/job/paylord
	name = "Paylord"
	jobtype = /datum/job/paylord

/*	belt = /obj/item/pda/quartermaster
	ears = /obj/item/radio/headset/headset_cargo
	uniform =/obj/item/clothing/under/imperial/cargo
	shoes = /obj/item/clothing/shoes/imperial
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/clipboard
	backpack_contents = list(/obj/item/card/id/departmental_budget/car=1)

	chameleon_extras = /obj/item/stamp/paylord*/


/datum/job/overwatch
	title = "Overwatch"
	flag = CLERK
	department_head = list("Leader")
	department_flag = MERCENARIES
	faction = "Mercenaries"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Leader"
	selection_color = "#ebfdff"

	outfit = /datum/outfit/job/overwatch

	access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
			            ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
			            ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
			            ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
			            ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK)
	minimal_access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
			            ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
			            ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
			            ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
			            ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_CLERK


/datum/outfit/job/overwatch
	name = "Overwatch"
	jobtype = /datum/job/overwatch

/*	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	belt = /obj/item/pda/bar
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/armor/vest
	//backpack_contents = list(/obj/item/storage/box/beanbag=1,/obj/item/book/granter/action/drink_fling=1)
	shoes = /obj/item/clothing/shoes/laceup*/