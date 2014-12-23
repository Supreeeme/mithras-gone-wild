--I'm guessing this does something important
local function OptionNameString(str) return THEME:GetString('OptionNames',str) end
local mithrasPrefs={
	ShowStepsType={
		Default = true,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
	AutoSetStyle={
		Default = true,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
	ShowFlashyCombo={
		Default = true,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
}
ThemePrefs.InitAll(mithrasPrefs)
		
