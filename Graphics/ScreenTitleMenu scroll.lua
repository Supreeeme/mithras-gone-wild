local gc = Var("GameCommand");

return Def.ActorFrame {
	Def.BitmapText{
			Font= "_fishfingers Bold",
			Text=THEME:GetString("ScreenTitleMenu",gc:GetName());
			OnCommand=cmd(shadowlength,1);
			GainFocusCommand=cmd(stoptweening;linear,0.1;zoom,1;diffuse,color("#FFFFFF"));
			LoseFocusCommand=cmd(stoptweening;linear,0.1;zoom,0.75;diffuse,color("#777777"));
	};
};
