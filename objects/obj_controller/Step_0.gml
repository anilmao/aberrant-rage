depth = -999;
if(instance_exists(obj_player))
{
	global.rage = obj_player.rage;
}
if(global.rage)
{
	global.chroma = true;
}
else
{
	global.chroma = false;
}
if(global.bossfight != -1)
{
	if(!instance_exists(obj_boss_controller))
	{
		instance_create_layer(0,0,"player",obj_boss_controller);
	}
}
if(room == rm_boss_arena)
{
	with(obj_player)
	{
		do_idle_rage = false;
	}
	global.bossfight = 0;
	if(global.bosshealth <= 0)
	{
		with(obj_boss_controller)
		{
			drawbossbar = false;
		}
	}
}
if(room == rm_end || room == rm_death || room == rm_main_menu)
{
	if(shader_current() == shd_chromatic)
	{
		shader_reset();
	}
	if(global.rage)
	{
		global.rage = false;
	}
	if(global.chroma)
	{
		global.chroma = false;
	}
}