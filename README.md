# sayer-fishing
Fishing For QBCore

Original by Evilanious - link to the original found here - https://github.com/MrEvilGamer/qb-fishing

i just rewrote parts and added some cool things that i liked. 

## Make sure to add the shard.lua in your qb-core/shared/items.lua
```lua
 --sayer-fishing
    ["fish"] 			 		 	 = {["name"] = "fish", 							["label"] = "Fish",                     ["weight"] = 1100,      ["type"] = "item",      ["image"] = "fish.png",                 ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["killerwhalemeat"] 			 = {["name"] = "killerwhalemeat", 				["label"] = "killerwhalemeat",          ["weight"] = 1100,      ["type"] = "item",      ["image"] = "killerwhalemeat.png",      ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["stingraymeat"] 			     = {["name"] = "stingraymeat", 				    ["label"] = "stingraymeat",              ["weight"] = 1111,      ["type"] = "item",      ["image"] = "stingraymeat.png",         ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["tigersharkmeat"] 			     = {["name"] = "tigersharkmeat", 				["label"] = "tigersharkmeat",            ["weight"] = 1111,      ["type"] = "item",      ["image"] = "tigersharkmeat.png",       ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["catfish"] 			         = {["name"] = "catfish", 				        ["label"] = "catfish",                   ["weight"] = 1111,      ["type"] = "item",      ["image"] = "catfish.png",              ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["salmon"] 			             = {["name"] = "salmon", 				        ["label"] = "salmon",                    ["weight"] = 1111,      ["type"] = "item",      ["image"] = "salmon.png",               ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["largemouthbass"] 			     = {["name"] = "largemouthbass", 				["label"] = "largemouthbass",            ["weight"] = 1111,      ["type"] = "item",      ["image"] = "largemouthbass.png",       ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["goldfish"] 			         = {["name"] = "goldfish", 			        	["label"] = "goldfish",                  ["weight"] = 1111,      ["type"] = "item",      ["image"] = "goldfish.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["redfish"] 			         = {["name"] = "redfish", 			        	["label"] = "redfish",                   ["weight"] = 1111,      ["type"] = "item",      ["image"] = "redfish.png",              ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["bluefish"] 			         = {["name"] = "bluefish", 			        	["label"] = "bluefish",                  ["weight"] = 1111,      ["type"] = "item",      ["image"] = "bluefish.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["stripedbass"] 			     = {["name"] = "stripedbass", 			        ["label"] = "stripedbass",               ["weight"] = 1111,      ["type"] = "item",      ["image"] = "stripedbass.png",          ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Fish for Fishing."},
    ["fishingrod"] 			 		 = {["name"] = "fishingrod", 					["label"] = "Fishing Rod", 				["weight"] = 5000, 		["type"] = "item", 		["image"] = "fishingrod.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A fishing rod for adventures with friends!!"},	
    ["fishingbait"] 			 	 = {["name"] = "fishingbait", 					["label"] = "Fish Bait", 				["weight"] = 400, 		["type"] = "item", 		["image"] = "fishbait.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "A fish bait"},
```

Add This to your qb-core/server/player.lua
```lua
--fishing
    PlayerData.metadata['sayerfishingxp'] = PlayerData.metadata['sayerfishingxp'] or 0
    PlayerData.metadata['sayerfishinglevel'] = PlayerData.metadata['sayerfishinglevel'] or 1
```

Configure script to your liking!