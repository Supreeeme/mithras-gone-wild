--Organization and crap
local t = Def.ActorFrame{
	Def.Quad{
		Name="headerline";
		OnCommand=cmd(xy,SCREEN_CENTER_X,29;SetWidth,SCREEN_WIDTH);
		OffCommand=cmd(bouncebegin,0.15;zoomx,0);
		StyleChangeCommand=cmd(SetHeight,50);
	};

	Def.BitmapText{
		Name="songname";
		Font="_fishfingers normal",
		Text="",
		OnCommand=function(self) self:xy(200,41):maxwidth(295) end,
		OffCommand=cmd(bouncebegin,0.15;zoomy,0);
		CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:GetCurrentSong() then
				self:settext(GAMESTATE:GetCurrentSong():GetDisplayMainTitle())
			else
				self:settext("")
			end
		end
	};

	Def.Quad{
		Name="horizline";
		OnCommand=function(self)
			if curAspect == AspectRatios.SixteenNine then
				self:xy(SCREEN_CENTER_X - 35,SCREEN_CENTER_Y):SetHeight(SCREEN_HEIGHT)
			elseif curAspect == AspectRatios.SixteenTen then
				self:xy(SCREEN_CENTER_X - 25,SCREEN_CENTER_Y):SetHeight(SCREEN_HEIGHT)
			else
				lua.ReportScriptError("Current aspect ratio not supported yet, please report")
			end
		end,
		OffCommand=cmd(bouncebegin,0.15;zoomy,0)
	};

	Def.BitmapText{
		Font="_fishfingers normal",
		Text=TextBanner,
		OnCommand=function(self)
			self:xy(200,90)
			if not GAMESTATE:IsCourseMode() then
				self:diffuse(SONGMAN:GetSongColor(GAMESTATE:GetCurrentSong()))
			end
		end
	};

	Def.Quad{
		Name="fadeoutforplayeroptions";
		InitCommand=cmd(setsize,SCREEN_WIDTH,SCREEN_HEIGHT;Center;diffuse,color("#000000");zoomy,0);
		ShowPressStartForOptionsCommand=cmd(decelerate,0.7;zoomy,1);
	};
	--"Press Start for More Options"
	Def.ActorFrame{
		Def.Quad{
			InitCommand=cmd(setsize,SCREEN_WIDTH,1;Center;glow,Color.White;visible,false);
			ShowPressStartForOptionsCommand=cmd(decelerate,0.7;y,SCREEN_CENTER_Y-30;linear,3;y,SCREEN_CENTER_Y-50;visible,true;bouncebegin,0.1;zoomx,0);
			ShowEnteringOptionsCommand=cmd(stoptweening;linear,0.8;y,SCREEN_BOTTOM+100)
		};
		Def.Quad{
			InitCommand=cmd(setsize,SCREEN_WIDTH,1;Center;glow,Color.White;visible,false);
			ShowPressStartForOptionsCommand=cmd(decelerate,0.7;y,SCREEN_CENTER_Y+30;linear,3;y,SCREEN_CENTER_Y+50;visible,true;bouncebegin,0.1;zoomx,0);
			ShowEnteringOptionsCommand=cmd(stoptweening;linear,0.8;y,-100)
		};
		Def.BitmapText{
			Font="_fishfingers normal",
			Text="Press start for more options",
			InitCommand=cmd(xy,-1000,SCREEN_CENTER_Y);
			ShowPressStartForOptionsCommand=cmd(decelerate,0.5;x,SCREEN_CENTER_X-20;linear,3;CenterX;bouncebegin,0.1;zoomy,0);
			ShowEnteringOptionsCommand=cmd(stoptweening;settext,'Entering options menu...';sleep,0.2;bouncebegin,0.15;zoomy,0)
		};
	};
}
--Difficulty List
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(xy,190,SCREEN_CENTER_Y-20;visible,not GAMESTATE:IsCourseMode());
	Def.StepsDisplayList {
		OffCommand=cmd(bouncebegin,0.15;zoomx,0);
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				self:stoptweening():bounceend(0.15):zoomx(1)
			else
				self:stoptweening():bouncebegin(0.15):zoomx(0):sleep(0.2)
			end
		end;
		Name="StepsDisplayListRow";
		CursorP1= Def.ActorFrame{
			InitCommand=cmd(x,-100;player,PLAYER_1);
			Def.BitmapText{
				Font="_fishfingers Bold",
				Text="P1",
				OnCommand=cmd(zoom,0.6;y,-2;x,-1;diffuse,PlayerColor(PLAYER_1);shadowlength,1)
			};

		};
		CursorP2= Def.ActorFrame{
			InitCommand=cmd(x,100;diffuse,PlayerColor(PLAYER_2);player,PLAYER_2);
			PlayerJoinedMessageCommand=function(self, params)
					if params.Player == PLAYER_2 then
						self:visible(true);
						(cmd(zoom,0;bounceend,1;zoom,1))(self);
					end;
			end;
			Def.BitmapText{
				Font="_fishfingers Bold",
				Text="P2",
				OnCommand=cmd(zoom,0.6;y,-2;x,-1;diffuse,PlayerColor(PLAYER_2);shadowlength,1)
			};
		};
		CursorP1Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening;decelerate,0.1);
		};
		CursorP2Frame = Def.Actor{
			ChangeCommand=cmd(stoptweening;decelerate,0.05);
		};
	};
};
--Course Contents
local transform = function(self,offsetFromCenter,itemIndex,numitems)
	self:y( offsetFromCenter * 44 );
end
t[#t+1]=Def.CourseContentsList {
	InitCommand=cmd(xy,195,SCREEN_CENTER_Y+10);
	OffCommand=cmd(bouncebegin,0.15;zoomy,0);
	MaxSongs = 7;
    	NumItemsToDraw = 8;
	ShowCommand=cmd(bouncebegin,0.3;zoomy,1);
	HideCommand=cmd(linear,0.3;zoomy,0);
	SetCommand=function(self)
		self:SetFromGameState();
		self:SetCurrentAndDestinationItem(0);
		self:SetPauseCountdownSeconds(1);
		self:SetSecondsPauseBetweenItems( 0.25 );
		self:SetTransformFromFunction(transform);
		self:SetDestinationItem(math.max(0,self:GetNumItems() - 4));
		self:SetLoop(false);
		self:SetMask(0,0);
	end;
	CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
	Display = Def.ActorFrame { 
		InitCommand=cmd(setsize,50,150);
		LoadActor(THEME:GetPathG("CourseEntryDisplay","bar")) .. {
			SetSongCommand=function(self, params)
				if params.Difficulty then
					self:diffuse( CustomDifficultyToColor(params.Difficulty) );
				else
					self:diffuse( color("#FFFFFF") );
				end
				(cmd(finishtweening;zoomy,0;sleep,0.125*params.Number;linear,0.125;zoomy,1.1;linear,0.05;zoomx,1.1;decelerate,0.1;zoom,1))(self);
			end;
		};

		Def.TextBanner {
			InitCommand=cmd(x,-28;y,2;Load,"TextBanner";SetFromString,"", "", "", "", "", "");
			SetSongCommand=function(self, params)
				if params.Song then
					self:SetFromSong( params.Song );
					self:diffuse( CustomDifficultyToColor(params.Difficulty) );
				else
					self:SetFromString( "??????????", "??????????", "", "", "", "" );
					self:diffuse( color("#FFFFFF") );
				end
				(cmd(finishtweening;zoomy,0;sleep,0.125*params.Number;linear,0.125;zoomy,1.1;linear,0.05;zoomx,1.1;decelerate,0.1;zoom,1))(self);
			end;
		};

 		LoadFont("_futura q") .. {
			Text="0";
			InitCommand=cmd(x,114;y,0;shadowlength,1);
			SetSongCommand=function(self, params)
				if params.PlayerNumber ~= GAMESTATE:GetMasterPlayerNumber() then return end
				self:settext( params.Meter );
				self:diffuse( CustomDifficultyToColor(params.Difficulty) );
				(cmd(finishtweening;zoomy,0;sleep,0.125*params.Number;linear,0.125;zoomy,1.2;linear,0.05;zoomx,1.2;decelerate,0.1;zoom,1))(self);
			end;
		}; 
	};
};
t[#t+1]=Def.Quad{
	Name="Hider",
	InitCommand=cmd(visible,GAMESTATE:IsCourseMode();setsize,390,90;xy,160,SCREEN_CENTER_Y-60;diffuse,color("#000033"));
	ShowPressStartForOptionsCommand=cmd(visible,false)
};

--BPM Display
t[#t+1] = Def.ActorFrame{
		InitCommand=cmd(xy,150,SCREEN_CENTER_Y-60);
		OffCommand=cmd(bouncebegin,0.15;zoomy,0);
		Def.BPMDisplay{
			Name="BPMDisplay";
			Font="BPMDisplay bpm";
			SetCommand=function(self) self:SetFromGameState() end;
			CurrentSongChangedMessageCommand=cmd(playcommand,'Set');
			CurrentCourseChangedMessageCommand=cmd(playcommand,'Set');
		};
		Def.BitmapText{
			Name="BPMLabel";
			Font="_fishfingers normal";
			Text="BPM";
			OnCommand=cmd(x,50);
		};
};
--Pane Display...which I'll do later because I'm too lazy	
return t
