Config = {}

Config.Debug = false

Config.JobRequired = {
    Enable = false,
    JobCode = 'fisherman',
    Label = "FisherMan",
}

Config.FishAnywhere = true -- if true will ignore the below fishingzones
Config.FishingZones = { --ignored if Config.FishAnywhere = true
    {Coords = vector3(-198.2, 794.38, 198.11),Radius = 20.0},
}

Config.FishingRelievesStress = true
Config.CatchTime = {Min = 5,Max = 10} --how long from baiting rod to getting a "Bite"
Config.PutRodAwayTime = 60 --how many seconds of being idle before rod is put away

Config.FishingItems = {
    ['fishingrod'] = {
        Type = 'rod', --using 'rod' means you can use this item as fishing rod
        CatchMultiplier = 20, --in % so 20 mulitplier would mean a 20% increase in chance of catching the fish
    },
    ['fishingbait'] = {
        Type = 'bait', --using 'bait' means you can use this item as bait
        CatchList = { --items from Config.FishingRewards below
            "fish",           
            "stripedbass",    
            "bluefish",       
            "salmon",         
            "redfish",        
        },
    },
    ['fishingbait2'] = {
        Type = 'bait', 
        CatchList = {  
            "pacifichalibut", 
            "goldfish",       
            "largemouthbass", 
            "catfish",        
        },
    },
    ['fishingbait3'] = {
        Type = 'bait',
        CatchList = { 
            "tigersharkmeat", 
            "stingraymeat",   
            "killerwhalemeat",
        },
    },
}

Config.FishingRewards = {
    ["fish"] =            {Chance = 90,     XPGive = 1},
    ["stripedbass"] =     {Chance = 70,     XPGive = 1},
    ["bluefish"] =        {Chance = 70,     XPGive = 1},
    ["salmon"] =          {Chance = 70,     XPGive = 1},
    ["redfish"] =         {Chance = 60,     XPGive = 1},
    ["pacifichalibut"] =  {Chance = 60,     XPGive = 1},
    ["goldfish"] =        {Chance = 60,     XPGive = 1},
    ["largemouthbass"] =  {Chance = 50,     XPGive = 1},
    ["catfish"] =         {Chance = 50,     XPGive = 1},
    ["tigersharkmeat"] =  {Chance = 30,     XPGive = 1},
    ["stingraymeat"] =    {Chance = 30,     XPGive = 1},
    ["killerwhalemeat"] = {Chance = 100,     XPGive = 1},
}

Config.ShopStyle = 'qb' --supports 'qb'/'jim'
Config.Shops = {
    Peds = {
        {Enable = true,Model = 'a_m_m_hillbilly_01',Coords = vector4(1348.36, 4317.34, 38.04, 83.71)},
    },
    EquipmentStock = {
        label = "Fishing Shop",
        slots = 2,
        items = {
            [1]  =  {name = "fishingrod",      price = 1,   amount = 50,    info = {},  type = "item",  slot = 1,},
            [2]  =  {name = "fishingbait",     price = 1,   amount = 50,    info = {},  type = "item",  slot = 2,},
        }
    }
}

Config.MiniGame = 'ps-ui' --configure in client/functions.lua TryToCatchFish function
    
-- some example stuff done in config. will work if you use either script
--ps-ui settings
Config.PSUI = {
    NumberOfCircles = 2,
    MiniGameTime = 20,
}
--qb-skillbar settings
Config.SkillBar = {
    Duration = {Min = 7,Max = 15,},
    Postion = {Min = 10,Max = 30,},
    Width = {Min = 10,Max = 20,},
    NumberOfBars = 3,
}
--boii-ui settings
Config.BOIIUI = {
    Style = 'default',
    Duration = 25,
}

Config.UseLevelSystem = false

Config.DoubleXP = true --multiplies the xp given by 2 so you dont have to change lots of values
Config.DoubleLevelRewards = false --multiplies the reward given by 2 so you dont have to change lots of values
Config.Levels = {
    [1] = {NextLevel = 100},
    [2] = {NextLevel = 200},
    [3] = {NextLevel = 300},
    [4] = {NextLevel = 400},
    [5] = {NextLevel = 500},
    [6] = {NextLevel = 600},
    [7] = {NextLevel = 700},
    [8] = {NextLevel = 800},
    [9] = {NextLevel = 900},
    [10] = {NextLevel = 1000,Reward = {Type = 'cash',Amount = 1000}}, --Type can be 'cash'/'bank'(if you want money rewards) or the itemcode you want to give as reward
    [11] = {NextLevel = 1100},
    [12] = {NextLevel = 1200},
    [13] = {NextLevel = 1300},
    [14] = {NextLevel = 1400},
    [15] = {NextLevel = 1500},
    [16] = {NextLevel = 1600},
    [17] = {NextLevel = 1700},
    [18] = {NextLevel = 1800},
    [19] = {NextLevel = 1900},
    [20] = {NextLevel = 2000,Reward = {Type = 'cash',Amount = 2000}},
    [21] = {NextLevel = 2100},
    [22] = {NextLevel = 2200},
    [23] = {NextLevel = 2300},
    [24] = {NextLevel = 2400},
    [25] = {NextLevel = 2500},
    [26] = {NextLevel = 2600},
    [27] = {NextLevel = 2700},
    [28] = {NextLevel = 2800},
    [29] = {NextLevel = 2900},
    [30] = {NextLevel = 3000,Reward = {Type = 'cash',Amount = 3000}},
    [31] = {NextLevel = 3100},
    [32] = {NextLevel = 3200},
    [33] = {NextLevel = 3300},
    [34] = {NextLevel = 3400},
    [35] = {NextLevel = 3500},
    [36] = {NextLevel = 3600},
    [37] = {NextLevel = 3700},
    [38] = {NextLevel = 3800},
    [39] = {NextLevel = 3900},
    [40] = {NextLevel = 4000,Reward = {Type = 'cash',Amount = 4000}},
    [41] = {NextLevel = 4100},
    [42] = {NextLevel = 4200},
    [43] = {NextLevel = 4300},
    [44] = {NextLevel = 4400},
    [45] = {NextLevel = 4500},
    [46] = {NextLevel = 4600},
    [47] = {NextLevel = 4700},
    [48] = {NextLevel = 4800},
    [49] = {NextLevel = 4900},
    [50] = {NextLevel = 5000,Reward = {Type = 'cash',Amount = 5000}},
    [51] = {NextLevel = 5100},
    [52] = {NextLevel = 5200},
    [53] = {NextLevel = 5300},
    [54] = {NextLevel = 5400},
    [55] = {NextLevel = 5500},
    [56] = {NextLevel = 5600},
    [57] = {NextLevel = 5700},
    [58] = {NextLevel = 5800},
    [59] = {NextLevel = 5900},
    [60] = {NextLevel = 6000,Reward = {Type = 'cash',Amount = 6000}},
    [61] = {NextLevel = 6100},
    [62] = {NextLevel = 6200},
    [63] = {NextLevel = 6300},
    [64] = {NextLevel = 6400},
    [65] = {NextLevel = 6500},
    [66] = {NextLevel = 6600},
    [67] = {NextLevel = 6700},
    [68] = {NextLevel = 6800},
    [69] = {NextLevel = 6900},
    [70] = {NextLevel = 7000,Reward = {Type = 'cash',Amount = 7000}},
    [71] = {NextLevel = 7100},
    [72] = {NextLevel = 7200},
    [73] = {NextLevel = 7300},
    [74] = {NextLevel = 7400},
    [75] = {NextLevel = 7500},
    [76] = {NextLevel = 7600},
    [77] = {NextLevel = 7700},
    [78] = {NextLevel = 7800},
    [79] = {NextLevel = 7900},
    [80] = {NextLevel = 8000,Reward = {Type = 'cash',Amount = 8000}},
    [81] = {NextLevel = 8100},
    [82] = {NextLevel = 8200},
    [83] = {NextLevel = 8300},
    [84] = {NextLevel = 8400},
    [85] = {NextLevel = 8500},
    [86] = {NextLevel = 8600},
    [87] = {NextLevel = 8700},
    [88] = {NextLevel = 8800},
    [89] = {NextLevel = 8900},
    [90] = {NextLevel = 9000,Reward = {Type = 'cash',Amount = 9000}},
    [91] = {NextLevel = 9100},
    [92] = {NextLevel = 9200},
    [93] = {NextLevel = 9300},
    [94] = {NextLevel = 9400},
    [95] = {NextLevel = 9500},
    [96] = {NextLevel = 9600},
    [97] = {NextLevel = 9700},
    [98] = {NextLevel = 9800},
    [99] = {NextLevel = 9900},
    [100] = {NextLevel = 0,Reward = {Type = 'cash',Amount = 10000}},
}