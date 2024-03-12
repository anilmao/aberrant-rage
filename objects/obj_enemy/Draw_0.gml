draw_sprite_ext(sprite_index,image_index,x,y,enemy_xscale,1,0,c_white,enemy_a);
if(state == enemystate.hit || state == enemystate.dead)
{
	if(flash_a > 0)
	{
		if(shader_current() == -1)
		{
			shader_set(shd_flash)
			
			draw_sprite_ext(sprite_index,image_index,x,y,enemy_xscale,1,0,flash_col,flash_a);
			
			shader_reset();
		}
	}
}