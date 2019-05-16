/datum/job/prisoner
	title = "Prisoner"
	flag = PRISONER
	department_head = list("Master Sergeant")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Master Sergeant"
	selection_color = "#ff7e16"

	outfit = /datum/outfit/job/prisoner

	access = list(ACCESS_LIBRARY)
	minimal_access = list(ACCESS_LIBRARY, ACCESS_CONSTRUCTION,ACCESS_MINING_STATION)
	display_order = JOB_DISPLAY_ORDER_PRISONER


/datum/outfit/job/prisoner
	name = "Prisoner"
	jobtype = /datum/job/prisoner

	//belt = /obj/item/pda/curator
	uniform = /obj/item/clothing/under/rank/prisoner
	shoes = /obj/item/clothing/shoes/sneakers/orange
	head = /obj/item/clothing/head/soft/orange
	//l_hand = /obj/item/storage/bag/books
	//r_pocket = /obj/item/key/displaycase
	//l_pocket = /obj/item/laser_pointer
	//accessory = /obj/item/clothing/accessory/pocketprotector/full
	/*backpack_contents = list(
		/obj/item/melee/curator_whip = 1,
		/obj/item/soapstone = 1,
		/obj/item/barcodescanner = 1
	)*/


/datum/outfit/job/prisoner/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return