/datum/job
	//Requires a ckey to be whitelisted in jobwhitelist.txt
	var/whitelist_only = 0

	//Does not display this job on the occupation setup screen
	var/latejoin_only = 0

	//Every hour playing this role gains this much time off. (Can be negative for off duty jobs!)
	var/timeoff_factor = 3

// Check client-specific availability rules.
/datum/job/proc/player_has_enough_pto(client/C)
	return timeoff_factor >= 0 || (C && LAZYACCESS(C.department_hours, department) > 0)

/var/global/datum/telltale/code_game_jobs_job_job_vr_dm = new("[__FILE__]")
