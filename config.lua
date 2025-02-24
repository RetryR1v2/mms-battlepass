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
    { Level = 1 , ExpNeed = 1000, RewardMoney = true, RewardMoneyAmount = 10, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 2 },
    { Level = 2 , ExpNeed = 2000, RewardMoney = true, RewardMoneyAmount = 20, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 4 },
    { Level = 3 , ExpNeed = 3000, RewardMoney = true, RewardMoneyAmount = 30, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 6 },
    { Level = 4 , ExpNeed = 4000, RewardMoney = true, RewardMoneyAmount = 40, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 8 },
    { Level = 5 , ExpNeed = 5000, RewardMoney = true, RewardMoneyAmount = 50, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 10 },
    { Level = 6 , ExpNeed = 6000, RewardMoney = true, RewardMoneyAmount = 60, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 12 },
    { Level = 7 , ExpNeed = 7000, RewardMoney = true, RewardMoneyAmount = 70, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 14 },
    { Level = 8 , ExpNeed = 8000, RewardMoney = true, RewardMoneyAmount = 80, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 16 },
    { Level = 9 , ExpNeed = 9000, RewardMoney = true, RewardMoneyAmount = 90, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 18 },
    { Level = 10 , ExpNeed = 10000, RewardMoney = true, RewardMoneyAmount = 100, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 20 },
    { Level = 11 , ExpNeed = 12000, RewardMoney = true, RewardMoneyAmount = 110, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 22 },
    { Level = 12 , ExpNeed = 13000, RewardMoney = true, RewardMoneyAmount = 120, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 24 },
    { Level = 13 , ExpNeed = 14000, RewardMoney = true, RewardMoneyAmount = 130, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 26 },
    { Level = 14 , ExpNeed = 15000, RewardMoney = true, RewardMoneyAmount = 140, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 28 },
    { Level = 15 , ExpNeed = 16000, RewardMoney = true, RewardMoneyAmount = 150, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 30 },
    { Level = 16 , ExpNeed = 17000, RewardMoney = true, RewardMoneyAmount = 160, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 32 },
    { Level = 17 , ExpNeed = 18000, RewardMoney = true, RewardMoneyAmount = 170, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 34 },
    { Level = 18 , ExpNeed = 19000, RewardMoney = true, RewardMoneyAmount = 180, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 36 },
    { Level = 19 , ExpNeed = 20000, RewardMoney = true, RewardMoneyAmount = 190, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 38 },
    { Level = 20 , ExpNeed = 21000, RewardMoney = true, RewardMoneyAmount = 200, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 40 },
    { Level = 21 , ExpNeed = 22000, RewardMoney = true, RewardMoneyAmount = 210, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 42 },
    { Level = 22 , ExpNeed = 23000, RewardMoney = true, RewardMoneyAmount = 220, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 44 },
    { Level = 23 , ExpNeed = 24000, RewardMoney = true, RewardMoneyAmount = 230, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 46 },
    { Level = 24 , ExpNeed = 25000, RewardMoney = true, RewardMoneyAmount = 240, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 48 },
    { Level = 25 , ExpNeed = 26000, RewardMoney = true, RewardMoneyAmount = 250, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 50 },
    { Level = 26 , ExpNeed = 27000, RewardMoney = true, RewardMoneyAmount = 260, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 52 },
    { Level = 27 , ExpNeed = 28000, RewardMoney = true, RewardMoneyAmount = 270, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 54 },
    { Level = 28 , ExpNeed = 29000, RewardMoney = true, RewardMoneyAmount = 280, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 56 },
    { Level = 29 , ExpNeed = 30000, RewardMoney = true, RewardMoneyAmount = 290, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 58 },
    { Level = 30 , ExpNeed = 0, RewardMoney = true, RewardMoneyAmount = 300, RewardItem = true, RewardItemName = 'QuestToken', RewardItemLabel = 'Quest Token', RewardItemAmount = 60 },
}