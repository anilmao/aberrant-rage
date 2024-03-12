bosstate = bosstates.idle;
showhead = false;
body_spr = spr_dionea_body_idle;
head_spr = spr_dionea_head_idle;
playroar = true;
spawn_bullet = true;
spawn_enemies = true;
damage = true;
damage_player = true;
enum bosstates
{
	pod,
	idle,
	roar,
	breakout,
	attack1,
	tired,
	hurt,
	dead,
}