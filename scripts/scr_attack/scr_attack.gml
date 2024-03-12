function scr_attack(argument0, argument1, argument2,argument3,argument4)
{
	canmove = false;
	canjump = false;
	xpsd = 0;
	yspd = 0;
	
	if(sprite_index != argument0)
	{
		sprite_index = argument0;
		image_speed = argument3;
		ds_list_clear(hit);
	}
	if(player_dir != -1)
	{
		mask_index = argument1;
	}
	else
	{
		mask_index = argument2;
	}
	var hitnow = ds_list_create();
	var hits = instance_place_list(x,y,obj_enemy,hitnow,false);
	if(hits > 0)
	{
		for (var i = 0; i < hits; ++i) 
		{
			var hitID = hitnow[|i];
			if(ds_list_find_index(hit,hitID) == -1)
			{
				ds_list_add(hit,hitID);
				with(hitID)
				{
					scr_hurt_enemy(argument4);
					if(other.idle_rage_decrease)
					{
						other.idle_rage_decrease = false;
					}
				}
			}
		}
	}
	canmove = true;
	canjump = true;
	ds_list_destroy(hitnow);
}