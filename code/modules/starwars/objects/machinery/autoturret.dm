/obj/machinery/auto_turret
	name = "turret"
	icon = 'icons/obj/turrets.dmi'
	icon_state = "turretCover"
	layer = OBJ_LAYER
	invisibility = INVISIBILITY_OBSERVER	//the turret is invisible if it's inside its cover
	density = TRUE
	desc = "A covered turret that shoots at its enemies."
	use_power = IDLE_POWER_USE				//this turret uses and requires power
	idle_power_usage = 50		//when inactive, this turret takes up constant 50 Equipment power
	active_power_usage = 300	//when active, this turret takes up constant 300 Equipment power
	req_access = list(ACCESS_SEC_DOORS)
	power_channel = EQUIP	//drains power from the EQUIPMENT channel

	var/base_icon_state = "standard"
	var/scan_range = 7
	var/atom/base = null //for turrets inside other objects
	var/mob/living/carbon/human/target = ""
	var/mob/living/silicon/robot/targets = ""
	var/mob/living/simple_animal/targeta = ""
	var/raised = 0			//if the turret cover is "open" and the turret is raised
	var/raising= 0			//if the turret is currently opening or closing its cover
	var/area/factions/src_area = ""
	var/obj/item/worn_id = ""

	max_integrity = 160		//the turret's health
	integrity_failure = 80
	armor = list("melee" = 50, "bullet" = 30, "laser" = 30, "energy" = 30, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 90, "acid" = 90)

	var/locked = TRUE			//if the turret's behaviour control access is locked
	var/controllock = FALSE		//if the turret responds to control panels

	var/installation = /obj/item/gun/energy/e_gun/turret		//the type of weapon installed by default
	var/obj/item/gun/stored_gun = null
	var/gun_charge = 0		//the charge of the gun when retrieved from wreckage

	var/mode = TURRET_STUN

	var/stun_projectile = null		//stun mode projectile type
	var/stun_projectile_sound
	var/lethal_projectile = null	//lethal mode projectile type
	var/lethal_projectile_sound

	var/reqpower = 500		//power needed per shot
	var/always_up = 0		//Will stay active
	var/has_cover = 1		//Hides the cover

	var/obj/machinery/porta_turret_cover/cover = null

	var/last_fired = 0		//world.time the turret last fired
	var/shot_delay = 15		//ticks until next shot (1.5 ?)


	var/check_records = 1	//checks if it can use the security records
	var/criminals = 1		//checks if it can shoot people on arrest
	var/auth_weapons = 0	//checks if it can shoot people that have a weapon they aren't authorized to have
	var/stun_all = 0		//if this is active, the turret shoots everything that isn't security or head of staff
	var/check_anomalies = 1	//checks if it can shoot at unidentified lifeforms (ie xenos)
	var/shoot_unloyal = 0	//checks if it can shoot people that aren't loyalty implantd

	var/attacked = 0		//if set to 1, the turret gets pissed off and shoots at people nearby (unless they have sec access!)

	var/on = TRUE				//determines if the turret is on

	var/list/faction = list("turret") // Same faction mobs will never be shot at, no matter the other settings

	var/datum/effect_system/spark_spread/spark_system	//the spark system, used for generating... sparks?

	var/obj/machinery/turretid/cp = null

	var/wall_turret_direction //The turret will try to shoot from a turf in that direction when in a wall

	var/manual_control = FALSE //
	var/datum/action/turret_quit/quit_action
	var/datum/action/turret_toggle/toggle_action
	var/mob/remote_controller

/obj/machinery/auto_turret/Initialize()
	. = ..()
	if(!base)
		base = src
	update_icon()
	//Sets up a spark system
	spark_system = new /datum/effect_system/spark_spread
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

	setup()
	if(has_cover)
		cover = new /obj/machinery/porta_turret_cover(loc)
		cover.parent_turret = src
		var/mutable_appearance/base = mutable_appearance('icons/obj/turrets.dmi', "basedark")
		base.layer = NOT_HIGH_OBJ_LAYER
		underlays += base
	if(!has_cover)
		INVOKE_ASYNC(src, .proc/popUp)

/obj/machinery/auto_turret/update_icon()
	cut_overlays()
	if(!anchored)
		icon_state = "turretCover"
		return
	if(stat & BROKEN)
		icon_state = "[base_icon_state]_broken"
	else
		if(powered())
			if(on && raised)
				switch(mode)
					if(TURRET_STUN)
						icon_state = "[base_icon_state]_stun"
					if(TURRET_LETHAL)
						icon_state = "[base_icon_state]_lethal"
			else
				icon_state = "[base_icon_state]_off"
		else
			icon_state = "[base_icon_state]_unpowered"


/obj/machinery/auto_turret/proc/setup(obj/item/gun/turret_gun)
	if(stored_gun)
		qdel(stored_gun)
		stored_gun = null

	if(installation && !turret_gun)
		stored_gun = new installation(src)
	else if (turret_gun)
		stored_gun = turret_gun

	var/list/gun_properties = stored_gun.get_turret_properties()

	//required properties
	stun_projectile = gun_properties["stun_projectile"]
	stun_projectile_sound = gun_properties["stun_projectile_sound"]
	lethal_projectile = gun_properties["lethal_projectile"]
	lethal_projectile_sound = gun_properties["lethal_projectile_sound"]
	base_icon_state = gun_properties["base_icon_state"]

	//optional properties
	if(gun_properties["shot_delay"])
		shot_delay = gun_properties["shot_delay"]
	if(gun_properties["reqpower"])
		reqpower = gun_properties["reqpower"]

	update_icon()
	return gun_properties

/obj/machinery/auto_turret/Destroy()
	//deletes its own cover with it
	QDEL_NULL(cover)
	base = null
	if(cp)
		cp.turrets -= src
		cp = null
	QDEL_NULL(stored_gun)
	QDEL_NULL(spark_system)
	remove_control()
	return ..()

/obj/machinery/auto_turret/ui_interact(mob/user)
	. = ..()
	var/dat
	dat += "Status: <a href='?src=[REF(src)];power=1'>[on ? "On" : "Off"]</a><br>"
	dat += "Behaviour controls are [locked ? "locked" : "unlocked"]<br>"

	if(!locked)
		//dat += "Check for Weapon Authorization: <A href='?src=[REF(src)];operation=authweapon'>[auth_weapons ? "Yes" : "No"]</A><BR>"
		dat += "Check Security Records: <A href='?src=[REF(src)];operation=checkrecords'>[check_records ? "Yes" : "No"]</A><BR>"
		dat += "Neutralize Identified Criminals: <A href='?src=[REF(src)];operation=shootcrooks'>[criminals ? "Yes" : "No"]</A><BR>"
		//dat += "Neutralize All Non-Security and Non-Command Personnel: <A href='?src=[REF(src)];operation=shootall'>[stun_all ? "Yes" : "No"]</A><BR>"
		//dat += "Neutralize All Unidentified Life Signs: <A href='?src=[REF(src)];operation=checkxenos'>[check_anomalies ? "Yes" : "No"]</A><BR>"
		//dat += "Neutralize All Non-Loyalty Implanted Personnel: <A href='?src=[REF(src)];operation=checkloyal'>[shoot_unloyal ? "Yes" : "No"]</A><BR>"
	if(issilicon(user))
		if(!manual_control)
			var/mob/living/silicon/S = user
			if(S.hack_software)
				dat += "Assume direct control : <a href='?src=[REF(src)];operation=manual'>Manual Control</a><br>"
		else
			dat += "Warning! Remote control protocol enabled.<br>"


	var/datum/browser/popup = new(user, "autosec", "Automatic Portable Turret Installation", 300, 300)
	popup.set_content(dat)
	popup.open()

/obj/machinery/auto_turret/Topic(href, href_list)
	if(..())
		return
	usr.set_machine(src)
	add_fingerprint(usr)

	if(href_list["power"] && !locked)
		if(anchored)	//you can't turn a turret on/off if it's not anchored/secured
			on = !on	//toggle on/off
		else
			to_chat(usr, "<span class='notice'>It has to be secured first!</span>")
		interact(usr)
		return

	if(href_list["operation"])
		switch(href_list["operation"])	//toggles customizable behavioural protocols
			if("authweapon")
				auth_weapons = !auth_weapons
			if("checkrecords")
				check_records = !check_records
			if("shootcrooks")
				criminals = !criminals
			if("shootall")
				stun_all = !stun_all
			if("checkxenos")
				check_anomalies = !check_anomalies
			if("checkloyal")
				shoot_unloyal = !shoot_unloyal
			if("manual")
				if(issilicon(usr) && !manual_control)
					give_control(usr)
		interact(usr)

/obj/machinery/auto_turret/power_change()
	if(!anchored)
		update_icon()
		remove_control()
		return
	if(stat & BROKEN)
		update_icon()
		remove_control()
	else
		if( powered() )
			stat &= ~NOPOWER
			update_icon()
		else
			spawn(rand(0, 15))
				stat |= NOPOWER
				remove_control()
				update_icon()


/obj/machinery/auto_turret/attackby(obj/item/I, mob/user, params)
	if(stat & BROKEN)
		if(I.tool_behaviour == TOOL_CROWBAR)
			//If the turret is destroyed, you can remove it with a crowbar to
			//try and salvage its components
			to_chat(user, "<span class='notice'>You begin prying the metal coverings off...</span>")
			if(I.use_tool(src, user, 20))
				if(prob(70))
					if(stored_gun)
						stored_gun.forceMove(loc)
					to_chat(user, "<span class='notice'>You remove the turret and salvage some components.</span>")
					if(prob(50))
						new /obj/item/stack/sheet/metal(loc, rand(1,4))
					if(prob(50))
						new /obj/item/assembly/prox_sensor(loc)
				else
					to_chat(user, "<span class='notice'>You remove the turret but did not manage to salvage anything.</span>")
				qdel(src)

	else if((I.tool_behaviour == TOOL_WRENCH) && (!on))
		if(raised)
			return

		//This code handles moving the turret around. After all, it's a portable turret!
		if(!anchored && !isinspace())
			setAnchored(TRUE)
			invisibility = INVISIBILITY_MAXIMUM
			update_icon()
			to_chat(user, "<span class='notice'>You secure the exterior bolts on the turret.</span>")
			if(has_cover)
				cover = new /obj/machinery/porta_turret_cover(loc) //create a new turret. While this is handled in process(), this is to workaround a bug where the turret becomes invisible for a split second
				cover.parent_turret = src //make the cover's parent src
		else if(anchored)
			setAnchored(FALSE)
			to_chat(user, "<span class='notice'>You unsecure the exterior bolts on the turret.</span>")
			power_change()
			invisibility = 0
			qdel(cover) //deletes the cover, and the turret instance itself becomes its own cover.

	else if(I.GetID())
		//Behavior lock/unlock mangement
		if(allowed(user))
			locked = !locked
			to_chat(user, "<span class='notice'>Controls are now [locked ? "locked" : "unlocked"].</span>")
		else
			to_chat(user, "<span class='notice'>Access denied.</span>")
	else if(I.tool_behaviour == TOOL_MULTITOOL && !locked)
		if(!multitool_check_buffer(user, I))
			return
		var/obj/item/multitool/M = I
		M.buffer = src
		to_chat(user, "<span class='notice'>You add [src] to multitool buffer.</span>")
	else
		return ..()

/obj/machinery/auto_turret/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	to_chat(user, "<span class='warning'>You short out [src]'s threat assessment circuits.</span>")
	visible_message("[src] hums oddly...")
	obj_flags |= EMAGGED
	controllock = TRUE
	on = FALSE //turns off the turret temporarily
	update_icon()
	sleep(60) //6 seconds for the traitor to gtfo of the area before the turret decides to ruin his shit
	on = TRUE //turns it back on. The cover popUp() popDown() are automatically called in process(), no need to define it here


/obj/machinery/auto_turret/emp_act(severity)
	. = ..()
	if (. & EMP_PROTECT_SELF)
		return
	if(on)
		//if the turret is on, the EMP no matter how severe disables the turret for a while
		//and scrambles its settings, with a slight chance of having an emag effect
		check_records = pick(0, 1)
		criminals = pick(0, 1)
		auth_weapons = pick(0, 1)
		stun_all = pick(0, 0, 0, 0, 1)	//stun_all is a pretty big deal, so it's least likely to get turned on

		on = FALSE
		remove_control()

		spawn(rand(60,600))
			if(!on)
				on = TRUE

/obj/machinery/auto_turret/take_damage(damage, damage_type = BRUTE, damage_flag = 0, sound_effect = 1)
	. = ..()
	if(. && obj_integrity > 0) //damage received
		if(prob(30))
			spark_system.start()
		if(on && !attacked && !(obj_flags & EMAGGED))
			attacked = TRUE
			addtimer(CALLBACK(src, .proc/reset_attacked), 60)

/obj/machinery/auto_turret/proc/reset_attacked()
	attacked = FALSE

/obj/machinery/auto_turret/deconstruct(disassembled = TRUE)
	qdel(src)

/obj/machinery/auto_turret/obj_break(damage_flag)
	if(!(flags_1 & NODECONSTRUCT_1) && !(stat & BROKEN))
		stat |= BROKEN	//enables the BROKEN bit
		power_change()
		invisibility = 0
		spark_system.start()	//creates some sparks because they look cool
		qdel(cover)	//deletes the cover - no need on keeping it there!



/obj/machinery/auto_turret/process()
	if(istype(get_area(src), /area/factions))
		src_area = get_area(src)
	//the main machinery process
	if(cover == null && anchored)	//if it has no cover and is anchored
		if(stat & BROKEN)	//if the turret is borked
			qdel(cover)	//delete its cover, assuming it has one. Workaround for a pesky little bug
		else
			if(has_cover)
				cover = new /obj/machinery/porta_turret_cover(loc)	//if the turret has no cover and is anchored, give it a cover
				cover.parent_turret = src	//assign the cover its parent_turret, which would be this (src)

	if(!on || (stat & (NOPOWER|BROKEN)) || manual_control)
		return

	var/list/targets = list()
	for(var/mob/A in view(scan_range, base))
		if(A.invisibility > SEE_INVISIBLE_LIVING)
			continue

		if(check_anomalies)//if it's set to check for simple animals
			if(isanimal(A))
				var/mob/living/simple_animal/SA = A
				if(SA.stat || in_faction(SA)) //don't target if dead or in faction
					continue
				targets += SA
				continue

		if(issilicon(A))
			var/mob/living/silicon/sillycone = A

			if(ispAI(A))
				continue

			if(sillycone.stat || in_faction(sillycone))
				continue

			if(iscyborg(sillycone))
				var/mob/living/silicon/robot/sillyconerobot = A
				if(LAZYLEN(faction) && (ROLE_SYNDICATE in faction) && sillyconerobot.emagged == TRUE)
					continue

			targets += sillycone
			continue

		if(iscarbon(A))
			var/mob/living/carbon/C = A
			//If not emagged, only target carbons that can use items
			if(mode != TURRET_LETHAL && (C.stat || C.handcuffed || !(C.mobility_flags & MOBILITY_USE)))
				continue

			//If emagged, target all but dead carbons
			if(mode == TURRET_LETHAL && C.stat == DEAD)
				continue

			//if the target is a human and not in our faction, analyze threat level
			if(ishuman(C) && !in_faction(C))
				if(assess_perp(C) >= 4)
					targets += C

			else if(check_anomalies) //non humans who are not simple animals (xenos etc)
				if(!in_faction(C))
					targets += C
	for(var/A in GLOB.mechas_list)
		if((get_dist(A, base) < scan_range) && can_see(base, A, scan_range))
			var/obj/mecha/Mech = A
			if(Mech.occupant && !in_faction(Mech.occupant)) //If there is a user and they're not in our faction
				if(assess_perp(Mech.occupant) >= 4)
					targets += Mech
	// yogs start
	for(var/A in GLOB.spacepods_list)
		if((get_dist(A, base) < scan_range) && can_see(base, A, scan_range))
			var/obj/spacepod/SP = A
			if(SP.pilot && !in_faction(SP.pilot))
				if(assess_perp(SP.pilot) >= 4)
					targets += SP
	// yogs end

	if(check_anomalies && GLOB.blobs.len && (mode == TURRET_LETHAL))
		for(var/obj/structure/blob/B in view(scan_range, base))
			targets += B

	if(targets.len)
		tryToShootAt(targets)
	else if(!always_up)
		popDown() // no valid targets, close the cover

/obj/machinery/auto_turret/proc/tryToShootAt(list/atom/movable/targets)
	while(targets.len > 0)
		var/atom/movable/M = pick(targets)
		targets -= M
		if(target(M))
			return 1


/obj/machinery/auto_turret/proc/popUp()	//pops the turret up
	if(!anchored)
		return
	if(raising || raised)
		return
	if(stat & BROKEN)
		return
	invisibility = 0
	raising = 1
	if(cover)
		flick("popup", cover)
	sleep(POPUP_ANIM_TIME)
	raising = 0
	if(cover)
		cover.icon_state = "openTurretCover"
	raised = 1
	layer = MOB_LAYER

/obj/machinery/auto_turret/proc/popDown()	//pops the turret down
	if(raising || !raised)
		return
	if(stat & BROKEN)
		return
	layer = OBJ_LAYER
	raising = 1
	if(cover)
		flick("popdown", cover)
	sleep(POPDOWN_ANIM_TIME)
	raising = 0
	if(cover)
		cover.icon_state = "turretCover"
	raised = 0
	invisibility = 2
	update_icon()

/obj/machinery/auto_turret/proc/assess_perp(mob/living/carbon/human/perp)
	var/threatcount = 0	//the integer returned
	worn_id = perp.wear_id
	if(istype(get_area(src), /area/factions))
		src_area = get_area(src)
		if(src_area.swfaction)
			if(!worn_id || worn_id.swfaction != src_area.swfaction )
				return 10

	if(obj_flags & EMAGGED)
		return 10	//if emagged, always return 10.

	if((stun_all || attacked) && !allowed(perp))
		//if the turret has been attacked or is angry, target all non-sec people
		if(!allowed(perp))
			return 10

	/*if(auth_weapons)	//check for weapon authorization
		if(isnull(perp.wear_id) || istype(perp.wear_id.GetID(), /obj/item/card/id/syndicate))

			if(allowed(perp)) //if the perp has security access, return 0
				return 0

			if(perp.is_holding_item_of_type(/obj/item/gun) ||  perp.is_holding_item_of_type(/obj/item/melee/baton))
				threatcount += 4

			if(istype(perp.belt, /obj/item/gun) || istype(perp.belt, /obj/item/melee/baton))
				threatcount += 2*/

	/*if(check_records)	//if the turret can check the records, check if they are set to *Arrest* on records
		var/perpname = perp.get_face_name(perp.get_id_name())
		var/datum/data/record/R = find_record("name", perpname, GLOB.data_core.security)
		if(!R || (R.fields["criminal"] == "*Arrest*"))
			threatcount += 4

	if(shoot_unloyal)
		if (!perp.has_trait(TRAIT_MINDSHIELD))
			threatcount += 4*/

	return threatcount


/obj/machinery/auto_turret/proc/in_faction(mob/A)
	if(iscarbon(A))
		target = A
	else if(issilicon(A))
		targets = A
	else if(isanimal(A))
		targeta = A

	if(target)
		worn_id = target.wear_id
		if(src_area.swfaction)
			if(!worn_id || worn_id.swfaction != src_area.swfaction)
				return FALSE
		return TRUE
	if(targets)
		if(src_area.swfaction)
			if(!targets.swfaction || targets.swfaction != src_area.swfaction)
				return FALSE
		return TRUE
	if(targeta)
		if(src_area.swfaction)
			if(!targeta.swfaction || targeta.swfaction != src_area.swfaction)
				return FALSE
		return TRUE

/obj/machinery/auto_turret/proc/target(atom/movable/target)
	if(target)
		popUp()				//pop the turret up if it's not already up.
		setDir(get_dir(base, target))//even if you can't shoot, follow the target
		shootAt(target)
		return 1
	return

/obj/machinery/auto_turret/proc/shootAt(atom/movable/target)
	if(!raised) //the turret has to be raised in order to fire - makes sense, right?
		return

	if(!(obj_flags & EMAGGED))	//if it hasn't been emagged, cooldown before shooting again
		if(last_fired + shot_delay > world.time)
			return
		last_fired = world.time

	var/turf/T = get_turf(src)
	var/turf/U = get_turf(target)
	if(!istype(T) || !istype(U))
		return

	//Wall turrets will try to find adjacent empty turf to shoot from to cover full arc
	if(T.density)
		if(wall_turret_direction)
			var/turf/closer = get_step(T,wall_turret_direction)
			if(istype(closer) && !is_blocked_turf(closer) && T.Adjacent(closer))
				T = closer
		else
			var/target_dir = get_dir(T,target)
			for(var/d in list(0,-45,45))
				var/turf/closer = get_step(T,turn(target_dir,d))
				if(istype(closer) && !is_blocked_turf(closer) && T.Adjacent(closer))
					T = closer
					break

	update_icon()
	var/obj/item/projectile/A
	//any emagged turrets drains 2x power and uses a different projectile?
	if(mode == TURRET_STUN)
		use_power(reqpower)
		A = new stun_projectile(T)
		playsound(loc, stun_projectile_sound, 75, 1)
	else
		use_power(reqpower * 2)
		A = new lethal_projectile(T)
		playsound(loc, lethal_projectile_sound, 75, 1)


	//Shooting Code:
	A.preparePixelProjectile(target, T)
	A.firer = src
	A.fire()
	return A

/obj/machinery/auto_turret/proc/setState(on, mode)
	if(controllock)
		return
	src.on = on
	if(!on)
		popDown()
	src.mode = mode
	power_change()


/datum/action/turret_toggle
	name = "Toggle Mode"
	icon_icon = 'icons/mob/actions/actions_mecha.dmi'
	button_icon_state = "mech_cycle_equip_off"

/datum/action/turret_toggle/Trigger()
	var/obj/machinery/auto_turret/P = target
	if(!istype(P))
		return
	P.setState(P.on,!P.mode)

/datum/action/turret_quit
	name = "Release Control"
	icon_icon = 'icons/mob/actions/actions_mecha.dmi'
	button_icon_state = "mech_eject"

/datum/action/turret_quit/Trigger()
	var/obj/machinery/auto_turret/P = target
	if(!istype(P))
		return
	P.remove_control(FALSE)

/obj/machinery/auto_turret/proc/give_control(mob/A)
	if(manual_control || !can_interact(A))
		return FALSE
	remote_controller = A
	if(!quit_action)
		quit_action = new(src)
	quit_action.Grant(remote_controller)
	if(!toggle_action)
		toggle_action = new(src)
	toggle_action.Grant(remote_controller)
	remote_controller.reset_perspective(src)
	remote_controller.click_intercept = src
	manual_control = TRUE
	always_up = TRUE
	popUp()
	return TRUE

/obj/machinery/auto_turret/proc/remove_control(warning_message = TRUE)
	if(!manual_control)
		return FALSE
	if(remote_controller)
		if(warning_message)
			to_chat(remote_controller, "<span class='warning'>Your uplink to [src] has been severed!</span>")
		quit_action.Remove(remote_controller)
		toggle_action.Remove(remote_controller)
		remote_controller.click_intercept = null
		remote_controller.reset_perspective()
	always_up = initial(always_up)
	manual_control = FALSE
	remote_controller = null
	return TRUE

/obj/machinery/auto_turret/proc/InterceptClickOn(mob/living/caller, params, atom/A)
	if(!manual_control)
		return FALSE
	if(!can_interact(caller))
		remove_control()
		return FALSE
	log_combat(caller,A,"fired with manual turret control at")
	target(A)
	return TRUE

