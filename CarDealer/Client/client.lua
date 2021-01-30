local dealerPointLocation = { x = 163333.75, y = 191667.28125, z = 1341.3671875 }

AddEvent("OnPackageStart", function()
    carDealerMenu = CreateWebUI(0.0, 0.0, 0.0, 0.0, 4, 32)
    SetWebVisibility(carDealerMenu, WEB_HIDDEN)
end)

AddEvent("OnPackageStop", function()
    carDealerMenu = DestroyWebUi(carDealerMenu)
end)

AddEvent("OnKeyPress", function(key)
    if key == 'F' and IsPlayerNearFromCarShopDealer() == true then
        DisplayCarDealerMenu()
    end
end)

AddEvent("playerBuyVehicleAtCarDealer", function(vehicleId)
    CallRemoteEvent("playerBuyVehicleAtCarDealerFromClient", vehicleId)
    HideCarDealerMenu()
end)

function DisplayCarDealerMenu()
    if (GetWebVisibility(carDealerMenu) == 1) then
        HideCarDealerMenu()
    else
        local screenX, screenY = GetScreenSize()

        LoadWebFile(carDealerMenu, "http://asset/"..GetPackageName().."/CarDealer/Client/Gui/VehicleShopMenu/index.html")
        SetWebSize(carDealerMenu, 600, 800)
        SetWebAlignment(carDealerMenu, 0.5, 0.5)
        SetWebAnchors(carDealerMenu, 0.5, 0.5, 0.5, 0.5)
        SetWebVisibility(carDealerMenu, WEB_VISIBLE)
        ShowMouseCursor(true)
        SetMouseLocation(screenX / 2, screenY / 2)
    end
end

function HideCarDealerMenu()
    SetWebVisibility(carDealerMenu, WEB_HIDDEN)
    ShowMouseCursor(false)
end

function IsPlayerNearFromCarShopDealer()
    local locationX, locationY, locationZ = GetPlayerLocation(GetPlayerId())

    local distance = GetDistance3D(
            locationX,
            locationY,
            locationZ,
            dealerPointLocation.x,
            dealerPointLocation.y,
            dealerPointLocation.z
    )

    return distance < 300
end