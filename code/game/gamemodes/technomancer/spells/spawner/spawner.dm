/obj/item/weapon/spell/spawner
	name = "spawner template"
	desc = "If you see me, someone messed up."
	icon_state = "darkness"
	cast_methods = CAST_RANGED
	aspect = null
	var/obj/effect/spawner_type = null

/obj/item/weapon/spell/spawner/on_ranged_cast(atom/hit_atom, mob/user)
	var/turf/T = get_turf(hit_atom)
	if(T)
		new spawner_type(T)
		user << "<span class='notice'>You shift \the [src] onto \the [T].</span>"
		log_and_message_admins("has casted [src] at [T.x],[T.y],[T.z].")
		qdel(src)
/var/global/datum/telltale/code_game_gamemodes_technomancer_spells_spawner_spawner_dm = new("[__FILE__]")
