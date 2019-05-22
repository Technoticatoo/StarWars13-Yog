/datum/species/droids
	species_traits = list(NOBLOOD,MUTCOLORS,NOEYESPRITES,NO_UNDERWEAR)
	inherent_traits = list(TRAIT_VIRUSIMMUNE,TRAIT_NODISMEMBER,TRAIT_NOLIMBDISABLE,TRAIT_NOHUNGER,TRAIT_NOBREATH)
	inherent_biotypes = list(MOB_ROBOTIC, MOB_HUMANOID)
	meat = null
	no_equip = list(SLOT_BACK, SLOT_WEAR_MASK, SLOT_WEAR_SUIT, SLOT_GLOVES, SLOT_SHOES, SLOT_W_UNIFORM, SLOT_S_STORE)

/datum/species/droids/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H)
	H.reagents.remove_reagent(chem.id, chem.volume) //yogs start - synths don't process chems
	return TRUE

/datum/species/droids/pdroid
	//Droids
	name = "Protocol Droid"
	id = "pdroid"
	damage_overlay_type = "synth"
	ignored_by = list(/mob/living/simple_animal/hostile/faithless)
	default_color = "FFFFFF"
	default_features = list("mcolor" = "FFF", "wings" = "None")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	no_equip = list(SLOT_WEAR_MASK, SLOT_WEAR_SUIT, SLOT_GLOVES, SLOT_SHOES, SLOT_W_UNIFORM, SLOT_S_STORE)

/datum/species/droids/pdroid/qualifies_for_rank(rank, list/features)
	return TRUE	//Droids are always allowed in all roles

/datum/species/droids/adroid
	//Droids
	name = "Astromech Droid"
	id = "adroid"
	damage_overlay_type = ""
	ignored_by = list(/mob/living/simple_animal/hostile/faithless)
	default_color = "FFFFFF"
	default_features = list("mcolor" = "FFF", "wings" = "None")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT


/datum/species/droids/adroid/qualifies_for_rank(rank, list/features)
	return TRUE	//Droids are always allowed in all roles
