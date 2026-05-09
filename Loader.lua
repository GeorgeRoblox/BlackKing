local GameList = {
    [6516141723] = "Doors",
}

local place_id = game.PlaceId
local url = "https://raw.githubusercontent.com/GeorgeRoblox/BlackKing/refs/heads/main/Games/"

local function Load(url)
    loadstring(game:HttpGet(url))()
end

if GameList[place_id] == "Doors" then
    Load(url .. "Doors.lua")
else
    Load(url .. "Universal.lua")
end
