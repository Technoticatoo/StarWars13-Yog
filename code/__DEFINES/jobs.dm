
#define ENGSEC			(1<<0)

#define SHIPWARDEN		(1<<0)
#define CAPTAIN			(1<<1)
#define HOS				(1<<2)
#define ASERGEANT		(1<<3)
#define BSERGEANT		(1<<4)
#define ATROOPER		(1<<5)
#define BTROOPER		(1<<6)
//#define WARDEN			(1<<7)
#define DETECTIVE		(1<<7)
//#define OFFICER			(1<<9)
#define CHIEF			(1<<8)
#define ESERGEANT		(1<<9)
#define ENGINEER		(1<<10)
#define ATMOSTECH		(1<<11)
#define ROBOTICIST		(1<<12)
#define AI_JF			(1<<13)
#define CYBORG			(1<<14)
#define CREWMAN			(1<<15)
#define NAVYGUARD		(1<<16)
#define SITH			(1<<17)
#define REQOFF			(1<<18)
#define AWAYLEAD		(1<<19)

#define MEDSCI			(1<<1)

#define CAO				(1<<0)
#define RD_JF			(1<<1)
#define SCIENTIST		(1<<2)
//#define CHEMIST			(1<<3)
#define CMO_JF			(1<<3)
#define DOCTOR			(1<<4)
#define GENETICIST		(1<<5)
//#define VIROLOGIST		(1<<7)
#define STORMSURG		(1<<6)
#define IMPMED			(1<<7)
#define CLERK			(1<<8)


#define CIVILIAN		(1<<2)

#define HOP				(1<<0)
#define BARTENDER		(1<<1)
//#define BOTANIST		(1<<2)
#define COOK			(1<<3)
#define JANITOR			(1<<4)
//#define CURATOR			(1<<5)
#define QUARTERMASTER	(1<<5)
#define CARGOTECH		(1<<6)
#define MINER			(1<<7)
//#define LAWYER			(1<<9)
#define CHAPLAIN		(1<<8)
//#define CLOWN			(1<<11)
//#define MIME			(1<<12)
#define ASSISTANT		(1<<9)
#define PRISONER		(1<<10)


#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_SLOTFULL 5

#define DEFAULT_RELIGION "The Force"
#define DEFAULT_DEITY "The Dark Side"

#define JOB_DISPLAY_ORDER_DEFAULT 0

#define JOB_DISPLAY_ORDER_ASSISTANT 1
#define JOB_DISPLAY_ORDER_SITH 2
#define JOB_DISPLAY_ORDER_SHIPWARDEN 3
#define JOB_DISPLAY_ORDER_COTG 4
#define JOB_DISPLAY_ORDER_ASG 5
#define JOB_DISPLAY_ORDER_ASS 6
#define JOB_DISPLAY_ORDER_BSG 7
#define JOB_DISPLAY_ORDER_BSS 8
#define JOB_DISPLAY_ORDER_DETECTIVE 9
#define JOB_DISPLAY_ORDER_CAPTAIN 10
#define JOB_DISPLAY_ORDER_LT 11
#define JOB_DISPLAY_ORDER_CREWMAN 12
#define JOB_DISPLAY_ORDER_NAVYGUARD 13
#define JOB_DISPLAY_ORDER_HE 14
#define JOB_DISPLAY_ORDER_ES 15
#define JOB_DISPLAY_ORDER_EC 16
#define JOB_DISPLAY_ORDER_EP 17
#define JOB_DISPLAY_ORDER_CAO 18
#define JOB_DISPLAY_ORDER_RD 19
#define JOB_DISPLAY_ORDER_RS 20
#define JOB_DISPLAY_ORDER_RB 21
#define JOB_DISPLAY_ORDER_CLERK 22
#define JOB_DISPLAY_ORDER_CMO 23
#define JOB_DISPLAY_ORDER_HS 24
#define JOB_DISPLAY_ORDER_STS 24
#define JOB_DISPLAY_ORDER_IM 25
#define JOB_DISPLAY_ORDER_GENETICIST 26
#define JOB_DISPLAY_ORDER_QM 27
#define JOB_DISPLAY_ORDER_ATL 28
#define JOB_DISPLAY_ORDER_CT 29
#define JOB_DISPLAY_ORDER_RO 30
#define JOB_DISPLAY_ORDER_SITH_ACOLYTE 31
#define JOB_DISPLAY_ORDER_MINER 32
#define JOB_DISPLAY_ORDER_BARTENDER 34
#define JOB_DISPLAY_ORDER_COOK 35
#define JOB_DISPLAY_ORDER_AI 36
#define JOB_DISPLAY_ORDER_CYBORG 37
#define JOB_DISPLAY_ORDER_PRISONER 38

/*
#define JOB_DISPLAY_ORDER_ASSISTANT 1 //yogs start - this list has been changed to include the yogs jobs.
#define JOB_DISPLAY_ORDER_CAPTAIN 2
#define JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL 4
#define JOB_DISPLAY_ORDER_QUARTERMASTER 4
#define JOB_DISPLAY_ORDER_CARGO_TECHNICIAN 5
#define JOB_DISPLAY_ORDER_SHAFT_MINER 6
#define JOB_DISPLAY_ORDER_BARTENDER 7
#define JOB_DISPLAY_ORDER_COOK 8
//#define JOB_DISPLAY_ORDER_BOTANIST 9
#define JOB_DISPLAY_ORDER_JANITOR 10
//#define JOB_DISPLAY_ORDER_CLOWN 11
//#define JOB_DISPLAY_ORDER_MIME 12
//#define JOB_DISPLAY_ORDER_CURATOR 13
//#define JOB_DISPLAY_ORDER_LAWYER 14
//#define JOB_DISPLAY_ORDER_TOURIST 15
#define JOB_DISPLAY_ORDER_CLERK 16
#define JOB_DISPLAY_ORDER_CHAPLAIN 17
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 18
#define JOB_DISPLAY_ORDER_STATION_ENGINEER 19
#define JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN 20
//#define JOB_DISPLAY_ORDER_SIGNAL_TECHNICIAN 21
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 22
#define JOB_DISPLAY_ORDER_MEDICAL_DOCTOR 23
//#define JOB_DISPLAY_ORDER_CHEMIST 24
#define JOB_DISPLAY_ORDER_GENETICIST 25
//#define JOB_DISPLAY_ORDER_VIROLOGIST 26
//#define JOB_DISPLAY_ORDER_MINING_MEDIC 27
//#define JOB_DISPLAY_ORDER_PARAMEDIC 28
//#define JOB_DISPLAY_ORDER_PSYCHIATRIST 29
#define JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR 30
#define JOB_DISPLAY_ORDER_SCIENTIST 31
#define JOB_DISPLAY_ORDER_ROBOTICIST 32
#define JOB_DISPLAY_ORDER_HEAD_OF_SECURITY 33
#define JOB_DISPLAY_ORDER_WARDEN 34
#define JOB_DISPLAY_ORDER_DETECTIVE 35
#define JOB_DISPLAY_ORDER_SECURITY_OFFICER 36
*/

#define JOB_DISPLAY_ORDER_AI 37
#define JOB_DISPLAY_ORDER_CYBORG 38 //yogs end - this list was changed to include the yogs jobs
