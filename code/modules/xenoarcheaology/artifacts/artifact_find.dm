/datum/artifact_find
	var/artifact_id
	var/artifact_find_type

/datum/artifact_find/New()

	artifact_id = "[pick("kappa","sigma","antaeres","beta","omicron","iota","epsilon","omega","gamma","delta","tau","alpha")]-[rand(100,999)]"

	artifact_find_type = pick(
	5;/obj/machinery/power/supermatter,
	5;/obj/structure/constructshell,
	5;/obj/machinery/syndicate_beacon,
	25;/obj/machinery/power/supermatter/shard,
	50;/obj/structure/cult/pylon,
	100;/obj/machinery/auto_cloner,
	100;/obj/machinery/giga_drill,
	100;/obj/machinery/replicator,
	150;/obj/structure/crystal,
1000;/obj/machinery/artifact)
/var/global/datum/telltale/code_modules_xenoarcheaology_artifacts_artifact_find_dm = new("[__FILE__]")
