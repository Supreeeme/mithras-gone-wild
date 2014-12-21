return Def.ActorFrame{
	OnCommand=cmd(xy,100,100);
	Def.BitmapText{
		Font="_fishfingers Bold",
		Text="Select Number of Players",
		OnCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_TOP+70;zoom,1.1);
		OffCommand=cmd(linear,0.5;diffusealpha,0)
	},
	Def.BitmapText{
		Font="_fishfingers normal",
		Text="How many players do you want?",
		OnCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_TOP+160;zoom,1);
		OffCommand=cmd(linear,0.5;diffusealpha,0)
	},
	--lines are rad
	Def.Quad{
		OnCommand=cmd(xy,SCREEN_RIGHT+1000,SCREEN_TOP+90;setsize,SCREEN_WIDTH,1;decelerate,0.7;x,SCREEN_CENTER_X);
	},
	Def.Quad{
		OnCommand=cmd(xy,SCREEN_LEFT-1000,SCREEN_BOTTOM-150;setsize,SCREEN_WIDTH,1;decelerate,0.7;x,SCREEN_CENTER_X);
	};
	
	--rawr
	LoadActor(THEME:GetPathB("","RAWR"))..{
		InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_BOTTOM-60;zoom,0);
		OnCommand=cmd(decelerate,0.5;zoom,0.25;spin);
	}
}
