return Def.ActorFrame{
	Def.BitmapText{
		Font="_fishfingers Bold",
		Text="Select Game Mode",
		InitCommand=cmd(diffusealpha,0;xy,SCREEN_CENTER_X,SCREEN_TOP+90;zoom,1.1);
		OnCommand=cmd(sleep,0.8;diffusealpha,1);
		OffCommand=cmd(linear,0.5;diffusealpha,0)
	},
	Def.BitmapText{
		Font="_fishfingers normal",
		Text="Which game mode would you like?",
		InitCommand=cmd(diffusealpha,0;xy,SCREEN_CENTER_X,SCREEN_TOP+140);
		OnCommand=cmd(sleep,0.8;diffusealpha,1;);
	},
	--yay, moar lines
	Def.Quad{
		InitCommand=cmd(xy,SCREEN_CENTER_X,200;setsize,SCREEN_WIDTH,1);
		OnCommand=cmd(decelerate,0.7;y,SCREEN_TOP+110);
		OffCommand=cmd(decelerate,0.7;x,SCREEN_LEFT-1000)
	},
	Def.Quad{
		InitCommand=cmd(xy,SCREEN_CENTER_X,282;setsize,SCREEN_WIDTH,1);
		OnCommand=cmd(decelerate,0.7;y,SCREEN_BOTTOM-150);
		OffCommand=cmd(decelerate,0.7;x,SCREEN_RIGHT+1000)
	};
	--yay for rawr
	LoadActor("RAWR")..{
		InitCommand=cmd(Center;zoom,0.25);
		OnCommand=function(self)
			self:decelerate(0.7)
			if curAspect==AspectRatios.SixteenNine then
				self:xy(150,SCREEN_TOP+60):rotationz(720):spin();
			elseif curAspect==AspectRatios.SixteenTen then
				self:xy(100,SCREEN_TOP+60):rotationz(720):spin()
			else
				lua.ReportScriptError("Current aspect ratio not supported, please report")
			end
		end,
		OffCommand=cmd(decelerate,0.7;zoom,0;rotationz,-720)
	};
	LoadActor("RAWR")..{
		InitCommand=cmd(Center;zoom,0.25);
		OnCommand=function(self)
			self:decelerate(0.7)
			if curAspect==AspectRatios.SixteenNine then
				self:xy(750,SCREEN_TOP+60):rotationz(720):spin()
			elseif curAspect==AspectRatios.SixteenTen then
				self:xy(700,SCREEN_TOP+60):rotationz(720):spin()
			end
		end,
		OffCommand=cmd(decelerate,0.7;zoom,0;rotationz,-720)
	};
	LoadActor("RAWR")..{
		InitCommand=cmd(Center;zoom,0.25);
		OnCommand=function(self)
			self:decelerate(0.7)
			if curAspect==AspectRatios.SixteenNine then
				self:xy(150,SCREEN_BOTTOM-50):rotationz(720):spin();
			elseif curAspect==AspectRatios.SixteenTen then
				self:xy(100,SCREEN_BOTTOM-50):rotationz(720):spin();
			end
		end,
		OffCommand=cmd(decelerate,0.7;zoom,0;rotationz,-720)
	};
	LoadActor("RAWR")..{
		InitCommand=cmd(Center;zoom,0.25);
		OnCommand=function(self)
			self:decelerate(0.7)
			if curAspect==AspectRatios.SixteenNine then
				self:xy(750,SCREEN_BOTTOM-50):rotationz(720):spin()
			elseif curAspect==AspectRatios.SixteenTen then
				self:xy(700,SCREEN_BOTTOM-50):rotationz(720):spin()
			end
		end,
		OffCommand=cmd(decelerate,0.7;zoom,0;rotationz,-720)
	};
}
