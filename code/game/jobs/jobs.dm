#define ENG               (1<<0)
#define SEC               (1<<1)
#define MED               (1<<2)
#define SCI               (1<<3)
#define CIV               (1<<4)
#define COM               (1<<5)
#define MSC               (1<<6)
#define SRV               (1<<7)
#define SUP               (1<<8)
#define SPT               (1<<9)
#define MIN               (1<<10)

GLOBAL_LIST_EMPTY(assistant_occupations)

GLOBAL_LIST_EMPTY(command_positions)

GLOBAL_LIST_EMPTY(engineering_positions)

GLOBAL_LIST_EMPTY(medical_positions)

GLOBAL_LIST_EMPTY(science_positions)

GLOBAL_LIST_EMPTY(civilian_positions)

GLOBAL_LIST_EMPTY(security_positions)

GLOBAL_LIST_INIT(nonhuman_positions, list("pAI"))

GLOBAL_LIST_EMPTY(service_positions)

GLOBAL_LIST_EMPTY(supply_positions)

GLOBAL_LIST_EMPTY(support_positions)

GLOBAL_LIST_EMPTY(mining_positions)

GLOBAL_LIST_EMPTY(unsorted_positions) // for nano manifest


/proc/guest_jobbans(var/job)
	return ((job in GLOB.command_positions) || (job in GLOB.nonhuman_positions) || (job in GLOB.security_positions))

/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)	continue
		occupations += job

	return occupations

/proc/get_alternate_titles(var/job)
	var/list/jobs = get_job_datums()
	var/list/titles = list()

	for(var/datum/job/J in jobs)
		if(J.title == job)
			titles = J.alt_titles

	return titles
