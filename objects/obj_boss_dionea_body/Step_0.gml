switch(bosstate)
{
	case bosstates.idle:
		scr_boss_idle();
	break;
	case bosstates.pod:
		scr_boss_pod();
	break;
	case bosstates.roar:
		scr_boss_roar();
	break;
	case bosstates.attack1:
		scr_boss_attack1();
	break;
	case bosstates.tired:
		scr_boss_tired();
	break;
	case bosstates.hurt:
		scr_boss_hurt();
	break;
	case bosstates.breakout:
		scr_boss_breakout();
	break;
	case bosstates.dead:
		scr_boss_dead();
	break;
}
if(global.bosshealth < 50)
{
	body_spr = spr_dionea_body_idle_hurt;
}
if(bosstate != bosstates.dead)
{
	if(alarm[1] == -1)
	{
		alarm[1] = room_speed * 30; //30 seconds
	}
}
if(bosstate == bosstates.idle)
{
	var _rand = irandom_range(0.9,1.5);
	if(alarm[2] == -1)
	{
		alarm[2] = room_speed * _rand
	}
}
/*
if(bosstate == bosstates.tired)
{
	alarm[2] = -1;
}
*/
if(place_meeting(x,y-32,obj_boss_projectile))
{
	if(obj_boss_projectile.turned)
	{
		bosstate = bosstates.hurt;
		with(obj_boss_projectile)
		{
			instance_destroy();
		}
	}
}
if(global.bosshealth <= 0)
{
	bosstate = bosstates.dead;
}