local VORPcore = exports.vorp_core:GetCore()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RetryR1v2/mms-wagonmissions/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

      
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('Current Version: %s'):format(currentVersion))
            versionCheckPrint('success', ('Latest Version: %s'):format(text))
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

--------------------------------------------------------------------------------------------------

RegisterServerEvent('mms-battlepass:server:GetMyData',function()
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local charIdentifier = Character.charIdentifier
    local result = MySQL.query.await("SELECT * FROM mms_battlepass WHERE charidentifier=@charidentifier", { ["charidentifier"] = charIdentifier})
    if #result > 0 then
        local MyData = result[1]
        TriggerClientEvent('mms-battlepass:client:openBattlepassMenu',src,MyData)
    else
        VORPcore.NotifyTip(src,_U('PleaseWait'), 4000)
    end
end)

-------------------------------------------------------------------------------------------------

RegisterServerEvent('mms-battlepass:server:createtable',function()
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local identifier = Character.identifier
    local charIdentifier = Character.charIdentifier
    local firstname = Character.firstname
    local lastname = Character.lastname
    if charIdentifier ~= nil then
        local result = MySQL.query.await("SELECT * FROM mms_battlepass WHERE charidentifier=@charidentifier", { ["charidentifier"] = charIdentifier})
        if #result > 0 then
            if Config.Debug then print('battlepass Bereits Aktiv') end
        else
            MySQL.insert('INSERT INTO `mms_battlepass` (identifier,charidentifier,firstname,lastname,exp,level,expneeded) VALUES (?,?,?,?,?,?,?)',
            {identifier,charIdentifier,firstname,lastname,0,1,1000}, function()end)
        end
    end
end)

Citizen.CreateThread(function () -- Reward for Playtime
    while true do
        if Config.Debug then
            Citizen.Wait(30000)
        else
            Citizen.Wait(Config.PlaytimeToReward * 60000)
        end
        for _, player in ipairs(GetPlayers()) do
            if #GetPlayers() ~= nil then
            local Character = VORPcore.getUser(player).getUsedCharacter
            local charIdentifier = Character.charIdentifier
            local EXPGain = Config.PlaytimeReward
            local MaxLevel = #Config.BattlepassLevels
            if charIdentifier ~= nil then
                local result = MySQL.query.await("SELECT * FROM mms_battlepass WHERE charidentifier=@charidentifier", { ["charidentifier"] = charIdentifier})
                if #result > 0 then
                    local EXPNeeded = result[1].expneeded
                    if MaxLevel == result[1].level then
                        if Config.Debug then print('battlepass Max Level Reached') end
                        MySQL.update('UPDATE `mms_battlepass` SET expneeded = ? WHERE charidentifier = ?',{0, charIdentifier})
                    else
                    if EXPNeeded <= EXPGain then
                        local TooMuchEXP = EXPNeeded - EXPGain
                        local oldlevel = result[1].level
                        local newlevel = oldlevel + 1
                        MySQL.update('UPDATE `mms_battlepass` SET level = ? WHERE charidentifier = ?',{newlevel, charIdentifier})
                        local oldexp = result[1].exp
                        local newexp = oldexp + EXPGain
                        MySQL.update('UPDATE `mms_battlepass` SET exp = ? WHERE charidentifier = ?',{newexp, charIdentifier})
                        Citizen.Wait(250)
                        local newexpneed = Config.BattlepassLevels[newlevel].ExpNeed + TooMuchEXP
                        Citizen.Wait(250)
                        MySQL.update('UPDATE `mms_battlepass` SET expneeded = ? WHERE charidentifier = ?',{newexpneed, charIdentifier})
                        VORPcore.NotifyTip(player, _U('RecivedEXP') .. EXPGain, 10000)
                        LevelUpReward(player,newlevel)
                    else
                        local oldexp = result[1].exp
                        local newexp = oldexp + EXPGain
                        MySQL.update('UPDATE `mms_battlepass` SET exp = ? WHERE charidentifier = ?',{newexp, charIdentifier})
                        local oldexpneed = result[1].expneeded
                        local newexpneed = oldexpneed - EXPGain
                        MySQL.update('UPDATE `mms_battlepass` SET expneeded = ? WHERE charidentifier = ?',{newexpneed, charIdentifier})
                        VORPcore.NotifyTip(player, _U('RecivedEXP') .. EXPGain, 10000)
                    end
                end
                else
                    if Config.Debug then print('battlepass Nicht Aktiv') end
                end
            end
        end
        end
    end
end)


RegisterServerEvent('mms-battlepass:server:GainExp',function(src,EXPGain)
    local Character = VORPcore.getUser(src).getUsedCharacter
    local charIdentifier = Character.charIdentifier
    local MaxLevel = #Config.BattlepassLevels
    if charIdentifier ~= nil then
        local result = MySQL.query.await("SELECT * FROM mms_battlepass WHERE charidentifier=@charidentifier", { ["charidentifier"] = charIdentifier})
        if #result > 0 then
            local EXPNeeded = result[1].expneeded
            if MaxLevel == result[1].level then
                if Config.Debug then print('battlepass Max Level Reached') end
                MySQL.update('UPDATE `mms_battlepass` SET expneeded = ? WHERE charidentifier = ?',{0, charIdentifier})
            else
            if EXPNeeded <= EXPGain then
                local TooMuchEXP = EXPNeeded - EXPGain
                local oldlevel = result[1].level
                local newlevel = oldlevel + 1
                MySQL.update('UPDATE `mms_battlepass` SET level = ? WHERE charidentifier = ?',{newlevel, charIdentifier})
                local oldexp = result[1].exp
                local newexp = oldexp + EXPGain
                MySQL.update('UPDATE `mms_battlepass` SET exp = ? WHERE charidentifier = ?',{newexp, charIdentifier})
                Citizen.Wait(250)
                local newexpneed = Config.BattlepassLevels[newlevel].ExpNeed + TooMuchEXP
                Citizen.Wait(250)
                MySQL.update('UPDATE `mms_battlepass` SET expneeded = ? WHERE charidentifier = ?',{newexpneed, charIdentifier})
                VORPcore.NotifyTip(src, _U('RecivedEXP') .. EXPGain, 10000)
                LevelUpReward(src,newlevel)
            else
                local oldexp = result[1].exp
                local newexp = oldexp + EXPGain
                MySQL.update('UPDATE `mms_battlepass` SET exp = ? WHERE charidentifier = ?',{newexp, charIdentifier})
                local oldexpneed = result[1].expneeded
                local newexpneed = oldexpneed - EXPGain
                MySQL.update('UPDATE `mms_battlepass` SET expneeded = ? WHERE charidentifier = ?',{newexpneed, charIdentifier})
                VORPcore.NotifyTip(src, _U('RecivedEXP') .. EXPGain, 10000)
            end
        end
        else
            if Config.Debug then print('battlepass Nicht Aktiv') end
        end
    end
end)

function LevelUpReward(player,newlevel)
    local src = player
    local Character = VORPcore.getUser(src).getUsedCharacter
    local identifier = Character.identifier
    local charIdentifier = Character.charIdentifier
    local firstname = Character.firstname
    local lastname = Character.lastname
    local LevelBonus = Config.BattlepassLevels[newlevel]
    local rewardmoney = 0
    local rewardmoneyamount = 0
    local rewarditem = 0
    local rewarditemname = ''
    local rewarditemlabel = ''
    local rewarditemamount = 0
    if LevelBonus.RewardMoney then
        rewardmoney = 1
        rewardmoneyamount = LevelBonus.RewardMoneyAmount
    end
    if LevelBonus.RewardItem then
        rewarditem = 1
        rewarditemname = LevelBonus.RewardItemName
        rewarditemlabel = LevelBonus.RewardItemLabel
        rewarditemamount = LevelBonus.RewardItemAmount
    end
    if LevelBonus.RewardItem or LevelBonus.RewardMoney then
        MySQL.insert('INSERT INTO `mms_battlepassrewards` (identifier,charidentifier,firstname,lastname,money,moneyamount,item,itemname,itemlabel,itemamount) VALUES (?,?,?,?,?,?,?,?,?,?)',
        {identifier,charIdentifier,firstname,lastname,rewardmoney,rewardmoneyamount,rewarditem,rewarditemname,rewarditemlabel,rewarditemamount}, function()end)
    end
    VORPcore.NotifyTip(player, _U('LeveledUP') .. newlevel, 10000)
end

RegisterServerEvent('mms-battlepass:server:RewardCollect',function()
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local charIdentifier = Character.charIdentifier
    if charIdentifier ~= nil then
        local result = MySQL.query.await("SELECT * FROM mms_battlepassrewards WHERE charidentifier=@charidentifier", { ["charidentifier"] = charIdentifier})
        if #result > 0 then
            local ItemName = result[1].itemname
            local ItemLabel = result[1].itemlabel
            local ItemAmount= result[1].itemamount
            local ID = result[1].id
            local GetMoney = result[1].money
            local GetItem = result[1].item
            local MoneyAmount = result[1].moneyamount
            if GetMoney == 1 then
                Character.addCurrency(Config.MoneyType,MoneyAmount)
            end
            if GetItem == 1 then
                local CanCarry = exports.vorp_inventory:canCarryItem(src, ItemName, ItemAmount)
                if CanCarry then
                    exports.vorp_inventory:addItem(src, ItemName, ItemAmount)
                end
            end
            if GetItem == 1 and GetMoney == 1 then
                VORPcore.NotifyTip(src, _U('YouGot') .. MoneyAmount .. ' $' .. _U('And') .. ItemAmount .. ' ' .. ItemLabel, 10000)
            elseif GetItem == 1 and GetMoney == 0 then
                VORPcore.NotifyTip(src, _U('YouGot') .. ItemAmount .. ' ' .. ItemLabel, 10000)
            elseif GetItem == 0 and GetMoney == 1 then
                VORPcore.NotifyTip(src, _U('YouGot') .. MoneyAmount .. ' $', 10000)
            end
            MySQL.execute('DELETE FROM mms_battlepassrewards WHERE charidentifier = ? AND id = ?', { charIdentifier, ID }, function() end)
        else
            VORPcore.NotifyTip(src, _U('NoRewards'), 10000)
        end
    end
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()