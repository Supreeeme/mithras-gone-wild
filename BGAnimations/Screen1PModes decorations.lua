return Def.ActorFrame{
	OnCommand=cmd(xy,100,100);
	Def.BitmapText{
		Font="_fishfingers Bold",
		Text="Select Style",
		OnCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_TOP+70;zoom,1.1);
		OffCommand=cmd(linear,0.5;diffusealpha,0)
	},
	Def.BitmapText{
		Font="_fishfingers normal",
		Text="What style do you want?",
		OnCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_TOP+160;zoom,1);
		OffCommand=cmd(linear,0.5;diffusealpha,0)
	},
	--lines are rad
	Def.Quad{
		OnCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_TOP+90;setsize,SCREEN_WIDTH,1);
		OffCommand=cmd(decelerate,0.7;x,SCREEN_LEFT-1000)
	},
	Def.Quad{
		OnCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_BOTTOM-150;setsize,SCREEN_WIDTH,1);
		OffCommand=cmd(decelerate,0.7;x,SCREEN_RIGHT+1000)
	};
	
	--rawr
	LoadActor(THEME:GetPathB("","RAWR"))..{
		InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_BOTTOM-60);
		OnCommand=cmd(zoom,0.25;spin);
		OffCommand=cmd(decelerate,0.5;rotationz,360;y,SCREEN_CENTER_Y)	
	}
};
