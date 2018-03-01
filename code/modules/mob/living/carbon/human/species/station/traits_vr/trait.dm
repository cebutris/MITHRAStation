/datum/trait
	var/name = "Prototype Trait"
	var/desc = "Contact a developer if you see this trait."

	var/cost = 0			// 0 is neutral, negative cost means negative, positive cost means positive.
	var/list/var_changes	// A list to apply to the custom species vars.
	var/list/excludes		// Store a list of paths of traits to exclude, but done automatically if they change the same vars.

//Proc can be overridden lower to include special changes, make sure to call up though for the vars changes
/datum/trait/proc/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	ASSERT(S)
	if(var_changes)
		for(var/V in var_changes)
			S.vars[V] = var_changes[V]
	return

//Similar to the above, but for removing. Probably won't be called often/ever.
/datum/trait/proc/remove(var/datum/species/S)
	ASSERT(S)
	return

/var/global/datum/telltale/code_modules_mob_living_carbon_human_species_station_traits_vr_trait_dm = new("[__FILE__]")
