/datum/technomancer/spell/dispel
	name = "Dispel"
	desc = "Ends most on-going effects caused by another Technomancer function on the target.  Useful if you are worried about \
	hitting an ally with a deterimental function, if your opponent has similar capabilities to you, or if you're tired of Instability \
	plaguing you."
	cost = 25
	obj_path = /obj/item/weapon/spell/dispel
	ability_icon_state = "tech_dispel"
	category = SUPPORT_SPELLS

/obj/item/weapon/spell/dispel
	name = "dispel"
	desc = "Useful if you're tired of glowing because of a miscast."
	icon_state = "dispel"
	cast_methods = CAST_RANGED
	aspect = ASPECT_BIOMED

/obj/item/weapon/spell/dispel/on_ranged_cast(atom/hit_atom, mob/living/user)
	if(isliving(hit_atom) && within_range(hit_atom) && pay_energy(1000))
		var/mob/living/target = hit_atom
		target.remove_modifiers_of_type(/datum/modifier/technomancer)
	user.adjust_instability(10)
	qdel(src)
/var/global/datum/telltale/code_game_gamemodes_technomancer_spells_dispel_dm = new("[__FILE__]")
