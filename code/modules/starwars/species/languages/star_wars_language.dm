// star wars langs.
/datum/language/rodese
	name = "Rodese"
	desc = "Greedo shot first."
	key = "r"
	speech_verb = "says"
	whisper_verb = "whispers"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	default_priority = 100
	icon_state = "galcom"

/datum/language_holder/rodese
	languages = list(/datum/language/rodese)

/datum/language/shyriiwook
	name = "Shyriiwook"
	desc = "RAWRGWAWGGR!"
	key = "w"
	speech_verb = "says"
	whisper_verb = "whispers"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	default_priority = 100
	icon_state = "galcom"

/datum/language_holder/shyriiwook
	languages = list(/datum/language/shyriiwook)

/datum/language/bothese
	name = "Bothese"
	desc = "The typical Bothan's goal is to go through life getting more and more people to listen to what he has to say."
	key = "b"
	speech_verb = "says"
	whisper_verb = "whispers"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	default_priority = 100
	icon_state = "galcom"

/datum/language_holder/bothese
	languages = list(/datum/language/bothese)

/datum/language/twileki
	name = "Twilek'i"
	desc = "Tail-head speak."
	key = "t"
	speech_verb = "says"
	whisper_verb = "whispers"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	default_priority = 100
	icon_state = "galcom"

/datum/language_holder/twileki
	languages = list(/datum/language/twileki)

/datum/language/zabraki
	name = "Zabraki"
	desc = "Those horned humaniods, that everyone likes.. Unless your in the empire."
	speech_verb = "says"
	whisper_verb = "whispers"
	key = "z"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	default_priority = 100
	icon_state = "galcom"

/datum/language_holder/zabraki
	languages = list(/datum/language/zabraki)

//Syllable Lists
/*
	This list really long, mainly because I can't make up my mind about which mandarin syllables should be removed,
	and the english syllables had to be duplicated so that there is roughly a 50-50 weighting.

	Sources:
	http://www.sttmedia.com/syllablefrequency-english
	http://www.chinahighlights.com/travelguide/learning-chinese/pinyin-syllables.htm
*/
/datum/language/rodese/syllables = list("ta", "pa", "man", "manta", "pi", "wan", "kuna", "wasi", "ni", "nki", "n", "nchik", "yku", "nkichik", "nku", "rqa", "saq", "nqaku", "tu", "pu", "qan", "ku", "ch'", "p'", "qh", "ph", "e,", "o", "th", "ka", "cha", "ga", "cho")

/datum/language/shyriiwook/syllables = list("ooh", "ra'", "huao", "r'rwh", "wua", "hu", "aa", "waag", "ya", "ahy", "ag", "moo", "oo", "gwy", "ruo", "w", "hu", "hwa", "ruh", "uma", "roo", "wuhu", "ar", "gh", "oow", "ah", "ggwa", "sh", "rf", "uh", "raa", "rrh", "awk", "wgh", "woof", "wurr", "wargh", "grh", "Grr", "arg")

/datum/language/bothese/syllables = list("bes", "elo", "jak", "raek", "stra", "sk", "est", "tra", "tre", "mo", "pes", "ru", "tav", "wes", "zra", "nor", "mak", "ko", "ys", "aek", "ukt", "ep", "rut", "bur", "lo", "ndu", "ryn", "rka", "yir", "isk", "eth", "eez", "ayl", "pri", "sa", "iga", "lk", "ist", "iga", "vei", "thri", "yab", "yrk", "ar'", "wok", "ops'", "nyzh")

/datum/language/twileki/syllables = list("al", "co", "gli", "je", "ith", "ne", "che", "e", "om", "ap", "lav", "id", "llar", "la", "ree", "rol", "sil", "ais", "re'", "ska", "wn", "ol", "ma", "ola", "kwi", "ao", "la", "ada", "joo", "oyi", "yla", "xia", "en", "ra", "di", "ame", "ya", "rsu", "lim", "ru", "an", "oon")

/datum/language/zabraki/syllables = list("oa", "lo", "kaz", "ta", "kas", "kan", "za", "tak", "chu", "tai", "ari", "-ga", "ask", "ti", "dan", "tuk", "cap", "ist", "is'c", "o", "ak", "yev", "bl", "ukk", "iz", "zur", "l'ok",)