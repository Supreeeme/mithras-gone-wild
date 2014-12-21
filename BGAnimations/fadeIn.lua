local time=...
assert(time,"Where yo fade in time at, fool?")

return Def.Quad{
	OnCommand=cmd(FullScreen;Center;diffuse,Color.Black;linear,time;diffusealpha,0)
}
