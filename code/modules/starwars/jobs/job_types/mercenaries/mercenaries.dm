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

	access = list( ACCESS_MERCS_COMMAND, ACCESS_MERCS_MILITARY, ACCESS_MERCS_MEDICAL, ACCESS_MERCS_SQUADRON, ACCESS_MERCS_SUPPORT, ACCESS_MERCS_GENERAL, ACCESS_FACTION_MERCS)
	minimal_access = list( ACCESS_MERCS_COMMAND, ACCESS_MERCS_MILITARY, ACCESS_MERCS_MEDICAL, ACCESS_MERCS_SQUADRON, ACCESS_MERCS_SUPPORT, ACCESS_MERCS_GENERAL, ACCESS_FACTION_MERCS)
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_LEADER

/datum/outfit/job/mleader
	name = "Leader"
	jobtype = /datum/job/mleader

	id = /obj/item/card/id/mercs
	belt = /obj/item/pda/mleader
	ears = /obj/item/radio/headset/heads/merc_leader
	uniform = /obj/item/clothing/under/mercs/scarlet
	shoes = /obj/item/clothing/shoes/mercs
	suit = /obj/item/clothing/suit/space/hardsuit/mercs/green
	gloves = /obj/item/clothing/gloves/color/black
	//head = /obj/item/clothing/head/helmet/imperial/warden
	r_pocket = /obj/item/assembly/flash/handheld
//	l_pocket = /obj/item/restraints/handcuffs
	suit_store = /obj/item/gun/energy/e_gun/advtaser
	backpack_contents = list(/obj/item/melee/baton/loaded=1)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/security

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = /obj/item/gun/ballistic/shotgun/automatic/combat/compact

/datum/job/mercenary
	title = "Mercenary"
	flag = MERCENARY
	department_head = list("Leader")
	department_flag = MERCENARIES
	faction = "Mercenaries"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Leader"
	selection_color = "#de6666"
//	req_admin_notify = 1
//	minimal_player_age = 14
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY

	outfit = /datum/outfit/job/mercenary

	access = list( ACCESS_MERCS_MILITARY, ACCESS_MERCS_MEDICAL, ACCESS_MERCS_SQUADRON, ACCESS_MERCS_SUPPORT, ACCESS_MERCS_GENERAL, ACCESS_FACTION_MERCS)
	minimal_access = list( ACCESS_MERCS_MILITARY, ACCESS_MERCS_MEDICAL, ACCESS_MERCS_SQUADRON, ACCESS_MERCS_SUPPORT, ACCESS_MERCS_GENERAL, ACCESS_FACTION_MERCS)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_MERCENARY

/datum/outfit/job/mercenary
	name = "Mercenary"
	jobtype = /datum/job/mercenary


	id = /obj/item/card/id/mercs
//	belt = /obj/item/pda/heads/hos
	ears = /obj/item/radio/headset/heads/merc_merc
	uniform = /obj/item/clothing/under/mercs/brown
	shoes = /obj/item/clothing/shoes/rebels
	suit = /obj/item/clothing/suit/space/hardsuit/mercs
	gloves = /obj/item/clothing/gloves/color/black/hos
//	head = /obj/item/clothing/head/helmet/rebels/visor
//	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
//	suit_store = /obj/item/gun/energy/e_gun
	r_pocket = /obj/item/assembly/flash/handheld
//	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/clothing/suit/armor/blastarmorblack=1)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/security

	//implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/energy/e_gun/hos, /obj/item/stamp/hos)

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

	access = list( ACCESS_MERCS_COMMAND, ACCESS_MERCS_MEDICAL, ACCESS_MERCS_SUPPORT, ACCESS_MERCS_GENERAL, ACCESS_FACTION_MERCS)
	minimal_access = list( ACCESS_MERCS_COMMAND,ACCESS_MERCS_MEDICAL, ACCESS_MERCS_SUPPORT, ACCESS_MERCS_GENERAL, ACCESS_FACTION_MERCS)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CAR
	display_order = JOB_DISPLAY_ORDER_QM

/datum/outfit/job/paylord
	name = "Paylord"
	jobtype = /datum/job/paylord

	id = /obj/item/card/id/mercs
	belt = /obj/item/pda/mpaylord
	ears = /obj/item/radio/headset/heads/merc_merc
	uniform = /obj/item/clothing/under/mercs/scarlet
	shoes = /obj/item/clothing/shoes/mercs
//	suit = /obj/item/clothing/suit/space/hardsuit/mercs/green
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/mercs
	r_pocket = /obj/item/assembly/flash/handheld
//	l_pocket = /obj/item/restraints/handcuffs
//	suit_store = /obj/item/gun/energy/e_gun/advtaser
	backpack_contents = list(/obj/item/clothing/suit/armor/mercs/blastarmor=1)

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

	access = list( ACCESS_MERCS_MEDICAL, ACCESS_MERCS_SUPPORT, ACCESS_MERCS_GENERAL, ACCESS_FACTION_MERCS)
	minimal_access = list( ACCESS_MERCS_MEDICAL, ACCESS_MERCS_SUPPORT, ACCESS_MERCS_GENERAL, ACCESS_FACTION_MERCS)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV
	display_order = JOB_DISPLAY_ORDER_CLERK


/datum/outfit/job/overwatch
	name = "Overwatch"
	jobtype = /datum/job/overwatch

	id = /obj/item/card/id/mercs
//	belt = /obj/item/pda/mpaylord
	ears = /obj/item/radio/headset/merc_support
	uniform = /obj/item/clothing/under/mercs
	shoes = /obj/item/clothing/shoes/mercs
//	suit = /obj/item/clothing/suit/space/hardsuit/mercs/green
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/mercs
	r_pocket = /obj/item/assembly/flash/handheld
//	l_pocket = /obj/item/restraints/handcuffs
//	suit_store = /obj/item/gun/energy/e_gun/advtaser
	backpack_contents = list(/obj/item/clothing/suit/armor/mercs/blastarmor=1)
