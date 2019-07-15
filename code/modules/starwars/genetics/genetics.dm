//Force Sensitive adds
/datum/mutation/human/force_sensitive
	name = "Force Sensitive"
	desc = "The force is strong in you."
	quality = POSITIVE
	difficulty = 18
	text_gain_indication = "<span class='notice'>You feel the force all around you!</span>"
	limb_req = BODY_ZONE_HEAD
	instability = 30

/datum/mutation/human/force_sensitive/New(class_ = MUT_OTHER, timer, datum/mutation/human/copymut)
	..()
	if(!(type in visual_indicators))
		visual_indicators[type] = list(mutable_appearance('icons/effects/genetics.dmi', "telekinesishead", -MUTATIONS_LAYER))

/datum/mutation/human/force_sensitive/get_visual_indicator()
	return visual_indicators[type][1]

/*/datum/mutation/human/force_sensitive/on_ranged_attack(atom/target)
	target.attack_tk(owner)*/

/datum/mutation/human/force_sensitive/level_0/on_acquiring(mob/living/carbon/human/H)
	. = ..()

/datum/mutation/human/force_sensitive/level_1/on_acquiring(mob/living/carbon/human/H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/forceheal(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcepull(null))
	//H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/forceprotect(null))
	. = ..()

/datum/mutation/human/force_sensitive/level_2/on_acquiring(mob/living/carbon/human/H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcewall(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/forcejump(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcehealothers(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/telepathy(null))
	. = ..()

/datum/mutation/human/force_sensitive/level_3/on_acquiring(mob/living/carbon/human/H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceslow(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceth(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/saber_return(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/force_control(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceteach(null))
	. = ..()


/datum/mutation/human/force_sensitive/sith_0/on_acquiring(mob/living/carbon/human/H)
	. = ..()

/datum/mutation/human/force_sensitive/sith_1/on_acquiring(mob/living/carbon/human/H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceslow(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceth(null))
	. = ..()

/datum/mutation/human/force_sensitive/sith_2/on_acquiring(mob/living/carbon/human/H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/forcejump(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcepull(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/telepathy(null))
	. = ..()

/datum/mutation/human/force_sensitive/sith_3/on_acquiring(mob/living/carbon/human/H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/saber_return(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/force_control(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceteach(null))
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceck(null))
	. = ..()

/datum/mutation/human/force_sensitive/sith_4/on_acquiring(mob/living/carbon/human/H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forceln(null))
	. = ..()