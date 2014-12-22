--stolen from ultralight, thanks freem
local grade = ...
assert(grade, "needs a grade")

return LoadFont("_fishfingers large")..{
	Text=THEME:GetString("Grade",grade);
	InitCommand=cmd(diffuse,color("#FFFFFF");shadowlength,1;strokecolor,color("#00000000"));
};
