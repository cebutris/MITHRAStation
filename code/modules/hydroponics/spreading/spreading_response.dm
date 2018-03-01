/obj/effect/plant/HasProximity(var/atom/movable/AM)

	if(!is_mature() || seed.get_trait(TRAIT_SPREAD) != 2)
		return

	var/mob/living/M = AM
	if(!istype(M))
		return

	if(!has_buckled_mobs() && !M.buckled && !M.anchored && (issmall(M) || prob(round(seed.get_trait(TRAIT_POTENCY)/3))))
		//wait a tick for the Entered() proc that called HasProximity() to finish (and thus the moving animation),
		//so we don't appear to teleport from two tiles away when moving into a turf adjacent to vines.
		spawn(1)
			entangle(M)

/obj/effect/plant/attack_hand(var/mob/user)
	manual_unbuckle(user)

/obj/effect/plant/attack_generic(var/mob/user)
	manual_unbuckle(user)

/obj/effect/plant/Crossed(atom/movable/O)
	if(isliving(O))
		trodden_on(O)

/obj/effect/plant/proc/trodden_on(var/mob/living/victim)
	if(!is_mature())
		return
	var/mob/living/carbon/human/H = victim
	if(prob(round(seed.get_trait(TRAIT_POTENCY)/3)))
		entangle(victim)
	if(istype(H) && H.shoes)
		return
	seed.do_thorns(victim,src)
	seed.do_sting(victim,src,pick("r_foot","l_foot","r_leg","l_leg"))

/obj/effect/plant/proc/unbuckle()
	if(has_buckled_mobs())
		for(var/A in buckled_mobs)
			var/mob/living/L = A
			if(L.buckled == src)
				L.buckled = null
				L.anchored = initial(L.anchored)
				L.update_canmove()
		buckled_mobs = list()
	return

/obj/effect/plant/proc/manual_unbuckle(mob/user as mob)
	if(has_buckled_mobs())
		var/chance = 20
		if(seed)
			chance = round(100/(20*seed.get_trait(TRAIT_POTENCY)/100))
		if(prob(chance))
			for(var/A in buckled_mobs)
				var/mob/living/L = A
				if(!(user in buckled_mobs))
					L.visible_message(\
					"<span class='notice'>\The [user] frees \the [L] from \the [src].</span>",\
					"<span class='notice'>\The [user] frees you from \the [src].</span>",\
					"<span class='warning'>You hear shredding and ripping.</span>")
				else
					L.visible_message(\
					"<span class='notice'>\The [L] struggles free of \the [src].</span>",\
					"<span class='notice'>You untangle \the [src] from around yourself.</span>",\
					"<span class='warning'>You hear shredding and ripping.</span>")
				unbuckle()
		else
			user.setClickCooldown(user.get_attack_speed())
			health -= rand(1,5)
			var/text = pick("rip","tear","pull", "bite", "tug")
			user.visible_message(\
			"<span class='warning'>\The [user] [text]s at \the [src].</span>",\
			"<span class='warning'>You [text] at \the [src].</span>",\
			"<span class='warning'>You hear shredding and ripping.</span>")
			check_health()
			return

/obj/effect/plant/proc/entangle(var/mob/living/victim)

	if(has_buckled_mobs())
		return

	if(victim.buckled || victim.anchored)
		return

	//grabbing people
	if(!victim.anchored && Adjacent(victim) && victim.loc != src.loc)
		var/can_grab = 1
		if(istype(victim, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = victim
			if(istype(H.shoes, /obj/item/clothing/shoes/magboots) && (H.shoes.item_flags & NOSLIP))
				can_grab = 0
		if(can_grab)
			src.visible_message("<span class='danger'>Tendrils lash out from \the [src] and drag \the [victim] in!</span>")
			victim.forceMove(src.loc)
			buckle_mob(victim)
			victim.set_dir(pick(cardinal))
			victim << "<span class='danger'>Tendrils [pick("wind", "tangle", "tighten")] around you!</span>"
			victim.Weaken(0.5)
			seed.do_thorns(victim,src)

/var/global/datum/telltale/code_modules_hydroponics_spreading_spreading_response_dm = new("[__FILE__]")
