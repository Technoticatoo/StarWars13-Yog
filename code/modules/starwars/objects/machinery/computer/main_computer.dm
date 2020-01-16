/obj/machinery/computer/main_computer
	name = "\improper area control console"
	desc = "Used to set an areas security system to a certain faction."
	icon_screen = "security"
	icon_keyboard = "security_key"
	circuit = /obj/item/circuitboard/computer/main_control
	var/obj/item/card/id/scan = null
	var/authenticated = null
	var/rank = null
	var/screen = null
	var/set_swfaction = ""
	var/a_id = null
	var/temp = null
	var/printing = null
	var/can_change_id = 0
	var/list/Perp
	var/tempname = null
	var/area/factions/src_area = ""
	var/map_data = ""
	var/lastfaction = ""
	var/tilex = 1
	var/tiley = 1
	var/mapshowing = 0
	var/turf/T = ""
	//Sorting Variables
	var/sortBy = "name"
	var/order = 1 // -1 = Descending - 1 = Ascending


/obj/machinery/computer/main_computer/examine(mob/user)
	..()
	if(scan)
		to_chat(user, "<span class='notice'>Alt-click to eject the ID card.</span>")

/obj/machinery/computer/main_computer/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/card/id))
		if(!scan)
			if(!user.transferItemToLoc(O, src))
				return
			scan = O
			to_chat(user, "<span class='notice'>You insert [O].</span>")
			playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, 0)
			authenticated = 1
			updateUsrDialog()
		else
			to_chat(user, "<span class='warning'>There's already an ID card in the console.</span>")
	else
		return ..()

/obj/machinery/computer/main_computer/ui_interact(mob/user)
	. = ..()
	var/dat = ""
	if(istype(get_area(src), /area/factions))
		src_area = get_area(src)
	if(mapshowing == 0)
		dat += "<BR>\[ Faction: [src_area.swfaction]</A> \]<BR>"
		dat += "<BR>\[ Last claimed by: [lastfaction]</A> \]<BR>"
		dat += "<BR>\[ <A HREF='?src=[REF(src)];choice=eject_id'>Eject ID</A> \]<BR>"
		dat += "<BR>\[ <A HREF='?src=[REF(src)];choice=claim'>Claim Area</A>  \]<BR>"
		dat += "<BR>\[ <A HREF='?src=[REF(src)];choice=map'>Map</A> \]<BR>"
		dat += "<BR>\[ <A HREF='?src=[REF(src)];choice=logout'>Log Out</A> \]<BR>"
	else
		dat = map_data
	var/datum/asset/spritesheet/assets = get_asset_datum(/datum/asset/spritesheet/simple/minimap)
	assets.send(user)
	var/datum/browser/popup =  new(user, "control", "Area Control System")
	popup.set_content(dat)
	popup.set_title_image(user.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()

/obj/machinery/computer/main_computer/Topic(href, href_list)
	switch(href_list["choice"])
//BASIC FUNCTIONS
		if ("claim")
			claim()
			playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, 0)
		if ("eject_id")
			to_chat(usr, "<span class='error'>Ejecting ID!</span>")
			eject_id(usr)
		if ("map")
			show_map()
			playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, 0)
		if ("back")
			mapshowing = 0
		if ("logout")
			eject_id(usr)
			authenticated = 0
			playsound(src, 'sound/machines/terminal_off.ogg', 50, 0)
		//	popup.close()

	updateUsrDialog()
	return


/*/obj/machinery/computer/main_computer/proc/canUseSecurityRecordsConsole(mob/user, message1 = 0, record1, record2)
	if(user)
		if(authenticated)
			if(user.canUseTopic(src))
				if(!trim(message1))
					return 0
				if(!record1 || record1 == active1)
					if(!record2 || record2 == active2)
						return 1
	return 0*/

/obj/machinery/computer/main_computer/AltClick(mob/user)
	if(user.canUseTopic(src))
		eject_id(user)

/obj/machinery/computer/main_computer/proc/eject_id(mob/user)
	if(scan)
		scan.forceMove(drop_location())
		if(!issilicon(user) && Adjacent(user))
			user.put_in_hands(scan)
		scan = null
		playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, 0)
	else //switching the ID with the one you're holding
		if(issilicon(user) || !Adjacent(user))
			return
		var/obj/item/card/id/held_id = user.is_holding_item_of_type(/obj/item/card/id)
		if(QDELETED(held_id) || !user.transferItemToLoc(held_id, src))
			return
		scan = held_id
		playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, 0)

/obj/machinery/computer/main_computer/proc/claim()
	if(scan)
		to_chat(usr, "<span class='error'>Claiming area!</span>")
		if(scan.swfaction)
			lastfaction = src_area.swfaction
			src_area.swfaction = scan.swfaction
/*			for(var/obj/machinery/door/D in src_area.doors)
				if(scan.swfaction == "Empire")
					D.req_access = list(ACCESS_FACTION_EMPIRE)
				if(scan.swfaction == "Rebels")
					D.req_access = list(ACCESS_FACTION_REBELS)
				if(scan.swfaction == "Mercs")
					D.req_access = list(ACCESS_FACTION_MERCS)
			for(var/obj/machinery/power/apc/APC in src_area.apcs)
				if(scan.swfaction == "Empire")
					APC.req_access = list(ACCESS_FACTION_EMPIRE)
				if(scan.swfaction == "Rebels")
					APC.req_access = list(ACCESS_FACTION_REBELS)
				if(scan.swfaction == "Mercs")
					APC.req_access = list(ACCESS_FACTION_MERCS)*/
			for(var/obj/O in src_area.objects)
				if(scan.swfaction == "Empire")
					O.req_access = list(ACCESS_FACTION_EMPIRE)
				if(scan.swfaction == "Rebels")
					O.req_access = list(ACCESS_FACTION_REBELS)
				if(scan.swfaction == "Mercs")
					O.req_access = list(ACCESS_FACTION_MERCS)
		else
			to_chat(usr, "<span class='error'>ID has no faction record.</span>")

/obj/machinery/computer/main_computer/proc/show_map()
	map_data = "<BR>\[ Faction: [src_area.swfaction]</A> \]<BR>"
	map_data += "<BR>\[ Map:</A> \]<BR>"
	while(tiley <= world.maxy)
		while(tilex <= world.maxx)
			var/atom/A = locate(tilex, tiley, 1)
			if(istype(get_area(A), /area/factions/command1))
				map_data += "+"
			else
				map_data += "o"

			if(tilex == 1)
				tilex = 5
			else
				tilex += 5
		map_data += "<BR>"

		if(tiley == 1)
			tiley = 5
		else
			tiley += 5
		tilex = 1



/*	for(var/i = map_data_reversed.len to 1 step -1)
		map_data << map_data_reversed[i]*/

	map_data += "<BR>\[ <A HREF='?src=[REF(src)];choice=back'>Back</A> \]<BR>"
	mapshowing= 1