local gc = Var("GameCommand")
return Def.ActorFrame{
	Def.BitmapText{
		Font="_fishfingers normal",
		Text=THEME:GetString("ScreenEditOptions",gc:GetName().."Explanation"),
		OnCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y+50),
		GainFocusCommand=cmd(stoptweening;diffusealpha,1;cropright,1;linear,0.7;cropright,0),
		LoseFocusCommand=cmd(stoptweening;linear,0.1;diffusealpha,0)
	};
}
