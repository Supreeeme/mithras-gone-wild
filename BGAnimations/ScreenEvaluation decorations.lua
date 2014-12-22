return Def.ActorFrame{
	Def.Quad{
		OnCommand=cmd(xy,SCREEN_CENTER_X,140;setsize,0,0;linear,1;setsize,SCREEN_WIDTH,1)
	};
	Def.BitmapText{
		Font="_fishfingers normal",
		Text="",
		InitCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				self:settext(GAMESTATE:GetCurrentCourse():GetDisplayFullTitle())
			else
				self:settext(GAMESTATE:GetCurrentSong():GetDisplayMainTitle())
			end
		end,
		OnCommand=cmd(xy,SCREEN_CENTER_X,120)
	};
}
