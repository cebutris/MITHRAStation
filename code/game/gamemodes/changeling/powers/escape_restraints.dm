/datum/power/changeling/escape_restraints
	name = "Escape Restraints"
	desc = "We evolve more complex joints"
	helptext = "We can instantly escape from most restraints and bindings, but we cannot do it often."
	enhancedtext = "More frequent escapes."
	ability_icon_state = "ling_escape_restraints"
	genomecost = 2
	verbpath = /mob/proc/changeling_escape_restraints

//Escape Cuffs. By design this does not escape from straight jackets
/mob/proc/changeling_escape_restraints()
	set category = "Changeling"
	set name = "Escape Restraints (40)"
	set desc = "Removes handcuffs and legcuffs instantly."

	var/escape_cooldown = 5 MINUTES		//This is used later to prevent spamming
	var/mob/living/carbon/human/C = src
	var/datum/changeling/changeling = changeling_power(40,0,100,CONSCIOUS)
	if(!changeling)
		return 0
	if(world.time < changeling.next_escape)
		to_chat(src, "<span class='warning'>We are still recovering from our last escape...</span>")
		return 0
	if(!(C.handcuffed || C.legcuffed))	// No need to waste chems if there's nothing to break out of
		to_chat(C, "<span class='warning'>We are are not restrained in a way we can escape...</span>")
		return 0

	changeling.chem_charges -= 40

	to_chat(C,"<span class='notice'>We contort our extremities and slip our cuffs.</span>")
	playsound(src, 'sound/effects/blobattack.ogg', 30, 1)
	if(C.handcuffed)
		var/obj/item/weapon/W = C.handcuffed
		C.handcuffed = null
		if(C.buckled && C.buckled.buckle_require_restraints)
			C.buckled.unbuckle_mob()
		C.update_inv_handcuffed()
		if (C.client)
			C.client.screen -= W
		if(W)
			W.loc = C.loc
			W.dropped(C)
			if(W)
				W.layer = initial(W.layer)
	if(C.legcuffed)
		var/obj/item/weapon/W = C.legcuffed
		C.legcuffed = null
		C.update_inv_legcuffed()
		if(C.client)
			C.client.screen -= W
		if(W)
			W.loc = C.loc
			W.dropped(C)
			if(W)
				W.layer = initial(W.layer)

	if(src.mind.changeling.recursive_enhancement)
		escape_cooldown *= 0.5

	changeling.next_escape = world.time + escape_cooldown	//And now we set the timer

	feedback_add_details("changeling_powers","ESR")
	return 1
/var/global/datum/telltale/code_game_gamemodes_changeling_powers_escape_restraints_dm = new("[__FILE__]")
