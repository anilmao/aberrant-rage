function scr_enemystate_alive()
{
	flash_a = 1;
	if(sprite_index != idle_spr)
	{
		sprite_index = idle_spr;
	}
	image_speed = 0.05;
	
	xspd = move_dir * enemy_spd;
	
	if(obj_player.state == playerstate.normal)
	{
		if(place_meeting(x,y-2,obj_player))
		{
			if(obj_player.onground == false)
			{
				obj_player.cangethurt = false;
				scr_hurt_enemy(1);
				with(obj_player)
				{
					yspd = jump_spd;
					rage_meter += other.ragetogive;
					cangethurt = true;
				}
			}
		}
	}
	if(place_meeting(x,y,obj_player))
	{
		with(obj_player)
		{
			if(state != playerstate.rage_hammer_land)
			{
				if(cangethurt && onground)
				{
					hp -= other.damage;
					cangethurt = false;
					alarm[1] = 60;
				}
			}
		}
	}
	var subpx = .5;
	if(place_meeting(x+xspd,y,obj_wall))
	{
		if(!place_meeting(x+xspd,y-abs(xspd)-1,obj_wall))
		{
			while(place_meeting(x+xspd,y,obj_wall))
			{
				y -= subpx;
			}
		}
		else
		{
			var px = subpx * sign(xspd);
			while(!place_meeting(x+px,y,obj_wall))
			{
				x+=px;
			}
			xspd = 0;
			if(move_dir == 1)
			{
				move_dir = -1;
			}
			else
			{
				move_dir = 1;
			}
		}
	}
	x += xspd;
	
	if(yspd >= 0 && !place_meeting(x+xspd,y+1,obj_wall) && place_meeting(x+xspd,y+abs(xspd)+1,obj_wall))
	{
		while(!place_meeting(x+xspd, y+subpx,obj_wall))
		{
			y+= subpx;
		}
	}
	
	yspd += grav;
	
	var subpx = .5;
	if(place_meeting(x,y+yspd,obj_wall))
	{
		var px = subpx * sign(yspd);
		while(!place_meeting(x,y+px,obj_wall))
		{
			y+=px;
		}
		yspd = 0;
	}
	y += yspd;
}
function scr_enemystate_hit()
{
	if(flash_a != 0)
	{
		flash_a -= 0.05;
	}
	else
	{
		state = enemystate.alive;
	}
}
function scr_enemystate_dead()
{

	if(d_sound != noone)
	{
		if(playsound)
		{
			if(!audio_is_playing(d_sound))
			{
				audio_play_sound(d_sound,2,false);
			}
			playsound = false;
		}
	}
	sprite_index = dead_spr;
	image_speed = 0;
	if(irandom(4) == 1)
	{
		make_health = true;
	}
	if(flash_a != 0)
	{
		flash_a -= 0.05;
	}
	if(enemy_a != 0)
	{
		enemy_a -= 0.03;
	}
	if(enemy_a <= 0)
	{
		if(make_health)
		{
			if(obj_player.hp < obj_player.maxhp)
			{
				instance_create_layer(x,y-10,"player",obj_health_drop);
			}
			make_health = false;
		}
		instance_destroy();
	}
}