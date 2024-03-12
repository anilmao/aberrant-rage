function scr_hurt_enemy(_damage)
{
	hp -= _damage;
	
	if(hp > 0)
	{
		state = enemystate.hit;
	}
	else
	{
		state = enemystate.dead;
	}
}