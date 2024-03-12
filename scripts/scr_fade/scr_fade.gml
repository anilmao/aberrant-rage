function scr_fade(_ROOM, _X, _Y)
{
	if(!instance_exists(obj_fader))
	{
		var myfader = instance_create_depth(0,0,-999,obj_fader);
		myfader.roomtogo = _ROOM;
		myfader.xtogo = _X;
		myfader.ytogo = _Y;
	}
}