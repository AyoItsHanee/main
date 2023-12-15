local inventoryPath = game:GetService("ReplicatedStorage").Player_Data.HonestTested.Inventory
local itemsFolder = inventoryPath:WaitForChild("Items")

-- Define a whitelist of item names and their prices
local whitelist = {
    ["Ore"] = 1,
}

-- Initialize variables to store found item prices and total price
local foundItems = {}
local totalItemPrice = 0

-- Function to find and perform an action for items with specific IDs
local function findAndPerformActionForItems(folder, currentPath)
    for _, itemFolder in pairs(folder:GetChildren()) do
        local itemName = itemFolder.Name
        local price = whitelist[itemName]
        if price then
            local settings = itemFolder:FindFirstChild("Settings")
            if settings then
                local idValue = settings:FindFirstChild("Id")
                if idValue and idValue:IsA("IntValue") then
                    local id = idValue.Value
                    foundItems[itemName] = id
                    totalItemPrice = totalItemPrice + price
                end
            end
        end
        -- Recursively call the function for subfolders
        findAndPerformActionForItems(itemFolder, currentPath .. itemName .. ".")
    end
end

-- Call the modified function with the 'Items' folder and an initial empty path
findAndPerformActionForItems(itemsFolder, "")

-- Print the total price of all found items
print("Total Price of Found Items:", totalItemPrice)
local args = {
    [1] = "add_items",
    [2] = {
        [1] = id
    },
    [3] = game:GetService("ReplicatedStorage"):WaitForChild("trading_folder"):WaitForChild("HonestTested<>ASUS_CITY1"):WaitForChild("Player2")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("trade"):FireServer(unpack(args))
