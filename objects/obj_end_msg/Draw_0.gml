for (var i = 0; i < array_length(menu_text); i++)
{
	var _sep = 120;
    draw_set_font(fnt_main);
	if(menu_sel == i)
	{
		draw_text_color(camera_get_view_x(view_camera[0])+text_x+_sep*i,camera_get_view_y(view_camera[0])+text_y,menu_text[i],#391148,#391148,#391148,#391148,1);
	}
	else
	{
		draw_text_color(camera_get_view_x(view_camera[0])+text_x+_sep*i,camera_get_view_y(view_camera[0])+text_y,menu_text[i],c_white,c_white,c_white,c_white,1);
	}
}
draw_text(160,130,string(end_msg[0]));
draw_text(90,150,string(end_msg[1]));