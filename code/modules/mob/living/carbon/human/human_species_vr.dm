/mob/living/carbon/human/dummy
	no_vore = TRUE //Dummies don't need bellies.

/mob/living/carbon/human/sergal/New(var/new_loc)
	h_style = "Sergal Plain"
	..(new_loc, "Sergal")

/mob/living/carbon/human/akula/New(var/new_loc)
	..(new_loc, "Akula")

/mob/living/carbon/human/nevrean/New(var/new_loc)
	..(new_loc, "Nevrean")

/mob/living/carbon/human/xenochimera/New(var/new_loc)
	..(new_loc, "Xenochimera")

/mob/living/carbon/human/xenohybrid/New(var/new_loc)
	..(new_loc, "Xenomorph Hybrid")

/mob/living/carbon/human/spider/New(var/new_loc)
	..(new_loc, "Vasilissan")
/var/global/datum/telltale/code_modules_mob_living_carbon_human_human_species_vr_dm = new("[__FILE__]")
