hspeed = -4;

if(place_meeting(x,y,obj_player))
{
	if(obj_player.state != playerstate.rage_attack1 || obj_player.state == playerstate.rage_attack2)
	{
		if(damage)
		{
			obj_player.hp -= 3;
			hspeed = 0;
			damage = false;
		}
	}
	else
	{
		turned = true;
	}
}
if(turned)
{
	hspeed = 4;
}