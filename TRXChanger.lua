local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/kav"))()
local Window = Library.CreateLib("TRX Changer", "Sentinel")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main")
Section:NewSlider("WalkSpeed", "WalkSpeed Slider", 300, 0, function(s)
    game:service'Players'.LocalPlayer.Character:FindFirstChildWhichIsA'Humanoid'.WalkSpeed = s
end)
Section:NewSlider("JumpPower", "JumpPower Slider", 300, 0, function(s)
    game:service'Players'.LocalPlayer.Character:FindFirstChildWhichIsA'Humanoid'.JumpPower = s
end)
Section:NewSlider("Gravity", "Gravity Slider", 300, 0, function(s)
    workspace.Gravity = s
end)
