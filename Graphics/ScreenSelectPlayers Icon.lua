local gc=Var("GameCommand")
return Def.ActorFrame{
	Def.BitmapText{
		Name="Explanation",
		Font="_fishfingers normal",
		Text="",
		OnCommand=cmd(CenterX;y,SCREEN_CENTER_Y+105;diffusealpha,0;linear,0.5;diffusealpha,1),
		GainFocusCommand=function(self)
			self:diffusealpha(1)
			self:settext(THEME:GetString("ScreenSelectPlayers",gc:GetName().."Explanation"))
		end,
		LoseFocusCommand=cmd(diffusealpha,0),
		OffCommand=cmd(linear,0.5;diffusealpha,0)
	}
}
