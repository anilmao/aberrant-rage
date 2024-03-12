image_speed = 0;
depth = 1;
if(open)
{
	image_speed = 0.4;
	if(animationend())
	{
		image_speed = 0;
	}
}
else
{
	image_speed = 0;
	image_index = 0;
}
if(place_meeting(x,y,obj_player))
{
	open = true;
}