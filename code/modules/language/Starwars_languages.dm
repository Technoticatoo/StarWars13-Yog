#define RODESE_SYLLABLES list ("ta", "pa", "man", "manta", "pi", "wan", "kuna", "wasi", "ni", "nki", "n", "nchik", "yku", "nkichik", "nku", "rqa", "saq", "nqaku", "tu", "pu", "qan", "ku", "ch'", "p'", "qh", "ph", "e,", "o", "th", "ka", "cha", "ga", "cho")
#define SHYRIIWOOK_SYLLABLES list ("ooh", "ra'", "huao", "r'rwh", "wua", "hu", "aa", "waag", "ya", "ahy", "ag", "moo", "oo", "gwy", "ruo", "w", "hu", "hwa", "ruh", "uma", "roo", "wuhu", "ar", "gh", "oow", "ah", "ggwa", "sh", "rf", "uh", "raa", "rrh", "awk", "wgh", "woof", "wurr", "wargh", "grh", "Grr", "arg")
#define BOTHESE_SYLLABLES list ("bes", "elo", "jak", "raek", "stra", "sk", "est", "tra", "tre", "mo", "pes", "ru", "tav", "wes", "zra", "nor", "mak", "ko", "ys", "aek", "ukt", "ep", "rut", "bur", "lo", "ndu", "ryn", "rka", "yir", "isk", "eth", "eez", "ayl", "pri", "sa", "iga", "lk", "ist", "iga", "vei", "thri", "yab", "yrk", "ar'", "wok", "ops'", "nyzh")
#define TWILEKI_SYLLABLES list ("al", "co", "gli", "je", "ith", "ne", "che", "e", "om", "ap", "lav", "id", "llar", "la", "ree", "rol", "sil", "ais", "re'", "ska", "wn", "ol", "ma", "ola", "kwi", "ao", "la", "ada", "joo", "oyi", "yla", "xia", "en", "ra", "di", "ame", "ya", "rsu", "lim", "ru", "an", "oon")
#define ZABRAKI_SYLLABLES list ("oa", "lo", "kaz", "ta", "kas", "kan", "za", "tak", "chu", "tai", "ari", "-ga", "ask", "ti", "dan", "tuk", "cap", "ist", "is'c", "o", "ak", "yev", "bl", "ukk", "iz", "zur", "l'ok",)

/datum/language/rodese
    name = "Rodese"
    desc = "Greedo shot first."
    key = "r"
    colour = "Rodese"
    flags = RESTRICTED | COMMON_VERBS
    syllables = RODESE_SYLLABLES

/datum/language/shyriiwook
    name = "Shyriiwook"
    desc = "RAWRGWAWGGR!"
    key = "w"
    colour = "Shyriiwook"
    flags = RESTRICTED | COMMON_VERBS
    syllables = SHYRIIWOOK_SYLLABLES

/datum/language/bothese
    name = "Bothese"
    desc = "The typical Bothan's goal is to go through life getting more and more people to listen to what he has to say."
    key = "b"
    colour = "Bothese"
    flags = RESTRICTED | COMMON_VERBS
    syllables = BOTHESE_SYLLABLES

/datum/language/twileki
    name = "Twilek'i"
    desc = "Tail-head speak."
    key = "t"
    colour = "Twilek'i"
    flags = RESTRICTED | COMMON_VERBS
    syllables = TWILEKI_SYLLABLES

/datum/language/zabraki
    name = "Zabraki"
    desc = "Those horned humaniods, that everyone likes.. Unless your in the empire."
    key = "z"
    colour = "Zabraki"
    flags = RESTRICTED | COMMON_VERBS
    syllables = ZABRAKI_SYLLABLES

