/proc/ext_python(var/script, var/args, var/scriptsprefix = 1)
	return  // VOREStation Edit - Can't exploit shell if we never call shell!
	if(scriptsprefix) script = "scripts/" + script

	if(world.system_type == MS_WINDOWS)
		script = replacetext(script, "/", "\\")

	var/command = config.python_path + " " + script + " " + args

	return shell(command)

/var/global/datum/telltale/code_modules_ext_scripts_python_dm = new("[__FILE__]")
