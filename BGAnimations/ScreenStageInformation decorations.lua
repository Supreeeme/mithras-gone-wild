--argh lua is being difficult
local a = Def.ActorFrame{
	Def.BitmapText{
		Font="_fishfingers normal",
		Text="You are playing...",
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-150;zoomy,0);
		OnCommand=cmd(bounceend,0.15;zoomy,1);
	};
}
local t = Def.ActorFrame{
		InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y-100),
		--because of this, SCREEN_CENTER_Y-100 = SCREEN_CENTER_Y, and
		--SCREEN_CENTER_Y-200 = SCREEN_CENTER_Y-100
		Def.BitmapText{
			Font="_fishfingers normal",
			Text="",
			OnCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					self:settext(GAMESTATE:GetCurrentCourse():GetDisplayFullTitle())
				else
					self:settext(GAMESTATE:GetCurrentSong():GetDisplayMainTitle())
				end
				if not GAMESTATE:IsCourseMode() then --why do I need this? it's an if then statement (produces error without it tho)
					if GAMESTATE:GetCurrentSong():GetDisplaySubTitle() then
						MESSAGEMAN:Broadcast('Subtitle')
					end
					if GAMESTATE:GetCurrentSong():GetDisplayArtist() then
						MESSAGEMAN:Broadcast('Artist')
					end
				end
				self:decelerate(0.7):y(SCREEN_CENTER_Y-160):sleep(1)
			end
		};


		Def.BitmapText{
			Font="_fishfingers normal",
			Text="",
			SubtitleMessageCommand=cmd(settext,GAMESTATE:GetCurrentSong():GetDisplaySubTitle()),
			OnCommand=cmd(decelerate,0.7;y,SCREEN_CENTER_Y-125;zoom,0.75;sleep,1)
		};

		Def.BitmapText{
			Font="_fishfingers normal",
			Text="",
			ArtistMessageCommand=cmd(settext,"by "..GAMESTATE:GetCurrentSong():GetDisplayArtist()),
			OnCommand=cmd(decelerate,0.7;y,SCREEN_CENTER_Y-85;sleep,1)
		};
	}
if not GAMESTATE:IsCourseMode() then
t[#t+1] = LoadActor(GAMESTATE:GetCurrentSong():GetBannerPath() or THEME:GetPathG("","Common fallback banner"))..{OnCommand=cmd(scaletoclipped,300,100;decelerate,0.7;y,SCREEN_CENTER_Y-220;sleep,1)};
else
t[#t+1] = LoadActor(GAMESTATE:GetCurrentCourse():GetBannerPath() or THEME:GetPathG("","Common fallback banner"))..{OnCommand=cmd(scaletoclipped,300,100;decelerate,0.7;y,SCREEN_CENTER_Y-220;sleep,1)};
end
a[#a+1] = t
return a
