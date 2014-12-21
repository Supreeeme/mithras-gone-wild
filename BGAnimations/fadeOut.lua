local time = ...
assert(time,"Where yo fade out time at, fool?")

return Def.Quad{
	OnCommand=cmd(FullScreen;Center;diffuse,Color.Black;diffusealpha,0;linear,time;diffusealpha,1)
}
