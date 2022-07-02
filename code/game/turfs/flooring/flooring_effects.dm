/obj/effect/damagedfloor
	layer = DECAL_LAYER
	icon = 'icons/turf/flooring/damage.dmi'
	icon_state = "damaged1"

/obj/effect/damagedfloor
	icon_state = "scorched1"

/obj/effect/damagedfloor/Initialize()
	SHOULD_CALL_PARENT(FALSE)
	var/turf/simulated/floor/F = loc
	if(istype(F))
		F.break_tile(1)
	atom_flags |= ATOM_FLAG_INITIALIZED
	return INITIALIZE_HINT_QDEL

/obj/effect/damagedfloor/fire/Initialize()
	SHOULD_CALL_PARENT(FALSE)
	var/turf/simulated/floor/F = loc
	if(istype(F))
		F.burn_tile()
	atom_flags |= ATOM_FLAG_INITIALIZED
	return INITIALIZE_HINT_QDEL

/obj/effect/damagedfloor/rust
	icon_state = "rust"

/obj/effect/damagedfloor/rust/Initialize()
	icon_state = "rust[rand(1,9)]"
	..()
