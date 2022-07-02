/*
	List generation helpers
*/
/proc/get_filtered_areas(var/list/predicates = list(/proc/is_area_with_turf))
	. = list()
	if(!predicates)
		return
	if(!islist(predicates))
		predicates = list(predicates)
	for(var/area/A)
		if(all_predicates_true(list(A), predicates))
			. += A

/proc/get_area_turfs(var/area/A, var/list/predicates)
	. = new/list()
	A = istype(A) ? A : locate(A)
	if(!A)
		return
	for(var/turf/T in A.contents)
		if(!predicates || all_predicates_true(list(T), predicates))
			. += T

/proc/get_subarea_turfs(var/area/A, var/list/predicates)
	. = new/list()
	A = istype(A) ? A.type : A
	if(!A)
		return
	for(var/sub_area_type in typesof(A))
		var/area/sub_area = locate(sub_area_type)
		for(var/turf/T in sub_area.contents)
			if(!predicates || all_predicates_true(list(T), predicates))
				. += T

/proc/group_areas_by_name(var/list/predicates)
	. = list()
	for(var/area/A in get_filtered_areas(predicates))
		group_by(., A.name, A)

/proc/group_areas_by_z_level(var/list/predicates)
	. = list()
	for(var/area/A in get_filtered_areas(predicates))
		group_by(., num2text(A.z), A)

/*
	Pick helpers
*/
// Changes the area of T to A. Do not do this manually.
// Area is expected to be a non-null instance.
/proc/ChangeArea(turf/T, area/A)
	if(!istype(A))
		CRASH("Area change attempt failed: invalid area supplied.")
	var/area/old_area = get_area(T)
	if(old_area == A)
		return
	A.contents.Add(T)
	if(old_area)
		old_area.Exited(T, A)
		for(var/atom/movable/AM in T)
			old_area.Exited(AM, A)  // Note: this _will_ raise exited events.
	A.Entered(T, old_area)
	for(var/atom/movable/AM in T)
		A.Entered(AM, old_area) // Note: this will _not_ raise moved or entered events. If you change this, you must also change everything which uses them.

/area/proc/get_clear_turf()
	return clear_turf_in_list(get_area_turfs(src), ignore_mobs = TRUE)

/proc/pick_subarea_turf(var/areatype, var/list/predicates)
	var/list/turfs = get_subarea_turfs(areatype, predicates)
	if(turfs && turfs.len)
		return pick(turfs)

/proc/pick_area_turf(var/areatype, var/list/predicates)
	var/list/turfs = get_area_turfs(areatype, predicates)
	if(turfs && turfs.len)
		return pick(turfs)

/proc/pick_area(var/list/predicates)
	var/list/areas = get_filtered_areas(predicates)
	if(areas && areas.len)
		. = pick(areas)

/proc/pick_area_and_turf(var/list/area_predicates, var/list/turf_predicates)
	var/area/A = pick_area(area_predicates)
	if(!A)
		return
	return pick_area_turf(A, turf_predicates)



/*
	Predicate Helpers
*/
/proc/is_station_area(var/area/A)
	. = isStationLevel(A.z)

/proc/is_contact_area(var/area/A)
	. = isContactLevel(A.z)

/proc/is_player_area(var/area/A)
	. = isPlayerLevel(A.z)

/proc/is_not_space_area(var/area/A)
	. = !istype(A,/area/space)

/proc/is_not_shuttle_area(var/area/A)
	. = !istype(A,/area/shuttle)

/proc/is_area_with_turf(var/area/A)
	. = isnum(A.x)

/proc/is_area_without_turf(var/area/A)
	. = !is_area_with_turf(A)

/proc/is_maint_area(var/area/A)
	. = istype(A,/area/maintenance)

/proc/area_corrupted(var/atom/A, var/require_support = TRUE)
	var/area/T = get_area(A)
	for (var/obj/effect/vine/corruption/C in T)
		if (!require_support || C.is_supported())
			return TRUE


	return FALSE

/proc/area_contains_necromorphs(var/atom/A)
	var/area/T = get_area(A)
	for (var/mob/living/L in T)
		if (L.stat != DEAD && L.is_necromorph())
			return TRUE

	return FALSE

/proc/area_contains_crew(var/atom/A)
	var/area/T = (isarea(A) ? A : get_area(A))
	for (var/mob/living/L in T.contents)
		if (L.stat != DEAD && L.is_crew_aligned())
			return TRUE

	return FALSE

//Makes all the entrypoints to an area indestructible
/area/proc/seal()
	for (var/turf/T in contents)
		if (isfloor(T))
			T.make_indestructible()

		else if (iswall(T))
			T.make_indestructible()



//Is this turf adjacent to another area?
/atom/proc/is_on_area_border()
	var/area/our_area = get_area(src)
	for (var/turf/T in orange(1, get_turf(src)))
		if (T.loc != our_area)
			return TRUE

	return FALSE

GLOBAL_LIST_INIT(is_station_but_not_space_or_shuttle_area, list(/proc/is_station_area, /proc/is_not_space_area, /proc/is_not_shuttle_area))

GLOBAL_LIST_INIT(is_contact_but_not_space_or_shuttle_area, list(/proc/is_contact_area, /proc/is_not_space_area, /proc/is_not_shuttle_area))

GLOBAL_LIST_INIT(is_player_but_not_space_or_shuttle_area, list(/proc/is_player_area, /proc/is_not_space_area, /proc/is_not_shuttle_area))

GLOBAL_LIST_INIT(is_station_area, list(/proc/is_station_area))

GLOBAL_LIST_INIT(is_station_and_maint_area, list(/proc/is_station_area, /proc/is_maint_area))



/*
	Misc Helpers
*/
#define teleportlocs area_repository.get_areas_by_name_and_coords(GLOB.is_player_but_not_space_or_shuttle_area)
#define stationlocs area_repository.get_areas_by_name(GLOB.is_player_but_not_space_or_shuttle_area)
#define wizteleportlocs area_repository.get_areas_by_name(GLOB.is_station_area)
#define maintlocs area_repository.get_areas_by_name(GLOB.is_station_and_maint_area)
#define wizportallocs area_repository.get_areas_by_name(GLOB.is_station_but_not_space_or_shuttle_area)
