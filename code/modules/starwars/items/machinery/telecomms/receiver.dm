//Preset Receivers

//--PRESET LEFT--//

/obj/machinery/telecomms/receiver/preset_left/rebels
	network = "tcommsatrebels"
	autolinkers = list("receiverA") // link to relay
	freq_listening = list(FREQ_REBCOM, FREQ_REBMIL, FREQ_REBSQD, FREQ_REBSEC)


//--PRESET RIGHT--//

/obj/machinery/telecomms/receiver/preset_right/rebels
	network = "tcommsatrebels"
	autolinkers = list("receiverB") // link to relay
	freq_listening = list(FREQ_REBMED, FREQ_REBBRD)

