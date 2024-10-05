-- Mspaint
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
-- Door sounds
local placeIds = {
    [6839171747] = "You are in a Doors match!",
    [10549820578] = "You are in a Super Hard Mode Doors match!",
    [6516141723] = "You are in the Doors lobby!"
}
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
local soundIdMaps = {
    [6839171747] = {
        ["rbxassetid://11447013731"] = "rbxassetid://5188314808",
        ["rbxassetid://7758469482"] = "rbxassetid://5037969255",
        ["rbxassetid://8007673711"] = "rbxassetid://9114149321",
        ["rbxassetid://9114149321"] = "rbxassetid://9114149321",
        ["rbxassetid://16604121645"] = "rbxassetid://5037969255"
    },
    [10549820578] = {
        ["rbxassetid://8007673711"] = "rbxassetid://9114149321",
        ["rbxassetid://16604121645"] = "rbxassetid://5037969255",
        ["rbxassetid://11447013731"] = "rbxassetid://5188314808",
        ["rbxassetid://7758469482"] = "rbxassetid://5037969255",
        ["rbxassetid://9114149321"] = "rbxassetid://9114149321"
    },
    [6516141723] = {
        ["rbxassetid://9145204049"] = "rbxassetid://101837480757161"
    }
}

local defaultVolume = 1.6  -- Set volume (0-10)
local function onDoorOpened(door)
    print("Door opened:", door.Name)
end
if game.PlaceId == 6839171747 then
    sendNotification("Supported Game", "You are in a Doors match!", 10, thumbsUpImage)
elseif game.PlaceId == 10549820578 then
    sendNotification("Supported Game", "You are in a Super Hard Mode Doors match!", 10, thumbsUpImage)
elseif game.PlaceId == 6516141723 then
    sendNotification("Supported Game", "You are in the Doors lobby!", 10, thumbsUpImage)
else
    sendNotification("Unsupported Game", "You are not in Doors!", 10, thumbsDownImage)
    return
end
workspace.ChildAdded:Connect(function(child)      
    if child:IsA("Part") and child:FindFirstChild("ClickDetector") then      
        child.ClickDetector.MouseClick:Connect(function()            
            onDoorOpened(child)     
        end)   
        print("Connected new door:", child.Name)    
    end
end)
local soundIdMap = soundIdMaps[game.PlaceId]
if soundIdMap then
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
        wait(1)
    end
end
