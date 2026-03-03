--There are two functions that will install mods, ServerModSetup and ServerModCollectionSetup. Put the calls to the functions in this file and they will be executed on boot.

--ServerModSetup takes a string of a specific mod's Workshop id. It will download and install the mod to your mod directory on boot.
	--The Workshop id can be found at the end of the url to the mod's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=350811795
	--ServerModSetup("350811795")

--ServerModCollectionSetup takes a string of a specific mod's Workshop id. It will download all the mods in the collection and install them to the mod directory on boot.
	--The Workshop id can be found at the end of the url to the collection's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=379114180
	--ServerModCollectionSetup("379114180")
ServerModSetup("3050607025")
ServerModSetup("3235319974")
ServerModSetup("3448135812")
ServerModSetup("2621090176")
ServerModSetup("3223103565")
ServerModSetup("2966979495")
ServerModSetup("3078702554")
ServerModSetup("1392778117")
ServerModSetup("1909182187")
ServerModSetup("2843097516")
ServerModSetup("2477889104")
ServerModSetup("2189004162")
ServerModSetup("1595631294")
ServerModSetup("3138571948")