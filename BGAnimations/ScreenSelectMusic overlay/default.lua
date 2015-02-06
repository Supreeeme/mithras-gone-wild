--I did my Pane Displays in a separate file because holy waffles that file is long.
--Also because overlay goes over everything.

local function UpdateP1(self)
	local tapChild = self:GetChild("Taps")
	local holdChild = self:GetChild("Holds")
	local jumpChild = self:GetChild("Jumps")
	local handChild = self:GetChild("Hands")
	local rollChild = self:GetChild("Rolls")
	local fakeChild = self:GetChild("Fakes")
	local mineChild = self:GetChild("Mines")
	local liftChild = self:GetChild("Lifts")
	local steps,radarvals
	if GAMESTATE:IsHumanPlayer(PLAYER_1) then
	steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
	radarvals = steps:GetRadarValues(PLAYER_1) 
	end
	if GAMESTATE:GetCurrentSong() then
		if steps and radarvals then
		tapChild:settext(radarvals:GetValue("RadarCategory_TapsAndHolds"))
		holdChild:settext(radarvals:GetValue("RadarCategory_Holds"))
		jumpChild:settext(radarvals:GetValue("RadarCategory_Jumps"))
		handChild:settext(radarvals:GetValue("RadarCategory_Hands"))
		rollChild:settext(radarvals:GetValue("RadarCategory_Rolls"))
		fakeChild:settext(radarvals:GetValue("RadarCategory_Fakes"))
		mineChild:settext(radarvals:GetValue("RadarCategory_Mines"))
		liftChild:settext(radarvals:GetValue("RadarCategory_Lifts"))
		end
	end
	
end

local function UpdateP2(self)
	local tapChild = self:GetChild("Taps")
	local holdChild = self:GetChild("Holds")
	local jumpChild = self:GetChild("Jumps")
	local handChild = self:GetChild("Hands")
	local rollChild = self:GetChild("Rolls")
	local fakeChild = self:GetChild("Fakes")
	local mineChild = self:GetChild("Mines")
	local liftChild = self:GetChild("Lifts")
	local steps,radarvals
	if GAMESTATE:IsHumanPlayer(PLAYER_2) then
	steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
	radarvals = steps:GetRadarValues(PLAYER_2) 
	end
	if GAMESTATE:GetCurrentSong() then
		if steps and radarvals then
		tapChild:settext(radarvals:GetValue("RadarCategory_TapsAndHolds"))
		holdChild:settext(radarvals:GetValue("RadarCategory_Holds"))
		jumpChild:settext(radarvals:GetValue("RadarCategory_Jumps"))
		handChild:settext(radarvals:GetValue("RadarCategory_Hands"))
		rollChild:settext(radarvals:GetValue("RadarCategory_Rolls"))
		fakeChild:settext(radarvals:GetValue("RadarCategory_Fakes"))
		mineChild:settext(radarvals:GetValue("RadarCategory_Mines"))
		liftChild:settext(radarvals:GetValue("RadarCategory_Lifts"))
		end
	end
	
end

-- Player 1 Pane Display
local a = Def.ActorFrame{
	InitCommand=cmd(xy,150,SCREEN_CENTER_Y+125;SetUpdateFunction,UpdateP1);
	CurrentSongChangedMessageCommand=function(self)
		if not GAMESTATE:GetCurrentSong() or not GAMESTATE:IsHumanPlayer(PLAYER_1) then
			self:visible(false)
		else
			self:visible(true)
		end
	end;
	OffCommand=cmd(bouncebegin,0.15;zoomx,0);
		
	Def.Quad{
		OnCommand=cmd(xy,75,20;setsize,230,100;diffuse,Color.Black);
	};
	
	--Taps
	Def.BitmapText{
		Text="Taps:",
		Font="_blaster",
	};
	Def.BitmapText{
		Name="Taps",
		Text="???",
		Font="_blaster",
		OnCommand=cmd(x,50;maxwidth,60)
	};
	
	--Holds
	Def.BitmapText{
		Text="Holds:",
		Font="_blaster",
		OnCommand=cmd(y,15)
	};
	Def.BitmapText{
		Name="Holds",
		Text="???",
		Font="_blaster",
		OnCommand=cmd(xy,50,15;maxwidth,60)
	};
	
	--Jumps
	Def.BitmapText{
		Text="Jumps:",
		Font="_blaster",
		OnCommand=cmd(y,30;maxwidth,60)
	};
	Def.BitmapText{
		Name="Jumps",
		Text="???",
		Font="_blaster",
		OnCommand=cmd(xy,50,30;maxwidth,60)
	};
	
	--Hands
	Def.BitmapText{
		Text="Hands:",
		Font="_blaster",
		OnCommand=cmd(y,45)
	};
	Def.BitmapText{
		Name="Hands",
		Text="???",
		Font="_blaster",
		OnCommand=cmd(xy,50,45;maxwidth,60)
	};
	
	--Rolls
	Def.BitmapText{
		Text="Rolls:",
		Font="_blaster",
		OnCommand=cmd(x,110)
	};
	Def.BitmapText{
		Name="Rolls",
		Text="???",
		Font="_blaster",
		OnCommand=cmd(x,170;maxwidth,60)
	};
	
	--Fakes
	Def.BitmapText{
		Text="Fakes:",
		Font="_blaster",
		OnCommand=cmd(xy,110,15;maxwidth,60)
	};
	Def.BitmapText{
		Name="Fakes",
		Text="???",
		Font="_blaster",
		OnCommand=cmd(xy,170,15;maxwidth,60)
	};
	
	--Mines
	Def.BitmapText{
		Text="Mines:",
		Font="_blaster",
		OnCommand=cmd(xy,110,30;maxwidth,60)
	};
	Def.BitmapText{
		Name="Mines",
		Text="???",
		Font="_blaster",
		OnCommand=cmd(xy,170,30;maxwidth,60)
	};
	
	--Lifts
	Def.BitmapText{
		Text="Lifts:",
		Font="_blaster",
		OnCommand=cmd(xy,110,45)
	};
	Def.BitmapText{
		Name="Lifts",
		Text="-",
		Font="_blaster",
		OnCommand=cmd(xy,170,45)
	};
	
}

-- Player 2 Pane Display
-- This derives directly from the a ActorFrame (Player 1 Pane Display), meaning that, unless explicitly 
-- stated otherwise, everything in a will be in b.

local b = a..{ OnCommand=cmd(x,540;SetUpdateFunction,UpdateP2);
	CurrentSongChangedMessageCommand=function(self)
		if not GAMESTATE:GetCurrentSong() or not GAMESTATE:IsHumanPlayer(PLAYER_2) then
			self:visible(false)
		else
			self:visible(true)
		end
	end;
}

return Def.ActorFrame{
	a;
	b;
}