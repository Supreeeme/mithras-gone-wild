return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:diffuse(color('#000033'))
		end;
	}
}
