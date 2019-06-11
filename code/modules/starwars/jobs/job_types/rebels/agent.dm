/datum/job/ragent
	title = "Agent"
	flag = RAGENT
	department_head = list("General")
	department_flag = REBELS
	faction = "Rebels"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Commander"
	selection_color = "#de6666"
//	req_admin_notify = 1
//	minimal_player_age = 14
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY

	outfit = /datum/outfit/job/ragent

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY,
			            ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_ALL_PERSONAL_LOCKERS,
			            ACCESS_RESEARCH, ACCESS_ENGINE, ACCESS_MINING, ACCESS_MEDICAL, ACCESS_CONSTRUCTION, ACCESS_MAILSORTING,
			            ACCESS_HEADS, ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY,
			            ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_ALL_PERSONAL_LOCKERS,
			            ACCESS_RESEARCH, ACCESS_ENGINE, ACCESS_MINING, ACCESS_MEDICAL, ACCESS_CONSTRUCTION, ACCESS_MAILSORTING,
			            ACCESS_HEADS, ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_RAGENT

/datum/outfit/job/ragent
	name = "Agent"
	jobtype = /datum/job/ragent

	//id = /obj/item/card/id/silver
	//belt = /obj/item/pda/heads/hos
	ears = /obj/item/radio/headset/rebels/agent
	uniform = /obj/item/clothing/under/rebels/grey
	shoes = /obj/item/clothing/shoes/imperial
	suit = /obj/item/clothing/suit/space/hardsuit/rebel/agent
	gloves = /obj/item/clothing/gloves/color/black/hos
	//head = /obj/item/clothing/head/helmet/imperial/cotg
	//glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	suit_store = /obj/item/gun/energy/e_gun
	r_pocket = /obj/item/assembly/flash/handheld
	l_pocket = /obj/item/restraints/handcuffs
	//backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/card/id/departmental_budget/sec=1, /obj/item/clothing/suit/armor/blastarmorblack=1)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/security

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/energy/e_gun/hos, /obj/item/stamp/hos)

/datum/outfit/job/ragent/hardsuit
	name = "Agent (Hardsuit)"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit =  /obj/item/clothing/suit/space/hardsuit/rebel/agent
	suit_store = /obj/item/tank/internals/oxygen
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/gun/energy/e_gun=1)