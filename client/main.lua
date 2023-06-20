local QBCore = exports['qb-core']:GetCoreObject()

cachedData = {}
local JobBusy = false
TargetPed = {}

-- function SellFish()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerIdentifier = QBCore.Functions.GetPlayerData().citizenid
	if Config.UseLevelSystem then
    	local level = QBCore.Functions.GetPlayerData().metadata["sayerfishinglevel"]
    	local xp = QBCore.Functions.GetPlayerData().metadata["sayerfishingxp"]
    	local max = #Config.Levels
    	local Next = Config.Levels[level].NextLevel

    	if level > max then
    	    TriggerServerEvent('sayer-fishing:SetLevel',max)
    	end
    	if xp > Next then
    	    TriggerServerEvent('sayer-fishing:SetXP',0)
    	end
	end
end)

CreateThread(function()
	for k,v in pairs(Config.Shops.Peds) do
		if v.Enable then
			local model = ''
            local entity = ''
            model = v.Model

            RequestModel(model)
            while not HasModelLoaded(model) do
              Wait(0)
            end

            entity = CreatePed(0, model, v.Coords.x,v.Coords.y,v.Coords.z-1,v.Coords.w, true, false)
            SetEntityInvincible(entity,true)
            FreezeEntityPosition(entity,true)
            SetBlockingOfNonTemporaryEvents(entity,true)

            TargetPed["FishingShop"..k] =
            exports['qb-target']:AddTargetEntity(entity,{
                options = {{icon = "fas fa-sack-dollar",label = "Fishing Shop",action = function() OpenFishShop() end,},},
                distance = 2.5,
            })
		end
	end
end)

function OpenFishShop()
	if Config.ShopStyle == 'qb' then
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "fishing", Config.Shops.Stock)
	elseif Config.ShopStyle == 'jim' then
		TriggerServerEvent("jim-shops:ShopOpen", "shop", "fishing", Config.Shops.Stock)
	end
end

RegisterNetEvent("sayer-fishing:tryToFish", function()
	TryToFish() 
end)

RegisterNetEvent("sayer-fishing:calculatedistances", pos, function()

end)

CreateThread(function()
	while true do
		Wait(1500)

		local ped = PlayerPedId()

		if cachedData["ped"] ~= ped then
			cachedData["ped"] = ped
		end
	end
end)
