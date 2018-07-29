config = {
	enableVersionNotifier = false, --notify if a new version is available (server console)

	useModifiedEmergency = false, --require modified emergency script
	useModifiedBanking = false, --require Simple Banking
	useVDKInventory = false, --require VDK Inventory script
	useGcIdentity = false, --require GCIdentity
	enableOutfits = false, --require Skin Customization
	useJobSystem = false, -- require job system
	useWeashop = false, -- require es_weashop
	
	stationBlipsEnabled = true, -- switch between true or false to enable/disable blips for police stations
	useCopWhitelist = true,
	enableCheckPlate = false, --require garages
	
	enableOtherCopsBlips = true,
	useNativePoliceGarage = true,
	enableNeverWanted = true,
	
	propsSpawnLimitByCop = -1,
	
	displayRankBeforeNameOnChat = false,
	
	--Available languages : 'en', 'fr', 'de'
	lang = 'en',

	
	--Use by job system
	job = {
		officer_on_duty_job_id = 2,
		officer_not_on_duty_job_id = 7,
	},
	
	bindings = {
		interact_position = 51, -- E
		use_police_menu = 170, -- F3
		accept_fine = 166, -- F5
		refuse_fine = 167 -- F6
	},

	--Customizable Departments
	departments = {
		label = {
			[1] = "Blaine County Sheriff's Office",
			[2] = "California Highway Patrol",
		},

		minified_label = {
			[1] = "BCSO",
			[2] = "CHP",
		}
	},
	
	rank = {

		label = {
			[1] = "Deputy Recruit",
			[2] = "Probationary Trooper", 

			[3] = "Deputy",
			[4] = "Trooper",

			[5] = "Senior Deputy",
			[6] = "Trooper First Class",

			[7] = "Corporal",
			[8] = "Corporal",

			[9] = "Senior Corporal",
			[10] = "Senior Corporal",

			[11] = "Sergeant",
			[12] = "Sergeant",
 
			[13] = "Senior Sergeant",
			[14] = "Staff Sergeant",

			[15] = "Lieutenant",
			[16] = "Lieutenant", 

			[17] = "Captain",
			[18] = "Captain",

			[19] = "Major",
			[20] = "Major",

			[21] = "Colonel",
			[22] = "Lieutenant Colonel",

			[23] = "Division Chief",
			[24] = "Colonel",

			[25] = "Assistant Sheriff",
			[26] = "Commander",
 
			[27] = "Undersheriff",
			[28] = "Deputy Commissioner",

			[29] = "Sheriff",
			[30] = "Commissioner",

		},

		--Used for chat
		minified_label = {
			[0] = "TNE",
			[1] = "TNE", --1
			[2] = "TNE",
			[3] = "TNE",

			[4] = "PR",
			[5] = "PO", --2
			[6] = "DS",
			[7] = "ST",

			[8] = "PR2",
			[9] = "MPO", --3
			[10] = "DS2",
			[11] = "ST2",

			[12] = "SGT",
			[13] = "SGT", --4
			[14] = "SGT",
			[15] = "SGT",

			[16] = "LT",
			[17] = "LT", --5
			[18] = "LT",
			[19] = "LT",

			[20] = "CPT",
			[21] = "CPT", --6
			[22] = "CPT",
			[23] = "CPT",

			[24] = "GW",
			[25] = "COP", --7
			[26] = "SHF",
			[27] = "COS",

			[28] = "RAR",
			[29] = "APR", --8
			[30] = "ASR",
			[31] = "SSR",
		},

		--You can set here a badge for each rank you have. You have to enable "enableOutfits" to use this
		--The index is the rank index, the value is the badge index.
		--Here a link where you have the 4 MP Models badges with their index : https://kyominii.com/fivem/index.php/MP_Badges
		outfit_badge = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0,

			[4] = 0,
			[5] = 0,
			[6] = 0,
			[7] = 0,

			[8] = 1,
			[9] = 1,
			[10] = 1,
			[11] = 1,

			[12] = 1,
			[13] = 1,
			[14] = 1,
			[15] = 1,

			[16] = 2,
			[17] = 2,
			[18] = 2,
			[19] = 2,

			[20] = 2,
			[21] = 2,
			[22] = 2,
			[23] = 2,

			[24] = 3,
			[25] = 3,
			[26] = 3,
			[27] = 3,

			[28] = 3,
			[29] = 3,
			[30] = 3,
			[31] = 3,
		},

		--Minimum rank require to modify officers rank
		min_rank_set_rank = 24
	}
}

clockInStation = {
  {x=850.156677246094, y=-1283.92004394531, z=28.0047378540039}, -- La Mesa
  {x=457.956909179688, y=-992.72314453125, z=30.6895866394043}, -- Mission Row
  {x=1856.91320800781, y=3689.50073242188, z=34.2670783996582}, -- Sandy Shore
  {x=-450.063201904297, y=6016.5751953125, z=31.7163734436035} -- Paleto Bay
}

garageStation = {
   {x=-470.85266113281, y=6022.9296875, z=31.340530395508},  -- La Mesa
   {x=1873.3372802734, y=3687.3508300781, z=33.616954803467},  -- Mission Row
   {x=452.115966796875, y=-1018.10681152344, z=28.4786586761475}, -- Sandy Shore
   {x=855.24249267578, y=-1279.9300537109, z=26.513223648071 }  --Paleto Bay
}

heliStation = {
    {x=449.113966796875, y=-981.084966796875, z=43.691966796875} -- Mission Row
}

armoryStation = {
    {x=452.119966796875, y=-980.061966796875, z=30.690966796875},
    {x=853.157, y=-1267.74, z= 26.6729},	
    {x=1849.63, y=3689.48, z=34.2671},
    {x=-448.219, y= 6008.98, z=31.7164}
}

i18n.setLang(tostring(config.lang))