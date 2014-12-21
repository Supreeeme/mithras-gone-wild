return Def.ActorFrame{
	Def.Quad{
		OnCommand=cmd(setsize,SCREEN_WIDTH,SCREEN_HEIGHT;Center;diffuse,Color.White;linear,1;diffuse,color("#330000");diffusealpha,0.5;linear,1.5;diffuse,Color.Black)
	};
	LoadActor(THEME:GetPathS("","ScreenGameplay failed"))
}
