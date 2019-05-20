#define HEART_RESPAWN_THRESHHOLD 40
#define HEART_SPECIAL_SHADOWIFY 2

/datum/species/twilek
	//Twilek
	name = "Twilek"
	id = "twilek"
	ignored_by = list(/mob/living/simple_animal/hostile/faithless)
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/shadow
	species_traits = list(MUTCOLORS,EYECOLOR,FACEHAIR,LIPS)
	default_features = list("mcolor" = "853", "wings" = "None")


/datum/species/twilek/qualifies_for_rank(rank, list/features)
	return TRUE	//Twilek are always allowed in all roles
