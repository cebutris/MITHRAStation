/obj/structure/table/rack
	name = "rack"
	desc = "Different from the Middle Ages version."
	icon = 'icons/obj/objects.dmi'
	icon_state = "rack"
	can_plate = 0
	can_reinforce = 0
	flipped = -1

/obj/structure/table/rack/New()
	..()
	verbs -= /obj/structure/table/verb/do_flip
	verbs -= /obj/structure/table/proc/do_put

/obj/structure/table/rack/update_connections()
	return

/obj/structure/table/rack/update_desc()
	return

/obj/structure/table/rack/update_icon()
	if(material) //VOREStation Add for rack colors based on materials
		color = material.icon_colour
	return

/obj/structure/table/rack/holorack/dismantle(obj/item/weapon/wrench/W, mob/user)
	user << "<span class='warning'>You cannot dismantle \the [src].</span>"
	return

/var/global/datum/telltale/code_modules_tables_rack_dm = new("[__FILE__]")
