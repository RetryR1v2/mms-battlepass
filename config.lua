Config = {}

Config.Debug = false

Config.defaultlang = "de_lang"

-- Webhook Settings

Config.WebHook = false

Config.WHTitle = 'Battlepass:'
Config.WHLink = ''  -- Discord WH link Here
Config.WHColor = 16711680 -- red
Config.WHName = 'Battlepass:' -- name
Config.WHLogo = '' -- must be 30x30px
Config.WHFooterLogo = '' -- must be 30x30px
Config.WHAvatar = '' -- must be 30x30px

-- Script Settings
-- NEW
Config.MoneyType = 0  -- The currency type (0 = money, 1 = gold, 2 = rol)
-- END NEW

Config.BattlepassCommand = 'Battlepass'

Config.PlaytimeToReward = 10 -- Time in Minutes
Config.PlaytimeReward = 60 -- EXP Every XMin

-- Battlepass Levels 

Config.BattlepassLevels = {
    { Level = 1 , ExpNeed = 1000, RewardMoney = true, RewardMoneyAmount = 100, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 20 },
    { Level = 2 , ExpNeed = 2000, RewardMoney = true, RewardMoneyAmount = 200, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 40 },
    { Level = 3 , ExpNeed = 3000, RewardMoney = true, RewardMoneyAmount = 300, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 60 },
    { Level = 4 , ExpNeed = 4000, RewardMoney = true, RewardMoneyAmount = 400, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 80 },
    { Level = 5 , ExpNeed = 5000, RewardMoney = true, RewardMoneyAmount = 500, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 100 },
    { Level = 6 , ExpNeed = 6000, RewardMoney = true, RewardMoneyAmount = 600, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 120 },
    { Level = 7 , ExpNeed = 7000, RewardMoney = true, RewardMoneyAmount = 700, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 140 },
    { Level = 8 , ExpNeed = 8000, RewardMoney = true, RewardMoneyAmount = 800, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 160 },
    { Level = 9 , ExpNeed = 9000, RewardMoney = true, RewardMoneyAmount = 900, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 180 },
    { Level = 10 , ExpNeed = 10000, RewardMoney = true, RewardMoneyAmount = 1000, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 200 },
    { Level = 11 , ExpNeed = 12000, RewardMoney = true, RewardMoneyAmount = 1100, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 220 },
    { Level = 12 , ExpNeed = 13000, RewardMoney = true, RewardMoneyAmount = 1200, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 240 },
    { Level = 13 , ExpNeed = 14000, RewardMoney = true, RewardMoneyAmount = 1300, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 260 },
    { Level = 14 , ExpNeed = 15000, RewardMoney = true, RewardMoneyAmount = 1400, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 280 },
    { Level = 15 , ExpNeed = 16000, RewardMoney = true, RewardMoneyAmount = 1500, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 300 },
    { Level = 16 , ExpNeed = 17000, RewardMoney = true, RewardMoneyAmount = 1600, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 320 },
    { Level = 17 , ExpNeed = 18000, RewardMoney = true, RewardMoneyAmount = 1700, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 340 },
    { Level = 18 , ExpNeed = 19000, RewardMoney = true, RewardMoneyAmount = 1800, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 360 },
    { Level = 19 , ExpNeed = 20000, RewardMoney = true, RewardMoneyAmount = 1900, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 380 },
    { Level = 20 , ExpNeed = 21000, RewardMoney = true, RewardMoneyAmount = 2000, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 400 },
    { Level = 21 , ExpNeed = 22000, RewardMoney = true, RewardMoneyAmount = 2100, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 420 },
    { Level = 22 , ExpNeed = 23000, RewardMoney = true, RewardMoneyAmount = 2200, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 440 },
    { Level = 23 , ExpNeed = 24000, RewardMoney = true, RewardMoneyAmount = 2300, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 460 },
    { Level = 24 , ExpNeed = 25000, RewardMoney = true, RewardMoneyAmount = 2400, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 480 },
    { Level = 25 , ExpNeed = 26000, RewardMoney = true, RewardMoneyAmount = 2500, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 500 },
    { Level = 26 , ExpNeed = 27000, RewardMoney = true, RewardMoneyAmount = 2600, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 520 },
    { Level = 27 , ExpNeed = 28000, RewardMoney = true, RewardMoneyAmount = 2700, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 540 },
    { Level = 28 , ExpNeed = 29000, RewardMoney = true, RewardMoneyAmount = 2800, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 560 },
    { Level = 29 , ExpNeed = 30000, RewardMoney = true, RewardMoneyAmount = 2900, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 580 },
    { Level = 30 , ExpNeed = 0, RewardMoney = true, RewardMoneyAmount = 3000, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 600 },
}