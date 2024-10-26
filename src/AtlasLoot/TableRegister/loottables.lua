-- $Id: loottables.lua 3697 2012-01-31 15:17:37Z lag123 $
--[[
loottables.en.lua
This file assigns a title to every loot table.  The primary use of this table
is in the search function, as when iterating through the loot tables there is no
inherant title to the loot table, given the origins of the mod as an Atlas plugin.
]]

-- Invoke libraries
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")
local BabbleInventory = AtlasLoot_GetLocaleLibBabble("LibBabble-Inventory-3.0")
local BabbleFaction = AtlasLoot_GetLocaleLibBabble("LibBabble-Faction-3.0")
local BabbleZone = AtlasLoot_GetLocaleLibBabble("LibBabble-Zone-3.0")

-- Using alchemy skill to get localized rank
local JOURNEYMAN = select(2, GetSpellInfo(3101));
local EXPERT = select(2, GetSpellInfo(3464));
local ARTISAN = select(2, GetSpellInfo(11611));
local MASTER = select(2, GetSpellInfo(28596));

local ALCHEMY, APPRENTICE = GetSpellInfo(2259);
local BLACKSMITHING = GetSpellInfo(2018);
local ARMORSMITH = GetSpellInfo(9788);
local WEAPONSMITH = GetSpellInfo(9787);
local AXESMITH = GetSpellInfo(17041);
local HAMMERSMITH = GetSpellInfo(17040);
local SWORDSMITH = GetSpellInfo(17039);
local COOKING = GetSpellInfo(2550);
local ENCHANTING = GetSpellInfo(7411);
local ENGINEERING = GetSpellInfo(4036);
local GNOMISH = GetSpellInfo(20220);
local GOBLIN = GetSpellInfo(20221);
local FIRSTAID = GetSpellInfo(3273);
local FISHING = GetSpellInfo(63275);
local INSCRIPTION = GetSpellInfo(45357);
local JEWELCRAFTING = GetSpellInfo(25229);
local LEATHERWORKING = GetSpellInfo(2108);
local DRAGONSCALE = GetSpellInfo(10656);
local ELEMENTAL = GetSpellInfo(10658);
local TRIBAL = GetSpellInfo(10660);
local MINING = GetSpellInfo(2575);
local TAILORING = GetSpellInfo(3908);
local MOONCLOTH = GetSpellInfo(26798);
local SHADOWEAVE = GetSpellInfo(26801);
local SPELLFIRE = GetSpellInfo(26797);

AtlasLoot_LootTableRegister = {
	["Instances"] = {
		-----------------------
		--- WotLK Instances ---
		-----------------------

		---- Dungeons

		["AhnKahet"] = {
			["Bosses"] = {
				{ "AhnkahetNadox",    3 },
				{ "AhnkahetTaldaram", 4 },
				{ "AhnkahetAmanitar", 5 },
				{ "AhnkahetJedoga",   6 },
				{ "AhnkahetVolazj",   7 },
				{ "AhnkahetTrash",    10 },
			},
			["Info"] = { BabbleZone["Ahn'kahet: The Old Kingdom"], "AtlasLootWotLK", mapname = "Ahnkahet" },
		},

		["AzjolNerub"] = {
			["Bosses"] = {
				{ "AzjolNerubKrikthir", 4 },
				{ "AzjolNerubHadronox", 8 },
				{ "AzjolNerubAnubarak", 9 },
				{ "LunarFestival",      10, hide = true },
				{ "AzjolNerubTrash",    12 },
			},
			["Info"] = { BabbleZone["Azjol-Nerub"], "AtlasLootWotLK", mapname = "AzjolNerub" },
		},

		["CoTOldStratholme"] = {
			["Bosses"] = {
				{ "CoTStratholmeMeathook", 5 },
				{ "CoTStratholmeSalramm",  6 },
				{ "CoTStratholmeEpoch",    7 },
				{ "CoTStratholmeTrash",    8, hide = true },
				{ "CoTStratholmeMalGanis", 10 },
				{ "CoTStratholmeTrash",    14 },
			},
			["Info"] = { BabbleZone["The Culling of Stratholme"], "AtlasLootWotLK", mapname = "CoTStratholme" },
		},

		["DrakTharonKeep"] = {
			["Bosses"] = {
				{ "DrakTharonKeepTrollgore", 3 },
				{ "DrakTharonKeepNovos",     4 },
				{ "DrakTharonKeepKingDred",  5 },
				{ "DrakTharonKeepTharonja",  6 },
				{ "LunarFestival",           8, hide = true },
				{ "DrakTharonKeepTrash",     11 },
			},
			["Info"] = { BabbleZone["Drak'Tharon Keep"], "AtlasLootWotLK", mapname = "DrakTharonKeep" },
		},

		["FHTheForgeOfSouls"] = {
			["Bosses"] = {
				{ "FoSBronjahm", 3 },
				{ "FoSDevourer", 4 },
				{ "FHTrashMobs", 12 },
			},
			["Info"] = { BabbleZone["The Forge of Souls"], "AtlasLootWotLK", mapname = "TheForgeofSouls" },
		},

		["FHHallsOfReflection"] = {
			["Bosses"] = {
				{ "HoRFalric",   4 },
				{ "HoRMarwyn",   5 },
				{ "HoRLichKing", { 6, 7 } },
				{ "FHTrashMobs", 13 },
			},
			["Info"] = { BabbleZone["Halls of Reflection"], "AtlasLootWotLK", mapname = "HallsofReflection" },
		},

		["FHPitOfSaron"] = {
			["Bosses"] = {
				{ "PoSGarfrost", 4 },
				{ "PoSKrickIck", 7 },
				{ "PoSTyrannus", 8 },
				{ "FHTrashMobs", 17 },
			},
			["Info"] = { BabbleZone["Pit of Saron"], "AtlasLootWotLK", mapname = "PitofSaron" },
		},

		["Gundrak"] = {
			["Bosses"] = {
				{ "GundrakSladran",  3 },
				{ "GundrakColossus", 4 },
				{ "GundrakMoorabi",  5 },
				{ "GundrakEck",      6 },
				{ "GundrakGaldarah", 7 },
				{ "LunarFestival",   8, hide = true },
				{ "GundrakTrash",    10 },
			},
			["Info"] = { BabbleZone["Gundrak"], "AtlasLootWotLK", mapname = "Gundrak" },
		},

		["TheNexus"] = {
			["Bosses"] = {
				{ "TheNexusKolurgStoutbeard", { 2, 3 } },
				{ "TheNexusTelestra",         5 },
				{ "TheNexusAnomalus",         6 },
				{ "TheNexusOrmorok",          7 },
				{ "TheNexusKeristrasza",      8 },
				{ "LunarFestival",            9,       hide = true },
			},
			["Info"] = { BabbleZone["The Nexus"], "AtlasLootWotLK", mapname = "TheNexus" },
		},

		["TheOculus"] = {
			["Bosses"] = {
				{ "OcuDrakos",       3 },
				{ "OcuCloudstrider", 4 },
				{ "OcuUrom",         5 },
				{ "OcuEregos",       { 6, 8 } },
				{ "OcuTrash",        10 },
			},
			["Info"] = { BabbleZone["The Oculus"], "AtlasLootWotLK", mapname = "Nexus80" },
		},

		["TrialOfTheChampion"] = {
			["Bosses"] = {
				{ "TrialoftheChampionChampions",          2 },
				{ "TrialoftheChampionEadricthePure",      15 },
				{ "TrialoftheChampionConfessorPaletress", 16 },
				{ "TrialoftheChampionBlackKnight",        17 },
			},
			["Info"] = { BabbleZone["Trial of the Champion"], "AtlasLootWotLK", mapname = "TheArgentColiseum" },
		},

		["UlduarHallsofStone"] = {
			["Bosses"] = {
				{ "HallsofStoneKrystallus", 2 },
				{ "HallsofStoneMaiden",     3 },
				{ "HallsofStoneTribunal",   { 4, 5 } },
				{ "HallsofStoneSjonnir",    6 },
				{ "LunarFestival",          7,       hide = true },
				{ "HallsofStoneTrash",      10 },
			},
			["Info"] = { BabbleZone["Halls of Stone"], "AtlasLootWotLK", mapname = "Ulduar77" },
		},

		["UlduarHallsofLightning"] = {
			["Bosses"] = {
				{ "HallsofLightningBjarngrim", 2 },
				{ "HallsofLightningVolkhan",   3 },
				{ "HallsofLightningIonar",     4 },
				{ "HallsofLightningLoken",     5 },
				{ "HallsofLightningTrash",     7 },
			},
			["Info"] = { BabbleZone["Halls of Lightning"], "AtlasLootWotLK", mapname = "HallsofLightning" },
		},

		["UtgardeKeep"] = {
			["Bosses"] = {
				{ "UtgardeKeepKeleseth", 4 },
				{ "UtgardeKeepSkarvald", { 5, 6 } },
				{ "UtgardeKeepIngvar",   7 },
				{ "LunarFestival",       8,       hide = true },
				{ "UtgardeKeepTrash",    10 },
			},
			["Info"] = { BabbleZone["Utgarde Keep"], "AtlasLootWotLK", mapname = "UtgardeKeep" },
		},

		["UtgardePinnacle"] = {
			["Bosses"] = {
				{ "UPSorrowgrave", 3 },
				{ "UPPalehoof",    4 },
				{ "UPSkadi",       5 },
				{ "UPYmiron",      6 },
				{ "LunarFestival", 7, hide = true },
				{ "UPTrash",       9 },
			},
			["Info"] = { BabbleZone["Utgarde Pinnacle"], "AtlasLootWotLK", mapname = "UtgardePinnacle" },
		},

		["VioletHold"] = {
			["Bosses"] = {
				{ "VioletHoldErekem",    2 },
				{ "VioletHoldZuramat",   3 },
				{ "VioletHoldXevozz",    4 },
				{ "VioletHoldIchoron",   5 },
				{ "VioletHoldMoragg",    6 },
				{ "VioletHoldLavanthor", 7 },
				{ "VioletHoldCyanigosa", 8 },
				{ "VioletHoldTrash",     10 },
			},
			["Info"] = { BabbleZone["The Violet Hold"], "AtlasLootWotLK", mapname = "VioletHold" },
		},

		---- Raids

		["IcecrownCitadelA"] = "IcecrownCitadel",
		["IcecrownCitadelB"] = "IcecrownCitadel",
		["IcecrownCitadelC"] = "IcecrownCitadel",
		["IcecrownCitadel"] = {
			["IcecrownCitadelA"] = {
				{ "TheAshenVerdict",     1,       hide = true },
				{ "ICCLordMarrowgar",    5 },
				{ "ICCLadyDeathwhisper", 6 },
				{ "ICCGunshipBattle",    { 7, 8 } },
				{ "ICCSaurfang",         9 },
				{ "ICCTrash",            15,      hide = true },
			},
			["IcecrownCitadelB"] = {
				{ "TheAshenVerdict", 1,                 hide = true },
				{ "ICCFestergut",    7 },
				{ "ICCRotface",      8 },
				{ "ICCPutricide",    9 },
				{ "ICCCouncil",      { 10, 11, 12, 13 } },
				{ "ICCLanathel",     14 },
				{ "ICCValithria",    16 },
				{ "ICCSindragosa",   17 },
				{ "ICCTrash",        23,                hide = true },
			},
			["IcecrownCitadelC"] = {
				{ "TheAshenVerdict", 1, hide = true },
				{ "ICCLichKing",     3 },
				{ "ICCTrash",        5 },
			},
			["Info"] = { BabbleZone["Icecrown Citadel"], "AtlasLootWotLK", sortOrder = { "IcecrownCitadelA", "IcecrownCitadelB", "IcecrownCitadelC" }, mapname = "IcecrownCitadel", raid = true },
		},

		["Naxxramas"] = {
			["Bosses"] = {
				{ "Naxx80Patchwerk",    4 },
				{ "Naxx80Grobbulus",    5 },
				{ "Naxx80Gluth",        6 },
				{ "Naxx80Thaddius",     7 },
				{ "Naxx80AnubRekhan",   11 },
				{ "Naxx80Faerlina",     12 },
				{ "Naxx80Maexxna",      13 },
				{ "Naxx80Razuvious",    15 },
				{ "Naxx80Gothik",       16 },
				{ "Naxx80FourHorsemen", { 17, 22 } },
				{ "Naxx80Noth",         24 },
				{ "Naxx80Heigan",       25 },
				{ "Naxx80Loatheb",      26 },
				{ "Naxx80Sapphiron",    28 },
				{ "Naxx80KelThuzad",    29 },
				{ "Naxx80Trash",        33 },
				{ "T7T8SET",            34,        hide = true },
			},
			["Info"] = { BabbleZone["Naxxramas"], "AtlasLootWotLK", mapname = "IcecrownCitadel", mapname = "Naxxramas", raid = true },
		},

		["ObsidianSanctum"] = {
			["Bosses"] = {
				{ "Sartharion", 6 },
			},
			["Info"] = { BabbleZone["The Obsidian Sanctum"], "AtlasLootWotLK", mapname = "TheObsidianSanctum", raid = true },
		},

		["OnyxiasLair"] = {
			["Bosses"] = {
				{ "Onyxia", 2 },
			},
			["Info"] = { BabbleZone["Onyxia's Lair"], "AtlasLootWotLK", mapname = "OnyxiasLair", raid = true },
		},

		["RubySanctum"] = {
			["Bosses"] = {
				{ "Halion", 6 },
			},
			["Info"] = { BabbleZone["The Ruby Sanctum"], "AtlasLootWotLK", mapname = "TheRubySanctum", raid = true },
		},

		["TheEyeOfEternity"] = {
			["Bosses"] = {
				{ "Malygos", 2 },
			},
			["Info"] = { BabbleZone["The Eye of Eternity"], "AtlasLootWotLK", mapname = "TheEyeOfEternity", raid = true },
		},

		["TrialOfTheCrusader"] = {
			["Bosses"] = {
				{ "TrialoftheCrusaderNorthrendBeasts",  4 },
				{ "TrialoftheCrusaderLordJaraxxus",     9 },
				{ "TrialoftheCrusaderFactionChampions", 10 },
				{ "TrialoftheCrusaderTwinValkyrs",      11 },
				{ "TrialoftheCrusaderAnubarak",         14 },
				{ "TrialoftheCrusaderTribute",          15 },
				{ "TrialoftheCrusaderPatterns",         16 },
			},
			["Info"] = { BabbleZone["Trial of the Crusader"], "AtlasLootWotLK", mapname = "TheArgentColiseum", raid = true },
		},

		["UlduarA"] = "Ulduar",
		["UlduarB"] = "Ulduar",
		["UlduarC"] = "Ulduar",
		["UlduarD"] = "Ulduar",
		["UlduarE"] = "Ulduar",
		["Ulduar"] = {
			["UlduarA"] = {
				{ "UlduarLeviathan",     7 },
				{ "UlduarRazorscale",    8 },
				{ "UlduarIgnis",         9 },
				{ "UlduarDeconstructor", 10 },
				{ "UlduarTrash",         16, hide = true },
				{ "UlduarPatterns",      17, hide = true },
				{ "T7T8SET",             18, hide = true },
			},
			["UlduarB"] = {
				{ "UlduarIronCouncil", 3 },
				{ "UlduarKologarn",    7 },
				{ "UlduarAlgalon",     8 },
				{ "UlduarTrash",       13, hide = true },
				{ "UlduarPatterns",    14, hide = true },
				{ "T7T8SET",           15, hide = true },
			},
			["UlduarC"] = {
				{ "UlduarAuriaya",  4 },
				{ "UlduarHodir",    5 },
				{ "UlduarThorim",   6 },
				{ "UlduarFreya",    8 },
				{ "UlduarTrash",    15, hide = true },
				{ "UlduarPatterns", 16, hide = true },
				{ "T7T8SET",        17, hide = true },
			},
			["UlduarD"] = {
				{ "UlduarMimiron",  2 },
				{ "UlduarTrash",    5, hide = true },
				{ "UlduarPatterns", 6, hide = true },
				{ "T7T8SET",        7, hide = true },
			},
			["UlduarE"] = {
				{ "UlduarVezax",     2 },
				{ "UlduarYoggSaron", 3 },
				{ "UlduarTrash",     7 },
				{ "UlduarPatterns",  8 },
				{ "T7T8SET",         9, hide = true },
			},
			["Info"] = { BabbleZone["Ulduar"], "AtlasLootWotLK", sortOrder = { "UlduarA", "UlduarB", "UlduarC", "UlduarD", "UlduarE" }, mapname = "Ulduar", raid = true },
		},

		["VaultOfArchavon"] = {
			["Bosses"] = {
				{ "ARCHAVON", 2 },
				{ "EMALON",   3 },
				{ "KORALON",  4 },
				{ "TORAVON",  5 },
			},
			["Info"] = { BabbleZone["Vault of Archavon"], "AtlasLootWotLK", mapname = "VaultofArchavon", raid = true, disableCompare = true },
		},

		--------------------
		--- BC Instances ---
		--------------------

		---- Dungeons

		["AuchAuchenaiCrypts"] = {
			["Bosses"] = {
				{ "LowerCity",         1, hide = true },
				{ "AuchCryptsShirrak", 3 },
				{ "AuchCryptsExarch",  4 },
				{ "AuchCryptsAvatar",  5 },
				{ "AuchTrash",         8 },
			},
			["Info"] = { BabbleZone["Auchenai Crypts"], "AtlasLootBurningCrusade" },
		},

		["AuchManaTombs"] = {
			["Bosses"] = {
				{ "Consortium",          1, hide = true },
				{ "AuchManaPandemonius", 4 },
				{ "AuchManaTavarok",     6 },
				{ "AuchManaNexusPrince", 7 },
				{ "AuchManaYor",         8 },
				{ "AuchTrash",           13 },
			},
			["Info"] = { BabbleZone["Mana-Tombs"], "AtlasLootBurningCrusade", mapname = "ManaTombs1" },
		},

		["AuchSethekkHalls"] = {
			["Bosses"] = {
				{ "LowerCity",             1, hide = true },
				{ "AuchSethekkDarkweaver", 3 },
				{ "AuchSethekkRavenGod",   5 },
				{ "AuchTrash",             6, hide = true },
				{ "AuchSethekkTalonKing",  7 },
				{ "AuchTrash",             9 },
			},
			["Info"] = { BabbleZone["Sethekk Halls"], "AtlasLootBurningCrusade" },
		},

		["AuchShadowLabyrinth"] = {
			["Bosses"] = {
				{ "LowerCity",             1, hide = true },
				{ "AuchShadowHellmaw",     3 },
				{ "AuchShadowBlackheart",  4 },
				{ "AuchShadowGrandmaster", 5 },
				{ "AuchShadowMurmur",      7 },
				{ "AuchTrash",             9, hide = true },
				{ "AuchTrash",             12 },
			},
			["Info"] = { BabbleZone["Shadow Labyrinth"], "AtlasLootBurningCrusade", mapname = "ShadowLabyrinth1" },
		},

		["CoTOldHillsbrad"] = {
			["Bosses"] = {
				{ "KeepersofTime",       3,              hide = true },
				{ "CoTHillsbradDrake",   10 },
				{ "CoTHillsbradSkarloc", 12 },
				{ "CoTHillsbradHunter",  15 },
				{ "CoTTrash",            { 18, 20, 21 }, hide = true },
				{ "CoTTrash",            25 },
			},
			["Info"] = { BabbleZone["Old Hillsbrad Foothills"], "AtlasLootBurningCrusade" },
		},

		["CoTBlackMorass"] = {
			["Bosses"] = {
				{ "KeepersofTime",     3, hide = true },
				{ "CoTMorassDeja",     7 },
				{ "CoTMorassTemporus", 8 },
				{ "CoTMorassAeonus",   9 },
				{ "CoTTrash",          13 },
			},
			["Info"] = { BabbleZone["The Black Morass"], "AtlasLootBurningCrusade" },
		},

		["CFRTheSlavePens"] = {
			["Bosses"] = {
				{ "CExpedition",        1, hide = true },
				{ "CFRSlaveMennu",      3 },
				{ "CFRSlaveRokmar",     4 },
				{ "CFRSlaveQuagmirran", 5 },
				{ "LordAhune",          6, hide = true },
			},
			["Info"] = { BabbleZone["The Slave Pens"], "AtlasLootBurningCrusade" },
		},

		["CFRTheSteamvault"] = {
			["Bosses"] = {
				{ "CExpedition",         1, hide = true },
				{ "CFRSteamThespia",     3 },
				{ "CFRSteamSteamrigger", 5 },
				{ "CFRSteamWarlord",     7 },
				{ "CFRSteamTrash",       9, hide = true },
				{ "CFRSteamTrash",       11 },
			},
			["Info"] = { BabbleZone["The Steamvault"], "AtlasLootBurningCrusade" },
		},

		["CFRTheUnderbog"] = {
			["Bosses"] = {
				{ "CExpedition",       1, hide = true },
				{ "CFRUnderHungarfen", 3 },
				{ "CFRUnderGhazan",    5 },
				{ "CFRUnderSwamplord", 6 },
				{ "CFRUnderStalker",   8 },
			},
			["Info"] = { BabbleZone["The Underbog"], "AtlasLootBurningCrusade" },
		},

		["HCHellfireRamparts"] = {
			["Bosses"] = {
				{ "HonorHold",         1,       hide = true },
				{ "Thrallmar",         2,       hide = true },
				{ "HCRampWatchkeeper", 4 },
				{ "HCRampOmor",        5 },
				{ "HCRampVazruden",    { 6, 8 } },
			},
			["Info"] = { BabbleZone["Hellfire Ramparts"], "AtlasLootBurningCrusade" },
		},

		["HCBloodFurnace"] = {
			["Bosses"] = {
				{ "HonorHold",        1, hide = true },
				{ "Thrallmar",        2, hide = true },
				{ "HCFurnaceMaker",   4 },
				{ "HCFurnaceBroggok", 5 },
				{ "HCFurnaceBreaker", 6 },
			},
			["Info"] = { BabbleZone["The Blood Furnace"], "AtlasLootBurningCrusade" },
		},

		["HCTheShatteredHalls"] = {
			["Bosses"] = {
				{ "HonorHold",         1, hide = true },
				{ "Thrallmar",         2, hide = true },
				{ "HCHallsNethekurse", 4 },
				{ "HCHallsPorung",     5 },
				{ "HCHallsOmrogg",     6 },
				{ "HCHallsKargath",    7 },
				{ "HCHallsTrash",      8, hide = true },
				{ "HCHallsTrash",      18 },
			},
			["Info"] = { BabbleZone["The Shattered Halls"], "AtlasLootBurningCrusade" },
		},

		["MagistersTerrace"] = {
			["Bosses"] = {
				{ "SunOffensive", 1, hide = true },
				{ "SMTFireheart", 4 },
				{ "SMTVexallus",  6 },
				{ "SMTDelrissa",  7 },
				{ "SMTKaelthas",  18 },
				{ "SMTTrash",     23 },
			},
			["Info"] = { BabbleZone["Magisters' Terrace"], "AtlasLootBurningCrusade" },
		},

		["TempestKeepArcatraz"] = {
			["Bosses"] = {
				{ "Shatar",         1,  hide = true },
				{ "TKArcUnbound",   3 },
				{ "TKArcDalliah",   4 },
				{ "TKArcScryer",    5 },
				{ "TKArcHarbinger", 6 },
				{ "TKTrash",        10, hide = true },
				{ "TKTrash",        13 },
			},
			["Info"] = { BabbleZone["The Arcatraz"], "AtlasLootBurningCrusade" },
		},

		["TempestKeepBotanica"] = {
			["Bosses"] = {
				{ "Shatar",         1, hide = true },
				{ "TKBotSarannis",  4 },
				{ "TKBotFreywinn",  5 },
				{ "TKBotThorngrin", 6 },
				{ "TKBotLaj",       7 },
				{ "TKBotSplinter",  8 },
				{ "TKTrash",        10 },
			},
			["Info"] = { BabbleZone["The Botanica"], "AtlasLootBurningCrusade" },
		},

		["TempestKeepMechanar"] = {
			["Bosses"] = {
				{ "Shatar",                 1, hide = true },
				{ "TKMechCapacitus",        6 },
				{ "TKTrash",                7, hide = true },
				{ "TKMechSepethrea",        8 },
				{ "TKMechCalc",             9 },
				{ "TKMechCacheoftheLegion", 10 },
				{ "TKTrash",                12 },
			},
			["Info"] = { BabbleZone["The Mechanar"], "AtlasLootBurningCrusade" },
		},

		---- Raids

		["BlackTempleStart"] = "BlackTemple",
		["BlackTempleBasement"] = "BlackTemple",
		["BlackTempleTop"] = "BlackTemple",
		["BlackTemple"] = {
			["BlackTempleStart"] = {
				{ "Ashtongue",  1,  hide = true },
				{ "BTNajentus", 6 },
				{ "BTSupremus", 7 },
				{ "BTAkama",    8 },
				{ "BTTrash",    15, hide = true },
				{ "BTPatterns", 16, hide = true },
			},
			["BlackTempleBasement"] = {
				{ "Ashtongue",          1,  hide = true },
				{ "BTBloodboil",        4 },
				{ "BTReliquaryofSouls", 5 },
				{ "BTGorefiend",        9 },
				{ "BTTrash",            11, hide = true },
				{ "BTPatterns",         12, hide = true },
			},
			["BlackTempleTop"] = {
				{ "Ashtongue",          1, hide = true },
				{ "BTShahraz",          4 },
				{ "BTCouncil",          5 },
				{ "BTIllidanStormrage", 10 },
				{ "BTTrash",            12 },
				{ "BTPatterns",         13 },
			},
			["Info"] = { BabbleZone["Black Temple"], "AtlasLootBurningCrusade", sortOrder = { "BlackTempleStart", "BlackTempleBasement", "BlackTempleTop" }, raid = true },
		},

		["CoTHyjalEnt"] = "CoTHyjalEaI",
		["CoTHyjal"] = "CoTHyjalEaI",
		["CoTHyjalEaI"] = {
			["CoTHyjalEnt"] = {
				{ "ScaleSands", 2, hide = true },
			},
			["CoTHyjal"] = {
				{ "ScaleSands",            2, hide = true },
				{ "MountHyjalWinterchill", 9 },
				{ "MountHyjalAnetheron",   10 },
				{ "MountHyjalKazrogal",    11 },
				{ "MountHyjalAzgalor",     12 },
				{ "MountHyjalArchimonde",  13 },
				{ "MountHyjalTrash",       15 },
			},
			["Info"] = { BabbleZone["Hyjal"], "AtlasLootBurningCrusade", sortOrder = { "CoTHyjalEnt", "CoTHyjal" }, raid = true },
		},

		["CFRSerpentshrineCavern"] = {
			["Bosses"] = {
				{ "CExpedition",          1, hide = true },
				{ "CFRSerpentHydross",    3 },
				{ "CFRSerpentLurker",     4 },
				{ "CFRSerpentLeotheras",  5 },
				{ "CFRSerpentKarathress", 6 },
				{ "CFRSerpentMorogrim",   8 },
				{ "CFRSerpentVashj",      9 },
				{ "CFRSerpentTrash",      11 },
			},
			["Info"] = { BabbleZone["Serpentshrine Cavern"], "AtlasLootBurningCrusade", raid = true },
		},

		["GruulsLair"] = {
			["Bosses"] = {
				{ "GruulsLairHighKingMaulgar", 2 },
				{ "GruulGruul",                7 },
			},
			["Info"] = { BabbleZone["Gruul's Lair"], "AtlasLootBurningCrusade", raid = true },
		},

		["HCMagtheridonsLair"] = {
			["Bosses"] = {
				{ "HCMagtheridon", 2 },
			},
			["Info"] = { BabbleZone["Magtheridon's Lair"], "AtlasLootBurningCrusade", raid = true },
		},

		["KarazhanEnt"] = "KarazhanEaI",
		["KarazhanStart"] = "KarazhanEaI",
		["KarazhanEnd"] = "KarazhanEaI",
		["KarazhanEaI"] = {
			["KarazhanEnt"] = {
				{ "KaraCharredBoneFragment", 8, hide = true },
			},
			["KarazhanStart"] = {
				{ "VioletEye",      1,                 hide = true },
				{ "KaraAttumen",    4 },
				{ "KaraMoroes",     6 },
				{ "KaraMaiden",     13 },
				{ "KaraOperaEvent", 14 },
				{ "KaraNightbane",  27 },
				{ "KaraNamed",      { 29, 30, 31, 32 } },
				{ "KaraTrash",      38,                hide = true },
				{ "KaraTrash",      43,                hide = true },
			},
			["KarazhanEnd"] = {
				{ "VioletEye",       1,         hide = true },
				{ "KaraCurator",     10 },
				{ "KaraIllhoof",     11 },
				{ "KaraAran",        13 },
				{ "KaraNetherspite", 14 },
				{ "KaraChess",       { 15, 16 } },
				{ "KaraPrince",      17 },
				{ "KaraTrash",       24 },
			},
			["Info"] = { BabbleZone["Karazhan"], "AtlasLootBurningCrusade", sortOrder = { "KarazhanEnt", "KarazhanStart", "KarazhanEnd" }, raid = true },
		},

		["SunwellPlateau"] = {
			["Bosses"] = {
				{ "SPKalecgos",    2 },
				{ "SPBrutallus",   4 },
				{ "SPFelmyst",     5 },
				{ "SPEredarTwins", 7 },
				{ "SPMuru",        10 },
				{ "SPKiljaeden",   12 },
				{ "SPTrash",       14 },
				{ "SPPatterns",    15 },
			},
			["Info"] = { BabbleZone["Sunwell Plateau"], "AtlasLootBurningCrusade", raid = true },
		},

		["TempestKeepTheEye"] = {
			["Bosses"] = {
				{ "Shatar",          1, hide = true },
				{ "TKEyeAlar",       3 },
				{ "TKEyeVoidReaver", 4 },
				{ "TKEyeSolarian",   5 },
				{ "TKEyeKaelthas",   6 },
				{ "TKEyeTrash",      12 },
			},
			["Info"] = { BabbleZone["The Eye"], "AtlasLootBurningCrusade", raid = true },
		},
		
		["ZulAman"] = {
			["Bosses"] = {
				{ "ZAAkilZon", 		1 },
				{ "ZANalorakk", 	2 },
				{ "ZAJanAlai", 		3 },
				{ "ZAHalazzi", 		4 },
				{ "ZAMalacrass", 	5 },
				{ "ZAZuljin", 		6 },
				{ "ZATimedChest", 	7 },
				{ "ZATrash", 		8 },
			},
			["Info"] = { BabbleZone["Zul'Aman"], "AtlasLootBurningCrusade", mapname = "ZulAman", raid = true },
		},
		
		["WorldBossesBC"] = {
			["Bosses"] = {
				{ "WBDoomLordKazzak", 1 },
				{ "WBDoomwalker", 2, },
			},
			["Info"] = { BabbleZone["World Bosses Outland"], "AtlasLootBurningCrusade", mapname = "WorldBossesBC", raid = true },
		},

		-------------------------
		--- Classic Instances ---
		-------------------------

		["BlackfathomDeeps"] = {
			["Bosses"] = {
				{ "BlackfathomDeepsGhamoora", 1 },
				{ "BlackfathomDeepsLadySarevess", 2 },
				{ "BlackfathomDeepsGelihast", 3 },
				{ "BlackfathomDeepsBaronAquanis", 4 },
				{ "BlackfathomDeepsOldSerrakis", 5 },
				{ "BlackfathomDeepsTwilightLordKelris", 6 },
				{ "BlackfathomDeepsAkumai", 7 },
				{ "BlackfathomDeepsTrash", 8 },
			},
			["Info"] = { "[23] " .. BabbleZone["Blackfathom Deeps"], "AtlasLootClassicWoW", mapname = "BlackFathomDeeps" },
		},

		["BlackrockDepths"] = {
			["Bosses"] = {
				{ "BRDHighInterrogatorGerstahn",  6 },
				{ "BRDLordRoccor",                7 },
				{ "BRDHoundmaster",               8 },
				{ "BRDBaelGar",                   9 },
				{ "BRDLordIncendius",             10 },
				{ "BRDFineousDarkvire",           12 },
				{ "BRDTheVault",                  13 },
				{ "BRDWarderStilgiss",            14 },
				{ "BRDVerek",                     15 },
				{ "BRDPyromantLoregrain",         17 },
				{ "BRDArena",                     { 18, 20, 21, 22, 23, 24, 25 } },
				{ "LunarFestival",                26,                            hide = true },
				{ "BRDGeneralAngerforge",         27 },
				{ "BRDGolemLordArgelmach",        28 },
				{ "BRDBSPlans",                   { 30, 59 },                    hide = true },
				{ "BRDGuzzler",                   { 31, 33, 34, 35 } },
				{ "CorenDirebrew",                32,                            hide = true },
				{ "BRDFlamelash",                 38 },
				{ "BRDTomb",                      39 },
				{ "BRDMagmus",                    40 },
				{ "BRDImperatorDagranThaurissan", 41 },
				{ "BRDPrincess",                  42 },
				{ "BRDPanzor",                    44 },
				{ "BRDQuestItems",                { 69, 70 },                    hide = true },
				{ "BRDTrash",                     72 },
				{ "VWOWSets#1",                   73,                            hide = true },
			},
			["Info"] = { "[55] " .. BabbleZone["Blackrock Depths"], "AtlasLootClassicWoW", mapname = "BlackrockDepths" },
		},

--		["BlackrockMountainEnt"] = {
--			["Bosses"] = {
--				{ "BlackrockMountainEntLoot", { 12, 13, 14 }, hide = true },
--			},
--			["Info"] = { BabbleZone["Blackrock Mountain"], "AtlasLootClassicWoW" },
--		},

		["BlackrockSpireLower"] = {
			["Bosses"] = {
				{ "LBRSOmokk",             4 },
				{ "LBRSVosh",              5 },
				{ "LBRSVoone",             6 },
				{ "LBRSSmolderweb",        7 },
				{ "LBRSDoomhowl",          8 },
				{ "LBRSZigris",            10 },
				{ "LBRSHalycon",           11 },
				{ "LBRSSlavener",          12 },
				{ "LBRSWyrmthalak",        13 },
				{ "LBRSFelguard",          14 },
				{ "LBRSSpirestoneButcher", 15 },
				{ "LBRSGrimaxe",           16 },
				{ "LBRSCrystalFang",       17 },
				{ "LBRSSpirestoneLord",    18 },
				{ "LBRSLordMagus",         19 },
				{ "LBRSBashguud",          20 },
				{ "LunarFestival",         22, hide = true },
				{ "LBRSQuestItems",        23, hide = true },
				{ "LBRSTrash",             25 },
				{ "T0SET",                 26, hide = true },
				{ "VWOWSets#3",            27, hide = true },
			},
			["Info"] = { "[60] " .. BabbleZone["Lower Blackrock Spire"], "AtlasLootClassicWoW", mapname = "BlackrockSpire" },
		},

		["BlackrockSpireUpper"] = {
			["Bosses"] = {
				{ "UBRSEmberseer",   5 },
				{ "UBRSSolakar",     6 },
				{ "UBRSAnvilcrack",  7 },
				{ "UBRSRend",        8 },
				{ "UBRSGyth",        9 },
				{ "UBRSBeast",       10 },
				{ "UBRSDrakkisath",  12 },
				{ "UBRSRunewatcher", 14 },
				{ "UBRSFLAME",       16 },
				{ "UBRSTrash",       18 },
				{ "T0SET",           19, hide = true },
				{ "VWOWSets#3",      20, hide = true },
			},
			["Info"] = { "[60] " .. BabbleZone["Upper Blackrock Spire"], "AtlasLootClassicWoW", mapname = "BlackrockSpire" },
		},

		["BlackwingLair"] = {
			["Bosses"] = {
				{ "BWLRazorgore",   6 },
				{ "BWLVaelastrasz", 7 },
				{ "BWLLashlayer",   8 },
				{ "BWLFiremaw",     9 },
				{ "BWLEbonroc",     10 },
				{ "BWLTrashMobs",   11, hide = true },
				{ "BWLFlamegor",    12 },
				{ "BWLChromaggus",  13 },
				{ "BWLNefarian",    14 },
				{ "BWLTrashMobs",   17 },
				{ "T1T2T3SET",      18, hide = true },
			},
			["Info"] = { "[60] " .. BabbleZone["Blackwing Lair"], "AtlasLootClassicWoW", mapname = "BlackwingLair", raid = true },
		},

		["DireMaulEnt"] = {
			["Bosses"] = {
				{ "LunarFestival", 7, hide = true },
			},
			["Info"] = { BabbleZone["Dire Maul"], "AtlasLootWorldEvents" },
		},

		["DireMaulNorth"] = {
			["Bosses"] = {
				{ "DMNGuardMoldar",      4 },
				{ "DMNStomperKreeg",     5 },
				{ "DMNGuardFengus",      6 },
				{ "DMNGuardSlipkik",     7 },
				{ "DMNThimblejack",      8 },
				{ "DMNCaptainKromcrush", 9 },
				{ "DMNKingGordok",       10 },
				{ "DMNChoRush",          11 },
				{ "DMNTRIBUTERUN",       13 },
				{ "DMBooks",             14 },
			},
			["Info"] = { "[60] " .. BabbleZone["Dire Maul (North)"], "AtlasLootClassicWoW", mapname = "DireMaul" },
		},

		["DireMaulEast"] = {
			["Bosses"] = {
				{ "DMELethtendrisPimgib", { 8, 9 } },
				{ "DMEHydro",             10 },
				{ "DMEZevrimThornhoof",   11 },
				{ "DMEAlzzin",            12 },
				{ "DMEPusillin",          { 13, 14 } },
				{ "DMETrash",             17 },
				{ "DMBooks",              18 },
			},
			["Info"] = { "[60] " .. BabbleZone["Dire Maul (East)"], "AtlasLootClassicWoW", mapname = "DireMaul" },
		},

		["DireMaulWest"] = {
			["Bosses"] = {
				{ "OldKeys",              1,  hide = true },
				{ "DMWTendrisWarpwood",   4 },
				{ "DMWMagisterKalendris", 5 },
				{ "DMWIllyannaRavenoak",  6 },
				{ "DMWImmolthar",         8 },
				{ "DMWHelnurath",         9 },
				{ "DMWPrinceTortheldrin", 10 },
				{ "DMWTsuzee",            11 },
				{ "DMWTrash",             23, hide = true },
				{ "DMWTrash",             25 },
				{ "DMBooks",              26 },
			},
			["Info"] = { "[60] " .. BabbleZone["Dire Maul (West)"], "AtlasLootClassicWoW", mapname = "DireMaul" },
		},

		["Maraudon"] = {
			["Bosses"] = {
				{ "MaraudonLoot#1", { 4, 5, 6, 7, 12 } },
				{ "MaraudonLoot#2", { 8, 9, 10, 11 },  hide = true },
				{ "LunarFestival",  13,                hide = true },
			},
			["Info"] = { "[47] " .. BabbleZone["Maraudon"], "AtlasLootClassicWoW", mapname = "Maraudon" },
		},

		["Uldaman"] = {
			["Bosses"] = {
				{ "UldamanLostVikings", 1},
				{ "UldamanRevelosh", 2},
				{ "UldamanIronaya", 3},
				{ "UldamanObsidianSentinel", 4},
				{ "UldamanAncientStoneKeeper", 5},
				{ "UldamanGalgannFirehammer", 6},
				{ "UldamanGrimlok", 7},
				{ "UldamanArchaedas", 8},
				{ "UldamanTrash", 9},
			},
			["Info"] = { "[39] " .. BabbleZone["Uldaman"], "AtlasLootClassicWoW", mapname = "Uldaman" },
		},

		["StratholmeCrusader"] = {
			["Bosses"] = {
				{ "STRATTheUnforgiven",         5 },
				{ "STRATTimmytheCruel",         6 },
				{ "STRATWilleyHopebreaker",     8 },
				{ "STRATInstructorGalford",     9 },
				{ "STRATBalnazzar",             10 },
				{ "STRATSkull",                 12 },
				{ "STRATFrasSiabi",             13 },
				{ "STRATHearthsingerForresten", 14 },
				{ "STRATRisenHammersmith",      { 15, 16 } },
				{ "LunarFestival",              19,                 hide = true },
				{ "STRATTrash",                 23 },
				{ "VWOWSets#2",                 { 17, 18, 20, 21 }, hide = true },
			},
			["Info"] = { "[60] " .. BabbleZone["Stratholme"] .. " - " .. AL["Crusader's Square"], "AtlasLootClassicWoW", mapname = "Stratholme" },
		},

		["StratholmeGauntlet"] = {
			["Bosses"] = {
				{ "STRATBaronessAnastari",     3 },
				{ "STRATNerubenkan",           4 },
				{ "STRATMalekithePallid",      5 },
				{ "STRATMagistrateBarthilas",  6 },
				{ "STRATRamsteintheGorger",    7 },
				{ "STRATLordAuriusRivendare",  8 },
				{ "STRATBlackGuardSwordsmith", { 9, 10 } },
				{ "STRATStonespine", },
				{ "STRATTrash",                17 },
				{ "VWOWSets#2",                11,       hide = true },
			},
			["Info"] = { "[60] " .. BabbleZone["Stratholme"] .. " - " .. AL["The Gauntlet"], "AtlasLootClassicWoW", mapname = "Stratholme" },
		},

		["RazorfenDowns"] = {
			["Bosses"] = {
				{"RazorfenDownsTutenkash", 1},
				{"RazorfenDownsMordreshFireEye", 2},
				{"RazorfenDownsPlaguemawTheRotting", 3},
				{"RazorfenDownsGlutton", 4},
				{"RazorfenDownsAmnennarTheColdbringer", 5},
				{"RazorfenDownsRagglesnout", 6},
				{"RazorfenDownsTrash", 7},
			},
			["Info"] = { "[36] " .. BabbleZone["Razorfen Downs"], "AtlasLootClassicWoW", mapname = "RazorfenDowns" },
		},

		["RazorfenKraul"] = {
			["Bosses"] = {
				{ "RazorfenKraulRoogug", 1},
				{ "RazorfenKraulAggemThorncurse", 2},
				{ "RazorfenKraulDeathSpeakerJargba", 3},
				{ "RazorfenKraulOverlordRamtusk", 4},
				{ "RazorfenKraulAgathelosTheRaging", 5},
				{ "RazorfenKraulCharlgaRazorflank", 6},
				{ "RazorfenKraulRazorfenSpearhide", 7},
				{ "RazorfenKraulBlindHunter", 8},
				{ "RazorfenKraulEarthcallerHalmgar", 9},
				{ "RazorfenKraulTrash", 10},
			},
			["Info"] = { "[26] " .. BabbleZone["Razorfen Kraul"], "AtlasLootClassicWoW", mapname = "RazorfenKraul" },
		},

		["TheSunkenTemple"] = {
			["Bosses"] = {
				{ "STAvatarofHakkar",  3 },
				{ "STJammalanandOgom", { 4, 5 } },
				{ "STDragons",         { 6, 7, 8, 9 } },
				{ "STEranikus",        10 },
				{ "LunarFestival",     12,            hide = true },
				{ "STTrash",           14 },
			},
			["Info"] = { "[49] " .. BabbleZone["Sunken Temple"], "AtlasLootClassicWoW", mapname = "TempleOfAtalHakkar" },
		},

		["RagefireChasm"] = {
			["Bosses"] = {
				{ "RagefireChasmTaragamanTheHungerer", 1},
				{ "RagefireChasmJergoshTheInvoker",    2},
				{ "RagefireChasmZelemarTheWrathful",   3},
			},
			["Info"] = { "[15] " .. BabbleZone["Ragefire Chasm"], "AtlasLootClassicWoW", mapname = "Ragefire"},
		},

		["MoltenCore"] = {
			["Bosses"] = {
				{ "BloodsailHydraxian", 2,  hide = true },
				{ "MCLucifron",         4 },
				{ "MCMagmadar",         5 },
				{ "MCGehennas",         6 },
				{ "MCGarr",             7 },
				{ "MCShazzrah",         8 },
				{ "MCGeddon",           9 },
				{ "MCGolemagg",         10 },
				{ "MCSulfuron",         11 },
				{ "MCMajordomo",        12 },
				{ "MCRagnaros",         13 },
				{ "T1T2T3SET",          15, hide = true },
				{ "MCRANDOMBOSSDROPPS", 16 },
				{ "MCTrashMobs",        17 },
			},
			["Info"] = { "[60] " .. BabbleZone["Molten Core"], "AtlasLootClassicWoW", mapname = "MoltenCore", raid = true },
		},

		["TheTempleofAhnQiraj"] = {
			["Bosses"] = {
				{ "AQBroodRings", 1,             hide = true },
				{ "AQ40Skeram",   4 },
				{ "AQ40BugFam",   { 5, 6, 7, 8 } },
				{ "AQ40Sartura",  9 },
				{ "AQ40Fankriss", 10 },
				{ "AQ40Viscidus", 11 },
				{ "AQ40Huhuran",  12 },
				{ "AQ40Emperors", { 13, 14, 15 } },
				{ "AQ40Ouro",     17 },
				{ "AQ40CThun",    { 18, 19 } },
				{ "AQ40Trash",    28 },
				{ "AQ40Sets",     29,            hide = true },
				{ "AQEnchants",   30 },
			},
			["Info"] = { "[60] " .. BabbleZone["Temple of Ahn'Qiraj"], "AtlasLootClassicWoW", mapname = "TempleofAhnQiraj", raid = true },
		},

		["ShadowfangKeep"] = {
			["Bosses"] = {
				{ "ShadowfangKeepRethilgore", 1},
				{ "ShadowfangKeepRazorclawTheButcher",   2},
				{ "ShadowfangKeepBaronSilverlaine",   3},
				{ "ShadowfangKeepCommanderSpringvale",   4},
				{ "ShadowfangKeepOdoTheBlindwatcher",   5},
				{ "ShadowfangKeepFenrusTheDevourer",   6},
				{ "ShadowfangKeepWolfMasterNandos",   7},
				{ "ShadowfangKeepArchmageArugal",   8},
				{ "ShadowfangKeepDeathswornCaptain",   9},
				{ "ShadowfangKeepTrash",   10},
			},
			["Info"] = { "[20] " .. BabbleZone["Shadowfang Keep"], { "AtlasLootClassicWoW" }, mapname = "ShadowfangKeep"},
		},

		["Gnomeregan"] = {
			["Bosses"] = {
				{ "GnomereganGrubbis", 1},
				{ "GnomereganViscousFallout", 2},
				{ "GnomereganElectrocutioner6000", 3},
				{ "GnomereganCrowdPummeler960", 4},
				{ "GnomereganMekgineerThermaplugg", 5},
				{ "GnomereganDarkIronAmbassador", 6},
				{ "GnomereganTrash", 7},
			},
			["Info"] = { "[27] " .. BabbleZone["Gnomeregan"], "AtlasLootClassicWoW", mapname = "Gnomeregan" },
		},

		["SMArmory"] = {
			["Bosses"] = {
				{ "SMArmoryHerod", 1},
				{ "SMTrash", 2},
			},
			["Info"] = { "[39] " .. BabbleZone["Scarlet Monastery"] .. ": " .. BabbleZone["Armory"], "AtlasLootClassicWoW", mapname = "ScarletMonastery" },
		},

		["SMCathedral"] = {
			["Bosses"] = {
				{ "SMCathedralHighInquisitorFairbanks", 1},
				{ "SMCathedralScarletCommanderMograine", 2},
				{ "SMCathedralHighInquisitorWhitemane", 3},
				{ "SMTrash", 4},
			},
			["Info"] = { "[39] " .. BabbleZone["Scarlet Monastery"] .. ": " .. BabbleZone["Cathedral"], "AtlasLootClassicWoW", mapname = "ScarletMonastery" },
		},

		["SMLibrary"] = {
			["Bosses"] = {
				{ "SMLibraryHoundmasterLoksey", 1},
				{ "SMLibraryArcanistDoan", 2},
				{ "SMTrash", 3},
			},
			["Info"] = { "[39] " .. BabbleZone["Scarlet Monastery"] .. ": " .. BabbleZone["Library"], "AtlasLootClassicWoW", mapname = "ScarletMonastery" },
		},

		["SMGraveyard"] = {
			["Bosses"] = {
				{ "SMGraveyardInterrogatorVishas", 1},
				{ "SMGraveyardBloodmageThalnos", 2},
				{ "SMGraveyardAzshirTheSleepless", 3},
				{ "SMGraveyardFallenChampion", 4},
				{ "SMGraveyardIronspine", 5},
				{ "SMTrash", 6 },
			},
			["Info"] = { "[39] " .. BabbleZone["Scarlet Monastery"] .. ": " .. BabbleZone["Graveyard"], "AtlasLootClassicWoW", mapname = "ScarletMonastery" },
		},

		["Scholomance"] = {
			["Bosses"] = {
				{ "OldKeys",                      { 1, 2 },           hide = true },
				{ "SCHOLOKirtonostheHerald",      9 },
				{ "SCHOLOJandiceBarov",           10 },
				{ "SCHOLORattlegore",             11 },
				{ "SCHOLODeathKnight",            12 },
				{ "SCHOLORasFrostwhisper",        13 },
				{ "SCHOLOLorekeeperPolkelt",      14 },
				{ "SCHOLODoctorTheolenKrastinov", 15 },
				{ "SCHOLOInstructorMalicia",      16 },
				{ "SCHOLOLadyIlluciaBarov",       17 },
				{ "SCHOLOLordAlexeiBarov",        18 },
				{ "SCHOLOQuestItems",             { 19, 25, 27, 28 }, hide = true },
				{ "SCHOLOTheRavenian",            20 },
				{ "SCHOLODarkmasterGandling",     21 },
				{ "SCHOLOMardukVectus",           { 22, 23 } },
				{ "SCHOLOBloodStewardofKirtonos", 24 },
				{ "SCHOLOTrash",                  30 },
				{ "VWOWScholo",                   31,                 hide = true },
			},
			["Info"] = { "[60] " .. BabbleZone["Scholomance"], "AtlasLootClassicWoW", mapname = "Scholomance" },
		},

		["TheDeadminesEnt"] = "TheDeadminesEaI",
		["TheDeadmines"] = "TheDeadminesEaI",
		["TheDeadminesEaI"] = {
			["TheDeadminesEnt"] = {
				{ "DeadminesTrash", { 4, 5 }, hide = true },
			},
			["TheDeadmines"] = {
				{ "DeadminesRhahkZor",     3 },
				{ "DeadminesSneedsShredder", 5 },
				{ "DeadminesSneed",   6 },
				{ "DeadminesGilnid",    7 },
				{ "DeadminesMrSmite",      8 },
				{ "DeadminesCookie",    9 },
				{ "DeadminesCaptainGreenskin",    10 },
				{ "DeadminesVanCleef",    11 },
				{ "DeadminesMinerJohnson",    12 },
				{ "DeadminesTrash",       18 },
			},
			["Info"] = { "[19] " .. BabbleZone["The Deadmines"], { "AtlasLootClassicWoW" }, sortOrder = { "TheDeadminesEnt", "TheDeadmines" }, mapname = "TheDeadmines"},
		},

		["WailingCavernsEnt"] = "WailingCavernsEaI",
		["WailingCaverns"] = "WailingCavernsEaI",
		["WailingCavernsEaI"] = {
			["WailingCavernsEnt"] = {
				{ "WailingCavernsTrash", 3, hide = true },
			},
			["WailingCaverns"] = {
				{ "WailingCavernsKresh",     1 },
				{ "WailingCavernsLadyAnacondra", 2 },
				{ "WailingCavernsLordCobrahn",   3 },
				{ "WailingCavernsLordPythas",    4 },
				{ "WailingCavernsSkum",      5 },
				{ "WailingCavernsLordSerpentis",    6 },
				{ "WailingCavernsVerdanTheEverliving",    7 },
				{ "WailingCavernsMutanusTheDevourer",    8 },
				{ "WailingCavernsDeviateFaerieDragon",    9 },
				{ "WailingCavernsTrash",       10 },
			},
			["Info"] = { "[19] " .. BabbleZone["Wailing Caverns"], "AtlasLootClassicWoW", sortOrder = { "WailingCavernsEnt", "WailingCaverns" }, mapname = "WailingCaverns" },
		},

		["TheStockade"] = {
			["Bosses"] = {
				{ "TheStockadeTargorrTheDread", 1},
				{ "TheStockadeDextrenWard", 2},
				{ "TheStockadeKamDeepfury", 3},
				{ "TheStockadeBazilThredd", 4},
				{ "TheStockadeBruegalIronknuckle", 5},
				{ "TheStockadeTrash", 6},
			},
			["Info"] = { "[24] " .. BabbleZone["The Stockade"], "AtlasLootClassicWoW", mapname = "TheStockade" },
		},

		["TheRuinsofAhnQiraj"] = {
			["Bosses"] = {
				{ "CenarionCircle", 1,                             hide = true },
				{ "AQ20Kurinnaxx",  3 },
				{ "AQ20Rajaxx",     { 6, 7, 8, 9, 10, 11, 12, 13 } },
				{ "AQ20Moam",       14 },
				{ "AQ20Buru",       15 },
				{ "AQ20Ayamiss",    16 },
				{ "AQ20Ossirian",   17 },
				{ "AQ20Trash",      20 },
				{ "AQ20Sets",       21,                            hide = true },
				{ "AQEnchants",     22 },
			},
			["Info"] = { "[60] " .. BabbleZone["Ruins of Ahn'Qiraj"], "AtlasLootClassicWoW", mapname = "RuinsofAhnQiraj", raid = true },
		},

		["ZulFarrak"] = {
			["Bosses"] = {
				{ "ZFGahzrilla",           5 },
				{ "ZFSezzziz",             12 },
				{ "ZFChiefUkorzSandscalp", 14 },
				{ "ZFWitchDoctorZumrah",   16 },
				{ "ZFAntusul",             17 },
				{ "ZFHydromancerVelratha", 19 },
				{ "ZFDustwraith",          21 },
				{ "ZFZerillis",            22 },
				{ "LunarFestival",         23, hide = true },
				{ "ZFTrash",               25 },
			},
			["Info"] = { "[44] " .. BabbleZone["Zul'Farrak"], "AtlasLootClassicWoW", mapname = "ZulFarrak" },
		},
		
		["ZulGurub"] = {
			["Bosses"] = {
				{ "ZGJeklik", 				1 },
				{ "ZGVenoxis", 				2 },
				{ "ZGMarli",				3 },
				{ "ZGMandokir",				4 },
				{ "ZGEdgeofMadness",		5 },
				{ "ZGGahzranka",			6 },
				{ "ZGThekal",				7 },
				{ "ZGArlokk",				8 },
				{ "ZGJindo",				9 },
				{ "ZGHakkar",				10 },
				{ "ZGShared",				11 },
				{ "ZGTrash",				12 },
				{ "ZGEnchants",				13 },
			},
			["Info"] = { "[60] " .. BabbleZone["Zul'Gurub"], "AtlasLootClassicWoW", mapname = "ZulGurub", raid = true },
		},
		
		["WorldBossesCLA"] = {
			["Bosses"] = {
				{ "WBAzuregos", 1 },
				{ "WBEmeriss", 3, },
				{ "WBLethon", 4, },
				{ "WBTaerar", 5, },
				{ "WBYsondre", 6, },
			},
			["Info"] = { BabbleZone["World Bosses Azeroth"], "AtlasLootClassicWoW", raid = true },
		},

		--------------------
		--- Mythic BC Instances ---
		--------------------

		---- Dungeons

		["MythicAuchAuchenaiCrypts"] = {
			["Bosses"] = {
				{ "MythicAuchCryptsShirrak", 3 },
				{ "MythicAuchCryptsExarch",  4 },
				{ "MythicAuchCryptsAvatar",  5 },
			},
			["Info"] = { BabbleZone["Auchenai Crypts"].."+", "AtlasLootMythic" },
		},

		["MythicAuchManaTombs"] = {
			["Bosses"] = {
				{ "MythicAuchManaPandemonius", 4 },
				{ "MythicAuchManaTavarok",     6 },
				{ "MythicAuchManaNexusPrince", 7 },
				{ "MythicAuchManaYor",         8 },
			},
			["Info"] = { BabbleZone["Mana-Tombs"].."+", "AtlasLootMythic", mapname = "ManaTombs1" },
		},

		["MythicAuchSethekkHalls"] = {
			["Bosses"] = {
				{ "MythicAuchSethekkDarkweaver", 3 },
				{ "MythicAuchSethekkRavenGod",   5 },
				{ "MythicAuchSethekkTalonKing",  7 },
			},
			["Info"] = { BabbleZone["Sethekk Halls"].."+", "AtlasLootMythic" },
		},

		["MythicAuchShadowLabyrinth"] = {
			["Bosses"] = {
				{ "MythicAuchShadowHellmaw",     3 },
				{ "MythicAuchShadowBlackheart",  4 },
				{ "MythicAuchShadowGrandmaster", 5 },
				{ "MythicAuchShadowMurmur",      7 },
			},
			["Info"] = { BabbleZone["Shadow Labyrinth"].."+", "AtlasLootMythic", mapname = "ShadowLabyrinth1" },
		},

		["MythicCoTOldHillsbrad"] = {
			["Bosses"] = {
				{ "MythicCoTHillsbradDrake",   10 },
				{ "MythicCoTHillsbradSkarloc", 12 },
				{ "MythicCoTHillsbradHunter",  15 },
			},
			["Info"] = { BabbleZone["Old Hillsbrad Foothills"].."+", "AtlasLootMythic" },
		},

		["MythicCoTBlackMorass"] = {
			["Bosses"] = {
				{ "MythicCoTMorassDeja",     7 },
				{ "MythicCoTMorassTemporus", 8 },
				{ "MythicCoTMorassAeonus",   9 },
			},
			["Info"] = { BabbleZone["The Black Morass"].."+", "AtlasLootMythic" },
		},

		["MythicCFRTheSlavePens"] = {
			["Bosses"] = {
				{ "MythicCFRSlaveMennu",      3 },
				{ "MythicCFRSlaveRokmar",     4 },
				{ "MythicCFRSlaveQuagmirran", 5 },
			},
			["Info"] = { BabbleZone["The Slave Pens"].."+", "AtlasLootMythic" },
		},

		["MythicCFRTheSteamvault"] = {
			["Bosses"] = {
				{ "MythicCFRSteamThespia",     3 },
				{ "MythicCFRSteamSteamrigger", 5 },
				{ "MythicCFRSteamWarlord",     7 },
			},
			["Info"] = { BabbleZone["The Steamvault"].."+", "AtlasLootMythic" },
		},

		["MythicCFRTheUnderbog"] = {
			["Bosses"] = {
				{ "MythicCFRUnderHungarfen", 3 },
				{ "MythicCFRUnderGhazan",    5 },
				{ "MythicCFRUnderSwamplord", 6 },
				{ "MythicCFRUnderStalker",   8 },
			},
			["Info"] = { BabbleZone["The Underbog"].."+", "AtlasLootMythic" },
		},

		["MythicHCHellfireRamparts"] = {
			["Bosses"] = {
				{ "MythicHCRampWatchkeeper", 4 },
				{ "MythicHCRampOmor",        5 },
				{ "MythicHCRampVazruden",    { 6, 8 } },
			},
			["Info"] = { BabbleZone["Hellfire Ramparts"].."+", "AtlasLootMythic" },
		},

		["MythicHCBloodFurnace"] = {
			["Bosses"] = {
				{ "MythicHCFurnaceMaker",   4 },
				{ "MythicHCFurnaceBroggok", 5 },
				{ "MythicHCFurnaceBreaker", 6 },
			},
			["Info"] = { BabbleZone["The Blood Furnace"].."+", "AtlasLootMythic" },
		},

		["MythicHCTheShatteredHalls"] = {
			["Bosses"] = {
				{ "MythicHCHallsNethekurse", 4 },
				{ "MythicHCHallsPorung",     5 },
				{ "MythicHCHallsOmrogg",     6 },
				{ "MythicHCHallsKargath",    7 },
			},
			["Info"] = { BabbleZone["The Shattered Halls"].."+", "AtlasLootMythic" },
		},

		["MythicMagistersTerrace"] = {
			["Bosses"] = {
				{ "MythicSMTFireheart", 4 },
				{ "MythicSMTVexallus",  6 },
				{ "MythicSMTDelrissa",  7 },
				{ "MythicSMTKaelthas",  18 },
			},
			["Info"] = { BabbleZone["Magisters' Terrace"].."+", "AtlasLootMythic" },
		},

		["MythicTempestKeepArcatraz"] = {
			["Bosses"] = {
				{ "MythicTKArcUnbound",   3 },
				{ "MythicTKArcDalliah",   4 },
				{ "MythicTKArcScryer",    5 },
				{ "MythicTKArcHarbinger", 6 },
			},
			["Info"] = { BabbleZone["The Arcatraz"].."+", "AtlasLootMythic" },
		},

		["MythicTempestKeepBotanica"] = {
			["Bosses"] = {
				{ "MythicTKBotSarannis",  4 },
				{ "MythicTKBotFreywinn",  5 },
				{ "MythicTKBotThorngrin", 6 },
				{ "MythicTKBotLaj",       7 },
				{ "MythicTKBotSplinter",  8 },
			},
			["Info"] = { BabbleZone["The Botanica"].."+", "AtlasLootMythic" },
		},

		["MythicTempestKeepMechanar"] = {
			["Bosses"] = {
				{ "MythicTKMechCapacitus",        6 },
				{ "MythicTKMechSepethrea",        8 },
				{ "MythicTKMechCalc",             9 },
				{ "MythicTKMechCacheoftheLegion", 10 },
			},
			["Info"] = { BabbleZone["The Mechanar"].."+", "AtlasLootMythic" },
		},

		---- Raids

		["MythicBlackTempleStart"] = "MythicBlackTemple",
		["MythicBlackTempleBasement"] = "MythicBlackTemple",
		["MythicBlackTempleTop"] = "MythicBlackTemple",
		["MythicBlackTemple"] = {
			["MythicBlackTempleStart"] = {
				{ "MythicBTNajentus", 6 },
				{ "MythicBTSupremus", 7 },
				{ "MythicBTAkama",    8 },
			},
			["MythicBlackTempleBasement"] = {
				{ "MythicBTBloodboil",        4 },
				{ "MythicBTReliquaryofSouls", 5 },
				{ "MythicBTGorefiend",        9 },
			},
			["MythicBlackTempleTop"] = {
				{ "MythicBTShahraz",          4 },
				{ "MythicBTCouncil",          5 },
				{ "MythicBTIllidanStormrage", 10 },
			},
			["Info"] = { BabbleZone["Black Temple"].."+", "AtlasLootMythic", sortOrder = { "MythicBlackTempleStart", "MythicBlackTempleBasement", "MythicBlackTempleTop" }, raid = true },
		},

		["MythicCoTHyjalEnt"] = "MythicCoTHyjalEaI",
		["MythicCoTHyjal"] = "MythicCoTHyjalEaI",
		["MythicCoTHyjalEaI"] = {
			["CoTHyjalEnt"] = {
				{ "ScaleSands", 2, hide = true },
			},
			["CoTHyjal"] = {
				{ "MythicMountHyjalWinterchill", 9 },
				{ "MythicMountHyjalAnetheron",   10 },
				{ "MythicMountHyjalKazrogal",    11 },
				{ "MythicMountHyjalAzgalor",     12 },
				{ "MythicMountHyjalArchimonde",  13 },
			},
			["Info"] = { BabbleZone["Hyjal"].."+", "AtlasLootMythic", sortOrder = { "MythicCoTHyjalEnt", "MythicCoTHyjal" }, raid = true },
		},

		["MythicCFRSerpentshrineCavern"] = {
			["Bosses"] = {
				{ "MythicCFRSerpentHydross",    3 },
				{ "MythicCFRSerpentLurker",     4 },
				{ "MythicCFRSerpentLeotheras",  5 },
				{ "MythicCFRSerpentKarathress", 6 },
				{ "MythicCFRSerpentMorogrim",   8 },
				{ "MythicCFRSerpentVashj",      9 },
			},
			["Info"] = { BabbleZone["Serpentshrine Cavern"].."+", "AtlasLootMythic", raid = true },
		},

		["MythicGruulsLair"] = {
			["Bosses"] = {
				{ "MythicGruulsLairHighKingMaulgar", 2 },
				{ "MythicGruulGruul",                7 },
			},
			["Info"] = { BabbleZone["Gruul's Lair"].."+", "AtlasLootMythic", raid = true },
		},

		["MythicMagtheridonsLair"] = {
			["Bosses"] = {
				{ "MythicMagtheridon", 2 },
			},
			["Info"] = { BabbleZone["Magtheridon's Lair"].."+", "AtlasLootMythic", raid = true },
		},

		["MythicKarazhanEnt"] = "MythicKarazhanEaI",
		["MythicKarazhanStart"] = "MythicKarazhanEaI",
		["MythicKarazhanEnd"] = "MythicKarazhanEaI",
		["MythicKarazhanEaI"] = {
			["MythicKarazhanEnt"] = {
				{ "KaraCharredBoneFragment", 8, hide = true },
			},
			["MythicKarazhanStart"] = {
				{ "MythicKaraAttumen",    4 },
				{ "MythicKaraMoroes",     6 },
				{ "MythicKaraMaiden",     13 },
				{ "MythicKaraOperaEvent", 14 },
				{ "MythicKaraNightbane",  27 },
				{ "MythicKaraNamed",      { 29, 30, 31, 32 } },
			},
			["MythicKarazhanEnd"] = {
				{ "MythicKaraCurator",     10 },
				{ "MythicKaraIllhoof",     11 },
				{ "MythicKaraAran",        13 },
				{ "MythicKaraNetherspite", 14 },
				{ "MythicKaraChess",       { 15, 16 } },
				{ "MythicKaraPrince",      17 },
			},
			["Info"] = { BabbleZone["Karazhan"].."+", "AtlasLootMythic", sortOrder = { "MythicKarazhanEnt", "MythicKarazhanStart", "MythicKarazhanEnd" }, raid = true },
		},

		["MythicSunwellPlateau"] = {
			["Bosses"] = {
				{ "MythicSPKalecgos",    2 },
				{ "MythicSPBrutallus",   4 },
				{ "MythicSPFelmyst",     5 },
				{ "MythicSPEredarTwins", 7 },
				{ "MythicSPMuru",        10 },
				{ "MythicSPKiljaeden",   12 },
			},
			["Info"] = { BabbleZone["Sunwell Plateau"].."+", "AtlasLootMythic", raid = true },
		},

		["MythicTempestKeepTheEye"] = {
			["Bosses"] = {
				{ "MythicTKEyeAlar",       3 },
				{ "MythicTKEyeVoidReaver", 4 },
				{ "MythicTKEyeSolarian",   5 },
				{ "MythicTKEyeKaelthas",   6 },
				{ "MythicTKEyeTrash",      12 },
			},
			["Info"] = { BabbleZone["The Eye"].."+", "AtlasLootMythic", raid = true },
		},
	},
	
	---------------------
	--- Battlegrounds ---
	---------------------

	["Battlegrounds"] = {

		["AlteracValleyNorth"] = {
			["Bosses"] = {
				{ "MiscFactions", 1 },
				{ "AVMisc",       48 },
				{ "AVBlue",       49 },
			},
			["Info"] = { BabbleZone["Alterac Valley"], "AtlasLootClassicWoW" },
		},

		["AlteracValleySouth"] = {
			["Bosses"] = {
				{ "MiscFactions", 1 },
				{ "AVMisc",       31 },
				{ "AVBlue",       32 },
			},
			["Info"] = { BabbleZone["Alterac Valley"], "AtlasLootClassicWoW" },
		},

		["ArathiBasin"] = {
			["Bosses"] = {
				{ "MiscFactions", { 1, 2 } },
				{ "AB2039",       11 },
				{ "AB4049",       12 },
				{ "ABSets",       13 },
				{ "ABMisc",       14 },
			},
			["Info"] = { BabbleZone["Arathi Basin"], "AtlasLootClassicWoW" },
		},

		["HalaaPvP"] = {
			["Bosses"] = {
				{ "Nagrand", 1 },
			},
			["Info"] = { BabbleZone["Nagrand"] .. ": " .. AL["Halaa"], "AtlasLootBurningCrusade" },
		},

		["HellfirePeninsulaPvP"] = {
			["Bosses"] = {
				{ "Hellfire", 1 },
			},
			["Info"] = { BabbleZone["Hellfire Peninsula"] .. ": " .. AL["Hellfire Fortifications"], "AtlasLootBurningCrusade" },
		},

		["TerokkarForestPvP"] = {
			["Bosses"] = {
				{ "Terokkar", 1 },
			},
			["Info"] = { BabbleZone["Terokkar Forest"] .. ": " .. AL["Spirit Towers"], "AtlasLootBurningCrusade" },
		},

		["ZangarmarshPvP"] = {
			["Bosses"] = {
				{ "Zangarmarsh", 1 },
			},
			["Info"] = { BabbleZone["Zangarmarsh"] .. ": " .. AL["Twin Spire Ruins"], "AtlasLootBurningCrusade" },
		},

		["WintergraspPvP"] = {
			["Bosses"] = {
				{ "LakeWintergrasp", 1 },
			},
			["Info"] = { BabbleZone["Wintergrasp"], "AtlasLootWotLK" },
		},
	},

	--------------------
	--- World Bosses ---
	--------------------

	["WorldBosses"] = {

		["DoomLordKazzak"] = {
			["Bosses"] = {
				{ "WorldBossesBC", 1 },
				{ "Thrallmar",     5, hide = true },
			},
			["Info"] = { BabbleBoss["Doom Lord Kazzak"], "AtlasLootBurningCrusade" },
		},

		["Doomwalker"] = {
			["Bosses"] = {
				{ "WorldBossesBC", 1 },
			},
			["Info"] = { BabbleBoss["Doomwalker"], "AtlasLootBurningCrusade" },
		},

		["Skettis"] = {
			["Bosses"] = {
				{ "Terokk",               9 },
				{ "DarkscreecherAkkarai", 18 },
				{ "GezzaraktheHuntress",  19 },
				{ "Karrog",               20 },
				{ "VakkiztheWindrager",   21 },
			},
			["Info"] = { AL["Skettis"], "AtlasLootWorldEvents" },
		},
	},
	
	["WorldBossesCLA"] = {
			["Bosses"] = {
				{ "Azuregos", 1 },
			},
			["Info"] = { BabbleBoss["Azuregos"], "AtlasLootClassicWoW" },
		},
		
	
	

	--------------------
	--- World Events ---
	--------------------

	["WorldEvents"] = {

		["MidsummerFestival"] = {
			["Bosses"] = {
				{ "MidsummerFestival" },
				{ "LordAhune" },
			},
			["Info"] = { AL["Midsummer Fire Festival"], "AtlasLootWorldEvents" },
		},
	},

	----------------
	--- Crafting ---
	----------------

	["Crafting"] = {

		["Leatherworking"] = {
			["Bosses"] = {
				{ "Dragonscale" },
				{ "Elemental" },
				{ "Tribal" },
			},
			["Info"] = { LEATHERWORKING, "AtlasLootCrafting" },
		},

		["Tailoring"] = {
			["Bosses"] = {
				{ "Mooncloth" },
				{ "Shadoweave" },
				{ "Spellfire" },
			},
			["Info"] = { TAILORING, "AtlasLootCrafting" },
		},

		["BlacksmithingMail"] = {
			["Bosses"] = {
				{ "BlacksmithingMailBloodsoulEmbrace" },
				{ "BlacksmithingMailFelIronChain" },
			},
			["Info"] = { BLACKSMITHING .. ": " .. BabbleInventory["Mail"], "AtlasLootCrafting" },
		},

		["BlacksmithingPlate"] = {
			["Bosses"] = {
				{ "BlacksmithingPlateImperialPlate" },
				{ "BlacksmithingPlateTheDarksoul" },
				{ "BlacksmithingPlateFelIronPlate" },
				{ "BlacksmithingPlateAdamantiteB" },
				{ "BlacksmithingPlateFlameG" },
				{ "BlacksmithingPlateEnchantedAdaman" },
				{ "BlacksmithingPlateKhoriumWard" },
				{ "BlacksmithingPlateFaithFelsteel" },
				{ "BlacksmithingPlateBurningRage" },
				{ "BlacksmithingPlateOrnateSaroniteBattlegear" },
				{ "BlacksmithingPlateSavageSaroniteBattlegear" },
			},
			["Info"] = { BLACKSMITHING .. ": " .. BabbleInventory["Plate"], "AtlasLootCrafting" },
		},

		["LeatherworkingLeather"] = {
			["Bosses"] = {
				{ "LeatherworkingLeatherVolcanicArmor" },
				{ "LeatherworkingLeatherIronfeatherArmor" },
				{ "LeatherworkingLeatherStormshroudArmor" },
				{ "LeatherworkingLeatherDevilsaurArmor" },
				{ "LeatherworkingLeatherBloodTigerH" },
				{ "LeatherworkingLeatherPrimalBatskin" },
				{ "LeatherworkingLeatherWildDraenishA" },
				{ "LeatherworkingLeatherThickDraenicA" },
				{ "LeatherworkingLeatherFelSkin" },
				{ "LeatherworkingLeatherSClefthoof" },
				{ "LeatherworkingLeatherPrimalIntent" },
				{ "LeatherworkingLeatherWindhawkArmor" },
				{ "LeatherworkingLeatherBoreanEmbrace" },
				{ "LeatherworkingLeatherIceborneEmbrace" },
				{ "LeatherworkingLeatherEvisceratorBattlegear" },
				{ "LeatherworkingLeatherOvercasterBattlegear" },
			},
			["Info"] = { LEATHERWORKING .. ": " .. BabbleInventory["Leather"], "AtlasLootCrafting" },
		},

		["LeatherworkingMail"] = {
			["Bosses"] = {
				{ "LeatherworkingMailGreenDragonM" },
				{ "LeatherworkingMailBlueDragonM" },
				{ "LeatherworkingMailBlackDragonM" },
				{ "LeatherworkingMailScaledDraenicA" },
				{ "LeatherworkingMailFelscaleArmor" },
				{ "LeatherworkingMailFelstalkerArmor" },
				{ "LeatherworkingMailNetherFury" },
				{ "LeatherworkingMailNetherscaleArmor" },
				{ "LeatherworkingMailNetherstrikeArmor" },
				{ "LeatherworkingMailFrostscaleBinding" },
				{ "LeatherworkingMailNerubianHive" },
				{ "LeatherworkingMailStormhideBattlegear" },
				{ "LeatherworkingMailSwiftarrowBattlefear" },
			},
			["Info"] = { LEATHERWORKING .. ": " .. BabbleInventory["Mail"], "AtlasLootCrafting" },
		},

		["TailoringSets"] = {
			["Bosses"] = {
				{ "TailoringBloodvineG" },
				{ "TailoringNeatherVest" },
				{ "TailoringImbuedNeather" },
				{ "TailoringArcanoVest" },
				{ "TailoringTheUnyielding" },
				{ "TailoringWhitemendWis" },
				{ "TailoringSpellstrikeInfu" },
				{ "TailoringBattlecastG" },
				{ "TailoringSoulclothEm" },
				{ "TailoringPrimalMoon" },
				{ "TailoringShadowEmbrace" },
				{ "TailoringSpellfireWrath" },
				{ "TailoringFrostwovenPower" },
				{ "TailoringDuskweaver" },
				{ "TailoringFrostsavageBattlegear" },
			},
			["Info"] = { TAILORING .. ": " .. BabbleInventory["Cloth"], "AtlasLootCrafting" },
		},
	},

	["Misc"] = {
		["Pets"] = {
			["Bosses"] = {
				{ "PetsMerchant" },
				{ "PetsQuest" },
				{ "PetsCrafted" },
				{ "PetsAchievementFaction" },
				{ "PetsRare" },
				{ "PetsEvent" },
				{ "PetsPromotional" },
				{ "PetsCardGame" },
				{ "PetsPetStore" },
				{ "PetsRemoved" },
				{ "PetsAccessories" },
			},
			["Info"] = { BabbleInventory["Companions"], "AtlasLootWotLK" },
		},

		["Mounts"] = {
			["Bosses"] = {
				{ "MountsFaction" },
				{ "MountsPvP" },
				{ "MountsRareDungeon" },
				{ "MountsRareRaid" },
				{ "MountsAchievement" },
				{ "MountsCraftQuest" },
				{ "MountsCardGamePromotional" },
				{ "MountsEvent" },
				{ "MountsRemoved" },
			},
			["Info"] = { BabbleInventory["Mounts"], "AtlasLootWotLK" },
		},

		["Tabards"] = {
			["Bosses"] = {
				{ "TabardsAlliance" },
				{ "TabardsHorde" },
				{ "TabardsAchievementQuestRareMisc" },
				{ "TabardsRemoved" },
			},
			["Info"] = { BabbleInventory["Tabards"], "AtlasLootWotLK" },
		},

		["TransformationItems"] = {
			["Bosses"] = {
				{ "TransformationNonconsumedItems" },
				{ "TransformationConsumableItems" },
				{ "TransformationAdditionalEffects" },
			},
			["Info"] = { AL["Transformation Items"], "AtlasLootWotLK" },
		},

		["WorldEpics"] = {
			["Bosses"] = {
				{ "WorldEpics80" },
				{ "WorldEpics70" },
				{ "WorldEpics5060" },
				{ "WorldEpics4049" },
				{ "WorldEpics3039" },
			},
			["Info"] = { AL["BoE World Epics"], "AtlasLootWotLK" },
		},
	},

	["PVP"] = {
		["AlteracValley"] = {
			["Bosses"] = {
				{ "AVMisc" },
				{ "AVBlue" },
			},
			["Info"] = { BabbleZone["Alterac Valley"] .. " " .. AL["Rewards"], "AtlasLootClassicWoW" },
		},

		["WarsongGulch"] = {
			["Bosses"] = {
				{ "WSGMisc",        6 },
				{ "WSGAccessories", 7 },
				{ "WSGWeapons",     8 },
				{ "WSGArmor",       10 },
			},
			["Info"] = { BabbleZone["Warsong Gulch"] .. " " .. AL["Rewards"], "AtlasLootClassicWoW" },
		},
	},

	["Sets"] = {
		["EmblemofTriumph"] = {
			["Bosses"] = {
				{ "EmblemofTriumph" },
				{ "EmblemofTriumph2" },
			},
			["Info"] = { AL["ilvl 245"] .. " - " .. AL["Rewards"], "AtlasLootWotLK" },
		},
	},
}

AtlasLoot_LootTableRegister["Instances"]["EmptyPage"] = {
	["Bosses"] = { { "EmptyPage" } },
	["Info"] = { "EmptyPage" },
}

AtlasLoot_Data["EmptyPage"] = {
	["Normal"] = { {} },
	info = {
		name = "EmptyPage",
		instance = "EmptyPage",
	},
}
