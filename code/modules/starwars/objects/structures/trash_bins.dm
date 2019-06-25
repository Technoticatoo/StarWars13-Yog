	/**********************Ore box**************************/

/obj/structure/trash_bin
	icon = 'icons/obj/mining.dmi'
	icon_state = "orebox"
	name = "trash bin"
	desc = "A heavy wooden bin, which can be filled with trash."
	density = TRUE
	pressure_resistance = 5*ONE_ATMOSPHERE
	var/trash_type = "paper"
/obj/structure/trash_bin/attackby(obj/item/W, mob/user, params)
	if (istype(W, trash_type))
		user.transferItemToLoc(W, src)
	else if(SEND_SIGNAL(W, COMSIG_CONTAINS_STORAGE))
		SEND_SIGNAL(W, COMSIG_TRY_STORAGE_TAKE_TYPE, trash_type, src)
		to_chat(user, "<span class='notice'>You empty the trash in [W] into \the [src].</span>")
	else
		return ..()

/obj/structure/trash_bin/crowbar_act(mob/living/user, obj/item/I)
	if(I.use_tool(src, user, 50, volume=50))
		user.visible_message("[user] pries \the [src] apart.",
			"<span class='notice'>You pry apart \the [src].</span>",
			"<span class='italics'>You hear splitting wood.</span>")
		deconstruct(TRUE, user)
	return TRUE

/obj/structure/trash_bin/examine(mob/living/user)
	if(Adjacent(user) && istype(user))
		show_contents(user)
	. = ..()

/obj/structure/trash_bin/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(Adjacent(user))
		show_contents(user)

/obj/structure/trash_bin/attack_robot(mob/user)
	if(Adjacent(user))
		show_contents(user)

/obj/structure/trash_bin/proc/show_contents(mob/user)
	var/dat = text("<b>The contents of the trash bin reveal...</b><br>")
	var/list/assembled = list()
	for(var/obj/item/stack/ore/O in src)
		assembled[O.type] += O.amount
	for(var/type in assembled)
		var/obj/item/stack/ore/O = type
		dat += "[initial(O.name)] - [assembled[type]]<br>"
	dat += text("<br><br><A href='?src=[REF(src)];removeall=1'>Empty box</A>")
	user << browse(dat, "window=orebox")

/obj/structure/trash_bin/proc/dump_box_contents()
	var/drop = drop_location()
	for(var/obj/item/stack/ore/O in src)
		if(QDELETED(O))
			continue
		if(QDELETED(src))
			break
		O.forceMove(drop)
		if(TICK_CHECK)
			stoplag()
			drop = drop_location()

/obj/structure/trash_bin/Topic(href, href_list)
	if(..())
		return
	if(!Adjacent(usr))
		return

	usr.set_machine(src)
	add_fingerprint(usr)
	if(href_list["removeall"])
		dump_box_contents()
		to_chat(usr, "<span class='notice'>You open the release hatch on the box..</span>")
	updateUsrDialog()

/obj/structure/trash_bin/deconstruct(disassembled = TRUE, mob/user)
	var/obj/item/stack/sheet/mineral/wood/WD = new (loc, 4)
	if(user)
		WD.add_fingerprint(user)
	dump_box_contents()
	qdel(src)

/obj/structure/trash_bin/onTransitZ()
	return

/obj/structure/trash_bin/paper
	name = "trash bin - paper"
	trash_type = "paper"

/obj/structure/trash_bin/glass
	name = "trash bin - glass"
	trash_type = "glass"

/obj/structure/trash_bin/food
	name = "trash bin - food"
	trash_type = "food"
