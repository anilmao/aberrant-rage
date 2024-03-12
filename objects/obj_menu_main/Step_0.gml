if(!instance_exists(obj_fader))
{
	menu_sel += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
}
menu_sel = clamp(menu_sel,0,array_length(menu_text));

if(keyboard_check_pressed(ord("Z")))
{
	switch(menu_sel)
	{
		case 0:
			scr_fade(rm_lab_start_1,noone,noone);
		break;
		case 1:
			game_end();
		break;
	}
}