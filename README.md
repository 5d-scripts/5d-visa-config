**Developer Server Events:**

```lua
AddEventHandler("5d-visa:getPlayerVisaStage", function(src, cb)
end)

ESX.RegisterServerCallback("5d-visa:getPlayerVisaStage", function(src, cb)
end)
```

**Developer Client Events:**
```lua
RegisterNetEvent("5d-visa:heartbeat", function(visaStage, stageLabel)
end)