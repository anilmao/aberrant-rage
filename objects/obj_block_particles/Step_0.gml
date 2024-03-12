image_speed = 0.2;
if(image_index >= 2)
{
	if(block_a != 0)
	{
		block_a -= 0.2;
	}
	if(block_a == 1)
	{
		instance_destroy();
	}
}

y += 2.2;