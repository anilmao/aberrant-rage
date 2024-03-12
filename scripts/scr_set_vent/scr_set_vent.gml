function scr_set_vent(_enemies_inside = 1, _spawn_delay = 0.5, _enemies_to_spawn = obj_bug_blue)
{
	with(obj_vent)
	{
		enemies_inside = _enemies_inside;
		spawn_delay = _spawn_delay;
		enemies_to_spawn = _enemies_to_spawn;
		
		open = true;
	}
}
function scr_reset_vent()
{
	with(obj_vent)
	{
		open = false;
	}
}