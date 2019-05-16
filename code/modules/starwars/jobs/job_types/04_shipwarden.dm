/datum/job/shipwarden
	title = "Warden"
	flag = SHIPWARDEN
	department_head = list("Imperial Army")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Imperial High Command"
	selection_color = "#dc5a5a"
	req_admin_notify = 1
	minimal_player_age = 30
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/shipwarden

	access = list()
	minimal_access = list() //SEE /DATUM/JOB/WARDEN/GET_ACCESS()
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SEC
	display_order = JOB_DISPLAY_ORDER_SHIPWARDEN

/datum/job/shipwarden/get_access()
	return get_all_accesses()

/datum/outfit/job/shipwarden
	name = "Warden"
	jobtype = /datum/job/shipwarden

	belt = /obj/item/pda/shipwarden
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

	chameleon_extras = /obj/item/gun/ballistic/shotgun/automatic/combat/compact
