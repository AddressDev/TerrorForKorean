local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CResource = ReplicatedStorage:WaitForChild("CarbonResource", 3)
local Players = game:GetService("Players")

local Window = Fluent:CreateWindow({
    Title = "Universal Hub For Terror",
    SubTitle = "by Address",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local tabs = {
    CETab = Window:AddTab({ Title = "Carbon Engine (CE)", Icon = "" }),
}

do -- Carbon Engine
    Tabs.CETab:AddButton({
        Title = "Check Carbon Engine Location",
        Description = "Find Carbon Engine",
        Callback = function()
            local Events = {}
            
            Players.LocalPlayer.Character.Humanoid.Health = 0
            task.wait(0.3)
            
            for idx, remote in pairs(CResource.Events:GetChildren()) do
                Events[remote.Name] = remote
            end
            
            Window:Dialog({
                Title = "Universal Hub",
                Content = "Succesfully find the location."
            })
        end
    })

    Tabs.CETab:AddButton({
        Title = "Kill All",
        Description = "Kill all the players"
        Callback = function()
            local Players = game:GetService("Players")

            for idx, plr in pairs(Players:GetPlayers()) do
                if plr ~= Players.LocalPlayer then
                    Events["DamageEvent"]:FireServer(plr.Character:FindFirstChild("Humanoid"), 100000, "Torso", {'nil','Auth','nil','nil'})
                end
            end
        end
    })
end