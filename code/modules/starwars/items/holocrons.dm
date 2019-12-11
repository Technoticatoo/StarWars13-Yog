/obj/item/starwars/holocron
	name = "A holocron"
	desc = "A holocron containing secrets of the force"
	//icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	lefthand_file = 'icons/starwars/obj/holocrons.dmi'
	righthand_file = 'icons/starwars/obj/holocrons.dmi'
	icon = 'icons/starwars/obj/holocrons.dmi'
	icon_state = "jedi_holocron"
	item_state = "jedi_holocron"
	var/mutation

/*/obj/item/starwars/holocron/Initialize()
	. = ..()
	if(list_reagents) //syringe starts in inject mode if its already got something inside
		mode = SYRINGE_INJECT
		update_icon()*/

/obj/item/starwars/holocron/jedi/basic
	name = "A holocron"
	desc = "A holocron containing secrets of the force"
	//icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	icon_state = "jedi_holocron"

/obj/item/starwars/holocron/sith/basic
	name = "A holocron"
	desc = "A holocron containing secrets of the dark side"
	//icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	icon_state = "sith_holocron"
	item_state = "sith_holocron"

/obj/item/starwars/holocron/jedi/basic/attack_self(mob/living/carbon/human/user = usr)
	user.taught = user.taught + 1
	user.visible_message("<span class='warning'>[user] is walking the path of the force!</span>", "<span class='notice'>You have taken another step to a deeper understanding of the force!</span>")
	if((user.dna.get_mutation(FORCE_SENSITIVE_0) && user.taught >= 6) && !user.dna.get_mutation(FORCE_SENSITIVE_1))
		user = user.dna.add_mutation(FORCE_SENSITIVE_1, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned secrets of the force!</span>", "<span class='notice'>You have learned secrets of the force!</span>")
/*	if(!user.dna.get_mutation(FORCE_SENSITIVE_0) &&  user.taught == 4)
		user = user.dna.add_mutation(FORCE_SENSITIVE_0, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has begun their path to the force!</span>", "<span class='notice'>You have taken the first step on the path to the force!</span>")*/

/obj/item/starwars/holocron/sith/basic/attack_self(mob/living/carbon/human/user = usr)
	user.taught = user.taught + 1
	user.visible_message("<span class='warning'>[user] is walking the path of the dark side!</span>", "<span class='notice'>You have taken another step to a deeper understanding of the dark side!</span>")
	if((user.dna.get_mutation(FORCE_SENSITIVE_SITH_0) && user.taught >= 4) && !user.dna.get_mutation(FORCE_SENSITIVE_SITH_1))
		user = user.dna.add_mutation(FORCE_SENSITIVE_SITH_1, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned secrets of the dark side!</span>", "<span class='notice'>You have learned secrets of the dark side!</span>")
	/*if(!user.dna.get_mutation(FORCE_SENSITIVE_SITH_0) && user.taught == 3)
		user = user.dna.add_mutation(FORCE_SENSITIVE_SITH_0, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has joined the dark side!</span>", "<span class='notice'>You feel the dark side of the force taking you into its cloying embrace!</span>")*/

/obj/item/starwars/holocron/jedi/master
	name = "A master holocron"
	desc = "A holocron containing deep secrets of the force"
	//icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	icon_state = "masterjedi_holocron"
	item_state = "masterjedi_holocron"

/obj/item/starwars/holocron/sith/master
	name = "A master holocron"
	desc = "A holocron containing deep secrets of the dark side"
	//icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	icon_state = "mastersith_holocron"
	item_state = "mastersith_holocron"

/obj/item/starwars/holocron/jedi/master/attack_self(mob/living/carbon/human/user = usr)
	user.taught = user.taught + 1
	user.visible_message("<span class='warning'>[user] is walking the path of the force!</span>", "<span class='notice'>You have taken another step to a deeper understanding of the force!</span>")
	if((user.dna.get_mutation(FORCE_SENSITIVE_1) && user.taught >= 8) && !user.dna.get_mutation(FORCE_SENSITIVE_2))
		user = user.dna.add_mutation(FORCE_SENSITIVE_2, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned deep secrets of the force!</span>", "<span class='notice'>You have learned deep secrets of the force!</span>")

/obj/item/starwars/holocron/jedi/master/attack_self(mob/living/carbon/human/user = usr)
	user.taught = user.taught + 1
	if((user.dna.get_mutation(FORCE_SENSITIVE_SITH_1) && user.taught >= 8) && !user.dna.get_mutation(FORCE_SENSITIVE_SITH_2))
		user = user.dna.add_mutation(FORCE_SENSITIVE_SITH_2, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned deep secrets of the dark side!</span>", "<span class='notice'>You have learned deep secrets of the dark side!</span>")


/obj/item/starwars/holocron/jedi/grand
	name = "A grand holocron"
	desc = "A holocron containing deepest secrets of the force"
	//icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	icon_state = "grandjedi_holocron"
	item_state = "grandjedi_holocron"

/obj/item/starwars/holocron/sith/grand
	name = "A grand holocron"
	desc = "A holocron containing deepest secrets of the dark side"
	//icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	icon_state = "grandsith_holocron"
	item_state = "grandsith_holocron"


/obj/item/starwars/holocron/jedi/grand/attack_self(mob/living/carbon/human/user = usr)
	user.taught = user.taught + 1
	if((user.dna.get_mutation(FORCE_SENSITIVE_2) && user.taught >= 12) && !user.dna.get_mutation(FORCE_SENSITIVE_3))
		user = user.dna.add_mutation(FORCE_SENSITIVE_3, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned the deepest secrets of the force!</span>", "<span class='notice'>You have learned the deepest secrets of the force!</span>")

/obj/item/starwars/holocron/sith/grand/attack_self(mob/living/carbon/human/user = usr)
	user.taught = user.taught + 1
	if((user.dna.get_mutation(FORCE_SENSITIVE_SITH_2) && user.taught >= 10) && user.dna.get_mutation(FORCE_SENSITIVE_SITH_3))
		user = user.dna.add_mutation(FORCE_SENSITIVE_SITH_3, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned the deepest secrets of the dark side!</span>", "<span class='notice'>You have learned the deepest secrets of the dark side!</span>")