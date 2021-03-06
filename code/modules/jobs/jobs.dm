GLOBAL_LIST_INIT(command_positions, list(
	"Emperor",
	"Captain",
	"Sith",
	"Warden",
	"Lieutenant",
	"Captain of the Guard",
	"Head Engineer",
	"Research Director",
	"Chief Medical Officer",
	"Quartermaster",
	"Coalition Administrative Officer",
	"General",
	"Commander"))


GLOBAL_LIST_INIT(engineering_positions, list(
	"Head Engineer",
	"Engineer Sergeant",
	"Engineer Corporal",
	"Engineer Private"))
	// yogs end


GLOBAL_LIST_INIT(medical_positions, list(
	"Chief Medical Officer",
	"Head Surgeon",
	"Geneticist",
	"Stormtrooper Surgeon",
	"Imperial Medic"))
	// yogs end


GLOBAL_LIST_INIT(science_positions, list(
	"Coalition Administrative Officer",
	"Research Director",
	"Researcher",
	"Clerk",
	"Roboticist"))


GLOBAL_LIST_INIT(supply_positions, list(
	"Lieutenant",
	"Quartermaster",
	"Cargo Technician",
	"Shaft Miner",
	"Requisitions Officer",
	"Away Team Leader"))

GLOBAL_LIST_INIT(civilian_positions, list(
	"Coalition Administrative Officer",
	"Bartender",
	"Cook",
	"Janitor",
	"Assistant",
	"Prisoner",
	"Sith Acolyte"))
	// yogs end


GLOBAL_LIST_INIT(security_positions, list(
	"Captain of the Guard",
	"Alpha Squad Sergeant",
	"Bravo Squad Sergeant",
	"Alpha Squad Stormtrooper",
	"Bravo Squad Stormtrooper",
	"Tie Pilot",
	"Interrogator",
	"Crewman",
	"Navy Guard"))
//STAR WARS EDIT

GLOBAL_LIST_INIT(council_positions, list(
	"Sith",
	"Sith Acolyte"))

GLOBAL_LIST_INIT(rebel_positions, list(
	"Jedi Knight",
	"General",
	"Commander",
	"Fighter Pilot",
	"Soldier",
	"Medic",
	"Agent",
	"Support"))

GLOBAL_LIST_INIT(merc_positions, list(
	"Leader",
	"Mercenary",
	"Paylord",
	"Overwatch"))

//END OF

GLOBAL_LIST_INIT(nonhuman_positions, list(
	"AI",
	"Cyborg",
	ROLE_PAI))

GLOBAL_LIST_INIT(exp_jobsmap, list(
	EXP_TYPE_CREW = list("titles" = command_positions | engineering_positions | medical_positions | science_positions | supply_positions | security_positions | civilian_positions | list("AI","Cyborg")), // crew positions
	EXP_TYPE_COMMAND = list("titles" = command_positions),
	EXP_TYPE_ENGINEERING = list("titles" = engineering_positions),
	EXP_TYPE_MEDICAL = list("titles" = medical_positions),
	EXP_TYPE_SCIENCE = list("titles" = science_positions),
	EXP_TYPE_SUPPLY = list("titles" = supply_positions),
	EXP_TYPE_SECURITY = list("titles" = security_positions),
	EXP_TYPE_SILICON = list("titles" = list("AI","Cyborg")),
	EXP_TYPE_SERVICE = list("titles" = civilian_positions),
))

GLOBAL_LIST_INIT(exp_specialmap, list(
	EXP_TYPE_LIVING = list(), // all living mobs
	EXP_TYPE_ANTAG = list(),
	EXP_TYPE_SPECIAL = list("Lifebringer","Ash Walker","Exile","Servant Golem","Free Golem","Hermit","Translocated Vet","Escaped Prisoner","Hotel Staff","SuperFriend","Space Syndicate","Ancient Crew","Space Doctor","Space Bartender","Beach Bum","Skeleton","Zombie","Space Bar Patron","Lavaland Syndicate","Ghost Role"), // Ghost roles
	EXP_TYPE_GHOST = list() // dead people, observers
))
GLOBAL_PROTECT(exp_jobsmap)
GLOBAL_PROTECT(exp_specialmap)

/proc/guest_jobbans(job)
	return ((job in GLOB.command_positions) || (job in GLOB.nonhuman_positions) || (job in GLOB.security_positions))



//this is necessary because antags happen before job datums are handed out, but NOT before they come into existence
//so I can't simply use job datum.department_head straight from the mind datum, laaaaame.
/proc/get_department_heads(var/job_title)
	if(!job_title)
		return list()

	for(var/datum/job/J in SSjob.occupations)
		if(J.title == job_title)
			return J.department_head //this is a list

/proc/get_full_job_name(job)
	var/static/regex/cap_expand = new("cap(?!tain)")
	var/static/regex/cmo_expand = new("cmo")
	var/static/regex/hos_expand = new("hos")
	var/static/regex/hop_expand = new("hop")
	var/static/regex/rd_expand = new("rd")
	var/static/regex/ce_expand = new("ce")
	var/static/regex/qm_expand = new("qm")
	var/static/regex/sec_expand = new("(?<!security )officer")
	var/static/regex/engi_expand = new("(?<!station )engineer")
	var/static/regex/atmos_expand = new("atmos tech")
	var/static/regex/doc_expand = new("(?<!medical )doctor|medic(?!al)")
	var/static/regex/mine_expand = new("(?<!shaft )miner")
	var/static/regex/chef_expand = new("chef")
	var/static/regex/borg_expand = new("(?<!cy)borg")
	// yogs start - Yog jobs
	var/static/regex/tour_expand = new("tourist")
	var/static/regex/mm_expand = new("mining medic")
	var/static/regex/psych_expand = new("psychiatrist")
	var/static/regex/clerk_expand = new("clerk")
	var/static/regex/para_expand = new("paramedic")
	// yogs end

	job = lowertext(job)
	job = cap_expand.Replace(job, "captain")
	job = cmo_expand.Replace(job, "chief medical officer")
	job = hos_expand.Replace(job, "Captain of the Guard")
	job = hop_expand.Replace(job, "head of personnel")
	job = rd_expand.Replace(job, "Science Director")
	job = ce_expand.Replace(job, "head engineer")
	job = qm_expand.Replace(job, "quartermaster")
	job = sec_expand.Replace(job, "Stormtrooper")
	job = engi_expand.Replace(job, "engineer corporal")
	job = atmos_expand.Replace(job, "engineer private")
	job = doc_expand.Replace(job, "medical doctor")
	job = mine_expand.Replace(job, "shaft miner")
	job = chef_expand.Replace(job, "cook")
	job = borg_expand.Replace(job, "cyborg")
	// yogs start - Yog jobs
	job = tour_expand.Replace(job, "tourist")
	job = mm_expand.Replace(job, "mining medic")
	job = psych_expand.Replace(job, "psychiatrist")
	job = clerk_expand.Replace(job, "clerk")
	job = para_expand.Replace(job, "paramedic")
	// yogs end
	return job
