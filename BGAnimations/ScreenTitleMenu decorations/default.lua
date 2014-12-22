return Def.ActorFrame{
	--title
	Def.BitmapText{
		Font="_fishfingers bold",
		Text="Mithras' Gone Wild",
		InitCommand=cmd(xy,SCREEN_CENTER_X,80);
		OnCommand=cmd(zoom,0;decelerate,0.5;zoom,1.5);
		OffCommand=cmd(decelerate,0.5;zoom,0)
	};
	Def.BitmapText{
		Font="_fishfingers normal",
		Text="inspired by Midiman",
		InitCommand=cmd(xy,SCREEN_CENTER_X,120);
		OnCommand=cmd(zoom,0;decelerate,0.5;zoom,1);
		OffCommand=cmd(decelerate,0.5;zoom,0)
	};
	LoadActor(THEME:GetPathB("","RAWR"))..{
		InitCommand=cmd(xy,SCREEN_CENTER_X,190);
		OnCommand=cmd(zoom,0;decelerate,0.5;rotationz,720;zoom,0.25);
		OffCommand=cmd(decelerate,0.5;rotationz,0;zoom,0)
	};

	--songs & groups
	Def.ActorFrame{
		OnCommand=function(self)
			self:y(100)
		local curAspect = round(GetScreenAspectRatio(),5);
		if curAspect == AspectRatios.SixteenNine then
			return
		elseif curAspect == AspectRatios.SixteenTen then
			self:x(50)
		else
			lua.ReportScriptError("Current aspect ratio not supported; please report to the github bug reporter")
		end
		end,
		Def.BitmapText{
			Font="_blaster",
			Text="Song Info",
			OnCommand=cmd(xy,SCREEN_CENTER_X-350,10;zoom,1.2);
			OffCommand=cmd(bouncebegin,0.15;zoomx,0);
		};
		Def.Quad{
			OnCommand=cmd(xy,SCREEN_CENTER_X-325,50;diffuse,color("#000000");faderight,0.25;setsize,180,100;diffusealpha,0.5);
			OffCommand=cmd(bouncebegin,0.15;zoomx,0);
		};
		Def.BitmapText{
			Font="_blaster",
			Text="Songs: "..SONGMAN:GetNumSongs(),
			OnCommand=cmd(xy,SCREEN_CENTER_X-350,30);
			OffCommand=cmd(bouncebegin,0.15;zoomx,0);
		};
		Def.BitmapText{
			Font="_blaster",
			Text="Song Groups: "..SONGMAN:GetNumSongGroups(),
			OnCommand=cmd(xy,SCREEN_CENTER_X-327,50);
			OffCommand=cmd(bouncebegin,0.15;zoomx,0);
		};
		Def.BitmapText{
			Font="_blaster",
			Text="Courses: "..SONGMAN:GetNumCourses(),
			OnCommand=cmd(xy,SCREEN_CENTER_X-348,70);
			OffCommand=cmd(bouncebegin,0.15;zoomx,0);
		};	
	};	

}
