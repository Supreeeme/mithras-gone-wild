-- ty kyz for your wisdom
local p1stats=STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
local p2stats=STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2)

-- Kyzentun's backward grading. Maybe put in as easter egg.
--[[local grades= {"AAAA", "AAA", "AA", "A", "B", "C", "D", "E", "F"}
local tier_to_grade= {}
local function pad_num(n) if n < 10 then return "0"..n end return tostring(n) end
for i, grade in ipairs(grades) do
	tier_to_grade["Grade_Tier"..pad_num(#grades-i+1)]= grade
end]]
--Grading
local grades= {"F", "E", "D", "C", "B", "A", "AA", "AAA", "AAAA"}
local tier_to_grade= {}
local function getnum(n)
	if n < 10 then return "0"..n end return tostring(n)
end

for i, grade in ipairs(grades) do
	tier_to_grade["Grade_Tier"..getnum(#grades-i+1)]=grade
end

local t = Def.ActorFrame{
	Def.BitmapText{
		Font="_fishfingers normal",
		Text="",
		InitCommand=cmd(xy,SCREEN_CENTER_X,130),
		OnCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				self:settext(GAMESTATE:GetCurrentCourse():GetDisplayFullTitle())
			else
				self:settext(GAMESTATE:GetCurrentSong():GetDisplayMainTitle())
			end
		end
	};
	Def.Quad{
		InitCommand=cmd(setsize,SCREEN_WIDTH,1;xy,SCREEN_CENTER_X,150;zoomx,0);
		OnCommand=cmd(bounceend,0.5;zoomx,1);
	};
	Def.BitmapText{
		Font="_fishfingers Bold",
		Text="Score",
		InitCommand=cmd(xy,SCREEN_CENTER_X,180);
	};
	Def.BitmapText{
		Font="_fishfingers Bold",
		Text="Grade",
		InitCommand=cmd(xy,SCREEN_CENTER_X,220);
	};
	Def.BitmapText{
		Font="_fishfingers Bold",
		Text="Max Combo",
		InitCommand=cmd(xy,SCREEN_CENTER_X,260)
	};
}
if GAMESTATE:IsHumanPlayer(PLAYER_1) then
t[#t+1]=Def.BitmapText{
		Font="_fishfingers normal",
		Text=p1stats:GetScore(),
		InitCommand=cmd(xy,SCREEN_CENTER_X-100,180;diffuse,PlayerColor(PLAYER_1));
	};
t[#t+1]=Def.BitmapText{
		Font="_fishfingers normal",
		Text=tier_to_grade[p1stats:GetGrade()],
		InitCommand=cmd(xy,SCREEN_CENTER_X-100,220;diffuse,PlayerColor(PLAYER_1));
		OnCommand=function(self)
			if p1stats:GetGrade() == "Grade_Failed" then
				self:settext("F")
			end
		end
	};
t[#t+1]=Def.BitmapText{
		Font="_fishfingers normal",
		Text=tostring(p1stats:MaxCombo()),
		InitCommand=cmd(xy,SCREEN_CENTER_X-100,260;diffuse,PlayerColor(PLAYER_1))
	};
end
if GAMESTATE:IsHumanPlayer(PLAYER_2) then
t[#t+1]=Def.BitmapText{
		Font="_fishfingers normal",
		Text=tier_to_grade[p2stats:GetGrade()],
		InitCommand=cmd(xy,SCREEN_CENTER_X+100,220;diffuse,PlayerColor(PLAYER_2))
	};
t[#t+1]=Def.BitmapText{
		Font="_fishfingers normal",
		Text=p2stats:GetScore(),
		InitCommand=cmd(xy,SCREEN_CENTER_X+150,180;diffuse,PlayerColor(PLAYER_2));
		OnCommand=function(self)
			if p2stats:GetGrade() == "Grade_Failed" then
				self:settext("F")
			end
		end
	};
t[#t+1]=Def.BitmapText{
		Font="_fishfingers normal",
		Text=tostring(p2stats:MaxCombo()),
		InitCommand=cmd(xy,SCREEN_CENTER_X+100,260;diffuse,PlayerColor(PLAYER_2))
	};
end
if not GAMESTATE:IsCourseMode() then
t[#t+1]=LoadActor(GAMESTATE:GetCurrentSong():GetBannerPath() or THEME:GetPathG("","Common fallback banner"))..{
		InitCommand=cmd(xy,SCREEN_CENTER_X,60)
	};
else
t[#t+1]=LoadActor(GAMESTATE:GetCurrentCourse():GetBannerPath() or THEME:GetPathG("","Common fallback banner"))..{
		InitCommand=cmd(xy,SCREEN_CENTER_X,60)
	};
end
return t
