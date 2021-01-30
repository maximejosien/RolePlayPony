AddCommand("spawn_copter", function(player)
    spawnVehicule(player, 10)
end)

AddCommand("spawn_car", function(player)
    spawnVehicule(player, 1)
end)

AddCommand("engine", function(player)
    local vehicle = GetPlayerVehicle(player)
    if vehicle ~= 0 then
        StartVehicleEngine(vehicle)
    end
end)

function spawnVehicule(player, vehicle)
    local x, y, z = GetPlayerLocation(player)

    local vehicule = CreateVehicle(vehicle, x + 200, y, z, GetPlayerHeading(player))
end