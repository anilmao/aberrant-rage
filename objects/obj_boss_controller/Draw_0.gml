if(drawbossbar)
{
	draw_sprite(spr_boss_bar_name,0,camera_get_view_x(view_camera[0])+180,camera_get_view_y(view_camera[0])+5);
	draw_sprite_stretched_ext(spr_rage_fill,0,camera_get_view_x(view_camera[0])+180,camera_get_view_y(view_camera[0])+20,(global.bosshealth/global.bosshealthmax) * 125,6,c_red,1);
	draw_sprite_ext(spr_rage_bar,0,camera_get_view_x(view_camera[0])+180,camera_get_view_y(view_camera[0])+20,1,1,0,c_white,1);
}