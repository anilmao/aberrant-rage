depth = 1;
if(global.bossfight == -1)
{
	if(global.rage)
	{
		open = true;
	}
}

if(open)
{
	image_index = 1;
	if(enemies_inside > 0)
	{
		for (var i = 0; i < enemies_inside; i++)
		{
		    if(enemies_to_spawn != noone)
			{
				if(alarm[0] == -1)
				{
					alarm[0] = room_speed * spawn_delay;
				}
			}
		}
	}
}
else
{
	image_index = 0;
}