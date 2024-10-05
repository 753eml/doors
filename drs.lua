loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
local placeIds = {6839171747, 10549820578}
local thumbsUpImage = "rbxassetid://97609256286565"
local thumbsDownImage = "rbxassetid://99911273351388"
local function sendNotification(title, text, duration, image)
    game:GetService("StarterGui"):SetCore("SendNotification", {  
        Title = title;
        Text = text;
        Duration = duration; 
        Icon = image;
    })
end

if table.find(placeIds, game.PlaceId) then
    sendNotification("Place Check", "You are in a Doors match!", 10, thumbsUpImage)
    workspace.ChildAdded:Connect(function(child)      
        if child:IsA("Part") and child:FindFirstChild("ClickDetector") then      
            child.ClickDetector.MouseClick:Connect(function()            
                onDoorOpened(child)     
            end)   
            print("Connected new door:", child.Name)    
        end
    end)
    local soundIdMap = {
        ["rbxassetid://11447013731"] = "rbxassetid://5188314808",
        ["rbxassetid://7758469482"] = "rbxassetid://5037969255",
        ["rbxassetid://8007673711"] = "rbxassetid://9114149321",
        ["rbxassetid://16604121645"] = "rbxassetid://5037969255",
        ["rbxassetid://17717855685"] = "rbxassetid://5037969255",
        ["rbxassetid://9114149321"] = "rbxassetid://8007673711"
    }
    local defaultVolume = 1.6  -- Set volume (0-10)
    while true do
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Sound") then  
                local newSoundId = soundIdMap[v.SoundId]
                if newSoundId then
                    v.SoundId = newSoundId
                    v.Volume = defaultVolume
                end
            end
        end
        wait(1)  -- Recommended: Keep the delay, but you can change it, as I lagged when I tried without it.
    end
else
    sendNotification("Error while loading sound modifications -", "You are not in a Doors match!", 10, thumbsDownImage) 
end
