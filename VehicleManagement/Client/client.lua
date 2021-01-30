AddEvent("OnKeyPress", function(key)
    if key == 'U' then
        CallRemoteEvent("EngineAction", GetPlayerId())
        AddPlayerChat("Action sur le moteur du vehicule")
    end
end)