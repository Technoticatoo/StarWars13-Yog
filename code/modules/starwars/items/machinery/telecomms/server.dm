/obj/machinery/telecomms/server/presets/rebels
	network = "tcommsatrebels"

/obj/machinery/telecomms/server/presets/rebels/rebcom
	id = "Rebel Command Server"
	freq_listening = list(FREQ_REBCOM)
	autolinkers = list("rebcom")

/obj/machinery/telecomms/server/presets/rebels/rebmil
	id = "Rebel Military Server"
	freq_listening = list(FREQ_REBMIL)
	autolinkers = list("rebmil")

/obj/machinery/telecomms/server/presets/rebels/rebmed
	id = "Rebel Medical Server"
	freq_listening = list(FREQ_REBMED)
	autolinkers = list("rebmed")

/obj/machinery/telecomms/server/presets/rebels/rebsqd
	id = "Rebel Squadron Server"
	freq_listening = list(FREQ_REBSQD)
	autolinkers = list("rebsqd")

/obj/machinery/telecomms/server/presets/rebels/rebsec
	id = "Rebel Agents Server"
	freq_listening = list(FREQ_REBSEC)
	autolinkers = list("rebsec")

/obj/machinery/telecomms/server/presets/rebels/rebbrd
	id = "Rebel Support Server"
	freq_listening = list(FREQ_REBBRD)
	autolinkers = list("rebbrd")

/obj/machinery/telecomms/server/presets/rebels/rebbrd/Initialize()
	. = ..()
	for(var/i = MIN_FREQ, i <= MAX_FREQ, i += 2)
		freq_listening |= i