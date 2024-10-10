if getgenv().doorshacksloaded then
    local thumbsDownImage = "rbxassetid://99911273351388"
    game:GetService("StarterGui"):SetCore("SendNotification", {  
        Title = "Erroɾ";
        Text = "Doors hacks already loaded!";
        Duration = 10; 
        Icon = thumbsDownImage;
    })
    return
end
getgenv().doorshacksloaded = true
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
        ["rbxassetid://16604121645"] = "rbxassetid://5037969255",
        ["rbxassetid://10470707502"] = "rbxassetid://101837480757161",
        ["rbxassetid://6973423505"] = "rbxassetid://12110342523",
        ["rbxassetid://9113549320"] = "rbxassetid://8248258948",
        ["rbxassetid://10460221938"] = "rbxassetid://10907273416",
        ["rbxassetid://10472770795"] = "rbxassetid://11638638410",
        ["rbxassetid://10470715177"] = "rbxassetid://5246103002"
    },
    [10549820578] = {
        ["rbxassetid://8007673711"] = "rbxassetid://9114149321",
        ["rbxassetid://16604121645"] = "rbxassetid://5037969255",
        ["rbxassetid://11447013731"] = "rbxassetid://5188314808",
        ["rbxassetid://7758469482"] = "rbxassetid://5037969255",
        ["rbxassetid://6973423505"] = "rbxassetid://12110342523",
        ["rbxassetid://10460221938"] = "rbxassetid://10907273416",
        ["rbxassetid://10472770795"] = "rbxassetid://11638638410",
        ["rbxassetid://10470715177"] = "rbxassetid://5246103002"
    },
    [6516141723] = {
        ["rbxassetid://7767565697"] = "rbxassetid://11638638410"
    }
}
local defaultVolume = 1.6  -- Set volume (0-10)
if placeIds[game.PlaceId] then
    sendNotification("Place Check", placeIds[game.PlaceId], 10, thumbsUpImage)
    -- MSPaint
    loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()
    -- Door sounds part 2
    workspace.ChildAdded:Connect(function(child)      
        if child:IsA("Part") and child:FindFirstChild("ClickDetector") then      
            child.ClickDetector.MouseClick:Connect(function()            
                print("Door opened:", child.Name)     
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
else
    sendNotification("Error", "You are not in Doors!", 10, thumbsDownImage)
end
