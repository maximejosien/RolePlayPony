AddCommand("own_position", function(player)
    local x, y, z = GetPlayerLocation(player)
    AddPlayerChat("Player location :"..x..","..y..","..z);
end)