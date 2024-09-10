local QBCore = exports['qb-core']:GetCoreObject()

local function DebugCode(msg)
	if Config.Debug then print(msg) end
end

QBCore.Functions.CreateCallback('sayer-fishing:GetItemData', function(source, cb, itemName)
	local retval = false
	local Player = QBCore.Functions.GetPlayer(source)
	if Player ~= nil then 
		if Player.Functions.GetItemByName(itemName) ~= nil then
			retval = true
		end
	end
	
	cb(retval)
end)

CreateThread(function()
	for k,v in pairs(Config.FishingItems) do
		QBCore.Functions.CreateUseableItem(k, function(source, item)
			local src = source
	    	local Player = QBCore.Functions.GetPlayer(src)
			if v.Type == 'rod' then
				if Config.JobRequired.Enable then
					if Player.PlayerData.job == Config.JobRequired.JobCode then
	    				TriggerClientEvent('sayer-fishing:tryToFish', source, k)
					else
						TriggerClientEvent('QBCore:Notify', src, "You Need To Be A ..."..Config.JobRequired.Label.." to use this equipment")
					end
				else
					TriggerClientEvent('sayer-fishing:tryToFish', source, k)
				end
			elseif v.Type == 'bait' then
				if Config.JobRequired.Enable then
					if Player.PlayerData.job == Config.JobRequired.JobCode then
	    				TriggerClientEvent('sayer-fishing:BaitRod', source, k)
					else
						TriggerClientEvent('QBCore:Notify', src, "You Need To Be A ..."..Config.JobRequired.Label.." to use this equipment")
					end
				else
					TriggerClientEvent('sayer-fishing:BaitRod', source, k)
				end
			end
		end)
	end
end)

RegisterNetEvent('sayer-fishing:OpenFishShop',function()
	if Config.ShopStyle == 'qb' then
		local itemTable = Config.Shops.EquipmentStock.items
		exports['qb-inventory']:CreateShop({
			name = 'sayerfishshop',
			label = Config.Shops.EquipmentStock.label,
			slots = #itemTable,
			items = itemTable
		})
		exports['qb-inventory']:OpenShop(source, 'sayerfishshop')
	end
end)

RegisterNetEvent('sayer-fishing:receiveFish', function(rodItem, baitItem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local luck = math.random(0,100)
	if Config.FishingItems[rodItem] ~= nil then
		if Config.FishingItems[rodItem].Type == 'rod' then
			if Config.FishingItems[rodItem].CatchMultiplier ~= nil then
				luck = luck - Config.FishingItems[rodItem].CatchMultiplier
			end
		end
	end

	local randomItem = Config.FishingItems[baitItem].CatchList[math.random(1,#Config.FishingItems[baitItem].CatchList)]
	if not Config.FishingRewards[randomItem] then print("ERROR Item "..randomItem.." does not exist in Config.FishingRewards") return end
	if luck <= Config.FishingRewards[randomItem].Chance then
		Player.Functions.AddItem(randomItem,1)
		TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem], 'add')
		DebugCode("Item = "..randomItem.." / XP = "..Config.FishingRewards[randomItem].XPGive.." !")
		TriggerClientEvent('QBCore:Notify', src, "You Caught a "..QBCore.Shared.Items[randomItem].label.."!", 'success', 5000)

		if Config.UseLevelSystem then
			TriggerEvent('sayer-fishing:AddXP',src,Config.FishingRewards[randomItem].XPGive)
		end

	else
		TriggerClientEvent('QBCore:Notify', src, "Bait returned empty", 'error', 5000)
	end
end)

RegisterNetEvent('sayer-fishing:RemoveItem', function(item,amount)
	local Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.RemoveItem(item, amount)
end)

RegisterNetEvent('sayer-fishing:SetLevel', function(level)
    local Player = QBCore.Functions.GetPlayer(source)
    local CurLevel = Player.PlayerData.metadata['sayerfishinglevel']
    Player.Functions.SetMetaData('sayerfishinglevel', level)
end)

RegisterNetEvent('sayer-fishing:SetXP', function(xp)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.SetMetaData('sayerfishingxp', xp)
end)

RegisterNetEvent('sayer-fishing:AddXP', function(src,xp)
    local Player = QBCore.Functions.GetPlayer(src)
    local EXP = Player.PlayerData.metadata['sayerfishingxp']
    local level = Player.PlayerData.metadata['sayerfishinglevel']
	local amount = 0
	local xpamount = 0
	if Config.DoubleXP then
		xpamount = xp*2
	else
		xpamount = xp
	end

    if level <= #Config.Levels then
        if (EXP+xpamount) >= Config.Levels[level].NextLevel then
            Player.Functions.SetMetaData('sayerfishinglevel', (level+1))
            Player.Functions.SetMetaData('sayerfishingxp', 0)
            TriggerClientEvent('QBCore:Notify', src, "Your Fishing Level Has Increased", 'success')
        else
            Player.Functions.SetMetaData('sayerfishingxp', (EXP+xpamount)) 
        end
		if Config.Levels[level+1].Reward then
			local reward = Config.Levels[level+1].Reward
			if reward.Type == 'cash' then
				if reward.Amount ~= nil then
					if Config.DoubleLevelRewards then
						amount = reward.Amount*2
					else
						amount = reward.Amount
					end
					Player.Functions.AddMoney('cash',amount)
				end
			elseif reward.Type == 'bank' then
				if reward.Amount ~= nil then
					if Config.DoubleLevelRewards then
						amount = reward.Amount*2
					else
						amount = reward.Amount
					end
					Player.Functions.AddMoney('bank',amount)
				end
			else
				if Config.DoubleLevelRewards then
					amount = reward.Amount*2
				else
					amount = reward.Amount
				end
				Player.Functions.AddItem(reward.Type,amount)
			end
		end
    else
        TriggerClientEvent('QBCore:Notify', src, "Your Fishing Level Cant Increase More!", 'error')
    end
end)