function scr_ragecontrol()
{
	if(rage)
	{
		if(rage_meter != 0)
		{
			rage_meter -= 0.15;
		}
		else
		{
			state = playerstate.normal;
		}
	}
	else
	{
		if(do_idle_rage)
		{
			if(idle_rage_decrease)
			{
				if(rage_meter != 0)
				{
					rage_meter -= 0.25;
				}
				else
				{
					idle_rage_decrease = false;
				}
			}
			else
			{
				if(alarm[0] == -1)
				{
					alarm[0] = room_speed * 20; //20 seconds
				}
			}
		}
	}
}