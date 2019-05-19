#define EMPERORWHITELISTFILE "[global.config.directory]/emperor_whitelist.txt"

GLOBAL_LIST(emperorwhitelist)
GLOBAL_PROTECT(emperorwhitelist)

/proc/load_emperorwhitelist()
	GLOB.emperorwhitelist = list()
	for(var/line in world.file2list(EMPERORWHITELISTFILE))
		if(!line)
			continue
		if(findtextEx(line,"#",1,2))
			continue
		GLOB.emperorwhitelist += ckey(line)

	if(!GLOB.emperorwhitelist.len)
		GLOB.emperorwhitelist = null

/proc/check_emperorwhitelist(var/ckey)
	if(!GLOB.emperorwhitelist)
		return FALSE
	. = (ckey in GLOB.emperorwhitelist)

#undef WHITELISTFILE