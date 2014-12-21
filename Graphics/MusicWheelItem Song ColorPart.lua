return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd();
		OnCommand=cmd(y,2.5;setsize,300,40;diffusealpha,0.3;);
	};
	
	Def.Quad{
		InitCommand=cmd();
		OnCommand=cmd(y,2.5;setsize,305,45;diffusealpha,0.3;);
	};

	Def.Quad{
		InitCommand=cmd();
		OnCommand=cmd(y,2.5;setsize,310,50;diffusealpha,0.3;);
	};
		
	Def.Quad{
		OnCommand=cmd(y,2.5;setsize,295,35;diffusealpha,0.5;diffuse,Color.Black)
	};
}
