//Preset Buses

/obj/machinery/telecomms/bus/preset_one/rebels
	network = "tcommsatrebels"
	freq_listening = list(FREQ_REBCOM, FREQ_REBMIL)
	autolinkers = list("processor1", "rebcom", "rebmil")

/obj/machinery/telecomms/bus/preset_two/rebels
	network = "tcommsatrebels"
	freq_listening = list(FREQ_REBSQD, FREQ_REBSEC)
	autolinkers = list("processor2", "rebsqd", "rebsec")

/obj/machinery/telecomms/bus/preset_three/rebels
	network = "tcommsatrebels"
	freq_listening = list(FREQ_REBMED, FREQ_REBBRD)
	autolinkers = list("processor3", "rebmed", "rebbrd")
