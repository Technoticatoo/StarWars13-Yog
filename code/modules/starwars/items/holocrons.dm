/obj/item/starwars/holocron
	name = "A holocron"
	desc = "A holocron containing secrets of the force"
	//icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	lefthand_file = 'icons/starwars/obj/holocrons.dmi'
	righthand_file = 'icons/starwars/obj/holocrons.dmi'
	icon_state = "jedi_holocron"
	var/mutation

/*/obj/item/starwars/holocron/Initialize()
	. = ..()
	if(list_reagents) //syringe starts in inject mode if its already got something inside
		mode = SYRINGE_INJECT
		update_icon()*/

/obj/item/starwars/holocron/jedi/attack_self(mob/living/carbon/human/user = usr)
	user.taught = user.taught + 1
	user.visible_message("<span class='warning'>[user] is walking the path of the force!</span>", "<span class='notice'>You have taken another step to a deeper understanding of the force!</span>")
	if(user.dna.get_mutation(FORCE_SENSITIVE_2) && user.taught == 12)
		user = user.dna.add_mutation(FORCE_SENSITIVE_3, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned the deepest secrets of the force!</span>", "<span class='notice'>You have learned the deepest secrets of the force!</span>")
	if(user.dna.get_mutation(FORCE_SENSITIVE_1) && user.taught == 8)
		user = user.dna.add_mutation(FORCE_SENSITIVE_2, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned deep secrets of the force!</span>", "<span class='notice'>You have learned deep secrets of the force!</span>")
	if(user.dna.get_mutation(FORCE_SENSITIVE_0) && user.taught == 6)
		user = user.dna.add_mutation(FORCE_SENSITIVE_1, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned secrets of the force!</span>", "<span class='notice'>You have learned secrets of the force!</span>")
	if(!user.dna.get_mutation(FORCE_SENSITIVE_0) &&  user.taught == 4)
		user = user.dna.add_mutation(FORCE_SENSITIVE_0, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has begun their path to the force!</span>", "<span class='notice'>You have taken the first step on the path to the force!</span>")

/obj/item/starwars/holocron/sith/attack_self(mob/living/carbon/human/user = usr)
	user.taught = user.taught + 1
	if(user.dna.get_mutation(FORCE_SENSITIVE_SITH_2) && user.taught == 10)
		user = user.dna.add_mutation(FORCE_SENSITIVE_SITH_3, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned the deepest secrets of the dark side!</span>", "<span class='notice'>You have learned the deepest secrets of the dark side!</span>")
	if(user.dna.get_mutation(FORCE_SENSITIVE_SITH_1) && user.taught == 8)
		user = user.dna.add_mutation(FORCE_SENSITIVE_SITH_2, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned deep secrets of the dark side!</span>", "<span class='notice'>You have learned deep secrets of the dark side!</span>")
	if(user.dna.get_mutation(FORCE_SENSITIVE_SITH_0) && user.taught == 6)
		user = user.dna.add_mutation(FORCE_SENSITIVE_SITH_1, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has learned secrets of the dark side!</span>", "<span class='notice'>You have learned secrets of the dark side!</span>")
	if(!user.dna.get_mutation(FORCE_SENSITIVE_SITH_0) && user.taught == 3)
		user = user.dna.add_mutation(FORCE_SENSITIVE_SITH_0, MUT_OTHER)
		user.taught = 0
		user.visible_message("<span class='warning'>[user] has joined the dark side!</span>", "<span class='notice'>You feel the dark side of the force taking you into its cloying embrace!</span>")