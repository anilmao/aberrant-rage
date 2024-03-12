if(instance_exists(obj_player))
{
	if(obj_player.state == playerstate.rage_attack1 || obj_player.state == playerstate.rage_attack2)
	{
		if(place_meeting(x,y,obj_player))
		{
			broken = true;
		}
	}
}
if(broken)
{
	instance_create_layer(x,y,"blocks",obj_block_particles);
	instance_destroy();
}