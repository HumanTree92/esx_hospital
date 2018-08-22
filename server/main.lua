ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_hospital:price')
AddEventHandler('esx_hospital:price', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if(Config.Paid == true) then
		if(xPlayer.getMoney('money') >= Config.Price) then
			xPlayer.removeMoney((Config.Price))
			TriggerClientEvent('esx:showNotification', _source, _U('hospital_you_paid'))
		else
			TriggerClientEvent('esx:showNotification', _source, _U('hospital_not_enough'))
		end
	else
		TriggerClientEvent('esx:showNotification', _source, _U('hospital_free'))
	end
end)
