/* Two-handed Weapons
 * Contains:
 * 		Twohanded
 *		Fireaxe
 *		Double-Bladed Energy Swords
 *		Spears
 *		CHAINSAWS
 *		Bone Axe and Spear
 */

/*##################################################################
##################### TWO HANDED WEAPONS BE HERE~ -Agouri :3 ########
####################################################################*/

//Rewrote TwoHanded weapons stuff and put it all here. Just copypasta fireaxe to make new ones ~Carn
//This rewrite means we don't have two variables for EVERY item which are used only by a few weapons.
//It also tidies stuff up elsewhere.




/*
 * Twohanded
 */
/obj/item/twohanded
	var/wielded = 0
	var/force_unwielded = 0
	var/force_wielded = 0
	var/wieldsound = null
	var/unwieldsound = null

/obj/item/twohanded/proc/unwield(mob/living/carbon/user, show_message = TRUE)
	if(!wielded || !user)
		return
	wielded = 0
	if(force_unwielded)
		force = force_unwielded
	var/sf = findtext(name," (Wielded)")
	if(sf)
		name = copytext(name,1,sf)
	else //something wrong
		name = "[initial(name)]"
	update_icon()
	if(user.get_item_by_slot(SLOT_BACK) == src)
		user.update_inv_back()
	else
		user.update_inv_hands()
	if(show_message)
		if(iscyborg(user))
			to_chat(user, "<span class='notice'>You free up your module.</span>")
		else
			to_chat(user, "<span class='notice'>You are now carrying [src] with one hand.</span>")
	if(unwieldsound)
		playsound(loc, unwieldsound, 50, 1)
	var/obj/item/twohanded/offhand/O = user.get_inactive_held_item()
	if(O && istype(O))
		O.unwield()
	return

/obj/item/twohanded/proc/wield(mob/living/carbon/user)
	if(wielded)
		return
	if(ismonkey(user))
		to_chat(user, "<span class='warning'>It's too heavy for you to wield fully.</span>")
		return
	if(user.get_inactive_held_item())
		to_chat(user, "<span class='warning'>You need your other hand to be empty!</span>")
		return
	if(user.get_num_arms() < 2)
		to_chat(user, "<span class='warning'>You don't have enough intact hands.</span>")
		return
	wielded = 1
	if(force_wielded)
		force = force_wielded
	name = "[name] (Wielded)"
	update_icon()
	if(iscyborg(user))
		to_chat(user, "<span class='notice'>You dedicate your module to [src].</span>")
	else
		to_chat(user, "<span class='notice'>You grab [src] with both hands.</span>")
	if (wieldsound)
		playsound(loc, wieldsound, 50, 1)
	var/obj/item/twohanded/offhand/O = new(user) ////Let's reserve his other hand~
	O.name = "[name] - offhand"
	O.desc = "Your second grip on [src]."
	O.wielded = TRUE
	user.put_in_inactive_hand(O)
	return

/obj/item/twohanded/dropped(mob/user)
	. = ..()
	//handles unwielding a twohanded weapon when dropped as well as clearing up the offhand
	if(!wielded)
		return
	unwield(user)

/obj/item/twohanded/update_icon()
	return

/obj/item/twohanded/attack_self(mob/user)
	. = ..()
	if(wielded) //Trying to unwield it
		unwield(user)
	else //Trying to wield it
		wield(user)

/obj/item/twohanded/equip_to_best_slot(mob/M)
	if(..())
		if(istype(src, /obj/item/twohanded/required))
			return // unwield forces twohanded-required items to be dropped.
		unwield(M)
		return

/obj/item/twohanded/equipped(mob/user, slot)
	..()
	if(!user.is_holding(src) && wielded && !istype(src, /obj/item/twohanded/required))
		unwield(user)

///////////OFFHAND///////////////
/obj/item/twohanded/offhand
	name = "offhand"
	icon_state = "offhand"
	w_class = WEIGHT_CLASS_HUGE
	item_flags = ABSTRACT
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/twohanded/offhand/Destroy()
	wielded = FALSE
	return ..()

/obj/item/twohanded/offhand/dropped(mob/living/user, show_message = TRUE) //Only utilized by dismemberment since you can't normally switch to the offhand to drop it.
	var/obj/I = user.get_active_held_item()
	if(I && istype(I, /obj/item/twohanded))
		var/obj/item/twohanded/thw = I
		thw.unwield(user, show_message)
		if(istype(thw, /obj/item/twohanded/required))
			user.dropItemToGround(thw)
	if(!QDELETED(src))
		qdel(src)

/obj/item/twohanded/offhand/unwield()
	if(wielded)//Only delete if we're wielded
		wielded = FALSE
		qdel(src)

/obj/item/twohanded/offhand/wield()
	if(wielded)//Only delete if we're wielded
		wielded = FALSE
		qdel(src)

/obj/item/twohanded/offhand/attack_self(mob/living/carbon/user)		//You should never be able to do this in standard use of two handed items. This is a backup for lingering offhands.
	var/obj/item/twohanded/O = user.get_inactive_held_item()
	if (istype(O) && !istype(O, /obj/item/twohanded/offhand/))		//If you have a proper item in your other hand that the offhand is for, do nothing. This should never happen.
		return
	if (QDELETED(src))
		return
	qdel(src)																//If it's another offhand, or literally anything else, qdel. If I knew how to add logging messages I'd put one here.

///////////Two hand required objects///////////////
//This is for objects that require two hands to even pick up
/obj/item/twohanded/required
	w_class = WEIGHT_CLASS_HUGE

/obj/item/twohanded/required/attack_self()
	return

/obj/item/twohanded/required/mob_can_equip(mob/M, mob/equipper, slot, disable_warning = 0)
	if(wielded && !slot_flags)
		if(!disable_warning)
			to_chat(M, "<span class='warning'>[src] is too cumbersome to carry with anything but your hands!</span>")
		return 0
	return ..()

/obj/item/twohanded/required/attack_hand(mob/user)//Can't even pick it up without both hands empty
	var/obj/item/twohanded/required/H = user.get_inactive_held_item()
	if(get_dist(src,user) > 1)
		return
	if(H != null)
		to_chat(user, "<span class='notice'>[src] is too cumbersome to carry in one hand!</span>")
		return
	if(loc != user)
		wield(user)
	. = ..()

/obj/item/twohanded/required/equipped(mob/user, slot)
	..()
	var/slotbit = slotdefine2slotbit(slot)
	if(slot_flags & slotbit)
		var/datum/O = user.is_holding_item_of_type(/obj/item/twohanded/offhand)
		if(!O || QDELETED(O))
			return
		qdel(O)
		return
	if(slot == SLOT_HANDS)
		wield(user)
	else
		unwield(user)

/obj/item/twohanded/required/dropped(mob/living/user, show_message = TRUE)
	unwield(user, show_message)
	..()

/obj/item/twohanded/required/wield(mob/living/carbon/user)
	..()
	if(!wielded)
		user.dropItemToGround(src)

/obj/item/twohanded/required/unwield(mob/living/carbon/user, show_message = TRUE)
	if(!wielded)
		return
	if(show_message)
		to_chat(user, "<span class='notice'>You drop [src].</span>")
	..(user, FALSE)

/*
 * Fireaxe
 */
/obj/item/twohanded/fireaxe  // DEM AXES MAN, marker -Agouri
	icon_state = "fireaxe0"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "fire axe"
	desc = "Truly, the weapon of a madman. Who would think to fight fire with an axe?"
	force = 5
	throwforce = 15
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	force_unwielded = 5
	force_wielded = 24
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = IS_SHARP
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 30)
	resistance_flags = FIRE_PROOF

/obj/item/twohanded/fireaxe/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 80, 0 , hitsound) //axes are not known for being precision butchering tools

/obj/item/twohanded/fireaxe/update_icon()  //Currently only here to fuck with the on-mob icons.
	icon_state = "fireaxe[wielded]"
	return

/obj/item/twohanded/fireaxe/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] axes [user.p_them()]self from head to toe! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS)

/obj/item/twohanded/fireaxe/afterattack(atom/A, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(wielded) //destroys windows and grilles in one hit
		if(istype(A, /obj/structure/window))
			var/obj/structure/window/W = A
			W.take_damage(200, BRUTE, "melee", 0)
		else if(istype(A, /obj/structure/grille))
			var/obj/structure/grille/G = A
			G.take_damage(40, BRUTE, "melee", 0)


//spears
/obj/item/twohanded/spear
	icon_state = "spearglass0"
	lefthand_file = 'icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "spear"
	desc = "A haphazardly-constructed yet still deadly weapon of ancient design."
	force = 10
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	force_unwielded = 10
	force_wielded = 18
	throwforce = 20
	throw_speed = 4
	embedding = list("embedded_impact_pain_multiplier" = 3)
	armour_penetration = 10
	materials = list(MAT_METAL=1150, MAT_GLASS=2075)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	sharpness = IS_SHARP
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 30)
	var/war_cry = "AAAAARGH!!!"
	var/icon_prefix = "spearglass"

/obj/item/twohanded/spear/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 70) //decent in a pinch, but pretty bad.

/obj/item/twohanded/spear/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins to sword-swallow \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS

/obj/item/twohanded/spear/Initialize()
	. = ..()
	AddComponent(/datum/component/jousting)

/obj/item/twohanded/spear/update_icon()
	icon_state = "[icon_prefix][wielded]"

/obj/item/twohanded/spear/CheckParts(list/parts_list)
	var/obj/item/shard/tip = locate() in parts_list
	if (istype(tip, /obj/item/shard/plasma))
		force_wielded = 19
		force_unwielded = 11
		throwforce = 21
		righthand_file = 'yogstation/icons/mob/inhands/weapons/polearms_righthand.dmi' //yogs
		alternate_worn_icon = 'yogstation/icons/mob/back.dmi' //yogs
		icon_prefix = "spearplasma"
	update_icon()
	qdel(tip)
	var/obj/item/grenade/G = locate() in parts_list
	if(G)
		var/obj/item/twohanded/spear/explosive/lance = new /obj/item/twohanded/spear/explosive(src.loc, G)
		lance.force_wielded = force_wielded
		lance.force_unwielded = force_unwielded
		lance.throwforce = throwforce
		lance.icon_prefix = icon_prefix
		parts_list -= G
		qdel(src)
	..()


/obj/item/twohanded/spear/explosive
	name = "explosive lance"
	var/obj/item/grenade/explosive = null

/obj/item/twohanded/spear/explosive/Initialize(mapload, obj/item/grenade/G)
	. = ..()
	if (!G)
		G = new /obj/item/grenade/iedcasing() //For admin-spawned explosive lances
	G.forceMove(src)
	explosive = G
	desc = "A makeshift spear with [G] attached to it"
	update_icon()

/obj/item/twohanded/spear/explosive/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins to sword-swallow \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	user.say("[war_cry]", forced="spear warcry")
	explosive.forceMove(user)
	explosive.prime()
	user.gib()
	qdel(src)
	return BRUTELOSS

/obj/item/twohanded/spear/explosive/examine(mob/user)
	..()
	to_chat(user, "<span class='notice'>Alt-click to set your war cry.</span>")

/obj/item/twohanded/spear/explosive/update_icon()
	icon_state = "spearbomb[wielded]"

/obj/item/twohanded/spear/explosive/AltClick(mob/user)
	if(user.canUseTopic(src, BE_CLOSE))
		..()
		if(istype(user) && loc == user)
			var/input = stripped_input(user,"What do you want your war cry to be? You will shout it when you hit someone in melee.", ,"", 50)
			if(input)
				src.war_cry = input

/obj/item/twohanded/spear/explosive/afterattack(atom/movable/AM, mob/user, proximity)
	. = ..()
	if(wielded)
		user.say("[war_cry]", forced="spear warcry")
		explosive.forceMove(AM)
		explosive.prime()
		qdel(src)

// CHAINSAW
/obj/item/twohanded/required/chainsaw
	name = "chainsaw"
	desc = "A versatile power tool. Useful for limbing trees and delimbing humans."
	icon_state = "chainsaw_off"
	lefthand_file = 'icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	flags_1 = CONDUCT_1
	force = 13
	var/force_on = 24
	w_class = WEIGHT_CLASS_HUGE
	throwforce = 13
	throw_speed = 2
	throw_range = 4
	materials = list(MAT_METAL=13000)
	attack_verb = list("sawed", "torn", "cut", "chopped", "diced")
	hitsound = "swing_hit"
	sharpness = IS_SHARP
	actions_types = list(/datum/action/item_action/startchainsaw)
	var/on = FALSE

/obj/item/twohanded/required/chainsaw/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 30, 100, 0, 'sound/weapons/chainsawhit.ogg', TRUE)

/obj/item/twohanded/required/chainsaw/suicide_act(mob/living/carbon/user)
	if(on)
		user.visible_message("<span class='suicide'>[user] begins to tear [user.p_their()] head off with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		playsound(src, 'sound/weapons/chainsawhit.ogg', 100, 1)
		var/obj/item/bodypart/head/myhead = user.get_bodypart(BODY_ZONE_HEAD)
		if(myhead)
			myhead.dismember()
	else
		user.visible_message("<span class='suicide'>[user] smashes [src] into [user.p_their()] neck, destroying [user.p_their()] esophagus! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		playsound(src, 'sound/weapons/genhit1.ogg', 100, 1)
	return(BRUTELOSS)

/obj/item/twohanded/required/chainsaw/attack_self(mob/user)
	on = !on
	to_chat(user, "As you pull the starting cord dangling from [src], [on ? "it begins to whirr." : "the chain stops moving."]")
	force = on ? force_on : initial(force)
	throwforce = on ? force_on : initial(force)
	icon_state = "chainsaw_[on ? "on" : "off"]"
	GET_COMPONENT_FROM(butchering, /datum/component/butchering, src)
	butchering.butchering_enabled = on

	if(on)
		hitsound = 'sound/weapons/chainsawhit.ogg'
	else
		hitsound = "swing_hit"

	if(src == user.get_active_held_item()) //update inhands
		user.update_inv_hands()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/twohanded/required/chainsaw/get_dismemberment_chance()
	if(wielded)
		. = ..()

/obj/item/twohanded/required/chainsaw/doomslayer
	name = "THE GREAT COMMUNICATOR"
	desc = "<span class='warning'>VRRRRRRR!!!</span>"
	armour_penetration = 100
	force_on = 30

/obj/item/twohanded/required/chainsaw/doomslayer/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(attack_type == PROJECTILE_ATTACK)
		owner.visible_message("<span class='danger'>Ranged attacks just make [owner] angrier!</span>")
		playsound(src, pick('sound/weapons/bulletflyby.ogg', 'sound/weapons/bulletflyby2.ogg', 'sound/weapons/bulletflyby3.ogg'), 75, 1)
		return 1
	return 0

//GREY TIDE
/obj/item/twohanded/spear/grey_tide
	icon_state = "spearglass0"
	name = "\improper Grey Tide"
	desc = "Recovered from the aftermath of a revolt aboard Defense Outpost Theta Aegis, in which a seemingly endless tide of Assistants caused heavy casualities among Nanotrasen military forces."
	force_unwielded = 15
	force_wielded = 25
	throwforce = 20
	throw_speed = 4
	attack_verb = list("gored")

/obj/item/twohanded/spear/grey_tide/afterattack(atom/movable/AM, mob/living/user, proximity)
	. = ..()
	if(!proximity)
		return
	user.faction |= "greytide([REF(user)])"
	if(isliving(AM))
		var/mob/living/L = AM
		if(istype (L, /mob/living/simple_animal/hostile/illusion))
			return
		if(!L.stat && prob(50))
			var/mob/living/simple_animal/hostile/illusion/M = new(user.loc)
			M.faction = user.faction.Copy()
			M.Copy_Parent(user, 100, user.health/2.5, 12, 30)
			M.GiveTarget(L)

/obj/item/twohanded/pitchfork
	icon_state = "pitchfork0"
	lefthand_file = 'icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "pitchfork"
	desc = "A simple tool used for moving hay."
	force = 7
	throwforce = 15
	w_class = WEIGHT_CLASS_BULKY
	force_unwielded = 7
	force_wielded = 15
	attack_verb = list("attacked", "impaled", "pierced")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = IS_SHARP
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 30)
	resistance_flags = FIRE_PROOF

/obj/item/twohanded/pitchfork/demonic
	name = "demonic pitchfork"
	desc = "A red pitchfork, it looks like the work of the devil."
	force = 19
	throwforce = 24
	force_unwielded = 19
	force_wielded = 25

/obj/item/twohanded/pitchfork/demonic/Initialize()
	. = ..()
	set_light(3,6,LIGHT_COLOR_RED)

/obj/item/twohanded/pitchfork/demonic/greater
	force = 24
	throwforce = 50
	force_unwielded = 24
	force_wielded = 34

/obj/item/twohanded/pitchfork/demonic/ascended
	force = 100
	throwforce = 100
	force_unwielded = 100
	force_wielded = 500000 // Kills you DEAD.

/obj/item/twohanded/pitchfork/update_icon()
	icon_state = "pitchfork[wielded]"

/obj/item/twohanded/pitchfork/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] impales [user.p_them()]self in [user.p_their()] abdomen with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS)

/obj/item/twohanded/pitchfork/demonic/pickup(mob/living/user)
	if(isliving(user) && user.mind && user.owns_soul() && !is_devil(user))
		var/mob/living/U = user
		U.visible_message("<span class='warning'>As [U] picks [src] up, [U]'s arms briefly catch fire.</span>", \
			"<span class='warning'>\"As you pick up [src] your arms ignite, reminding you of all your past sins.\"</span>")
		if(ishuman(U))
			var/mob/living/carbon/human/H = U
			H.apply_damage(rand(force/2, force), BURN, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
		else
			U.adjustFireLoss(rand(force/2,force))

/obj/item/twohanded/pitchfork/demonic/attack(mob/target, mob/living/carbon/human/user)
	if(user.mind && user.owns_soul() && !is_devil(user))
		to_chat(user, "<span class ='warning'>[src] burns in your hands.</span>")
		user.apply_damage(rand(force/2, force), BURN, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
	..()

/obj/item/twohanded/pitchfork/demonic/ascended/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(!proximity || !wielded)
		return
	if(iswallturf(target))
		var/turf/closed/wall/W = target
		user.visible_message("<span class='danger'>[user] blasts \the [target] with \the [src]!</span>")
		playsound(target, 'sound/magic/disintegrate.ogg', 100, 1)
		W.break_wall()
		W.ScrapeAway()
		return

//HF blade

/obj/item/twohanded/vibro_weapon
	icon_state = "hfrequency0"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	name = "vibro sword"
	desc = "A potent weapon capable of cutting through nearly anything. Wielding it in two hands will allow you to deflect gunfire."
	force_unwielded = 20
	force_wielded = 40
	armour_penetration = 100
	block_chance = 40
	throwforce = 20
	throw_speed = 4
	sharpness = IS_SHARP
	attack_verb = list("cut", "sliced", "diced")
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/item/twohanded/vibro_weapon/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 20, 105)

/obj/item/twohanded/vibro_weapon/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(wielded)
		final_block_chance *= 2
	if(wielded || attack_type != PROJECTILE_ATTACK)
		if(prob(final_block_chance))
			if(attack_type == PROJECTILE_ATTACK)
				owner.visible_message("<span class='danger'>[owner] deflects [attack_text] with [src]!</span>")
				playsound(src, pick('sound/weapons/bulletflyby.ogg', 'sound/weapons/bulletflyby2.ogg', 'sound/weapons/bulletflyby3.ogg'), 75, 1)
				return 1
			else
				owner.visible_message("<span class='danger'>[owner] parries [attack_text] with [src]!</span>")
				return 1
	return 0

/obj/item/twohanded/vibro_weapon/update_icon()
	icon_state = "hfrequency[wielded]"

/*
 * Bone Axe
 */
/obj/item/twohanded/fireaxe/boneaxe  // Blatant imitation of the fireaxe, but made out of bone.
	icon_state = "bone_axe0"
	name = "bone axe"
	desc = "A large, vicious axe crafted out of several sharpened bone plates and crudely tied together. Made of monsters, by killing monsters, for killing monsters."
	force_wielded = 23

/obj/item/twohanded/fireaxe/boneaxe/update_icon()
	icon_state = "bone_axe[wielded]"

/*
 * Bone Spear
 */
/obj/item/twohanded/bonespear	//Blatant imitation of spear, but made out of bone. Not valid for explosive modification.
	icon_state = "bone_spear0"
	lefthand_file = 'icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "bone spear"
	desc = "A haphazardly-constructed yet still deadly weapon. The pinnacle of modern technology."
	force = 11
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	force_unwielded = 11
	force_wielded = 20					//I have no idea how to balance
	throwforce = 22
	throw_speed = 4
	embedding = list("embedded_impact_pain_multiplier" = 3)
	armour_penetration = 15				//Enhanced armor piercing
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	sharpness = IS_SHARP

/obj/item/twohanded/bonespear/update_icon()
	icon_state = "bone_spear[wielded]"

/obj/item/twohanded/binoculars
	name = "binoculars"
	desc = "Used for long-distance surveillance."
	item_state = "binoculars"
	icon_state = "binoculars"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	var/datum/component/mobhook
	var/zoom_out_amt = 6
	var/zoom_amt = 10

/obj/item/twohanded/binoculars/wield(mob/user)
	. = ..()
	if(!wielded)
		return
	if(QDELETED(mobhook))
		mobhook = user.AddComponent(/datum/component/redirect, list(COMSIG_MOVABLE_MOVED = CALLBACK(src, .proc/unwield)))
	else
		user.TakeComponent(mobhook)
	user.visible_message("[user] holds [src] up to [user.p_their()] eyes.","You hold [src] up to your eyes.")
	item_state = "binoculars_wielded"
	user.regenerate_icons()
	if(!user?.client)
		return
	var/client/C = user.client
	var/_x = 0
	var/_y = 0
	switch(user.dir)
		if(NORTH)
			_y = zoom_amt
		if(EAST)
			_x = zoom_amt
		if(SOUTH)
			_y = -zoom_amt
		if(WEST)
			_x = -zoom_amt
	C.change_view(world.view + zoom_out_amt)
	C.pixel_x = world.icon_size*_x
	C.pixel_y = world.icon_size*_y

/obj/item/twohanded/binoculars/unwield(mob/user)
	. = ..()
	mobhook.RemoveComponent()
	user.visible_message("[user] lowers [src].","You lower [src].")
	item_state = "binoculars"
	user.regenerate_icons()
	if(user && user.client)
		user.regenerate_icons()
		var/client/C = user.client
		C.change_view(CONFIG_GET(string/default_view))
		user.client.pixel_x = 0
		user.client.pixel_y = 0
