
/datum/element/turf_z_transparency
	element_flags = ELEMENT_DETACH

///This proc sets up the signals to handle updating viscontents when turfs above/below update. Handle plane and layer here too so that they don't cover other obs/turfs in Dream Maker
/datum/element/turf_z_transparency/Attach(datum/target)
	. = ..()
	if(!isturf(target))
		return ELEMENT_INCOMPATIBLE

	var/turf/our_turf = target

	our_turf.layer = OPENSPACE_LAYER
	our_turf.plane = OPENSPACE_PLANE

	RegisterSignal(target, COMSIG_TURF_MULTIZ_DEL, .proc/on_multiz_turf_del)
	RegisterSignal(target, COMSIG_TURF_MULTIZ_NEW, .proc/on_multiz_turf_new)

	var/turf/below_turf = GetBelow(our_turf)
	if(below_turf)
		our_turf.vis_contents += below_turf
	update_multi_z(our_turf)

/datum/element/turf_z_transparency/Detach(datum/source)
	. = ..()
	var/turf/our_turf = source
	our_turf.vis_contents.len = 0
	UnregisterSignal(our_turf, list(COMSIG_TURF_MULTIZ_NEW, COMSIG_TURF_MULTIZ_DEL))

///Updates the viscontents or underlays below this tile.
/datum/element/turf_z_transparency/proc/update_multi_z(turf/our_turf)
	var/turf/below_turf = GetBelow(our_turf)
	if(!below_turf)
		our_turf.vis_contents.len = 0
		add_baseturf_underlay(our_turf)
	return TRUE

/datum/element/turf_z_transparency/proc/on_multiz_turf_del(turf/our_turf, turf/below_turf, dir)
	SIGNAL_HANDLER

	if(dir != DOWN)
		return

	update_multi_z(our_turf)

/datum/element/turf_z_transparency/proc/on_multiz_turf_new(turf/our_turf, turf/below_turf, dir)
	SIGNAL_HANDLER

	if(dir != DOWN)
		return

	update_multi_z(our_turf)

///Called when there is no real turf below this turf
/datum/element/turf_z_transparency/proc/add_baseturf_underlay(turf/our_turf)
	our_turf.ChangeTurf(/turf/simulated/floor/plating, keep_air = TRUE)
	var/turf/path = GLOB.using_map.base_floor_type || /turf/space
	if(!ispath(path))
		path = text2path(path)
		if(!ispath(path))
			warning("Z-level [our_turf.z] has invalid baseturf '[GLOB.using_map.base_floor_type]'")
			path = /turf/space
	var/mutable_appearance/underlay_appearance = mutable_appearance(initial(path.icon), initial(path.icon_state), layer = TURF_LAYER-0.02, plane = SPACE_PLANE)
	underlay_appearance.appearance_flags = RESET_ALPHA | RESET_COLOR
	our_turf.underlays += underlay_appearance
