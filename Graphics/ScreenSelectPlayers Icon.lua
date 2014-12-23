local gc=Var("GameCommand")
return Def.ActorFrame{
	Def.BitmapText{
		Name="Explanation",
		Font="_fishfingers normal",
		Text="",
		OnCommand=cmd(CenterX;y,SCREEN_CENTER_Y+105;zoomx,0;decelerate,0.5;zoomx,1;rotationz,360),
		GainFocusCommand=function(self)
			self:diffusealpha(1)
			self:settext(THEME:GetString("ScreenSelectPlayers",gc:GetName().."Explanation"))
		end,
		LoseFocusCommand=cmd(diffusealpha,0),
		OffCommand=cmd(bouncebegin,0.3;zoomx,0;rotationz,0)
	}
}
