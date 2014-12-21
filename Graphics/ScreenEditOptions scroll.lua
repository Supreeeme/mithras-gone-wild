local gc = Var("GameCommand")
return Def.ActorFrame{
	Def.BitmapText{
		Font="_fishfingers Bold",
		Text=gc:GetName(),
		GainFocusCommand=cmd(stoptweening;linear,0.1;diffuse,Color.White;zoom,1),
		LoseFocusCommand=cmd(stoptweening;linear,0.1;diffuse,color("#777777");zoom,0.75)
	};
}
