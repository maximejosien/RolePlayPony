AddEvent("OnPlayerJoin", function(player)
    SetPlayerSpawnLocation(player, 163512.125, 189667.90625, 1326.8924560547, 90)
    AddPlayerChat(player, "Welcome, "..GetPlayerName(player).."!")
end)

print("Tutorial script has been started")