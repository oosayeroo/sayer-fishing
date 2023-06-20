local QBCore = exports['qb-core']:GetCoreObject()

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

for k,v in pairs(Config.FishingItems) do
	QBCore.Functions.CreateUseableItem(k, function(source, item)
    	local Player = QBCore.Functions.GetPlayer(source)
		if v.Type == 'rod' then
			if Config.JobRequired.Enable then
				if Player.PlayerData.job == Config.JobRequired.JobCode then
    				TriggerClientEvent('sayer-fishing:tryToFish', source)
				else
					TriggerClientEvent('QBCore:Notify', src, "You Need To Be A ..."..Config.JobRequired.Label.." to use this equipment")
				end
			else
				TriggerClientEvent('sayer-fishing:tryToFish', source)
			end
		end
	end)
end


RegisterServerEvent('sayer-fishing:receiveFish', function(cabin, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local luck = 0
    local itemCount = math.random(Config.MinItemRewards,Config.MaxItemRewards)

    for i = 1, itemCount, 1 do
        local randomItem = Config.FishingRewards[math.random(1,#Config.FishingRewards)]
		luck = math.random(1,100)
		if luck <= randomItem.Chance then
			Player.Functions.AddItem(randomItem.Name,1)
			if Config.Debug then print("Item = "..randomItem.Name.." / XP = "..randomItem.XPGive.." !")
			TriggerClientEvent('QBCore:Notify', src, "You Caught a "..QBCore.Shared.Items[randomItem.Name].label.."!", 'success')
			if Config.UseLevelSystem then
				TriggerEvent('sayer-fishing:AddXP',src,randomItem.XPGive)
			end
		else
			TriggerClientEvent('QBCore:Notify', src, "You didnt catch the fish")
		end
	end
end)

RegisterNetEvent('sayer-fishing:RemoveItem', function (item,amount)
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