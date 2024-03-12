if(!cinematic)
{
	if(f_state == fade_in)
	{
		if(fade_a != 1)
		{
			fade_a += 0.05;
		}
		else
		{
			if(roomtogo != noone)
			{
				room_goto(roomtogo);
			}
			with(obj_player)
			{
				canmove = false;
				canjump = false;
				canrage = false;
				xpsd = 0;
				yspd = 0;
				if(other.xtogo != noone && other.ytogo != noone)
				{
					x = other.xtogo;
					y = other.ytogo;
				}
			}
			f_state = fade_out;
		}
	}
	if(f_state == fade_out)
	{
		if(fade_a != 0)
		{
			fade_a -= 0.05;
		}
		else
		{
			with(obj_player)
			{
				canmove = true;
				canjump = true;
				canrage = true;
			}
			instance_destroy();
		}
	}
}