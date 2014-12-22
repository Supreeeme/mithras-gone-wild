local jl = Var "JudgmentLine";

return Def.ActorFrame {
	LoadFont("_fishfingers Bold") .. {
		Text=string.upper(JudgmentLineToLocalizedString(jl)),
		InitCommand=cmd(diffuse,JudgmentLineToColor(jl);shadowlength,1;maxwidth,180);
	};
};
