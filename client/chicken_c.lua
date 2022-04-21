local QBCore = exports['qb-core']:GetCoreObject()
---------------------------------------------
--------tego lepiej nie ruszaj ponizej-------
---------------------------------------------
local kurczak1
local kurczak2
local kurczak3
local Zlapany1 = 0
local Zlapany2 = 0
local Zlapany3 = 0
local Ilosczlapanych = 0
local akcja = false
local prop
local zapakowaneDoauta = false
local karton
local mieso
local pakuje = 0

--------------
local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

----
--------------------chicken start---------------------------------------
Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, startX, startY, startZ)
		if dist <= 20.0 then
			DrawMarker(27, startX, startY, startZ-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
		else
			Citizen.Wait(1500)
		end
		
		if dist <= 2.5 then
			DrawText3D2(startX, startY, startZ, "~g~[E]~w~ To start catching chickens")
		end

		if dist <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				QBCore.Functions.Progressbar("chicken_", "Gathering Alive Chicken", math.random(15000, 20000), false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mini@repair",
					anim = "fixing_a_player",
					flags = 16,
				}, {}, {}, function()
					TriggerServerEvent("tost:wkladajKurczki")
				end, function()
					ClearPedTasks(GetPlayerPed(-1))
					QBCore.Functions.Notify("Canceled", "error")
				end)
			end			
		end
	end
end)

---------------chicken sell---------------------------
--[[Citizen.CreateThread(function()
    while true do
		Citizen.Wait(5)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sellX, sellY, sellZ)
		if dist <= 20.0 then
			DrawMarker(2, sellX, sellY, sellZ+0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
		else
		Citizen.Wait(1000)
		end
		if dist <= 2.0 then
			DrawText3D2(sellX, sellY, sellZ+0.1, "[E] Sell Packed Chickens")
			if IsControlJustPressed(0, Keys['E']) then 
				SellChicken()
			end	
		end
	end
end)]]

RegisterNetEvent("Chickens:sell", function()
SellChicken()
end)


-------------chicken portion------------------
Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, przetworniaX, przetworniaY, przetworniaZ)
		if dist <= 20.0 then
			DrawMarker(27, przetworniaX, przetworniaY, przetworniaZ-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
		else
			Citizen.Wait(1500)
		end
		
		if dist <= 2.5 then
			DrawText3D2(przetworniaX, przetworniaY, przetworniaZ, "~g~[E]~w~ To portion the chicken")
		end

		if dist <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				QBCore.Functions.Progressbar("chicken_", "Portion the Chicken..", math.random(5000, 10000), false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mini@repair",
					anim = "fixing_a_player",
					flags = 16,
				}, {}, {}, function()
					--TriggerServerEvent("tostKurczaki:przerob",1)
					processchicken()
				end, function()
					ClearPedTasks(GetPlayerPed(-1))
					QBCore.Functions.Notify("Canceled", "error")
				end)
			end			
		end
	end
end)

------chicken packed----------------
Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pakowanieX2, pakowanieY2, pakowanieZ)
		if dist <= 20.0 then
			DrawMarker(27, pakowanieX2, pakowanieY2, pakowanieZ-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
		else
			Citizen.Wait(1500)
		end
		
		if dist <= 2.5 then
			DrawText3D2(pakowanieX2, pakowanieY2, pakowanieZ, "~g~[E]~w~ To pack chicken")
		end

		if dist <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				QBCore.Functions.Progressbar("chicken_", "Packing the Chicken..", math.random(15000, 20000), false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mini@repair",
					anim = "fixing_a_player",
					flags = 16,
				}, {}, {}, function()
					--TriggerServerEvent("tostKurczaki:przerob",1)
					packedchicken()
				end, function()
					ClearPedTasks(GetPlayerPed(-1))
					QBCore.Functions.Notify("Canceled", "error")
				end)
			end			
		end
	end
end)




----------------------------Packed Chicken------------------
function packedchicken()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
				SetEntityHeading(GetPlayerPed(-1), 40.0)
				local PedCoords = GetEntityCoords(GetPlayerPed(-1))
				mieso = CreateObject(GetHashKey('prop_cs_steak'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
				AttachEntityToEntity(mieso, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x49D9), 0.15, 0.0, 0.01, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				karton = CreateObject(GetHashKey('prop_cs_clothes_box'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
				AttachEntityToEntity(karton, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.13, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
				pakuje = 0
				LoadDict("anim@heists@ornate_bank@grab_cash_heels")
				TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
    Citizen.Wait(6500)
	
					FreezeEntityPosition(GetPlayerPed(-1),false)
					DeleteEntity(karton)
					DeleteEntity(mieso)
	ClearPedTasks(PlayerPedId())
	
   -- DeleteEntity(prQBCore)
   TriggerServerEvent("tostKurczaki:przerob", 2)
   QBCore.Functions.Notify('You packed a chicken')
    else
    QBCore.Functions.Notify('You have nothing to pack!', 'error')
    
    end
end


---------------Process Chicken----------------
function processchicken()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
				local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
				LoadDict(dict)
				FreezeEntityPosition(GetPlayerPed(-1),true)
				TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
				local PedCoords = GetEntityCoords(GetPlayerPed(-1))
				nozyk = CreateObject(GetHashKey('prop_knife'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
				AttachEntityToEntity(nozyk, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0), 0.13, 0.14, 0.09, 40.0, 0.0, 0.0, false, false, false, false, 2, true)
					SetEntityHeading(GetPlayerPed(-1), 311.0)
					kurczak = CreateObject(GetHashKey('prop_int_cf_chick_01'),-94.87, 6207.008, 30.08, true, true, true)
					SetEntityRotation(kurczak,90.0, 0.0, 45.0, 1,true)
    Citizen.Wait(5000)
	--TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    --LoadDict('amb@medic@standing@tendtodead@exit')
    --TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    --ClearPedTasks(GetPlayerPed(-1))
					FreezeEntityPosition(GetPlayerPed(-1),false)
				DeleteEntity(kurczak)
				DeleteEntity(nozyk)
	ClearPedTasks(PlayerPedId())
	
   -- DeleteEntity(prQBCore)
    TriggerServerEvent("tostKurczaki:przerob",1)
	QBCore.Functions.Notify('You Make Slaughtered Chicken')
    else
    QBCore.Functions.Notify('You dont have any chickens!!!', 'error')
    
    end
end



-----

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end



--------------Selling-------------------------
function SellChicken()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("_chicken", "Selling Chicken Package..", 6500, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
   -- prQBCore = CreateObject(GetHashKey('hei_prQBCore_heist_box'), x, y, z,  true,  true, true)
	TriggerEvent('animations:client:EmoteCommandStart', {"box"})
    --SetEntityHeading(prQBCore, GetEntityHeading(GetPlayerPed(-1)))
    --LoadDict('amb@medic@standing@tendtodead@idle_a')
    --TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    Citizen.Wait(6500)
	TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    --LoadDict('amb@medic@standing@tendtodead@exit')
    --TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    --ClearPedTasks(GetPlayerPed(-1))

	ClearPedTasks(PlayerPedId())
   -- DeleteEntity(prQBCore)
    TriggerServerEvent('chicken:sell')
    else
    QBCore.Functions.Notify('You dont have any Chicken Package!!!', 'error')
    
    end
end




