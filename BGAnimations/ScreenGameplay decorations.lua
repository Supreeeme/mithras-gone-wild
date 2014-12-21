local function UpdateBPM(self)
	local bpmDisplay=self:GetChild('BPMDisplay')
	local pn = GAMESTATE:GetMasterPlayerNumber()
	local bpm=GAMESTATE:GetPlayerState(pn):GetSongPosition():GetCurBPS() * 60
	bpmDisplay:settext( string.format("%03.2f",bpm) )
end 
local function UpdateSong(self)
	local child = self:GetChild("SongName")
	local song = GAMESTATE:GetCurrentSong()
	local songname = song:GetDisplayMainTitle()
	local artist = song:GetDisplayArtist()
	child:settext(artist.." - "..songname)
	if song ~= GAMESTATE:GetCurrentSong() then
		child:settext(GAMESTATE:GetCurrentSong():GetDisplayArtist().." - "..GAMESTATE:GetCurrentSong():GetDisplayMainTitle())
	end
end
return Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(SetUpdateFunction,UpdateBPM);
		Def.BitmapText{
			Name="BPMDisplay",
			Font="BPMDisplay bpm",
			InitCommand=cmd(xy,SCREEN_CENTER_X-10,SCREEN_BOTTOM-28)
		};
		Def.BitmapText{
			Name="BPMLabel",
			Font="_fishfingers normal",
			InitCommand=cmd(xy,SCREEN_CENTER_X+20,SCREEN_BOTTOM-28)
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(SetUpdateFunction,UpdateSong);
		Def.BitmapText{
			Name="SongName",
			Font="_fishfingers normal",
			Text="",
			InitCommand=function(self) self:xy(SCREEN_CENTER_X,40):zoom(0.5) end
		};
	};
}
		
