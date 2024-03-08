ESX = exports["es_extended"]:getSharedObject()

local pedmoney = ''
RegisterNetEvent('get:money')
AddEventHandler('get:money', function()
    local plr = ESX.GetPlayerFromId(source)
    local money = plr.getAccount('money').money
    pedmoney = money
    TriggerClientEvent(
        'get:money',
        source,
        pedmoney
    )

end)