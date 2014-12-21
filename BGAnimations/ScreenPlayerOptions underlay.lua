return Def.ActorFrame{
	Def.Quad{
		Name="backup",
		InitCommand=cmd(FullScreen;Center;diffuse,Color.Black)
	};
	ActorCondition(not GAMESTATE:IsCourseMode(),LoadActor(GAMESTATE:GetCurrentSong():GetBannerPath())..{InitCommand=cmd(FullScreen;Center;diffusealpha,0.5)})
}
