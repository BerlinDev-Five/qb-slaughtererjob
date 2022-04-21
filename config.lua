Config = {}


Config.ChickenItems = {
    ["packagedchicken"] = {
        ["price"] = 80
    },
}

------------------CONFIG----------------------
startX = -68.425  --miejsce lapania kurczakow
startY = 6248.42
startZ = 31.194
---------------------------------------------
przetworniaX = -96.007   --punkt na przetwarzanie 1
przetworniaY = 6206.92
przetworniaZ = 31.02
---
przetworniaX2 = -100.64   --punkt na przetwarzanie 2
przetworniaY2 = 6202.30
przetworniaZ2 = 31.02
---
pakowanieX = -106.44    --punkt pakowania 1
pakowanieY = 6204.29
pakowanieZ = 31.02
---
pakowanieX2 = -104.20   --punkt pakowania 2
pakowanieY2 = 6206.45
pakowanieZ2 = 31.02
---
sellX = -1177.17    --punkt sprzedazy
sellY = -890.68
sellZ = 13.79




local rzeznia = AddBlipForCoord(przetworniaX, przetworniaY, przetworniaZ)
	SetBlipSprite (rzeznia, 273)
	SetBlipDisplay(rzeznia, 4)
	SetBlipScale  (rzeznia, 0.7)
	SetBlipColour (rzeznia, 46)
	SetBlipAsShortRange(rzeznia, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Slaughter House')
	EndTextCommandSetBlipName(rzeznia)

local skupk = AddBlipForCoord(sellX, sellY, sellZ)
	SetBlipSprite (skupk, 478)
	SetBlipDisplay(skupk, 4)
	SetBlipScale  (skupk, 0.6)
	SetBlipColour (skupk, 46)
	SetBlipAsShortRange(skupk, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Chicken Dealer')
	EndTextCommandSetBlipName(skupk)


	

