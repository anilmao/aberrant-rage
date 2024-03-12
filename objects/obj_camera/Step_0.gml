if(!instance_exists(obj_player))
{
	exit;
}
var cam_width = camera_get_view_width(view_camera[0]);
var cam_height = camera_get_view_height(view_camera[0]);

var camx = obj_player.x - cam_width/2;
var camy = obj_player.y - cam_height/2;

camx = clamp(camx,0,room_width-cam_width);
camy = clamp(camy,0,room_height-cam_height);

camera_set_view_pos(view_camera[0],camx,camy);