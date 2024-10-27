local VORPcore = exports.vorp_core:GetCore()
local BccUtils = exports['bcc-utils'].initiate()
local FeatherMenu =  exports['feather-menu'].initiate()

local MainMenuOpen = false
local MaxLevel = #Config.BattlepassLevels

if Config.Debug then
    Citizen.CreateThread(function ()
        Citizen.Wait(10000)
        TriggerServerEvent('mms-battlepass:server:createtable')
    end)
end


RegisterNetEvent('vorp:SelectedCharacter')
AddEventHandler('vorp:SelectedCharacter', function()
    Citizen.Wait(10000)
    TriggerServerEvent('mms-battlepass:server:createtable')
end)

----- Battlepass Menu

Citizen.CreateThread(function ()
    BattlepassMenu = FeatherMenu:RegisterMenu('BattlepassMenu', {
        top = '20%',
        left = '20%',
        ['720width'] = '500px',
        ['1080width'] = '700px',
        ['2kwidth'] = '700px',
        ['4kwidth'] = '800px',
        style = {
            ['border'] = '5px solid orange',
            -- ['background-image'] = 'none',
            ['background-color'] = '#FF8C00'
        },
        contentslot = {
            style = {
                ['height'] = '550px',
                ['min-height'] = '250px'
            }
        },
        draggable = true,
    --canclose = false
}, {
    opened = function()
        --print("MENU OPENED!")
    end,
    closed = function()
        --print("MENU CLOSED!")
    end,
    topage = function(data)
        --print("PAGE CHANGED ", data.pageid)
    end
})
end)

Citizen.CreateThread(function ()
    RegisterCommand(Config.BattlepassCommand, function()
        TriggerServerEvent('mms-battlepass:server:GetMyData')
    end)
end)

RegisterNetEvent('mms-battlepass:client:openBattlepassMenu')
AddEventHandler('mms-battlepass:client:openBattlepassMenu',function(MyData)
    if not MainMenuOpen then
    BattlepassMenuPage1 = BattlepassMenu:RegisterPage('seite1')
    BattlepassMenuPage1:RegisterElement('header', {
        value = _U('BattlepassMenuHeader'),
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    BattlepassMenuPage1:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    Hello = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('Hello') .. MyData.firstname .. ' ' .. MyData.lastname,
        style = {
            ['font-size'] = '24px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
        }
    })
    Level = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('YourLevel') .. MyData.level,
        style = {
            ['font-size'] = '20px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
        }
    })
    Level = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('MaxLevel') .. MaxLevel,
        style = {
            ['font-size'] = '20px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
        }
    })
    EXP = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('YourEXP') .. MyData.exp,
        style = {
            ['font-size'] = '20px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
            
        }
    })
    NeededEXP = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('YourNeededEXP') .. MyData.expneeded,
        style = {
            ['font-size'] = '20px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
            
        }
    })
    BattlepassMenuPage1:RegisterElement('button', {
        label =  _U('ReciveReward'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        TriggerServerEvent('mms-battlepass:server:RewardCollect')
    end)
    BattlepassMenuPage1:RegisterElement('button', {
        label =  _U('CloseBattlepassMenu'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        BattlepassMenu:Close({ 
        })
    end)
    BattlepassMenuPage1:RegisterElement('subheader', {
        value = _U('BattlepassMenuSubHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    BattlepassMenuPage1:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    BattlepassMenu:Open({startupPage = BattlepassMenuPage1,})
    MainMenuOpen = true
    elseif MainMenuOpen then
    BattlepassMenuPage1:UnRegister()
    BattlepassMenuPage1 = BattlepassMenu:RegisterPage('seite1')
    BattlepassMenuPage1:RegisterElement('header', {
        value = _U('BattlepassMenuHeader'),
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    BattlepassMenuPage1:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    Hello = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('Hello') .. MyData.firstname .. ' ' .. MyData.lastname,
        style = {
            ['font-size'] = '24px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
        }
    })
    Level = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('YourLevel') .. MyData.level,
        style = {
            ['font-size'] = '20px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
        }
    })
    Level = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('MaxLevel') .. MaxLevel,
        style = {
            ['font-size'] = '20px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
        }
    })
    EXP = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('YourEXP') .. MyData.exp,
        style = {
            ['font-size'] = '20px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
            
        }
    })
    NeededEXP = BattlepassMenuPage1:RegisterElement('textdisplay', {
        value = _U('YourNeededEXP') .. MyData.expneeded,
        style = {
            ['font-size'] = '20px',
            ['font-weight'] = 'bold',
            ['color'] = 'orange',
            
        }
    })
    BattlepassMenuPage1:RegisterElement('button', {
        label =  _U('ReciveReward'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        TriggerServerEvent('mms-battlepass:server:RewardCollect')
    end)
    BattlepassMenuPage1:RegisterElement('button', {
        label =  _U('CloseBattlepassMenu'),
        style = {
        ['background-color'] = '#FF8C00',
        ['color'] = 'orange',
        ['border-radius'] = '6px'
        },
    }, function()
        BattlepassMenu:Close({ 
        })
    end)
    BattlepassMenuPage1:RegisterElement('subheader', {
        value = _U('BattlepassMenuSubHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    BattlepassMenuPage1:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    BattlepassMenu:Open({startupPage = BattlepassMenuPage1,})
end
end)