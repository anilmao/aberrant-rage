if(open)
{
	draw_sprite(spr_lab_hallway,0,x,y);
	draw_set_font(fnt_main);
	draw_set_color(#391148);
	draw_text(x-30,y-80,"PRESS UP");
}
draw_set_color(c_white);
draw_sprite(sprite_index,image_index,x,y);