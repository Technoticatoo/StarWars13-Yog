#define HEART_RESPAWN_THRESHHOLD 40
#define HEART_SPECIAL_SHADOWIFY 2

/datum/species/rodian
	//rodian
	name = "Rodian"
	id = "rodian"
	ignored_by = list(/mob/living/simple_animal/hostile/faithless)
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/shadow
	species_traits = list(MUTCOLORS,EYECOLOR)
	default_features = list("mcolor" = "853", "wings" = "None")


/datum/species/rodian/qualifies_for_rank(rank, list/features)
	return TRUE	//Rodians are always allowed in all roles
