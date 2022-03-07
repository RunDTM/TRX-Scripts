local plr = game:service'Players'.LocalPlayer
local mouse = plr:GetMouse()
local notify = (trx and trx.notify) or function(msg) game:service'StarterGui':SetCore('SendNotification', {Title = 'TRX Notification', Text = msg, Duration = 7}) end

notify('G to path.')

mouse.KeyDown:Connect(function(key)
if key == 'g' then
local part = Instance.new('Part', workspace)
part.Name = 'Path'
part.Anchored = true
part.Size = Vector3.new(5,1,5)
part.Position = plr.Character.HumanoidRootPart.Position - Vector3.new(0, 1.5, 0)
end
end)

