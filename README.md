# xg-slaughtererjob
Hey Everyone

its working with latest QBCore version server.

qb-target configure soon...

added this on your qbcore shared/items.lua

`
["alivechicken"] 		 			 	 = {["name"] = "alivechicken", 							["label"] = "Alive Chicken", 					    ["weight"] = 4000, 		["type"] = "item", 		["image"] = "alivechicken.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Alive Chicken"}, `

`
["slaughteredchicken"] 		 		     = {["name"] = "slaughteredchicken", 						["label"] = "Slaughtered Chicken", 					    ["weight"] = 4000, 		["type"] = "item", 		["image"] = "slaughteredchicken.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Slaughtered Chicken"}, `

`
["packagedchicken"] 		 			 = {["name"] = "packagedchicken", 							["label"] = "Packaged Chicken", 					    ["weight"] = 4000, 		["type"] = "item", 		["image"] = "packagedchicken.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Packaged Chicken"}, `


#add this on your qb-target init Config.TargetModels
```
    ["chickensell"] = {
        models = {
            "csb_chef", 
        },
        options = {
            {
                type = "client",
                event = "Chickens:sell",
                icon = "fas fa-archive",
                label = "Sell Chicken Box",
			
            },
        },
        distance = 2.5,
    },
    


#and add this on your qb-target init Config.Peds



     { 
	model = `csb_chef`,
	coords = vector4(-1178.16, -891.61, 12.76, 304.99),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
}, 



#Any issues and problems related this script please contact me on my Discord 
#https://discord.gg/Nh8WscE6ck
