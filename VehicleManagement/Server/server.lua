AddRemoteEvent("EngineAction", function(player)
    local vehicle = GetPlayerVehicle(player)
    local vehicleEngineState = GetVehicleEngineState(vehicle)

    if (GetPlayerVehicleSeat(player) ~= 1) then
        AddPlayerChat(player, "Vous n'êtes pas à la place conducteur")
        return
    end

    if (vehicleEngineState == true) then
        StopVehicleEngine(vehicle)
    else
        StartVehicleEngine(vehicle)
    end
end)