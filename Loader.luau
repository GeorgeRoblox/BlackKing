local GameList = {
    [6516141723] = "Doors lobby",
    [6839171747] = "Doors",
    [110258689672367] = "Doors",
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
else
    Load(url .. "Universal.lua")
end
