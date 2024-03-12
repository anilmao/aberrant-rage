function scr_resetplayer()
{
	if(rage_meter > 0)
	{
		state = playerstate.rage;
	}
	else
	{
		state = playerstate.normal;
	}
	mask_index = spr_player_idle;
}