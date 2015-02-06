--200: top half
--282: bottom half
return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(xy,SCREEN_RIGHT+1000,200;SetWidth,SCREEN_WIDTH;SetHeight,1.2;sleep,0.2);
		OnCommand=cmd(decelerate,0.5;x,SCREEN_CENTER_X)
	};
	Def.Quad{
		InitCommand=cmd(xy,SCREEN_LEFT-1000,282;SetWidth,SCREEN_WIDTH;SetHeight,1.2;sleep,0.2);
		OnCommand=cmd(decelerate,0.5;x,SCREEN_CENTER_X)
	};
	LoadActor("RAWR")..{
		OnCommand=cmd(spin;Center;zoom,0.25);
		OffCommand=cmd(decelerate,0.5;rotationz,360)
	};
}
