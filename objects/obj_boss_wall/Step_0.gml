if(state == heyimhere)
{
	x = 184;
	y = 184;
	image_speed = 0.1;
	if(thing_a != 1)
	{
		thing_a += 0.05;
	}
	
}
if(state == goaway)
{
	image_speed = 0;
	if(thing_a != 0)
	{
		thing_a -= 0.08;
	}
	x = 0;
	y = 0;
}