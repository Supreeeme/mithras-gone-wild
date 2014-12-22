return Def.ActorFrame{
	Def.BitmapText{
		Font="_fishfingers large",
		Text="GAME OVER",
		OnCommand=cmd(CenterX;y,120);
	};
	Def.BitmapText{
		Font="_fishfingers large",
		Text="Thanks for playing!",
		OnCommand=cmd(Center;rainbow);
	};
	Def.BitmapText{
		Font="_fishfingers normal",
		Text="Play again soon!",
		OnCommand=cmd(CenterX;y,SCREEN_CENTER_Y+80)
	}
}
