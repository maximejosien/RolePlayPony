local dealerPointLocation = { x = 163333.75, y = 191667.28125, z = 1341.3671875 }

local vehicleLocations = {
    { x = 161061.359375, y = 191816.046875, z = 1265.423828125, h = -86.444946289063 },
    { x = 160541.421875, y = 191794.953125, z = 1265.423828125, h = -86.444946289063 },
    { x = 160053.0625, y = 191739.078125, z = 1265.423828125, h = -86.444946289063 },
    { x = 159561.40625, y = 191705.046875, z = 1265.423828125, h = -85.552917480469 },
}

AddEvent("OnPackageStart", function()
    CreateCarDealerPoint()
end)

AddRemoteEvent("playerBuyVehicleAtCarDealerFromClient", function(player, vehicle)
    local locationX, locationY, locationZ = GetPlayerLocation(player)

    local distance = GetDistance3D(
        locationX,
        locationY,
        locationZ,
        dealerPointLocation.x,
        dealerPointLocation.y,
        dealerPointLocation.z
    )

    if (distance >= 300) then
        AddPlayerChat(player, "Vous n'etes pas dans un coin de vente")
        return
    end

    for index, vehicleLocation in ipairs(vehicleLocations) do
        if (IsVehicleAlreadyParkOnPosition(vehicleLocation) == 'KO') then
            PlayerBuyCar(player, vehicle, vehicleLocation)
            break
        end
    end

    AddPlayerChat(player, "Achat en cours")
end)

function CreateCarDealerPoint()
    CreateObject(2, dealerPointLocation.x, dealerPointLocation.y, dealerPointLocation.z)
end

function PlayerBuyCar(player, vehicle, vehicleLocation)
    CreateVehicle(
        vehicle,
        vehicleLocation.x,
        vehicleLocation.y,
        vehicleLocation.z,
        vehicleLocation.h
    )
end

function IsVehicleAlreadyParkOnPosition(vehicleLocation)
    for index, vehicle in pairs(GetAllVehicles()) do
        local locationX, locationY, locationZ = GetVehicleLocation(vehicle)

        local distance = GetDistance3D(
            locationX,
            locationY,
            locationZ,
            vehicleLocation.x,
            vehicleLocation.y,
            vehicleLocation.z
        )

        if (distance <= 450) then
            return 'OK'
        end
    end

    return 'KO'
end

--
--AddRemoteEvent("playerBuyVehicleAtCarDealerFromClient", function(player, vehicle)
--    AddPlayerChat(1, "AMAZING")
--end)
