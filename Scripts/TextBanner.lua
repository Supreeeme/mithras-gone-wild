--Formatting title, subtile, and artist
function TextBannerPostSet(self,param)
	local Title=self:GetChild("Title") 
	local Subtitle=self:GetChild("Subtitle")
	local Artist=self:GetChild("Artist")

	Title:maxwidth(250)
	Subtitle:maxwidth(230)
	Artist:maxwidth(240)

	if Subtitle:GetText() == "" and Artist:GetText() == "" then
		Title:y(0)
		Title:zoom(1)
		Subtitle:visible(false)
		Artist:visible(false)
	elseif Subtitle:GetText() == "" then
		Title:y(-6)
		Artist:y(6)
		Subtitle:visible(false)
	elseif Artist:GetText() == "" then
		Title:y(-6)
		Subtitle:y(6)
		Subtitle:visible(true)
		Artist:visible(false)
	else
		Title:y(-12)
		Subtitle:y(0)
		Artist:y(12)
		Subtitle:visible(true)
		Artist:visible(true)
	end
end
