if getgenv().doorshacksloaded then
    local thumbsDownImage = "rbxassetid://99911273351388"
    game:GetService("StarterGui"):SetCore("SendNotification", {  
        Title = "Erroɾ";
        Text = "Doors script already loaded!";
        Duration = 10; 
        Icon = thumbsDownImage;
    })
    return
end
getgenv().doorshacksloaded = true
local placeIds = {
    [6839171747] = "You are in a Doors match!",
    [10549820578] = "You are in a Super Hard Mode Doors match!",
    [6516141723] = "You are in the Doors lobby!",
    [12308344607] = "You are in the Doors Voice Chat lobby!"
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
        ["rbxassetid://11447013731"] = {id = "rbxassetid://5188314808", volume = 1.45},
        ["rbxassetid://7758469482"] = {id = "rbxassetid://5037969255", volume = 1.6},
        ["rbxassetid://8007673711"] = {id = "rbxassetid://9114149321", volume = 1.6},
        ["rbxassetid://16604121645"] = {id = "rbxassetid://5037969255", volume = 1.6},
        ["rbxassetid://10470707502"] = {id = "rbxassetid://12159119088", volume = 1.15},
        ["rbxassetid://6973423505"] = {id = "rbxassetid://6973423694", volume = 1.45},
        ["rbxassetid://9113549320"] = {id = "rbxassetid://8248258948", volume = 1.6},
        ["rbxassetid://10460221938"] = {id = "rbxassetid://10907273416", volume = 1.6},
        ["rbxassetid://10472770795"] = {id = "rbxassetid://11638638410", volume = 1.6},
        ["rbxassetid://10470715177"] = {id = "rbxassetid://5246103002", volume = 1.4},
        ["rbxassetid://17717855685"] = {id = "rbxassetid://103523196237716", volume = 1.6},
        ["rbxassetid://103523196237716"] = {id = "rbxassetid://5188314808", volume = 1.45},
        ["rbxassetid://11447163904"] = {id = "rbxassetid://11447163904", volume = 0},
        ["rbxassetid://9114149321"] = {id = "rbxassetid://9114149321", volume = 1.6},
        ["rbxassetid://10116403034"] = {id = "rbxassetid://10116403034", volume = 1.45},
        ["rbxassetid://12159119088"] = {id = "rbxassetid://101837480757161", volume = 1}
    },
    [10549820578] = {
        ["rbxassetid://8007673711"] = {id = "rbxassetid://9114149321", volume = 1.6},
        ["rbxassetid://16604121645"] = {id = "rbxassetid://5037969255", volume = 1.6},
        ["rbxassetid://11447013731"] = {id = "rbxassetid://5188314808", volume = 1.45},
        ["rbxassetid://7758469482"] = {id = "rbxassetid://5037969255", volume = 1.6},
        ["rbxassetid://6973423505"] = {id = "rbxassetid://6973423694", volume = 1.45},
        ["rbxassetid://10460221938"] = {id = "rbxassetid://10907273416", volume = 1.6},
        ["rbxassetid://10472770795"] = {id = "rbxassetid://11638638410", volume = 1.6},
        ["rbxassetid://10470715177"] = {id = "rbxassetid://5246103002", volume = 1.4},
        ["rbxassetid://17717855685"] = {id = "rbxassetid://103523196237716", volume = 1.6},
        ["rbxassetid://103523196237716"] = {id = "rbxassetid://5188314808", volume = 1.45},
        ["rbxassetid://11447163904"] = {id = "rbxassetid:// 5188314808", volume = 0},
        ["rbxassetid://9114149321"] = {id = "rbxassetid://9114149321", volume = 1.6},
        ["rbxassetid://10470707502"] = {id = "rbxassetid://12159119088", volume = 1.15},
        ["rbxassetid://10116403034"] = {id = "rbxassetid://10116403034", volume = 1.45},
        ["rbxassetid://12159119088"] = {id = "rbxassetid://101837480757161", volume = 1}
    },
    [6516141723] = {
        ["rbxassetid://7767565697"] = {id = "rbxassetid://11638638410", volume = 1.0}
    },
    [12308344607] = {
        ["rbxassetid://7767565697"] = {id = "rbxassetid://11638638410", volume = 1.0}
    }
}
if placeIds[game.PlaceId] then
    sendNotification("Place Check", placeIds[game.PlaceId], 10, thumbsUpImage)
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
                    local soundInfo = soundIdMap[v.SoundId]
                    if soundInfo then
                        v.SoundId = soundInfo.id
                        v.Volume = soundInfo.volume
                    end
                end
            end
            wait(0.2)
        end
    end
else
    sendNotification("Error", "You are not in Doors!", 10, thumbsDownImage)
end
