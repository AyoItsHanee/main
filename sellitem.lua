local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Data = game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name]
local inventoryPath = game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Inventory
local itemsFolder = inventoryPath:WaitForChild("Items")

-- Define a whitelist of item names and their prices
local whitelist = {
    ["War Fans"] = 3500,
    ["Flame Katana"] = 3500,
    ["Beast Katanas"] = 3500,
    ["Giyu's Water Katana"] = 500,
    ["Insect Katana"] = 3500,
    ["Lightning Katana"] = 500,
    ["Mist Katana"] = 3500,
    ["Scythe"] = 3500,
    ["Claws"] = 3500,
    ["Water Katana"] = 500,
    ["Wind Katana"] = 500,
    ["Snow Katana"] = 3500
}

-- Initialize variables to store found item prices and total price
local foundItems = {}
local totalItemPrice = 0

local function findAndCreateArgsForItems(folder)
    local args = {
        [1] = {},
        [2] = 0,
        [3] = 0
    }

    for _, itemFolder in pairs(folder:GetChildren()) do
        local itemName = itemFolder.Name
        local price = whitelist[itemName]
        if price then
            local settings = itemFolder:FindFirstChild("Settings")
            if settings then
                local idValue = settings:FindFirstChild("Id")
                if idValue and idValue:IsA("IntValue") then
                    local id = idValue.Value
                    print("Item:", itemName)
                    print("ID:", id)
                    foundItems[itemName] = id
                    totalItemPrice = totalItemPrice + price

                    -- Add the item ID with a value of 1 to args[1]
                    args[1][id] = 1
                end
            end
        end
    end

    return args
end

-- Call the modified function with the 'Items' folder
local args = findAndCreateArgsForItems(itemsFolder)

-- Print the total price of all found items
print("Total Price of Found Items:", totalItemPrice)

-- Divide the total price by 25000 and round to the nearest integer
local result = math.floor(totalItemPrice / 25000)

args[2] = result

-- Print the result without a comma
print("Total Price of Found Items (Divided by 25000):", result)

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame
local framest = Instance.new("Frame")
framest.Size = UDim2.new(0, 300, 0, 50)
framest.Position = UDim2.new(0.25, -framest.Size.X.Offset / 2, 0.25, -framest.Size.Y.Offset / 2)  --UDim2.new(0.5, 0, 0.5, 0)
framest.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
framest.BackgroundTransparency = 0.5
framest.Parent = screenGui
-- Create a TextLabel to display the state of KeepSC
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.5, 0)
label.Position = UDim2.new(0, 0, 0, 0, 0)
label.Text = "Total Price of Found Items (Divided by 25000): " .. tostring(result)
label.Parent = framest

print("Selling Items in 20 seconds")
wait(10)
print("Selling Items in 10 seconds")
wait(5)
print("Selling Items in 5 seconds")
wait(1)
print("Selling Items in 4 seconds")
wait(1)
print("Selling Items in 3 seconds")
wait(1)
print("Selling Items in 2 seconds")
wait(1)
print("Selling Items in 1 seconds")

-- Run the action with the generated args
game:GetService("ReplicatedStorage"):WaitForChild("Sell_Items_tang"):InvokeServer(unpack(args))
