if(global.bossfight == -1)
{
	if(instance_exists(obj_hammer_trail_left))
	{
		fall = true;
	}
}
else
{
	if(global.bosshealth <= 0)
	{
		fall = true;
	}
}
if(fall)
{
	if(place_meeting(x,y+16,obj_wall_invis_block))
	{
		vspeed = 0;
	}
	else
	{
		vspeed = 3;
	}
}