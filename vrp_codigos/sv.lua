-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Criador Eterno.exe#9767 Por favor Mantenha os Creditos! 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

emP = {}
Tunnel.bindInterface("vrp_codigos",emP)
local idgens = Tools.newIDGenerator()

RegisterCommand('rename',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasGroup(user_id, "permisao que tem acesso") then
        local idjogador = vRP.prompt(source, "Qual id do jogador?", "")
        local nome = vRP.prompt(source, "Novo nome", "")
        local firstname = vRP.prompt(source, "Novo sobrenome", "")
        local idade = vRP.prompt(source, "Nova idade", "")
        local identity = vRP.getUserIdentity(parseInt(idjogador))
        vRP.execute("vRP/update_user_identity",{
            user_id = idjogador,
            firstname = firstname,
            name = nome,
            age = idade,
            registration = identity.registration,
            phone = identity.phone
        })
    end
end)


-------------------------
------ FACILITAR EUP
--------------------------
-- VER ID DAS ROUPITCHAS

local player_customs = {}
RegisterCommand('vroupas',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local custom = vRPclient.getCustomization(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if player_customs[source] then
            player_customs[source] = nil
            vRPclient._removeDiv(source,"customization")
        else 
            local content = ""
            for k,v in pairs(custom) do
                content = content..k.." => "..json.encode(v).."<br/>" 
            end

            player_customs[source] = true
            vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 4px; width: 200px; margin-top: 100px; margin-right: 50px; background: rgba(15,15,15,0.7); color: #ffff; font-weight: bold; }",content)
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
----[pegar ping steam hex e ip de um player ---- /dados "id"    
-----------------------------------------------------------------------------------------------------------------------------------------

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
-----------------------------------------------------------------------------------------------------------------------------------------
---- [ /COR ]
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cor', function(source, args)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,'classico.permissao') or vRP.hasPermission(user_id,'streamer.permissao') or vRP.hasPermission(user_id,'black.permissao') or vRP.hasPermission(user_id,'premium.permissao') or vRP.hasPermission(user_id,'administrador.permissao') or vRP.hasPermission(user_id,'pro.permissao') or vRP.getInventoryItemAmount(user_id,"tinta") >= 1 then
		TriggerClientEvent('changeWeaponColor', source, args[1])
	else
		TriggerClientEvent("Notify",source,"negado","Negado","Apenas <b>VIP's</b> e <b>BOOST</b> podem utilizar este comando")
    end
end)
--------------------------------------------------------------------------------------
-- /cobrar
--------------------------------------------------------------------------------------
RegisterCommand('cobrar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local consulta = vRPclient.getNearestPlayer(source,2)
    local nuser_id = vRP.getUserId(consulta)
    local resultado = json.decode(consulta) or 0
    local banco = vRP.getBankMoney(nuser_id)
    local identity =  vRP.getUserIdentity(user_id)
    local identityu = vRP.getUserIdentity(nuser_id)
    if vRP.request(consulta,"Deseja pagar <b>$"..vRP.format(parseInt(args[1])).."</b> dólares para <b>"..identity.name.." "..identity.firstname.."</b>?",30) then
        if banco >= parseInt(args[1]) then
            vRP.setBankMoney(nuser_id,parseInt(banco-args[1]))
            vRP.giveBankMoney(user_id,parseInt(args[1]))
            TriggerClientEvent("Notify",source,"sucesso","Recebeu <b>$"..vRP.format(parseInt(args[1])).." dólares</b> de <b>"..identityu.name.. " "..identityu.firstname.."</b>.")
            local player = vRP.getUserSource(parseInt(args[2]))
            if player == nil then
                return
            else
                local identity = vRP.getUserIdentity(user_id)
                TriggerClientEvent("Notify",player,"importante","<b>"..identity.name.." "..identity.firstname.."</b> transferiu <b>$"..vRP.format(parseInt(args[1])).." dólares</b> para sua conta.")
            end
        else
            TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
        end
    end
end)
--Função: Anuncio animado para todos (configure e permissao)
--------------------------------------------------------------------------
--------------- ANUNCIO FESTA
--------------------------------------------------------------------------
RegisterCommand('festinha',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"event.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
        local identity = vRP.getUserIdentity(user_id)
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        vRPclient.setDiv(-1,"festinha"," @keyframes blinking {    0%{ background-color: #ff3d50; border: 2px solid #871924; opacity: 1.8; } 25%{ background-color: #d22d99; border: 2px solid #901f69; opacity: 0.8; } 50%{ background-color: #55d66b; border: 2px solid #126620; opacity: 0.8; } 75%{ background-color: #22e5e0; border: 2px solid #15928f; opacity: 0.8; } 100%{ background-color: #222291; border: 2px solid #6565f2; opacity: 0.8; }  } .div_festinha { font-size: 11px; font-family: arial; color: rgba(255, 255, 255,1); padding: 20px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; animation: blinking 1s infinite; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Festeiro(a): "..identity.name.." "..identity.firstname)
        SetTimeout(7000,function()
            vRPclient.removeDiv(-1,"festinha")
        end)
    end
end)

--------------------kick resoluçao
AddEventHandler("kickRESOLUCAO",function()
    local source = source
    DropPlayer(source,"Voce foi desconectado por usar uma resolucao muito baixa.") --Notificacao que aparece para o player
end)
-----

--------------------------------------------------------------------------
--------------- ANUNCIO FESTA
--------------------------------------------------------------------------
RegisterCommand('festinha',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"event.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
        local identity = vRP.getUserIdentity(user_id)
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
        vRPclient.setDiv(-1,"festinha"," @keyframes blinking {    0%{ background-color: #ff3d50; border: 2px solid #871924; opacity: 1.8; } 25%{ background-color: #d22d99; border: 2px solid #901f69; opacity: 0.8; } 50%{ background-color: #55d66b; border: 2px solid #126620; opacity: 0.8; } 75%{ background-color: #22e5e0; border: 2px solid #15928f; opacity: 0.8; } 100%{ background-color: #222291; border: 2px solid #6565f2; opacity: 0.8; }  } .div_festinha { font-size: 11px; font-family: arial; color: rgba(255, 255, 255,1); padding: 20px; bottom: 10%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; animation: blinking 1s infinite; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Festeiro(a): "..identity.name.." "..identity.firstname)
        SetTimeout(7000,function()
            vRPclient.removeDiv(-1,"festinha")
        end)
    end
end)
