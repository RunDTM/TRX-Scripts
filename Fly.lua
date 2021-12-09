local Fly = false
local localplayer = game:service "Players".LocalPlayer
local mouse = localplayer:GetMouse ""
local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
local speed = 0
local keys = {a = false, d = false, w = false, s = false}
local e1
local e2
local function start()
    local pos = Instance.new("BodyPosition", torso)
    local gyro = Instance.new("BodyGyro", torso)
    pos.Name = "EPIXPOS"
    pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
    pos.position = torso.Position
    gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    gyro.cframe = torso.CFrame
    repeat
        wait()
        localplayer.Character.Humanoid.PlatformStand = true
        local new = gyro.cframe - gyro.cframe.p + pos.position
        if not keys.w and not keys.s and not keys.a and not keys.d then
            speed = 1
        end
        if keys.w then
            new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
            speed = speed + 0.01
        end
        if keys.s then
            new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
            speed = speed + 0.01
        end
        if keys.d then
            new = new * CFrame.new(speed, 0, 0)
            speed = speed + 0.01
        end
        if keys.a then
            new = new * CFrame.new(-speed, 0, 0)
            speed = speed + 0.01
        end
        if speed > 5 then
            speed = 5
        end
        pos.position = new.p
        if keys.w then
            gyro.cframe = workspace.CurrentCamera.CoordinateFrame
        elseif keys.s then
            gyro.cframe = workspace.CurrentCamera.CoordinateFrame
        else
            gyro.cframe = workspace.CurrentCamera.CoordinateFrame
        end
    until not Fly
    if gyro then
        gyro:Destroy()
    end
    if pos then
        pos:Destroy()
    end
    flying = false
    localplayer.Character.Humanoid.PlatformStand = false
    speed = 0
end
e1 =
    mouse.KeyDown:connect(
    function(key)
        if not torso or not torso.Parent then
            flying = false
            e1:disconnect()
            e2:disconnect()
            return
        end
        if key == "w" then
            keys.w = true
        elseif key == "s" then
            keys.s = true
        elseif key == "a" then
            keys.a = true
        elseif key == "d" then
            keys.d = true
        end
    end
)
e2 =
    mouse.KeyUp:connect(
    function(key)
        if key == "w" then
            keys.w = false
        elseif key == "s" then
            keys.s = false
        elseif key == "a" then
            keys.a = false
        elseif key == "d" then
            keys.d = false
        end
    end
)
start()

local kk =
    mouse.KeyDown:Connect(
    function(key)
        if key == "e" then
            Fly = not Fly
            if Fly == true then
                start()
            end
        end
    end
)

game:service "Players".LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Died:Connect(
    function()
        if Fly == true then
            Fly = false
        end
        kk:Disconnect()
    end
)

game:service "StarterGui":SetCore("SendNotification", {Title = "Fly", Text = "Press E to fly", Button1 = "ok"})
