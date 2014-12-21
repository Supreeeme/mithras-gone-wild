return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,80;xy,SCREEN_CENTER_X,40;diffuse,Color.Black;diffusealpha,0.5)
	};
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,80;xy,SCREEN_CENTER_X,SCREEN_BOTTOM-40;diffuse,Color.Black;diffusealpha,0.5)
	};
}
