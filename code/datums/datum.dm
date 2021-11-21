/datum
	var/tmp/gc_destroyed //Time when this object was destroyed.
	var/tmp/datum/controller/subsystem/processing/is_processing = FALSE
	var/list/active_timers  //for SStimer
	var/implements_dummy = FALSE	//If true, this datum has an argument named "dummy" in its new proc

	//Used by mob previews
	var/dummy = FALSE	//Set true if this datum is a dummy and should not perform its normal functions

	/// Status traits attached to this datum
	var/list/status_traits

	/**
	  * Components attached to this datum
	  *
	  * Lazy associated list in the structure of `type:component/list of components`
	  */
	var/list/datum_components
	/**
	  * Any datum registered to receive signals from this datum is in this list
	  *
	  * Lazy associated list in the structure of `signal:registree/list of registrees`
	  */
	var/list/comp_lookup
	/// Lazy associated list in the structure of `signals:proctype` that are run when the datum receives that signal
	var/list/list/datum/callback/signal_procs

	/*
	* Lazy associative list of currently active cooldowns.
	*
	* cooldowns [ COOLDOWN_INDEX ] = add_timer()
	* add_timer() returns the truthy value of -1 when not stoppable, and else a truthy numeric index
	*/
	var/list/cooldowns

	/// Datum level flags
	var/datum_flags = NONE

	/// A weak reference to another datum
	var/datum/weakref/weak_reference

#ifdef TESTING
	var/tmp/running_find_references
	var/tmp/last_find_references = 0
#endif

// The following vars cannot be edited by anyone
/datum/VV_static()
	return ..() + list("gc_destroyed", "is_processing")

// Default implementation of clean-up code.
// This should be overridden to remove all references pointing to the object being destroyed.
// Return the appropriate QDEL_HINT; in most cases this is QDEL_HINT_QUEUE.
/datum/proc/Destroy(force=FALSE, ...)
	SHOULD_CALL_PARENT(TRUE)
	tag = null
	datum_flags &= ~DATUM_FLAG_WEAKREF_USE_TAG //In case something tries to REF us
	weak_reference = null //ensure prompt GCing of weakref.

	SSnano && SSnano.close_uis(src)
	var/list/timers = active_timers
	active_timers = null
	for(var/thing in timers)
		var/datum/timedevent/timer = thing
		if (timer.spent)
			continue
		qdel(timer)
	return QDEL_HINT_QUEUE

/datum/proc/Process()
	set waitfor = 0
	return PROCESS_KILL

/datum/proc/CanProcCall(procname)
	return TRUE

/**
  * Callback called by a timer to end an associative-list-indexed cooldown.
  *
  * Arguments:
  * * source - datum storing the cooldown
  * * index - string index storing the cooldown on the cooldowns associative list
  *
  * This sends a signal reporting the cooldown end.
  */
/proc/end_cooldown(datum/source, index)
	if(QDELETED(source))
		return
	SEND_SIGNAL(source, COMSIG_CD_STOP(index))
	TIMER_COOLDOWN_END(source, index)


/**
  * Proc used by stoppable timers to end a cooldown before the time has ran out.
  *
  * Arguments:
  * * source - datum storing the cooldown
  * * index - string index storing the cooldown on the cooldowns associative list
  *
  * This sends a signal reporting the cooldown end, passing the time left as an argument.
  */
/proc/reset_cooldown(datum/source, index)
	if(QDELETED(source))
		return
	SEND_SIGNAL(source, COMSIG_CD_RESET(index), S_TIMER_COOLDOWN_TIMELEFT(source, index))
	TIMER_COOLDOWN_END(source, index)
