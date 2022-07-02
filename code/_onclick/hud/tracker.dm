//A tracker is a screen object which is bound not only to the client screen,but also to an inworld atom.
//It will strive, as much as possible, to track the location of that atom, and adjust its screen position so it is overlaid on that atom
//If the specified atom is not onscreen, the tracker will turn invisible, but keep tracking

/atom/movable/screen/movable/tracker
	var/client/C
	var/mob/origin	//Todo: Accomodate for origin possibly changing
	var/atom/tracked
	alpha = 128
	icon = 'icons/hud/screen1.dmi'
	icon_state = "health6"
	var/lifetimer
	mouse_opacity = 0

/atom/movable/screen/movable/tracker/New(var/mob/host, var/atom/_tracked, var/lifetime)
	if (host.client)
		origin = host
		C = origin.client
		tracked = _tracked
		setup()
		C.screen |= src
		if (lifetime)
			set_lifetime(lifetime)
		.=..()
	else
		//Can't add it to a mob without a client
		qdel(src)
		return

/atom/movable/screen/movable/tracker/proc/setup()
	return

/atom/movable/screen/movable/tracker/proc/set_lifetime(var/lifetime)
	deltimer(lifetimer)
	lifetimer = addtimer(CALLBACK(src, /atom/movable/screen/movable/tracker/proc/end), lifetime,  TIMER_STOPPABLE)

/atom/movable/screen/movable/tracker/proc/end()
	deltimer(lifetimer)
	qdel(src)

/atom/movable/screen/movable/tracker/Initialize()
	.=..()
	RegisterSignal(origin, list(COMSIG_MOVABLE_MOVED, COMSIG_ATOM_DIR_CHANGE, COMSIG_MOB_VIEW_CHANGED), .proc/update)
	RegisterSignal(tracked, COMSIG_MOVABLE_MOVED, .proc/update)

	INVOKE_ASYNC(src, .proc/update)

/atom/movable/screen/movable/tracker/Destroy()
	clear_from_screen()
	.=..()

/atom/movable/screen/movable/tracker/proc/clear_from_screen()
	if (C)
		C.screen -= src

/atom/movable/screen/movable/tracker/hide()
	screen_loc = "CENTER"
	alpha = 0

/atom/movable/screen/movable/tracker/proc/update()
	SIGNAL_HANDLER
	if (QDELETED(tracked) || QDELETED(origin))
		qdel(src)	//if our target atom is gone, so are we
		return

	if (!origin.client || !C)//Player logged out?
		qdel(src)
		return

	if (origin.client && origin.client != C)	//Someone else posessed the player? Lets transfer ourselves to the new client
		clear_from_screen()
		C = origin.client

	alpha = initial(alpha)

	var/atom/track_target
	if (isturf(tracked.loc))
		track_target = tracked	//If our target is on a turf, we move to it
	else
		track_target = get_turf(tracked) //If its hidden inside an object, we move to its tile

	//Ok, now lets see if the target is onscreen,
	//First we've got to figure out what onscreen is

	//The point we work from, the client eye. Which is probably screen centre, but there can be offsets
	if (origin.z != track_target.z)
		//If its on another zlevel we can't see it
		//Possible todo: Add support for openspace/transparent floors and seeing things below. But not now
		hide()
		return

	//Lets get how far the screen extends around the origin
	var/list/bound_offsets = C.get_tile_bounds(FALSE) //Cut off partial tiles or they might stretch the screen
	var/vector2/delta = get_new_vector(track_target.x - origin.x, track_target.y - origin.y)	//Lets get the position delta from origin to target
	//Now check whether or not that would put it onscreen
	//Bottomleft first
	var/vector2/BL = bound_offsets["BL"]
	if (delta.x < BL.x || delta.y < BL.y)
		//Its offscreen
		hide()
		release_vector(delta)
		release_vector_assoc_list(bound_offsets)
		return


	//Then topright
	var/vector2/TR = bound_offsets["TR"]
	if (delta.x > TR.x || delta.y > TR.y)
		//Its offscreen
		hide()
		release_vector(delta)
		release_vector_assoc_list(bound_offsets)
		return


	//If we get here, the target is on our screen!
	//Lets place it
	delta.SelfAdd(bound_offsets["OFFSET"])
	delta.x += C.view + 1
	delta.y += C.view + 1
	screen_loc = "[encode_screen_X(delta.x, origin)],[encode_screen_Y(delta.y,origin)]"
	release_vector(delta)
	release_vector_assoc_list(bound_offsets)
	//AAaaand done