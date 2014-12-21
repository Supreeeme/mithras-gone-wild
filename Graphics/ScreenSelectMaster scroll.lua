local c = Var("GameCommand");

return Def.ActorFrame{
	Def.BitmapText{
		Font="_fishfingers Bold",
		Text=c:GetName(),
		GainFocusCommand=cmd(stoptweening;diffuse,color("#FFFFFF");linear,0.1;zoom,1;);
		LoseFocusCommand=cmd(stoptweening;diffuse,color("#777777");linear,0.1;zoom,0.75;);
		OffCommand=cmd(linear,0.3;diffusealpha,0)
	}
}
