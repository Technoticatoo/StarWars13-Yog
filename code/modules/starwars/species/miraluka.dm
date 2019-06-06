/datum/species/miraluka
	//Twilek
	name = "Miraluka"
	id = "miraluka"
	ignored_by = list(/mob/living/simple_animal/hostile/faithless)
	//meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/shadow
	default_color = "FFFFFF"
	species_traits = list(NOEYESPRITES,LIPS,HAIR,FACEHAIR)
	default_features = list("mcolor" = "FFF", "wings" = "None")
	//inherent_traits = list(TRAIT_BLIND)
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW
	liked_food = JUNKFOOD | FRIED
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT


/datum/species/miraluka/qualifies_for_rank(rank, list/features)
	return TRUE	//Twilek are always allowed in all roles

/datum/species/miraluka/after_equip_job(datum/job/J, mob/living/carbon/human/H)
	H.dna.add_mutation(BLINDMUT)
//	H.dna.activate_mutation(BLINDMUT)
	H.add_client_colour(/datum/client_colour/monochrome)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/forcesight(null))
	//H.grant_language(/datum/language/twileki)