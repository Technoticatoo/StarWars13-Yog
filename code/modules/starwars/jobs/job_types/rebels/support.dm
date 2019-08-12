/datum/job/rsupport
	title = "Support"
	flag = RSUPPORT
	department_head = list("General")
	department_flag = REBELS
	faction = "Rebels"
	total_positions = 12
	spawn_positions = 12
	supervisors = "the Commander"
	selection_color = "#de6666"
//	req_admin_notify = 1
//	minimal_player_age = 14
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY

	outfit = /datum/outfit/job/rsupport

	access = list(ACCESS_REBELS_SUPPORT, ACCESS_REBELS_GENERAL, ACCESS_FACTION_REBELS)
	minimal_access = list(ACCESS_REBELS_SUPPORT, ACCESS_REBELS_GENERAL, ACCESS_FACTION_REBELS)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_RSUPPORT

/datum/outfit/job/rsupport
	name = "Support"
	jobtype = /datum/job/rsupport

	id = /obj/item/card/id/rebels
//	belt = /obj/item/pda/heads/hos
	belt = /obj/item/pda/janitor
	ears = /obj/item/radio/headset/rebel_support
	uniform = /obj/item/clothing/under/rebels/tan
	shoes = /obj/item/clothing/shoes/rebels
//	suit = /obj/item/clothing/suit/armor/hos/trenchcoat
//	gloves = /obj/item/clothing/gloves/color/black/hos
	head = /obj/item/clothing/head/helmet/rebels/tanhat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
//	suit_store = /obj/item/gun/energy/e_gun
	r_pocket = /obj/item/assembly/flash/handheld
//	l_pocket = /obj/item/restraints/handcuffs
//	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/card/id/departmental_budget/sec=1, /obj/item/clothing/suit/armor/blastarmorblack=1)
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

	backpack = /obj/item/storage/backpack/starwars/rebels
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/security

/*/datum/outfit/job/rsupport/hardsuit
	name = "Support (Hardsuit)"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/security/hos
	suit_store = /obj/item/tank/internals/oxygen
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/gun/energy/e_gun=1)*/