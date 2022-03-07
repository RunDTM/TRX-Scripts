local noclip = false
local plr = game:service'Players'.LocalPlayer
local mouse = plr:GetMouse()
local notify = (trx and trx.notify) or function(msg) game:service'StarterGui':SetCore('SendNotification', {Title = 'TRX Notification', Text = msg, Duration = 7}) end

notify('R to noclip.')

mouse.KeyDown:Connect(function(key)
if key == 'r' then
noclip = not noclip
end
end)

game:service'RunService'.Stepped:Connect(function()
if noclip then
for i,v in pairs(plr.Character:GetDescendants()) do
if v:IsA('BasePart') and v.Name ~= 'HumanoidRootPart' then
v.CanCollide = false
end
end
end
end)
