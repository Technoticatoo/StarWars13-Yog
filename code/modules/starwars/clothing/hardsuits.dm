// Imperial
/obj/item/clothing/head/helmet/space/hardsuit/imperial
	name = "Imperial Hardsuit Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Armoured and mass produced for workers of the Empire."
	alternate_worn_icon = 'icons/starwars/clothing/hardsuit_mob.dmi'
	icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	basestate = "default_helmet"
	icon_state = "default_helmet0"
	//flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	armor = list("melee" = 35, "bullet" = 15, "laser" = 30,"energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)

/obj/item/clothing/suit/space/hardsuit/imperial
	name = "Imperial Hardsuit"
	desc = "A special armour designed for work in a hazardous, low pressure environment. Armoured and mass produced for workers of the Empire."
	alternate_worn_icon = 'icons/starwars/clothing/hardsuit_mob.dmi'
	icon = 'icons/starwars/clothing/hardsuit_obj.dmi'
	icon_state = "default_suit"
	armor = list("melee" = 35, "bullet" = 15, "laser" = 30, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/imperial

// Stormtrooper
/obj/item/clothing/head/helmet/space/hardsuit/imperial/stormtrooper
	name = "Stormtrooper Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Armoured and mass produced for troopers of the Imperial Army."
	basestate = "stormtrooper_helmet"
	icon_state = "stormtrooper_helmet0"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/space/hardsuit/imperial/stormtrooper
	name = "Stormtrooper Armour"
	desc = "A special armour designed for work in a hazardous, low pressure environment. Armoured and mass produced for troopers of the Imperial Army."
	icon_state = "stormtrooper_suit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/imperial/stormtrooper

// Captain of the Guard
/obj/item/clothing/head/helmet/space/hardsuit/imperial/cotg
	name = "Captain of the Guard Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Armoured and mass produced for the Captains of the Guard."
	basestate = "cotg_helmet"
	icon_state = "cotg_helmet0"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80,"energy" = 80, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/space/hardsuit/imperial/cotg
	name = "Captain of the Guard Armour"
	desc = "A special armour designed for work in a hazardous, low pressure environment. Armoured and mass produced for the Captains of the Guard."
	icon_state = "cotg_suit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/imperial/cotg
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80,"energy" = 80, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)

// Scouttrooper
/obj/item/clothing/head/helmet/space/hardsuit/imperial/scouttrooper
	name = "Scouttrooper Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Armoured and mass produced for scout troopers of the Imperial Army."
	basestate = "scouttrooper_helmet"
	icon_state = "scouttrooper_helmet0"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/space/hardsuit/imperial/scouttrooper
	name = "Scouttrooper Armour"
	desc = "A special armour designed for work in a hazardous, low pressure environment. Armoured and mass produced for scout troopers of the Imperial Army."
	icon_state = "scouttrooper_suit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/imperial/scouttrooper

// Flametrooper
/obj/item/clothing/head/helmet/space/hardsuit/imperial/flametrooper
	name = "Flametrooper Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Armoured and mass produced for flame troopers of the Imperial Army."
	basestate = "flametrooper_helmet"
	icon_state = "flametrooper_helmet0"
	resistance_flags = FIRE_PROOF
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/space/hardsuit/imperial/flametrooper
	name = "Flametrooper Armour"
	desc = "A special armour designed for work in a hazardous, low pressure environment. Armoured and mass produced for flame troopers of the Imperial Army."
	icon_state = "flametrooper_suit"
	resistance_flags = FIRE_PROOF
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/imperial/flametrooper

// Sith Hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/imperial/sith
	name = "Sith Hardsuit Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. A Sith does not need armour, the force bends to their will... But they still cannot fly in space without help!"
	icon_state = "sith_helmet"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80,"energy" = 80, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/space/hardsuit/imperial/sith
	name = "Sith Hardsuit"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. A Sith does not need armour, the force bends to their will... But they still cannot fly in space without help!"
	icon_state = "sith_suit"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80,"energy" = 80, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/imperial/sith
	jetpack = /obj/item/tank/jetpack/suit


/obj/item/clothing/head/helmet/space/hardsuit/jedi
	name = "gem-encrusted hardsuit helmet"
	desc = "A bizarre gem-encrusted helmet that radiates magical energies."
	icon_state = "hardsuit0-wiz"
	item_state = "wiz_helm"
	item_color = "wiz"
	resistance_flags = FIRE_PROOF | ACID_PROOF //No longer shall our kind be foiled by lone chemists with spray bottles!
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 20, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100)
	heat_protection = HEAD												//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/jedi
	icon_state = "hardsuit-wiz"
	name = "gem-encrusted hardsuit"
	desc = "A bizarre gem-encrusted suit that radiates magical energies."
	item_state = "wiz_hardsuit"
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 20, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 100, "acid" = 100)
	allowed = list(/obj/item/teleportation_scroll, /obj/item/tank/internals)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS					//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/jedi

/obj/item/clothing/suit/space/hardsuit/jedi/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, FALSE)


// Tie Pilot
/obj/item/clothing/head/helmet/space/hardsuit/imperial/tiepilot
	name = "Tie Pilot Helmet"
	desc = "A helmet of a tie pilot of the Imperial Navy."
	basestate = "tiepilot_helmet"
	icon_state = "tiepilot_helmet0"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/space/hardsuit/imperial/tiepilot
	name = "Tie Pilot Suit"
	desc = "The flight suit of a tie pilot of the Imperial Navy."
	icon_state = "tiepilot_suit"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/imperial/tiepilot