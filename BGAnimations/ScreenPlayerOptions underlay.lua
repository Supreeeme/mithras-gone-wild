--I AM SICK OF SHIT NOT WORKING
local t = Def.ActorFrame{}
if not GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentSong():GetBackgroundPath() then
		t[#t+1]=LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
				InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;Center;diffusealpha,0.5)
		}
elseif GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse():GetBackgroundPath() then
		t[#t+1]=LoadActor(GAMESTATE:GetCurrentCourse():GetBackgroundPath())..{
				InitCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;Center;diffusealpha,0.5)
		}
else
	local a=Def.ActorFrame{
	Def.BitmapText{
		Font="_fishfingers Bold",
		Text="Mithras Gone Wild",
		OnCommand=cmd(rotationz,45;xy,SCREEN_CENTER_X+40,SCREEN_CENTER_Y);
	};
	Def.BitmapText{
		Font="_fishfingers normal",
		Text="(lol you ain't got no background)",
		OnCommand=cmd(rotationz,45;xy,SCREEN_CENTER_X,SCREEN_CENTER_Y+20;zoom,0.75);
	};
	};
	t[#t+1]=a
end
return t
