local GameList = {
    [6516141723] = "Doors lobby",
    [6839171747] = "Doors",
    [110258689672367] = "Doors",
    [142823291] = "Murderer Mystery 2",
}

local place_id = game.PlaceId
local url = "https://raw.githubusercontent.com/GeorgeRoblox/BlackKing/refs/heads/main/Games/"

local function Load(url)
    loadstring(game:HttpGet(url))()
end

if GameList[place_id] == "Doors" then
    Load(url .. "Doors.lua")
elseif GameList[place_id] == "Doors lobby" then
    Load(url .. "DoorsLobby.lua")
elseif GameList[place_id] == "Murderer Mystery 2" then
    Load(url .. "MM2.lua")
else
    Load(url .. "Universal.lua")
end
