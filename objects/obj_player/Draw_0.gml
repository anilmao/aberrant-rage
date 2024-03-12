if(drawbar)
{
	draw_sprite_ext(spr_player_bar,0,camera_get_view_x(view_camera[0])+10,camera_get_view_y(view_camera[0])+5,1,1,0,#595652,0.5);
	for (var i = 0; i < hp; ++i) 
	{
		var _sep = 12;
		draw_sprite_ext(spr_bar_health,0,camera_get_view_x(view_camera[0])+16+_sep*i,camera_get_view_y(view_camera[0])+15,0.9,0.9,0,#c50808,1);
	}
	draw_sprite_stretched_ext(spr_rage_fill,0,camera_get_view_x(view_camera[0])+15,camera_get_view_y(view_camera[0])+25,(rage_meter/rage_meter_max) * 100,5,#391148,1);
	draw_sprite_ext(spr_rage_bar,0,camera_get_view_x(view_camera[0])+15,camera_get_view_y(view_camera[0])+25,0.8,0.8,0,c_white,1);
}
draw_sprite_ext(sprite_index,image_index,x,y,sign(player_dir),1,0,player_col,1);

if(showragetext == 0)
{
	if(rage_meter >= 100)
	{
		draw_text_color(x-70,y-50,"PRESS [X] TO UNLEASH RAGE",#391148,#391148,#391148,#391148,1);
	}
}