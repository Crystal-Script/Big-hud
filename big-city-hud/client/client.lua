ESX = exports["es_extended"]:getSharedObject()


Citizen.CreateThread(function()  -- Thread to remove health and armour hud
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(10)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(100)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()	
    end
end)

Citizen.CreateThread(	 -- Thread to move the minimap position and disable north blip
  function()
    local minimap = RequestScaleformMovie("minimap")
    while not HasScaleformMovieLoaded(minimap) do
      Wait(0)
    end
    SetMinimapComponentPosition("minimap", "L", "B", -0.0045, 0.002, 0.150, 0.188888)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.020, 0.032, 0.111, 0.159)
    SetMinimapComponentPosition("minimap_blur", "L", "B", -0.03, 0.002, 0.266, 0.237)
	SetBlipAlpha(GetNorthRadarBlip(), 0)

  end
)

--- closemenu ---

function GenDisplay() 
    SendNUIMessage({
        type = "ui",
        status = true,
    })
end

function GenDisplayClose() 
    SendNUIMessage({
        type = "ui",
        status = false,
    })
end

local money = ''
RegisterNetEvent('get:money')
AddEventHandler('get:money', function(pedmoney)
    money = pedmoney

end)

---------------------------------------------------


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300)
        --- menu close ---

        if IsPauseMenuActive() then
          GenDisplayClose()
        else
          GenDisplay()
        end
        --- player status
        stamina = math.floor(GetPlayerSprintStaminaRemaining(GetPlayerIndex()))
        health = GetEntityHealth(PlayerPedId()) - 100
        displayText = string.format("Vita: %d", health)

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            local playerhunger = math.floor(100-status.getPercent())
                SendNUIMessage({
                    type         =   'hunger',
                    imputhunger   =   playerhunger,


                })
        end)




        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            local playerthirst = math.floor(100-status.getPercent())
                SendNUIMessage({
                    type         =   'thirst',
                    imputthirst   =   playerthirst,


                })

        end)

        SendNUIMessage({
            type         =   'status',
            imputhealt   =    health,
            imputstamina =    stamina,
        })

        TriggerServerEvent('get:money')

        SendNUIMessage({
            type         =   'player',
            imputmoney   =    money,

        })

        
        
    end
end)