switch(room)
{
	case rm_lab_start_2:
		talk = true;
		cur_msg = msg[0];
	break;
	case rm_boss_arena:
		talk = true;
		cur_msg = msg[3];
	break;
	case rm_lab_6:
		talk = true;
		cur_msg = msg[2];
	break;
	
}
if(talk)
{
	if(text_state == 0)
	{
		if(text_a != 1)
		{
			text_a += 0.1;
		}
		else
		{
			if(alarm[0] == -1)
			{
				alarm[0] = room_speed * 2;
			}
		}
	}
	if(text_state == 1)
	{
		if(text_a != 0)
		{
			text_a -= 0.1;
		}
		else
		{
			talk = false;
		}
	}
}