switch(state)
{
	case enemystate.alive:
		scr_enemystate_alive();
	break;
	case enemystate.hit:
		scr_enemystate_hit();
	break;
	case enemystate.dead:
		scr_enemystate_dead();
	break;
}
if(move_dir == 1)
{
	enemy_xscale = -1;
}
else
{
	enemy_xscale = 1;
}