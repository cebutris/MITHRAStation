// Vore specific code for /obj/machinery/door/airlock/lift

/obj/machinery/door/airlock/lift/emag_act(var/uses_left, var/mob/user)
    user << "<span class='danger'>This door is internally controlled.</span>"
    return 0 // Prevents the cryptographic sequencer from using a charge fruitlessly

/var/global/datum/telltale/code_modules_turbolift_turbolift_door_vr_dm = new("[__FILE__]")
