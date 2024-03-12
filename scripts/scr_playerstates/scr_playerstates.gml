function scr_playerstate_normal()
{
	if(rage)
	{
		rage = false;
	}
	if(leftkey)
	{
		player_dir = -1;
	}
	if(rightkey)
	{
		player_dir = 1;
	}
	if(canmove)
	{
		move_dir = rightkey - leftkey;
	
		xpsd = move_dir * move_spd;
	}
	
	var subpx = .5;
	if(place_meeting(x+xpsd,y,obj_wall))
	{
		if(!place_meeting(x+xpsd,y-abs(xpsd)-1,obj_wall))
		{
			while(place_meeting(x+xpsd,y,obj_wall))
			{
				y -= subpx;
			}
		}
		else
		{
			var px = subpx * sign(xpsd);
			while(!place_meeting(x+px,y,obj_wall))
			{
				x+=px;
			}
			xpsd = 0;
		}
	}
	if(yspd >= 0 && !place_meeting(x+xpsd,y+1,obj_wall) && place_meeting(x+xpsd,y+abs(xpsd)+1,obj_wall))
	{
		while(!place_meeting(x+xpsd, y+subpx,obj_wall))
		{
			y+= subpx;
		}
	}
	
	x += xpsd;
	
	yspd += grav;
	
	if(jump_key_pressed)
	{
		jump_key_buff_timer = jump_key_buff_time;
	}
	if(jump_key_buff_timer > 0)
	{
		jump_key_buffered = true;
		jump_key_buff_timer--;
	}
	else
	{
		jump_key_buffered = false;
	}
	if(jump_key_buffered && onground && canjump)
	{
		jump_key_buffered = false;
		jump_key_buff_timer = 0;
		yspd = jump_spd;
	}
	
	if(yspd > vel)
	{
		yspd = vel;
	}
	
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
	
	if(yspd >= 0 && place_meeting(x,y+1,obj_wall))
	{
		onground = true;
	}
	else
	{
		onground = false;
	}
	
	y += yspd;
	
	if(rage_meter >= 80 && !rage)
	{
		if(rage_key_pressed && onground && canrage)
		{
			rage = true;
			rage_sound = true;
			state = playerstate.rage;
		}
	}
	//sprite work
	if(xpsd > 0 || xpsd < 0)
	{
		sprite_index = spr_walk;
		image_speed = 0.2;
		mask_index = spr_walk;
		
		if(sprite_index == spr_walk)
		{
			if(floor(image_index) == 1)
			{
				if(position_meeting(x,y+1,obj_wall_metal) || position_meeting(x,y+1,obj_wall_metal_moss))
				{
					walk_sound = true;
				}
				if(position_meeting(x,y+1,obj_block) || position_meeting(x,y+1,obj_falling_block))
				{
					walk_sound_brick = true;
				}
				}
			if(floor(image_index) == 3)
				{
				if(position_meeting(x,y+1,obj_wall_metal) || position_meeting(x,y+1,obj_wall_metal_moss))
				{
					walk_sound_alt = true;
				}
				if(position_meeting(x,y+1,obj_block) || position_meeting(x,y+1,obj_falling_block))
				{
					walk_sound_brick = true;
				}
			}
		}
		if(walk_sound)
		{
			if(!audio_is_playing(snd_player_walk_1))
			{
				audio_play_sound(snd_player_walk_1,0,false);
				walk_sound = false;
			}
		}
		if(walk_sound_alt)
		{
			if(!audio_is_playing(snd_player_walk_2))
			{
				audio_play_sound(snd_player_walk_2,0,false);
				walk_sound_alt = false;
			}
		}
		if(walk_sound_brick)
		{
			if(!audio_is_playing(snd_brick_walk))
			{
				audio_play_sound(snd_brick_walk,0,false);
				walk_sound_brick = false;
			}
		}
	}
	if(xpsd == 0)
	{
		sprite_index = spr_idle;
		image_speed = 0.05;
		mask_index = spr_idle;
	}
	if(!onground)
	{
		sprite_index = spr_jump;
		mask_index = spr_jump;
	}
	if(place_meeting(x,y,obj_lab_door))
	{
		if(upkey)
		{
			with(obj_lab_door)
			{
				if(!instance_exists(obj_fader))
				{
					var myfader = instance_create_depth(0,0,-999,obj_fader);
					myfader.roomtogo = roomtogo;
					myfader.xtogo = xtogo;
					myfader.ytogo = ytogo;
				}	
			}
		}
	}
}

function scr_playerstate_rage()
{
	if(rage_sound)
	{
		if(!audio_is_playing(snd_rage))
		{
			audio_play_sound(snd_rage,0,false);
		}
		rage_sound = false;
	}
	if(leftkey)
	{
		player_dir = -1;
	}
	if(rightkey)
	{
		player_dir = 1;
	}
	if(canmove)
	{
		move_dir = rightkey - leftkey;
	}
	xpsd = move_dir * move_spd;
	
	var subpx = .5;
	if(place_meeting(x+xpsd,y,obj_wall))
	{
		if(!place_meeting(x+xpsd,y-abs(xpsd)-1,obj_wall))
		{
			while(place_meeting(x+xpsd,y,obj_wall))
			{
				y -= subpx;
			}
		}
		else
		{
			var px = subpx * sign(xpsd);
			while(!place_meeting(x+px,y,obj_wall))
			{
				x+=px;
			}
			xpsd = 0;
		}
	}
	if(yspd >= 0 && !place_meeting(x+xpsd,y+1,obj_wall) && place_meeting(x+xpsd,y+abs(xpsd)+1,obj_wall))
	{
		while(!place_meeting(x+xpsd, y+subpx,obj_wall))
		{
			y+= subpx;
		}
	}
	
	x += xpsd;
	
	yspd += grav;
	
	if(jump_key_pressed)
	{
		jump_key_buff_timer = jump_key_buff_time;
	}
	if(jump_key_buff_timer > 0)
	{
		jump_key_buffered = true;
		jump_key_buff_timer--;
	}
	else
	{
		jump_key_buffered = false;
	}
	if(jump_key_buffered && onground && canjump)
	{
		jump_key_buffered = false;
		jump_key_buff_timer = 0;
		yspd = jump_spd;
	}
	
	if(yspd > vel)
	{
		yspd = vel;
	}
	
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
	
	if(yspd >= 0 && place_meeting(x,y+1,obj_wall))
	{
		onground = true;
	}
	else
	{
		onground = false;
	}
	
	y += yspd;
	
	if(rage_key_pressed)
	{
		if(onground)
		{
			state = playerstate.rage_attack1;
		}
		else
		{
			state = playerstate.rage_hammer_land;
		}
	}
	//sprite work
	if(xpsd > 0 || xpsd < 0)
	{
		sprite_index = spr_walk;
		image_speed = 0.3;
		mask_index = spr_walk;
		if(sprite_index == spr_walk)
		{
			if(floor(image_index) == 1)
			{
				if(position_meeting(x,y+1,obj_wall_metal) || position_meeting(x,y+1,obj_wall_metal_moss))
				{
					walk_sound = true;
				}
				if(position_meeting(x,y+1,obj_block) || position_meeting(x,y+1,obj_falling_block))
				{
					walk_sound_brick = true;
				}
			}
			if(floor(image_index) == 3)
			{
				if(position_meeting(x,y+1,obj_wall_metal) || position_meeting(x,y+1,obj_wall_metal_moss))
				{
					walk_sound_alt = true;
				}
				if(position_meeting(x,y+1,obj_block) || position_meeting(x,y+1,obj_falling_block))
				{
					walk_sound_brick = true;
				}
			}
		}
		if(walk_sound)
		{
			if(!audio_is_playing(snd_player_walk_1))
			{
				audio_play_sound(snd_player_walk_1,0,false);
				walk_sound = false;
			}
		}
		if(walk_sound_alt)
		{
			if(!audio_is_playing(snd_player_walk_2))
			{
				audio_play_sound(snd_player_walk_2,0,false);
				walk_sound_alt = false;
			}
		}
		if(walk_sound_brick)
		{
			if(!audio_is_playing(snd_brick_walk))
			{
				audio_play_sound(snd_brick_walk,0,false);
				walk_sound_brick = false;
			}
		}
	}
	if(xpsd == 0)
	{
		sprite_index = spr_idle;
		image_speed = 0.05;
		mask_index = spr_idle;
	}
	if(!onground)
	{
		sprite_index = spr_jump;
		mask_index = spr_jump;
	}
	if(place_meeting(x,y,obj_lab_door))
	{
		if(upkey)
		{
			with(obj_lab_door)
			{
				if(!instance_exists(obj_fader))
				{
					var myfader = instance_create_depth(0,0,-999,obj_fader);
					myfader.roomtogo = roomtogo;
					myfader.xtogo = xtogo;
					myfader.ytogo = ytogo;
				}	
			}
		}
	}
}

function scr_playerstate_rage_att_1()
{
	
	scr_attack(spr_player_rage_attack1,spr_player_rage_attack1_mask,spr_player_rage_attack1_mask_left,0.4,player_damage);
	
	if(rage_key_pressed)
	{
		state  = playerstate.rage_attack2;
	}
	
	if(animationend())
	{
		scr_resetplayer();
	}
}

function scr_playerstate_rage_att_2()
{
	scr_attack(spr_player_rage_attack2,spr_player_rage_attack2_mask,spr_player_rage_attack1_mask_left,0.2,player_damage+1);
	
	if(animationend())
	{
		scr_resetplayer();
	}
}

function scr_playerstate_rage_hammer_land()
{
	if(sprite_index != spr_player_rage_hammer_land)
	{
		sprite_index = spr_player_rage_hammer_land;
	}
	mask_index = spr_player_rage_hammer_land;
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
	
	if(yspd >= 0 && place_meeting(x,y+1,obj_wall))
	{
		onground = true;
	}
	else
	{
		onground = false;
	}
	y += yspd;
	
	if(onground)
	{
		image_speed = 0.4;
	}
	else
	{
		image_speed = 0;
	}
	
	yspd += grav;
	if(animationend())
	{
		//rage_meter -= 10;
		image_speed = 0;
		image_index = 2;
		if(!instance_exists(obj_hammer_trail_left))
		{
			instance_create_layer(x,y+18,"player",obj_hammer_trail_left);
		}
		else
		{
			scr_resetplayer();
		}
	}
}