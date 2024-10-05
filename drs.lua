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
if placeIds[game.PlaceId] then
    sendNotification("Place Check", placeIds[game.PlaceId], 10, thumbsUpImage)
-- Mspaint
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

else
    sendNotification("Error", "You are not in Doors!", 10, thumbsDownImage)
end
