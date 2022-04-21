local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('tost:wkladajKurczki')
AddEventHandler('tost:wkladajKurczki', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)

	Player.Functions.AddItem('alivechicken', 5)
	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items["alivechicken"], 'add')
end)

RegisterServerEvent('tostKurczaki:przerob')
AddEventHandler('tostKurczaki:przerob', function(opcja)
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
	local zywyKurczak = Player.Functions.GetItemByName('alivechicken')
	local MartwyKurczak = Player.Functions.GetItemByName('slaughteredchicken')
	local ZapakowanyKurczak = Player.Functions.GetItemByName('packagedchicken')

	if opcja == 1 then
		if zywyKurczak ~= nil and zywyKurczak.amount > 0 then
			Player.Functions.RemoveItem('alivechicken', 1)
			TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items["alivechicken"], 'remove')
			Player.Functions.AddItem('slaughteredchicken', 1)
			TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items["slaughteredchicken"], 'add')
		else
			TriggerClientEvent(NotifyTrigger, _source, "You dont have enough Alive Chickens", "error")
		end
	end

	if opcja == 2 then
		if MartwyKurczak ~= nil and MartwyKurczak.amount > 0 then
			Player.Functions.RemoveItem('slaughteredchicken', 1)
			TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items["slaughteredchicken"], 'remove')
			Player.Functions.AddItem('packagedchicken', 1)
			TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items["packagedchicken"], 'add')
		else
			TriggerClientEvent(NotifyTrigger, _source, "You dont have enough Slaughtered Chickens", "error")
		end
	end
end)





RegisterServerEvent("chicken:sell")
AddEventHandler("chicken:sell", function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local price = 0
	local price2 = 90
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "packagedchicken" then 
                    price = price + (price2 * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem("packagedchicken", Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, 1)
		TriggerClientEvent('QBCore:Notify', src, "You sold Chicken Box")
	end
end)

