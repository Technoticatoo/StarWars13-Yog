/datum/outfit/jedi
	name= "Jedi"
	uniform = /obj/item/clothing/under/rebel/jedi
	shoes = /obj/item/clothing/shoes/rebel/jedi
	ears = /obj/item/radio/headset/heads/rebel_jedi
	head = /obj/item/clothing/head/jedi
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/melee/transforming/energy/sword/saber/blue=1, /obj/item/storage/box=1)

/*/datum/outfit/jedi/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/spellbook/S = locate() in H.held_items
	if(S)
		S.owner = H

/datum/outfit/jedi/apprentice
	name = "Jedi Apprentice"
	r_hand = null
	l_hand = null
	r_pocket = /obj/item/teleportation_scroll/apprentice

/datum/outfit/jedi/red
	name = "Red Jedi"

	suit = /obj/item/clothing/suit/wizrobe/red
	head = /obj/item/clothing/head/jedi/red

/datum/outfit/jedi/weeb
	name = "Marisa Jedi"

	suit = /obj/item/clothing/suit/wizrobe/marisa
	shoes = /obj/item/clothing/shoes/sandal/marisa
	head = /obj/item/clothing/head/jedi/marisa


/datum/outfit/jedi/academy
	name = "Academy Jedi"
	r_pocket = null
	r_hand = null
	suit = /obj/item/clothing/suit/wizrobe/red
	head = /obj/item/clothing/head/jedi/red
	backpack_contents = list(/obj/item/storage/box/survival = 1)
*/


/datum/outfit/emperor
	//name = "The Emperor"
	name= "Emperor"
	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/imperial/sith
	belt = /obj/item/pda/sith
	suit = /obj/item/clothing/suit/wizrobe
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/heads/sith/alt
	gloves = /obj/item/clothing/gloves/color/sith
	head = /obj/item/clothing/head/sithat
	/*head = /obj/item/clothing/head/jedi*/
	//r_pocket = /obj/item/teleportation_scroll
	/*r_hand = /obj/item/spellbook
	l_hand = /obj/item/staff*/
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/melee/transforming/energy/sword/saber/red=1, /obj/item/card/id/departmental_budget/civ=1)
	implants = list(/obj/item/implant/mindshield)
