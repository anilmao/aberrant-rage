image_speed = 0.3;
if(place_meeting(x,y,obj_player))
{
	if(obj_player.state == playerstate.normal || obj_player.state == playerstate.rage)
	{
		obj_player.hp += 1;
		instance_destroy();
	}
}
if(alarm[0] == -1)
{
	alarm[0] = room_speed * 10;
}