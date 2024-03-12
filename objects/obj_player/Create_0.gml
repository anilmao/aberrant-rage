move_dir = 0;
move_spd = 2;
xpsd = 0;
yspd = 0;
grav = .275;
vel = 4;
jump_spd = -4.5;
canmove = true;
canjump = true;
canrage = true;
drawbar = true;
jump_key_buff_time = 3;
jump_key_buff_timer = 0;
jump_key_buffered = false;
onground = false;
rage = false;
rage_meter = 0;
rage_meter_max = 100;
do_idle_rage = false;
idle_rage_decrease = false;
player_dir = 1;
hp = 4;
cangethurt = true;
player_col = c_white;
player_damage = 2;
maxhp = hp;
spr_idle = spr_player_idle;
spr_jump = spr_player_jump;
spr_walk = spr_player_walk;
spr_hurt = spr_player_hurt;
rage_sound = false;
walk_sound = false;
walk_sound_alt = false;
walk_sound_brick = false;
showragetext = 0;

state = playerstate.normal;
hit = ds_list_create();

enum playerstate
{
	normal,
	rage,
	rage_attack1,
	rage_attack2,
	rage_hammer_fly,
	rage_hammer_land,
}