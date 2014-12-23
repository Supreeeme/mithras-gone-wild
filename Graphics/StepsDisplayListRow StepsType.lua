local sString;

local stGraphics = {
	-- dance (ok)
	StepsType_Dance_Single = "dance-single",
	StepsType_Dance_Double = "dance-double",
	StepsType_Dance_Couple = "dance-couple",
	StepsType_Dance_Solo = "solo",
	StepsType_Dance_Routine = "dance-routine",
	StepsType_Dance_Threepanel = "dance-3panel",
	-- pump (ok)
	StepsType_Pump_Single = "pump-single",
	StepsType_Pump_Halfdouble = "pump-halfdouble",
	StepsType_Pump_Double = "pump-double",
	StepsType_Pump_Couple = "pump-couple",
	StepsType_Pump_Routine = "pump-routine",
	-- kb7
	StepsType_Kb7_Single = "kb7",
	-- ez2
	StepsType_Ez2_Single = "base",
	StepsType_Ez2_Double = "base",
	StepsType_Ez2_Real = "base",
	-- para
	StepsType_Para_Single = "para",
	-- ds3ddx
	StepsType_Ds3ddx_Single = "base",
	-- beat (ok)
	StepsType_Bm_Single5 = "beat5",
	StepsType_Bm_Double5 = "beat10",
	StepsType_Bm_Single7 = "beat7",
	StepsType_Bm_Double7 = "beat14",
	-- maniax
	StepsType_Maniax_Single = "maniax-single",
	StepsType_Maniax_Double = "maniax-double",
	-- techno (ok)
	StepsType_Techno_Single4 = "dance-single",
	StepsType_Techno_Single5 = "pump-single",
	StepsType_Techno_Single8 = "techno8",
	StepsType_Techno_Double4 = "dance-double",
	StepsType_Techno_Double5 = "pump-double",
	-- popn
	StepsType_Pnm_Five = "popn5",
	StepsType_Pnm_Nine = "popn9",
	-- gametypes that don't matter
	StepsType_Lights_Cabinet = "lights", -- nobody should play this mode (except to test lightmaps)
};

local t = Def.ActorFrame{
	Def.BitmapText{
		Font="_fishfingers normal",
		OnCommand=cmd(maxwidth,100;maxheight,25;y,-1);
		SetMessageCommand=function(self,param)
			if param.StepsType then
				self:settext(stGraphics[param.StepsType])
				if param.Steps:IsAutogen() then
					self:rainbow()
				else
					self:stopeffect();
				end;
			end;
		end;
	};
};

return t;
