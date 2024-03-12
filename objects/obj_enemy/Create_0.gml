damage = 2;
hp = 2;
enemy_spd = 0.4;
ragetogive = 40;
state = enemystate.alive;
dead_spr = noone;
idle_spr = noone;
xspd = 0;
yspd = 0;
grav = .275;
move_dir = 1;
enemy_xscale = 1;
flash_a = 1;
flash_col = c_red;
enemy_a = 1;
d_sound = noone;
playsound = true;
make_health = false;
enum enemystate
{
	alive,
	hit,
	dead
}