/datum/controller/subsystem/direction/proc/start_tracking(squad_id, mob/living/carbon/C)
	if(!C)
		stack_trace("SSdirection.start_tracking called with a null mob")
		return FALSE
	if(mobs_in_processing[C] == squad_id)
		return TRUE // already tracking this squad leader
	if(mobs_in_processing[C])
		stop_tracking(mobs_in_processing[C], C) // remove from tracking the other squad
	mobs_in_processing[C] = squad_id
	processing_mobs[squad_id].Add(C)

/datum/controller/subsystem/direction/proc/stop_tracking(squad_id, mob/living/carbon/C)
	if(!mobs_in_processing[C])
		return TRUE // already removed
	var/tracking_id = mobs_in_processing[C]
	mobs_in_processing[C] = FALSE

	if(tracking_id != squad_id)
		stack_trace("mismatch in tracking mobs by reference")
		processing_mobs[squad_id].Remove(C)

	processing_mobs[tracking_id].Remove(C)