local function getLocalPlayerUsername()
    local player = game.Players.LocalPlayer
    if player then
        return player.Name
    else
        return nil
    end
end
local inventoryPath = game:GetService("ReplicatedStorage").Player_Data[getLocalPlayerUsername()].Inventory
local itemsFolder = inventoryPath:WaitForChild("Items")

-- Define a whitelist of item names and their prices
local whitelist = {
    ["Boar Head"] = 500,
    ["Kanden Shi Haorie"] = 3500,
    ["Olive Green Flower Haorie"] = 500,
    ["Shadow Haorie"] = 500,
    ["Stylish Mask"] = 500,
    ["Murasakiiro Sutoraipu Haorie"] = 3500,
    ["Uncertained Times Scarf"] = 3500,
    ["Shinobu Haorie"] = 500,
    ["Bandaged Mask"] = 500,
	["Dark Smoke Visor"] = 500,
	["Wind Necklace"] = 500,
	["Stylish Haorie"] = 500,
	["Sabito's Mask"] = 180,
	["Box Lantern"] = 500,
	["Giyu Haorie"] = 500,
	["Inosuke Bottom"] = 500,
	["Yellow Haorie"] = 500,
	["Tamari Necklace"] = 500,
	["White Scarf"] = 500,
	["Boar Head"] = 500,
	["Banigaru Mask"] = 3500,
	["Tigress Warding Mask"] = 3500,
	["Arrow Necklace"] = 500,
	["Akuma no ie Mask"] = 500,
	["Ominous Blindfold"] = 500,
	["Tokosen Haorie"] = 3500,
	["Swamp Necklace"] = 500,
	["Boroboro Haorie"] = 3500,
	["Sleeveless Dragon Haorie"] = 500,
	["Black Caped Scarf"] = 500,
	["Akai Kumo Haorie"] = 3500,
	["Gem Stone Eyepatch"] = 500,
	["Bandaged Blindfold"] = 500,
	["Akuma Kurenza Mask"] = 500,
	["Orenjibisuto Mask"] = 500,
	["Mist Necklace"] = 500,
	["Snow Haorie"] = 500,
	["Fox Mask"] = 500,
	["Tactical Black Headband"] = 500,
	["Tonakai Keikai Mask"] = 500,
	["Tanjiro Haorie"] = 500,
	["Zenitsu Haorie"] = 500,
	["Panther Mask"] = 500,
	["Striped Green Scarf"] = 500
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
                local amountValue = itemFolder:FindFirstChild("Amount") -- Added line to find the Amount value
                if idValue and idValue:IsA("IntValue") and amountValue and amountValue:IsA("IntValue") then
                    local id = idValue.Value
                    local amount = amountValue.Value - 1 -- Changed variable name from 'id' to 'amount'

                    print("Item:", itemName)
                    print("ID:", id)
                    print("Amount:", amount) -- Added line to print the amount
                    foundItems[itemName] = id
                    totalItemPrice = totalItemPrice + price * amount -- Adjusted totalItemPrice calculation

                    -- Add the item ID with the amount to args[1]
                    args[1][id] = amount -- Changed id to amount
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
