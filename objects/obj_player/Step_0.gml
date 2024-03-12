leftkey = keyboard_check(vk_left);
rightkey = keyboard_check(vk_right);
downkey = keyboard_check(vk_down);
upkey = keyboard_check(vk_up);
jump_key_pressed = keyboard_check_pressed(ord("Z"));
rage_key_pressed = keyboard_check_pressed(ord("X"));

rage_meter = clamp(rage_meter,0,rage_meter_max);
hp = clamp(hp,0,maxhp);

depth = -2;

if(!rage)
{
	spr_idle = spr_player_idle;
	spr_jump = spr_player_jump;
	spr_walk = spr_player_walk;
	spr_hurt = spr_player_hurt;
}
else
{
	spr_idle = spr_player_rage_idle;
	spr_jump = spr_player_rage_jump;
	spr_walk = spr_player_rage_walk;
	//spr_hurt = spr_player_rage_hurt;
}

switch(state)
{
	case playerstate.normal:
		scr_playerstate_normal();
	break;
	case playerstate.rage:
		scr_playerstate_rage();
	break;
	case playerstate.rage_attack1:
		scr_playerstate_rage_att_1();
	break;
	case playerstate.rage_attack2:
		scr_playerstate_rage_att_2();
	break;
	case playerstate.rage_hammer_land:
		 scr_playerstate_rage_hammer_land()
	break;
}
scr_ragecontrol();

if(rage)
{
	move_spd = 2.5;
	jump_spd = -5.5;
}
else
{
	move_spd = 2;
	jump_spd = -4.5;
}
if(cangethurt)
{
	player_col = c_white;
}
else
{
	player_col = c_maroon;
}
if(hp <= 0)
{
	canmove = false
	canjump = false
	canrage = false;
	scr_fade(rm_death,0,0);
}
if(rage_meter >= 100)
{
	if(showragetext == 0)
	{
		if(alarm[2] == -1)
		{
			alarm[2] = room_speed * 5;
		}
	}
}
if(room == rm_end || room == rm_death)
{
	instance_destroy();
}