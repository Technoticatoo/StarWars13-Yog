/obj/item/clothing/shoes/rebels
	name = "Rebel Jackboots"
	desc = "Your typical Rebel Jackboots"
	alternate_worn_icon = 'icons/starwars/clothing/feet_mob.dmi'
	icon = 'icons/starwars/clothing/feet_obj.dmi'
	icon_state = "jackboots"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 50, "bio" = 10, "rad" = 0, "fire" = 70, "acid" = 50)
	strip_delay = 70
	resistance_flags = NONE
	permeability_coefficient = 0.05 //Thick soles, and covers the ankle
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes

/obj/item/clothing/shoes/rebels/jedi
	alternate_worn_icon = 'icons/starwars/clothing/feet_mob.dmi'
	icon = 'icons/starwars/clothing/feet_obj.dmi'
	name = "Jedi Boots"
	desc = "Your typical Jedi Boots"
	icon_state = "jedi"