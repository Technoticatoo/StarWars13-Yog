/obj/item/pod_parts
	icon = 'icons/starwars/spacepods/parts.dmi'
	w_class = WEIGHT_CLASS_GIGANTIC
	flags_1 = CONDUCT_1


/obj/item/shuttle_parts
	icon = 'icons/starwars/spacepods/parts.dmi'
	w_class = WEIGHT_CLASS_GIGANTIC
	flags_1 = CONDUCT_1


/obj/item/pod_parts/core
	name = "space pod core"
	icon_state = "core"

/obj/item/pod_parts/pod_frame
	name = "space pod frame"
	density = FALSE
	anchored = FALSE
	var/link_to = null
	var/link_angle = 0

/obj/item/pod_parts/pod_frame/ComponentInitialize()
	AddComponent(/datum/component/simple_rotation, ROTATION_ALTCLICK | ROTATION_CLOCKWISE)

/obj/item/pod_parts/pod_frame/proc/find_square()
	/*
	each part, in essence, stores the relative position of another part
	you can find where this part should be by looking at the current direction of the current part and applying the link_angle
	the link_angle is the angle between the part's direction and its following part, which is the current part's link_to
	the code works by going in a loop - each part is capable of starting a loop by checking for the part after it, and that part checking, and so on
	this 4-part loop, starting from any part of the frame, can determine if all the parts are properly in place and aligned
	it also checks that each part is unique, and that all the parts are there for the spacepod itself
	*/
	var/neededparts = list(/obj/item/pod_parts/pod_frame/aft_port, /obj/item/pod_parts/pod_frame/aft_starboard, /obj/item/pod_parts/pod_frame/fore_port, /obj/item/pod_parts/pod_frame/fore_starboard)
	var/turf/T
	var/obj/item/pod_parts/pod_frame/linked
	var/obj/item/pod_parts/pod_frame/pointer
	var/list/connectedparts =  list()
	neededparts -= src
	linked = src
	for(var/i = 1; i <= 4; i++)
		T = get_turf(get_step(linked, turn(linked.dir, -linked.link_angle))) //get the next place that we want to look at
		if(locate(linked.link_to) in T)
			pointer = locate(linked.link_to) in T
		if(istype(pointer, linked.link_to) && pointer.dir == linked.dir && pointer.anchored)
			if(!(pointer in connectedparts))
				connectedparts += pointer
			linked = pointer
			pointer = null
	if(connectedparts.len < 4)
		return FALSE
	for(var/i = 1; i <=4; i++)
		var/obj/item/pod_parts/pod_frame/F = connectedparts[i]
		if(F.type in neededparts) //if one of the items can be founded in neededparts
			neededparts -= F.type
		else //because neededparts has 4 distinct items, this must be called if theyre not all in place and wrenched
			return FALSE
	return connectedparts

/obj/item/pod_parts/pod_frame/attackby(var/obj/item/O, mob/user)
	if(istype(O, /obj/item/stack/rods))
		var/obj/item/stack/rods/R = O
		var/list/linkedparts = find_square()
		if(!linkedparts)
			to_chat(user, "<span class='warning'>You cannot assemble a ship frame because you do not have the necessary assembly.</span>")
			return TRUE
		if(!R.use(10))
			to_chat(user, "<span class='warning'>You need 10 rods for this.</span>")
			return TRUE
		var/obj/spacepod/pod = new
		pod.forceMove(loc)
		switch(dir)
			if(NORTH)
				pod.angle = 0
			if(SOUTH)
				pod.angle = 180
			if(WEST)
				pod.angle = 270
			if(EAST)
				pod.angle = 90
		pod.process(2)
		to_chat(user, "<span class='notice'>You strut the ship frame together.</span>")
		for(var/obj/item/pod_parts/pod_frame/F in linkedparts)
			if(1 == turn(F.dir, -F.link_angle)) //if the part links north during construction, as the bottom left part always does
				pod.forceMove(F.loc)
			qdel(F)
		return TRUE
	if(O.tool_behaviour == TOOL_WRENCH)
		to_chat(user, "<span class='notice'>You [!anchored ? "secure \the [src] in place."  : "remove the securing bolts."]</span>")
		anchored = !anchored
		density = anchored
		O.play_tool_sound(src)
		return TRUE

/obj/item/pod_parts/pod_frame/fore_port
	name = "fore port ship frame"
	icon_state = "pod_fp"
	desc = "A spaceship frame component. This is the fore port component."
	link_to = /obj/item/pod_parts/pod_frame/fore_starboard
	link_angle = 90

/obj/item/pod_parts/pod_frame/fore_starboard
	name = "fore starboard shiü frame"
	icon_state = "pod_fs"
	desc = "A spaceship frame component. This is the fore starboard component."
	link_to = /obj/item/pod_parts/pod_frame/aft_starboard
	link_angle = 180

/obj/item/pod_parts/pod_frame/aft_port
	name = "aft port ship frame"
	icon_state = "pod_ap"
	desc = "A spaceship frame component. This is the aft port component."
	link_to = /obj/item/pod_parts/pod_frame/fore_port
	link_angle = 0

/obj/item/pod_parts/pod_frame/aft_starboard
	name = "aft starboard ship frame"
	icon_state = "pod_as"
	desc = "A spaceship frame component. This is the aft starboard component."
	link_to = /obj/item/pod_parts/pod_frame/aft_port
	link_angle = 270

/obj/item/pod_parts/armor
	name = "civilian ship armor"
	icon_state = "pod_armor_civ"
	desc = "Spaceship armor. This is the civilian version. It looks rather flimsy."
	var/pod_icon = 'icons/starwars/fighters.dmi'
	var/pod_icon_state = "pod_civ"
	var/pod_desc = "A sleek civilian spaceship."
	var/pod_integrity = 250

/obj/item/pod_parts/armor/syndicate
	name = "syndicate ship armor"
	icon_state = "pod_armor_synd"
	desc = "Tough-looking spaceship armor, with a bold \"FUCK NT\" stenciled directly into it."
	pod_icon_state = "pod_synd"
	pod_desc = "A menacing military spaceship with \"FUCK NT\" stenciled onto the side"
	pod_integrity = 400

/obj/item/pod_parts/armor/black
	name = "black pod armor"
	icon_state = "pod_armor_black"
	desc = "Plain black spaceship armor, with no logos or insignias anywhere on it."
	pod_icon_state = "pod_black"
	pod_desc = "An all black spaceship with no insignias."

/obj/item/pod_parts/armor/gold
	name = "golden pod armor"
	icon_state = "pod_armor_gold"
	desc = "Golden spaceship armor. Looks like what a rich spessmen put on their spacepod."
	pod_icon_state = "pod_gold"
	pod_desc = "A civilian spaceship with a gold body, must have cost somebody a pretty penny"
	pod_integrity = 220

/obj/item/pod_parts/armor/industrial
	name = "industrial ship armor"
	icon_state = "pod_armor_industrial"
	desc = "Tough industrial-grade spaceship armor. While meant for construction work, it is commonly used in spacepod battles, too."
	pod_icon_state = "pod_industrial"
	pod_desc = "A rough looking spaceship meant for industrial work"
	pod_integrity = 330

/obj/item/pod_parts/armor/security
	name = "security ship armor"
	icon_state = "pod_armor_mil"
	desc = "Tough military-grade ship armor, meant for use by the NanoTrasen military and it's sub-divisons for space combat."
	pod_icon_state = "pod_mil"
	pod_desc = "An armed security spaceship with reinforced armor plating brandishing the Nanotrasen Military insignia"
	pod_integrity = 350

/obj/item/circuitboard/mecha/pod
	name = "Circuit board (Space Pod Mainboard)"
	icon_state = "mainboard"

/obj/item/pod_parts/armor/fighter
	name = "tie fighter armor"
	icon_state = "tie_fighter_armor"
	desc = "Tough military-grade tie fighter armor, meant for use by the imperial navy and it's sub-divisons for space combat."
	pod_icon_state = "tie_fighter"
	pod_desc = "An armed tie fighter with reinforced armor plating brandishing the Imperial Navy insignia"
	pod_integrity = 300

/obj/item/pod_parts/armor/interceptor
	name = "tie interceptor armor"
	icon_state = "tie_interceptor_armor"
	desc = "Tough tie interceptor armor, meant for use by the imperial navy and it's sub-divisons for space combat."
	pod_icon_state = "tie_interceptor"
	pod_desc = "An armed tie interceptor with reinforced armor plating brandishing the Imperial Navy insignia"
	pod_integrity = 280

/obj/item/pod_parts/armor/bomber
	name = "tie bomber armor"
	icon_state = "tie_bomber2_armor"
	desc = "Tough military-grade tie bomber armor, meant for use by the imperial navy and it's sub-divisons for space combat."
	pod_icon_state = "tie_bomber2"
	pod_desc = "An armed tie bomber with reinforced armor plating brandishing the Imperial Navy insignia"
	pod_integrity = 350

/obj/item/pod_parts/armor/xwing
	name = "x-wing armor"
	icon_state = "xwing_armor"
	desc = "Tough military-grade x-wing armor, meant for use by the rebel alliance for space combat."
	pod_icon_state = "xwing"
	pod_desc = "An armed x-wing with reinforced armor plating brandishing the rebel alliance insignia"
	pod_integrity = 300

/obj/item/pod_parts/armor/awing
	name = "a-wing interceptor armor"
	icon_state = "awing_armor"
	desc = "Tough a-wing interceptor armor, meant for use by the rebel alliance for space combat."
	pod_icon_state = "awing"
	pod_desc = "An armed a-wing interceptor with reinforced armor plating brandishing the rebel alliance insignia"
	pod_integrity = 280

/obj/item/pod_parts/armor/ywing
	name = "y-wing bomber armor"
	icon_state = "ywing_armor"
	desc = "Tough y-wing bomber armor, meant for use by the rebel alliance for space combat."
	pod_icon_state = "ywing"
	pod_desc = "An armed y-wing bomber with reinforced armor plating brandishing the rebel alliance insignia"
	pod_integrity = 350

/*/obj/item/pod_parts/armor/shuttle
	icon = 'icons/starwars/spacepods/shuttle.dmi'
	name = "shuttle armor"
	icon_state = "shuttle_armor"
	desc = "Tough military-grade pod armor, meant for use by the NanoTrasen military and it's sub-divisons for space combat."
	pod_icon_state = "shuttle"
	pod_desc = "An armed security spacepod with reinforced armor plating brandishing the Nanotrasen Military insignia"
	pod_integrity = 350*/