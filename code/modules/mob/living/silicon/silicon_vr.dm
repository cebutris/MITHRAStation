/mob/living/silicon/Topic(href, href_list) //For Robots and pAI's. And possibly AI's too.
	if(href_list["ooc_notes"])
		src.Examine_OOC()
		return 1
	return ..()

/var/global/datum/telltale/code_modules_mob_living_silicon_silicon_vr_dm = new("[__FILE__]")
