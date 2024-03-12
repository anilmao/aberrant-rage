function scr_boss_idle()
{
	showhead = true;
	spawn_bullet = true;
	playroar = true;
	spawn_enemies = true;
	damage = true;
	scr_reset_vent();
	if(y != 272)
	{
		y -= 1;
	}
	if(place_meeting(x,y-32,obj_player))
	{
		if(damage_player)
		{
			obj_player.hp -= 2;
			damage_player = false;
		}
		with(obj_player)
		{
			yspd -= 15;
			other.bosstate = bosstates.roar;
		}
	}
	image_speed = 0.05;
	if(body_spr != spr_dionea_body_idle)
	{
		body_spr = spr_dionea_body_idle;
	}
	if(head_spr != spr_dionea_head_idle)
	{
		head_spr = spr_dionea_head_idle;
	}
	with(obj_boss_wall)
	{
		state = heyimhere;
	}
}
function scr_boss_roar()
{
	if(y != 272)
	{
		y -= 1;
	}
	showhead = true;
	damage = true;
	image_speed = 0.05;
	if(body_spr != spr_dionea_body_idle)
	{
		body_spr = spr_dionea_body_idle;
	}
	if(head_spr != spr_dionea_head_roar)
	{
		head_spr = spr_dionea_head_roar;
	}
	if(playroar)
	{
		audio_play_sound(snd_dionea_roar,0,false);
		playroar = false;
	}
	if(place_meeting(x,y-32,obj_player))
	{
		if(damage_player)
		{
			obj_player.hp -= 2;
			damage_player = false;
		}
		with(obj_player)
		{
			yspd -= 15;
			other.bosstate = bosstates.roar;
		}
	}
	if(spawn_enemies)
	{
		scr_set_vent(6,1,obj_bug_red);
		alarm[0] = room_speed * 1;
		spawn_enemies = false;
	}
}
function scr_boss_attack1()
{
	showhead = true;
	damage = true;
	scr_reset_vent();
	if(place_meeting(x,y-32,obj_player))
	{
		if(damage_player)
		{
			obj_player.hp -= 2;
			damage_player = false;
		}
		with(obj_player)
		{
			yspd -= 15;
			other.bosstate = bosstates.roar;
		}
	}
	if(y != 280)
	{
		y += 1;
	}
	else
	{
		if(head_spr != spr_dionea_head_roar)
		{
			head_spr = spr_dionea_head_roar;
		}
		if(spawn_bullet)
		{
			instance_create_depth(x,y-75,-1,obj_boss_projectile)
			alarm[0] = room_speed * 0.8;
			spawn_bullet = false;
		}
	}
}
function scr_boss_pod()
{
	showhead = false;
	image_speed = 0.2;
	if(body_spr != spr_dionea_pod_idle)
	{
		body_spr = spr_dionea_pod_idle;
	}
}
function scr_boss_breakout()
{
	showhead = false;
	image_speed = 0.05;
	if(body_spr != spr_dionea_pod_breakout)
	{
		body_spr = spr_dionea_pod_breakout;
	}
}
function scr_boss_hurt()
{
	if(damage)
	{
		global.bosshealth -= 30;
		damage = false;
	}
	if(y != 300)
	{
		y += 1;
	}
	else
	{
		if(alarm[0] == -1)
		{
			alarm[0] = room_speed * 0.2;
		}
		if(place_meeting(x,y-32,obj_player))
		{
			if(damage_player)
			{
				obj_player.hp -= 2;
				damage_player = false;
			}
			with(obj_player)
			{
				yspd -= 15;
				other.bosstate = bosstates.roar;
			}
			with(obj_boss_wall)
			{
				state = heyimhere;
			}
		}
	}
	if(y > 300)
	{
		y -= 1;
	}
}
function scr_boss_tired()
{
	if(y != 290)
	{
		y += 1;
	}
	else
	{
		global.bosshealth += 0.1;
		with(obj_boss_wall)
		{
			state = goaway;
		}
		if(place_meeting(x,y-32,obj_player))
		{
			if(obj_player.state == playerstate.normal || obj_player.state == playerstate.rage)
			{
				if(damage_player)
				{
					obj_player.hp -= 2;
					damage_player = false;
				}
				with(obj_player)
				{
					yspd -= 15;
					other.bosstate = bosstates.roar;
				}
			}
			if(obj_player.state == playerstate.rage_hammer_land)
			{
				with(obj_player)
				{
					state = playerstate.rage;
					yspd -= 15;
				}
				bosstate = bosstates.hurt;
			}
		}
		else
		{
			if(alarm[0] == -1)
			{
				alarm[0] = room_speed * 5;
			}
		}
	}
	if(y > 290)
	{
		y -= 1;
	}
}
function scr_boss_dead()
{
	if(head_spr != spr_dionea_head_dead)
	{
		head_spr = spr_dionea_head_dead;
	}
	if(y != 400)
	{
		y += 2;
	}
	with(obj_boss_wall)
	{
		state = goaway;
	}
}