/datum/species/wookie
	//Wookies
	name = "Wookiee"
	id = "wookie"
	ignored_by = list(/mob/living/simple_animal/hostile/faithless)
	species_traits = list(MUTCOLORS,EYECOLOR)
	default_features = list("mcolor" = "853", "wings" = "None")


/datum/species/wookie/qualifies_for_rank(rank, list/features)
	return TRUE	//Wookies are always allowed in all roles
