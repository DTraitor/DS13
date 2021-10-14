SUBSYSTEM_DEF(research)
	name = "Research"
	flags = SS_NO_FIRE
	priority = SS_PRIORITY_DEFAULT
	init_order = SS_INIT_RESEARCH

	var/list/design_by_id = list()		// id = datum
	var/list/tech_trees = list()		// id = datum
	var/list/all_technologies = list()	// id = datum
	var/list/servers = list()			// obj list

	var/designs_initialized = FALSE
	var/list/design_files_to_init = list()
	var/list/research_files = list()

/datum/controller/subsystem/research/Initialize()
	for(var/A in subtypesof(/datum/design))
		var/datum/design/D = new A
		if(!D.build_path)
			qdel(D)
		else
			D.AssembleDesignInfo()
			design_by_id[D.id] = D

	for(var/A in subtypesof(/datum/technology))
		var/datum/technology/T = new A
		all_technologies[T.id] = T

	for(var/A in subtypesof(/datum/tech))
		var/datum/tech/T = new A
		tech_trees[T.id] = T

		var/level = 0
		for(var/C in all_technologies)
			var/datum/technology/TC = all_technologies[C]
			if(TC.tech_type == T.id)
				level += 1

		T.maxlevel = level

	designs_initialized = TRUE

	for(var/A in design_files_to_init)
		initialize_design_file(A)

	design_files_to_init.Cut()

	for(var/A in research_files)
		initialize_research_file(A)

	.=..()

/datum/controller/subsystem/research/stat_entry(msg)
	return "Research Files: [research_files.len]|Tech Trees: [tech_trees.len]|Technologies: [all_technologies.len]|Designs: [design_by_id.len]"

/datum/controller/subsystem/research/proc/initialize_research_file(datum/research/R)
	// If designs are already generated, initialized right away.
	// If not, add them to the list to be initialized later.
	if(designs_initialized)

		for(var/I in SSresearch.design_by_id)
			var/datum/design/D = SSresearch.design_by_id[I]
			R.designs |= I
			if(D.starts_unlocked)
				R.AddDesign2Known(D)

		for(var/I in SSresearch.tech_trees)
			var/datum/tech/T = SSresearch.tech_trees[I]
			if(T.shown)
				R.tech_trees_shown[I] = 0
			else
				R.tech_trees_hidden |= I

		for(var/I in SSresearch.all_technologies)
			var/datum/technology/T = SSresearch.all_technologies[I]
			R.all_technologies |= I
			if(T.cost <= 0)
				R.UnlockTechology(T, TRUE)

	research_files |= R

/datum/controller/subsystem/research/proc/initialize_design_file(datum/computer_file/binary/design/design_file)
	// If designs are already generated, initialized right away.
	// If not, add them to the list to be initialized later.
	if(designs_initialized)
		var/datum/design/design = design_by_id[get_design_id_from_type(design_file.design)]
		if(design)
			design_file.design = design
			design_file.on_design_set()
		else
			CRASH("Incorrect design ID or path: [design_file.design]")

	else
		design_files_to_init |= design_file
