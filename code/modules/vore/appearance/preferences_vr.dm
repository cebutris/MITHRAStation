/**
 * Additional variables that must be defined on /mob/living/carbon/human
 * for use in code that is part of the vore modules.
 *
 * These variables are declared here (separately from the normal human_defines.dm)
 * in order to isolate VOREStation changes and ease merging of other codebases.
 */

// Additional vars
/mob/living/carbon/human

	// Horray Furries!
	var/datum/sprite_accessory/ears/ear_style = null
	var/r_ears = 30
	var/g_ears = 30
	var/b_ears = 30
	var/r_ears2 = 30
	var/g_ears2 = 30
	var/b_ears2 = 30
	var/datum/sprite_accessory/tail/tail_style = null
	var/r_tail = 30
	var/g_tail = 30
	var/b_tail = 30
	var/r_tail2 = 30
	var/g_tail2 = 30
	var/b_tail2 = 30
	var/datum/sprite_accessory/tail/wing_style = null
	var/r_wing = 30
	var/g_wing = 30
	var/b_wing = 30

	// Custom Species Name
	var/custom_species

/var/global/datum/telltale/code_modules_vore_appearance_preferences_vr_dm = new("[__FILE__]")
