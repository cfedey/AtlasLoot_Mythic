﻿-- $Id: InstanceList.lua 3697 2012-01-31 15:17:37Z lag123 $
--[[
Atlasloot Enhanced
Author Hegarol
Loot browser associating loot with instance bosses
Can be integrated with Atlas (http://www.atlasmod.com)

Functions:
]]
AtlasLoot_ModuleList_Loader = {
	"AtlasLootClassicWoW",
	"AtlasLootBurningCrusade",
	"AtlasLootWotLK",
	"AtlasLootCrafting",
	"AtlasLootWorldEvents",
	"AtlasLootMythic",
}

AtlasLoot_InstanceList_Loader = {
["T456Rogue"] = 2,
["TailoringSoulclothEm"] = 4,
["HCHallsKargath"] = 2,
["DrakTharonKeepTrollgore"] = 3,
["T456PaladinHoly"] = 2,
["EngineeringMisc"] = 4,
["HCFurnaceMaker"] = 2,
["VioletHoldMoragg"] = 3,
["WSGArmor"] = 1,
["AQ20Ayamiss"] = 1,
["Gilneas"] = 1,
["AhnkahetTaldaram"] = 3,
["SCHOLODeathKnight"] = 1,
["T10PriestShadow"] = 3,
["JewelOrange"] = 4,
["NaxxDeathKnightTank"] = 3,
["PVP70Warrior"] = 2,
["VioletEye"] = 2,
["Naxx80Thaddius"] = 3,
["HordeExpedition"] = 3,
["LeatherItemEnhancement"] = 4,
["SPKalecgos"] = 2,
["BRDTrash"] = 1,
["HCFurnaceBreaker"] = 2,
["EngineeringTinker"] = 4,
["PVP70NonSet"] = 2,
["TailoringItemEnhancement"] = 4,
["TKEyeSolarian"] = 2,
["Kurenai"] = 2,
["PVP70Mage"] = 2,
["Naxx80AnubRekhan"] = 3,
["KeepersofTime"] = 2,
["HardModeResist"] = 2,
["LeatherworkingLeatherVolcanicArmor"] = 4,
["ABSets"] = 1,
["BRDArena"] = 1,
["KaraNightbane"] = 2,
["AQ40Fankriss"] = 1,
["KaraAttumen"] = 2,
["GundrakTrash"] = 3,
["AlchemyTransmute"] = 4,
["SmithingWeaponRemoved"] = 4,
["UlduarIronCouncil"] = 3,
["WorldBossesBC"] = 2,
["Naxx80Patchwerk"] = 3,
["BTBloodboil"] = 2,
["T456Hunter"] = 2,
["LeatherworkingMailSwiftarrowBattlefear"] = 4,
["BRDTomb"] = 1,
["Inscription_Scrolls"] = 4,
["LeatherworkingMailNerubianHive"] = 4,
["TKEyeKaelthas"] = 2,
["Ashtongue"] = 2,
["CFRSlaveRokmar"] = 2,
["TailoringArmorBC"] = 4,
["UlduarRazorscale"] = 3,
["RagefireChasmLoot"] = 1,
["STRATMalekithePallid"] = 1,
["Inscription_DeathKnight"] = 4,
["AQ20Sets"] = 1,
["SMArmoryLoot"] = 1,
["EnchantingMisc"] = 4,
["JewelcraftingDailyBlue"] = 4,
["SilvermoonCity"] = 1,
["EngineeringReagents"] = 4,
["AQ20Moam"] = 1,
["T456Mage"] = 2,
["LBRSFelguard"] = 1,
["NaxxShamanElemental"] = 3,
["MCMagmadar"] = 1,
["CFRSerpentHydross"] = 2,
["Gnomish"] = 4,
["UBRSAnvilcrack"] = 1,
["Onyxia"] = 3,
["LeatherworkingMailBlueDragonM"] = 4,
["LeatherworkingLeatherBoreanEmbrace"] = 4,
["VoAToravon"] = 3,
["UBRSBeast"] = 1,
["Naxx80Gluth"] = 3,
["EnchantingBoots"] = 4,
["LeatherLeatherArmorBC"] = 4,
["PVP80ShamanRestoration"] = 3,
["KnightsoftheEbonBlade"] = 3,
["MCGolemagg"] = 1,
["EngineeringArmorMail"] = 4,
["T0Warlock"] = 1,
["MCGehennas"] = 1,
["AQ40Skeram"] = 1,
["LeatherSpecializations"] = 4,
["MountsRareDungeon"] = 3,
["Inscription_OffHand"] = 4,
["PVP80Hunter"] = 3,
["LBRSWyrmthalak"] = 1,
["ZFAntusul"] = 1,
["JewelTrinket"] = 4,
["SCHOLOJandiceBarov"] = 1,
["TransformationConsumableItems"] = 3,
["T10WarriorFury"] = 3,
["T456ShamanElemental"] = 2,
["SMTTrash"] = 2,
["EngineeringArmorCloth"] = 4,
["CoTMorassDeja"] = 2,
["KirinTor"] = 3,
["JewelPrismatic"] = 4,
["Mooncloth"] = 4,
["DMEPusillin"] = 1,
["PVPGladiatorWeapons"] = 2,
["LeatherworkingMailNetherstrikeArmor"] = 4,
["SmithingWeaponCata"] = 4,
["PVP70PaladinHoly"] = 2,
["DMNGuardMoldar"] = 1,
["DMNGuardFengus"] = 1,
["VentureBay"] = 3,
["JewelDragonsEye"] = 4,
["AlchemyOtherElixir"] = 4,
["PVP70PriestHoly"] = 2,
["SMGraveyardLoot"] = 1,
["Naxx80Trash"] = 3,
["Netherwing"] = 2,
["RazorfenKraulLoot"] = 1,
["MountsAchievement"] = 3,
["PVP60Rogue"] = 1,
["CFRSerpentVashj"] = 2,
["EnchantingBracer"] = 4,
["T9DruidBalance"] = 3,
["Shatar"] = 2,
["DrakTharonKeepNovos"] = 3,
["Inscription_Shaman"] = 4,
["ArchaeologyNightElf"] = 4,
["DS3Plate"] = 2,
["VWOWSets"] = 1,
["PetsRare"] = 3,
["Weaponsmith"] = 4,
["TailoringBattlecastG"] = 4,
["MountHyjalWinterchill"] = 2,
["SmithingWeaponWrath"] = 4,
["CardGame"] = 3,
["JewelYellow"] = 4,
["AhnkahetJedoga"] = 3,
["TheNexusAnomalus"] = 3,
["UldGrimlok"] = 1,
["T9DeathKnightDPS"] = 3,
["SPBrutallus"] = 2,
["TailoringArcanoVest"] = 4,
["T9Warlock"] = 3,
["WorldEpics80"] = 3,
["STRATTrash"] = 1,
["PVP60Hunter"] = 1,
["LBRSBashguud"] = 1,
["UldShovelphlange"] = 1,
["KaraTrash"] = 2,
["HCFurnaceBroggok"] = 2,
["T9WarriorProtection"] = 3,
["GnomereganLoot"] = 1,
["SCHOLOKirtonostheHerald"] = 1,
["PVPVengefulWeapons"] = 2,
["AVMisc"] = 1,
["TabardsRemoved"] = 3,
["AzjolNerubHadronox"] = 3,
["LeatherworkingLeatherFelSkin"] = 4,
["STDragons"] = 1,
["NaxxPaladinHoly"] = 3,
["ZFZerillis"] = 1,
["DMEZevrimThornhoof"] = 1,
["MountsPvP"] = 3,
["TailoringFrostwovenPower"] = 4,
["Spellfire"] = 4,
["T0Mage"] = 1,
["T456DruidBalance"] = 2,
["HallsofStoneMaiden"] = 3,
["VioletHoldIchoron"] = 3,
["ICCFestergut"] = 3,
["PVP60Druid"] = 1,
["Inscription_Paladin"] = 4,
["ArchaeologyTolvir"] = 4,
["FoSBronjahm"] = 3,
["ArgentDawn"] = 1,
["Skyguard"] = 2,
["T456DruidRestoration"] = 2,
["Legendaries"] = 3,
["SmithingArmorOld"] = 4,
["LBRSSmolderweb"] = 1,
["ZFHydromancerVelratha"] = 1,
["LeatherLeatherArmorWrath"] = 4,
["MountHyjalAzgalor"] = 2,
["EmblemofValor"] = 3,
["DarkspearTrolls"] = 1,
["HallsofStoneKrystallus"] = 3,
["MCRANDOMBOSSDROPPS"] = 1,
["UBRSDrakkisath"] = 1,
["NaxxPaladinRetribution"] = 3,
["PVP70DruidRestoration"] = 2,
["SCHOLODoctorTheolenKrastinov"] = 1,
["AQ40CThun"] = 1,
["STJammalanandOgom"] = 1,
["EmblemofTriumph"] = 3,
["DMWImmolthar"] = 1,
["TailoringSpellstrikeInfu"] = 4,
["MountHyjalTrash"] = 2,
["WSGWeapons"] = 1,
["AuchShadowBlackheart"] = 2,
["CFRSlaveMennu"] = 2,
["TheNexusKolurgStoutbeard"] = 3,
["HardModeArena"] = 2,
["LeatherworkingMailBlackDragonM"] = 4,
["CFRSerpentLurker"] = 2,
["Halion"] = 3,
["LeatherworkingMailScaledDraenicA"] = 4,
["ICCTrash"] = 3,
["CExpedition"] = 2,
["Naxx80Heigan"] = 3,
["LeatherworkingLeatherEvisceratorBattlegear"] = 4,
["WailingCavernsLoot"] = 1,
["T1T2Shaman"] = 1,
["T9DruidRestoration"] = 3,
["Mining"] = 4,
["LeatherCloaks"] = 4,
["Nagrand"] = 2,
["BlackrockMountainEntLoot"] = 1,
["AuchManaTavarok"] = 2,
["Swordsmith"] = 4,
["NaxxPriestHoly"] = 3,
["T3Mage"] = 1,
["SCHOLORasFrostwhisper"] = 1,
["ArchaeologyDwarf"] = 4,
["MCSulfuron"] = 1,
["PVP60Warrior"] = 1,
["AuchShadowGrandmaster"] = 2,
["ThunderBluff"] = 1,
["TailoringShirts"] = 4,
["UldIronaya"] = 1,
["PVP80Accessories"] = 3,
["BTAkama"] = 2,
["Inscription_Warrior"] = 4,
["BRDPyromantLoregrain"] = 1,
["UldBaelog"] = 1,
["T1T2Druid"] = 1,
["BRDWarderStilgiss"] = 1,
["OcuDrakos"] = 3,
["AQ40BugFam"] = 1,
["VioletHoldCyanigosa"] = 3,
["SCHOLOLadyIlluciaBarov"] = 1,
["UlduarAuriaya"] = 3,
["CraftedWeapons"] = 4,
["CoTStratholmeTrash"] = 3,
["PVP70Weapons"] = 2,
["SCHOLORattlegore"] = 1,
["Sartharion"] = 3,
["DMNCaptainKromcrush"] = 1,
["Inscription_Warlock"] = 4,
["CFRUnderStalker"] = 2,
["CoTStratholmeSalramm"] = 3,
["EmblemofTriumph2"] = 3,
["TrialoftheCrusaderNorthrendBeasts"] = 3,
["NaxxPaladinProtection"] = 3,
["SmithingArmorEnhancement"] = 4,
["JewelRing"] = 4,
["LeatherDrumsBagsMisc"] = 4,
["GundrakGaldarah"] = 3,
["T10DeathKnightDPS"] = 3,
["T10DruidBalance"] = 3,
["PVP80ShamanElemental"] = 3,
["AllianceVanguard"] = 3,
["BWLChromaggus"] = 1,
["BRDLordIncendius"] = 1,
["HCHallsTrash"] = 2,
["Shadoweave"] = 4,
["VoAEmalon"] = 3,
["MountsAlliance"] = 3,
["OldKeys"] = 1,
["HardModePlate"] = 2,
["ICCLanathel"] = 3,
["Undercity"] = 1,
["LeatherworkingCataVendor"] = 4,
["LeatherworkingMailFelstalkerArmor"] = 4,
["AuchSethekkTalonKing"] = 2,
["STRATTheUnforgiven"] = 1,
["MountsFaction"] = 3,
["AlchemyOil"] = 4,
["T9Mage"] = 3,
["BRDVerek"] = 1,
["KaraAran"] = 2,
["MountsCardGamePromotional"] = 3,
["T1T2Hunter"] = 1,
["AuchCryptsExarch"] = 2,
["SmithingWeaponEnhancement"] = 4,
["BWLNefarian"] = 1,
["SmithingArmorBC"] = 4,
["STRATBalnazzar"] = 1,
["STRATInstructorGalford"] = 1,
["Goblin"] = 4,
["KaraCharredBoneFragment"] = 2,
["BRDLordRoccor"] = 1,
["TKArcHarbinger"] = 2,
["LBRSVosh"] = 1,
["PetsEvent"] = 3,
["STRATStonespine"] = 1,
["EngineeringExplosives"] = 4,
["GundrakColossus"] = 3,
["UtgardeKeepTrash"] = 3,
["UPSkadi"] = 3,
["DMNKingGordok"] = 1,
["Naxx80Loatheb"] = 3,
["Armorsmith"] = 4,
["UlduarIgnis"] = 3,
["MCLucifron"] = 1,
["LBRSGrimaxe"] = 1,
["DMNStomperKreeg"] = 1,
["SCHOLOTrash"] = 1,
["Timbermaw"] = 1,
["T10ShamanRestoration"] = 3,
["T9Rogue"] = 3,
["CookingSpecial"] = 4,
["TBCSets"] = 2,
["HCMagtheridon"] = 2,
["PetsRemoved"] = 3,
["JewelNeck"] = 4,
["DMETrash"] = 1,
["LeatherworkingLeatherStormshroudArmor"] = 4,
["LeatherworkingMailFelscaleArmor"] = 4,
["T456PriestHoly"] = 2,
["EmblemofConquest"] = 3,
["ArchaeologyMisc"] = 4,
["UlduarMimiron"] = 3,
["DrakTharonKeepTrash"] = 3,
["SMCathedralLoot"] = 1,
["UBRSTrash"] = 1,
["MaraudonLoot"] = 1,
["PVP80NonSet"] = 3,
["LBRSTrash"] = 1,
["AQBroodRings"] = 1,
["PoSTyrannus"] = 3,
["KaraPrince"] = 2,
["AuchCryptsShirrak"] = 2,
["PVP70DruidBalance"] = 2,
["Tranquillien"] = 2,
["SPMuru"] = 2,
["PVP80PriestShadow"] = 3,
["T0Warrior"] = 1,
["ArgentCrusade"] = 3,
["LBRSCrystalFang"] = 1,
["WSGAccessories"] = 1,
["NaxxShamanEnhancement"] = 3,
["AQ40Emperors"] = 1,
["PVP70PriestShadow"] = 2,
["HCRampWatchkeeper"] = 2,
["TailoringCataVendor"] = 4,
["PVP60Priest"] = 1,
["T10PaladinRetribution"] = 3,
["CFRSerpentLeotheras"] = 2,
["TKBotSplinter"] = 2,
["STEranikus"] = 1,
["T3Warrior"] = 1,
["UlduarVezax"] = 3,
["SmithingMisc"] = 4,
["LBRSSlavener"] = 1,
["BlacksmithingPlateEnchantedAdaman"] = 4,
["OcuUrom"] = 3,
["LeatherworkingLeatherPrimalBatskin"] = 4,
["SunOffensive"] = 2,
["BlacksmithingPlateAdamantiteB"] = 4,
["PVP80PriestHoly"] = 3,
["Consortium"] = 2,
["HallsofStoneTribunal"] = 3,
["SCHOLOLorekeeperPolkelt"] = 1,
["Stockade"] = 1,
["SPPatterns"] = 2,
["T9PaladinRetribution"] = 3,
["HallsofLightningBjarngrim"] = 3,
["KaraIllhoof"] = 2,
["WorldEpics3039"] = 1,
["PetsCrafted"] = 3,
["CoTHillsbradDrake"] = 2,
["T3Shaman"] = 1,
["NaxxWarlock"] = 3,
["MiscFactions"] = 1,
["SMTVexallus"] = 2,
["LeatherLeather"] = 4,
["TheNexusTelestra"] = 3,
["WOTLKSets"] = 3,
["ZFSezzziz"] = 1,
["HoRMarwyn"] = 3,
["AQ40Trash"] = 1,
["Naxx80Gothik"] = 3,
["SCHOLOLordAlexeiBarov"] = 1,
["STRATNerubenkan"] = 1,
["PetsPromotional"] = 3,
["BTShahraz"] = 2,
["AuchManaPandemonius"] = 2,
["PVP60Mage"] = 1,
["EnchantingCloak"] = 4,
["TailoringBloodvineG"] = 4,
["CookingRating"] = 4,
["UlduarHodir"] = 3,
["AuchShadowHellmaw"] = 2,
["TrialoftheCrusaderAnubarak"] = 3,
["TrialoftheCrusaderTribute"] = 3,
["CookingDaily"] = 4,
["LBRSDoomhowl"] = 1,
["EnchantingCataVendor"] = 4,
["DMWTrash"] = 1,
["ZFChiefUkorzSandscalp"] = 1,
["DMEHydro"] = 1,
["AuchTrash"] = 2,
["T3Paladin"] = 1,
["TrialoftheCrusaderLordJaraxxus"] = 3,
["CFRSteamWarlord"] = 2,
["DMWTsuzee"] = 1,
["T9PaladinHoly"] = 3,
["BRDFineousDarkvire"] = 1,
["NaxxMage"] = 3,
["VoAArchavon"] = 3,
["CFRSteamSteamrigger"] = 2,
["PVP80PaladinHoly"] = 3,
["BRDTheVault"] = 1,
["CoTHillsbradSkarloc"] = 2,
["BlacksmithingPlateBurningRage"] = 4,
["AlchemyGuardianElixir"] = 4,
["TrialoftheCrusaderFactionChampions"] = 3,
["HallsofStoneSjonnir"] = 3,
["TailoringImbuedNeather"] = 4,
["CookingOtherBuffs"] = 4,
["HCHallsNethekurse"] = 2,
["UlduarAlgalon"] = 3,
["SPEredarTwins"] = 2,
["LBRSSpirestoneButcher"] = 1,
["PVP70Rep"] = 2,
["VWOWScholo"] = 1,
["WorldEpics5060"] = 1,
["TKMechCalc"] = 2,
["UPYmiron"] = 3,
["BTPatterns"] = 2,
["T9ShamanElemental"] = 3,
["PVP70ShamanRestoration"] = 2,
["NaxxHunter"] = 3,
["LeatherworkingLeatherPrimalIntent"] = 4,
["AuchManaNexusPrince"] = 2,
["UBRSGyth"] = 1,
["PVP70WarlockDemonology"] = 2,
["PetsMerchant"] = 3,
["Heirloom"] = 3,
["AlchemyBattleElixir"] = 4,
["KaraMaiden"] = 2,
["VioletHoldTrash"] = 3,
["JewelcraftingDailyGreen"] = 4,
["CoTTrash"] = 2,
["DMEAlzzin"] = 1,
["PVP60Shaman"] = 1,
["CoTStratholmeMeathook"] = 3,
["TailoringShadowEmbrace"] = 4,
["Naxx80KelThuzad"] = 3,
["BWLEbonroc"] = 1,
["PoSGarfrost"] = 3,
["HardModeRelic"] = 2,
["JewelMisc"] = 4,
["T0Shaman"] = 1,
["TabardsAlliance"] = 3,
["LeatherLeatherArmorCata"] = 4,
["T1T2Warrior"] = 1,
["T9DruidFeral"] = 3,
["T10WarriorProtection"] = 3,
["TailoringPrimalMoon"] = 4,
["TailoringMisc"] = 4,
["GundrakEck"] = 3,
["TailoringWhitemendWis"] = 4,
["LeatherworkingLeatherWindhawkArmor"] = 4,
["TheSonsofHodir"] = 3,
["ThoriumBrotherhood"] = 1,
["Naxx80Faerlina"] = 3,
["AuchSethekkRavenGod"] = 2,
["AlchemyCauldron"] = 4,
["PoSKrickIck"] = 3,
["LeatherworkingLeatherIceborneEmbrace"] = 4,
["SMTrash"] = 1,
["T10DruidFeral"] = 3,
["Exodar"] = 1,
["LeatherworkingMailNetherscaleArmor"] = 4,
["NaxxDruidRestoration"] = 3,
["TabardsAchievementQuestRareMisc"] = 3,
["HardModeAccessories"] = 2,
["TailoringTheUnyielding"] = 4,
["T3Hunter"] = 1,
["AuchManaYor"] = 2,
["T10DruidRestoration"] = 3,
["CookingBuff"] = 4,
["PVPMercilessWeapons"] = 2,
["WSGMisc"] = 1,
["SPTrash"] = 2,
["UPTrash"] = 3,
["AuchCryptsAvatar"] = 2,
["ICCPutricide"] = 3,
["T3Druid"] = 1,
["BlacksmithingPlateImperialPlate"] = 4,
["SmithingArmorWrath"] = 4,
["AzjolNerubKrikthir"] = 3,
["ICCRotface"] = 3,
["Maghar"] = 2,
["LeatherworkingMailNetherFury"] = 4,
["ICCLichKing"] = 3,
["Inscription_Druid"] = 4,
["BlacksmithingMailFelIronChain"] = 4,
["EmblemofFrost"] = 3,
["HardModeCloaks"] = 2,
["HCHallsOmrogg"] = 2,
["SMLibraryLoot"] = 1,
["TailoringArmorWotLK"] = 4,
["TheWyrmrestAccord"] = 3,
["T9DeathKnightTank"] = 3,
["DMNThimblejack"] = 1,
["BlacksmithingPlateFaithFelsteel"] = 4,
["T456PriestShadow"] = 2,
["BRDBSPlans"] = 1,
["RazorfenDownsLoot"] = 1,
["CFRSerpentMorogrim"] = 2,
["Naxx80Grobbulus"] = 3,
["CookingStandard"] = 4,
["SCHOLOQuestItems"] = 1,
["CookingAPSP"] = 4,
["STRATHearthsingerForresten"] = 1,
["T9PaladinProtection"] = 3,
["HallsofStoneTrash"] = 3,
["CFRSerpentKarathress"] = 2,
["NaxxWarriorFury"] = 3,
["FishingDaily"] = 4,
["PetsPetStore"] = 3,
["STTrash"] = 1,
["Naxx80Noth"] = 3,
["PVP80PaladinRetribution"] = 3,
["UlduarFreya"] = 3,
["ICCGunshipBattle"] = 3,
["AQ40Ouro"] = 1,
["HoRFalric"] = 3,
["MountHyjalAnetheron"] = 2,
["TrialoftheChampionBlackKnight"] = 3,
["AQ20Ossirian"] = 1,
["JewelRed"] = 4,
["AzjolNerubAnubarak"] = 3,
["OcuTrash"] = 3,
["BRDFlamelash"] = 1,
["T456Warlock"] = 2,
["PVP80DruidFeral"] = 3,
["AhnkahetAmanitar"] = 3,
["Orgrimmar"] = 1,
["UldTrash"] = 1,
["MountsEvent"] = 3,
["FHTrashMobs"] = 3,
["PVP80DruidBalance"] = 3,
["T456ShamanRestoration"] = 2,
["BTCouncil"] = 2,
["Enchanting2HWeapon"] = 4,
["T10ShamanEnhancement"] = 3,
["ZFTrash"] = 1,
["LeatherMailArmorBC"] = 4,
["T10Warlock"] = 3,
["GundrakSladran"] = 3,
["T10DeathKnightTank"] = 3,
["HardModeMail"] = 2,
["T456WarriorProtection"] = 2,
["KaraNetherspite"] = 2,
["BRDImperatorDagranThaurissan"] = 1,
["BTIllidanStormrage"] = 2,
["PVP60Paladin"] = 1,
["KaraCurator"] = 2,
["EnchantingRing"] = 4,
["ICCValithria"] = 3,
["TKEyeVoidReaver"] = 2,
["ArchaeologyOrc"] = 4,
["AQ20Buru"] = 1,
["BloodsailHydraxian"] = 1,
["PVP60Accessories"] = 1,
["SCHOLODarkmasterGandling"] = 1,
["DS3Mail"] = 2,
["PetsAccessories"] = 3,
["BRDBaelGar"] = 1,
["PVP70DeathKnight"] = 2,
["PVP70WarlockDestruction"] = 2,
["T456WarriorFury"] = 2,
["Inscription_Priest"] = 4,
["LBRSZigris"] = 1,
["T456DruidFeral"] = 2,
["BRDHighInterrogatorGerstahn"] = 1,
["HallsofLightningVolkhan"] = 3,
["JewelPurple"] = 4,
["T10PaladinProtection"] = 3,
["AzjolNerubTrash"] = 3,
["GundrakMoorabi"] = 3,
["DMNGuardSlipkik"] = 1,
["WorldEpics4049"] = 1,
["EnchantingStaff"] = 4,
["LeatherLeatherArmorOld"] = 4,
["SCHOLOTheRavenian"] = 1,
["VoAKoralon"] = 3,
["UlduarLeviathan"] = 3,
["ArchaeologyArmorAndWeapons"] = 4,
["PVP70PaladinRetribution"] = 2,
["T9ShamanEnhancement"] = 3,
["UlduarDeconstructor"] = 3,
["TailoringDuskweaver"] = 4,
["LeatherMailArmorWrath"] = 4,
["MountsCraftQuest"] = 3,
["CFRUnderHungarfen"] = 2,
["UlduarKologarn"] = 3,
["UBRSRunewatcher"] = 1,
["TheKaluak"] = 3,
["Aldor"] = 2,
["Axesmith"] = 4,
["UlduarTrash"] = 3,
["NaxxDruidBalance"] = 3,
["LeatherworkingLeatherBloodTigerH"] = 4,
["UPSorrowgrave"] = 3,
["DMWTendrisWarpwood"] = 1,
["TKBotLaj"] = 2,
["SMTFireheart"] = 2,
["AuchSethekkDarkweaver"] = 2,
["STRATRamsteintheGorger"] = 1,
["BWLFiremaw"] = 1,
["DMWIllyannaRavenoak"] = 1,
["T0Rogue"] = 1,
["CFRSlaveQuagmirran"] = 2,
["CFRSteamTrash"] = 2,
["VioletHoldErekem"] = 3,
["TailoringSpellfireWrath"] = 4,
["ICCSindragosa"] = 3,
["AQ40Viscidus"] = 1,
["LBRSOmokk"] = 1,
["ICCLordMarrowgar"] = 3,
["T1T2Paladin"] = 1,
["CoTStratholmeMalGanis"] = 3,
["STRATMagistrateBarthilas"] = 1,
["HoRLichKing"] = 3,
["STRATFrasSiabi"] = 1,
["UBRSSolakar"] = 1,
["CFRSerpentTrash"] = 2,
["SPFelmyst"] = 2,
["DMWHelnurath"] = 1,
["TKArcScryer"] = 2,
["TailoringCloth"] = 4,
["TheAshenVerdict"] = 3,
["LeatherworkingLeatherSClefthoof"] = 4,
["T1T2Warlock"] = 1,
["AlchemyPotion"] = 4,
["BRDMagmus"] = 1,
["BlacksmithingPlateFelIronPlate"] = 4,
["TKEyeTrash"] = 2,
["T3Rogue"] = 1,
["TheNexusOrmorok"] = 3,
["HCHallsPorung"] = 2,
["TKMechSepethrea"] = 2,
["SmithingArmorRemoved"] = 4,
["LeatherMailArmorCata"] = 4,
["MCShazzrah"] = 1,
["NaxxShamanRestoration"] = 3,
["BRDPrincess"] = 1,
["VioletHoldZuramat"] = 3,
["Thrallmar"] = 2,
["NaxxDeathKnightDPS"] = 3,
["Naxx80FourHorsemen"] = 3,
["BTGorefiend"] = 2,
["UldObsidianSentinel"] = 1,
["UBRSEmberseer"] = 1,
["Naxx80Sapphiron"] = 3,
["T9Hunter"] = 3,
["AhnkahetVolazj"] = 3,
["ICCCouncil"] = 3,
["T9PriestShadow"] = 3,
["TrialoftheCrusaderPatterns"] = 3,
["JewelChimerasEye"] = 4,
["CoTMorassTemporus"] = 2,
["NaxxDruidFeral"] = 3,
["UldRevelosh"] = 1,
["T9ShamanRestoration"] = 3,
["T1T2Priest"] = 1,
["Ironforge"] = 1,
["BRDPanzor"] = 1,
["AhnkahetNadox"] = 3,
["MCTrashMobs"] = 1,
["TransformationAdditionalEffects"] = 3,
["BTSupremus"] = 2,
["LBRSVoone"] = 1,
["PVP80DeathKnight"] = 3,
["Naxx80Razuvious"] = 3,
["Inscription_RelicsEnchants"] = 4,
["T10PriestHoly"] = 3,
["TKBotFreywinn"] = 2,
["KaraChess"] = 2,
["ZFGahzrilla"] = 1,
["SMTKaelthas"] = 2,
["PVP70Accessories"] = 2,
["EmblemofHeroism"] = 3,
["GruulGruul"] = 2,
["Blackfathom"] = 1,
["UlduarPatterns"] = 3,
["T9WarriorFury"] = 3,
["T10ShamanElemental"] = 3,
["AQ40Sartura"] = 1,
["PVP80Warlock"] = 3,
["BlacksmithingPlateKhoriumWard"] = 4,
["CoTStratholmeEpoch"] = 3,
["JewelcraftingDailyOrange"] = 4,
["T3Priest"] = 1,
["PVP80Weapons"] = 3,
["DMELethtendrisPimgib"] = 1,
["BWLRazorgore"] = 1,
["PVP80DruidRestoration"] = 3,
["PVP70ShamanEnhancement"] = 2,
["AB4049"] = 1,
["JewelBlue"] = 4,
["CenarionCircle"] = 1,
["STRATLordAuriusRivendare"] = 1,
["ArchaeologyDraenei"] = 4,
["JewelGreen"] = 4,
["BlacksmithingPlateSavageSaroniteBattlegear"] = 4,
["SMTDelrissa"] = 2,
["STRATWilleyHopebreaker"] = 1,
["Malygos"] = 3,
["ZFDustwraith"] = 1,
["PVP80Warrior"] = 3,
["PVP60Warlock"] = 1,
["EnchantingChest"] = 4,
["Zangarmarsh"] = 2,
["TKTrash"] = 2,
["WorldEpics70"] = 2,
["BRDGolemLordArgelmach"] = 1,
["BlacksmithingPlateTheDarksoul"] = 4,
["TrialoftheChampionChampions"] = 3,
["Ogrila"] = 2,
["T0Priest"] = 1,
["Darnassus"] = 1,
["LBRSQuestItems"] = 1,
["EngineeringWeapon"] = 4,
["AQ20Trash"] = 1,
["SmithingWeaponBC"] = 4,
["PVP80Rogue"] = 3,
["PVP70Rogue"] = 2,
["VioletHoldLavanthor"] = 3,
["AQ40Sets"] = 1,
["CFRUnderGhazan"] = 2,
["WinterfinRetreat"] = 3,
["BTTrash"] = 2,
["OcuCloudstrider"] = 3,
["EngineeringArmorPlate"] = 4,
["ZFWitchDoctorZumrah"] = 1,
["DMWMagisterKalendris"] = 1,
["BTNajentus"] = 2,
["TKArcDalliah"] = 2,
["EnchantingGloves"] = 4,
["AhnkahetTrash"] = 3,
["CFRSteamThespia"] = 2,
["TailoringArmorOld"] = 4,
["Scryer"] = 2,
["SmithingCataVendor"] = 4,
["HallsofLightningLoken"] = 3,
["TKArcUnbound"] = 2,
["PVP80Mage"] = 3,
["UtgardeKeepKeleseth"] = 3,
["DrakTharonKeepTharonja"] = 3,
["JewelcraftingDailyMeta"] = 4,
["MCMajordomo"] = 1,
["T0Paladin"] = 1,
["Naxx80Maexxna"] = 3,
["JewelcraftingDailyDragonEye"] = 4,
["T456PaladinProtection"] = 2,
["KaraMoroes"] = 2,
["LBRSLordMagus"] = 1,
["BlacksmithingMailBloodsoulEmbrace"] = 4,
["NaxxWarriorProtection"] = 3,
["BlacksmithingPlateFlameG"] = 4,
["Inscription_Rogue"] = 4,
["AQ40Huhuran"] = 1,
["LeatherworkingLeatherDevilsaurArmor"] = 4,
["BRDQuestItems"] = 1,
["CookingHitCrit"] = 4,
["Stormwind"] = 1,
["EnchantingWeapon"] = 4,
["T1T2Rogue"] = 1,
["EngineeringArmorLeather"] = 4,
["ArchaeologyFossil"] = 4,
["PetsAchievementFaction"] = 3,
["NaxxPriestShadow"] = 3,
["TKEyeAlar"] = 2,
["PetsCardGame"] = 3,
["BTReliquaryofSouls"] = 2,
["TailoringBags"] = 4,
["MountHyjalKazrogal"] = 2,
["DMNTRIBUTERUN"] = 1,
["EngineeringPetMount"] = 4,
["FoSDevourer"] = 3,
["Inscription_Hunter"] = 4,
["T1T2Mage"] = 1,
["PVP80ShamanEnhancement"] = 3,
["T10Mage"] = 3,
["EngineeringArmor"] = 4,
["TrialoftheChampionEadricthePure"] = 3,
["BWLFlamegor"] = 1,
["TabardsHorde"] = 3,
["UlduarThorim"] = 3,
["UlduarYoggSaron"] = 3,
["BWLVaelastrasz"] = 1,
["T0Hunter"] = 1,
["MCGarr"] = 1,
["STRATSkull"] = 1,
["T10Rogue"] = 3,
["LeatherworkingMailGreenDragonM"] = 4,
["PVP70PaladinProtection"] = 2,
["Sporeggar"] = 2,
["T3Warlock"] = 1,
["LowerCity"] = 2,
["T10PaladinHoly"] = 3,
["STRATRisenHammersmith"] = 1,
["UtgardeKeepSkarvald"] = 3,
["Inscription_Mage"] = 4,
["SCHOLOInstructorMalicia"] = 1,
["EngineeringArmorTrinket"] = 4,
["ABMisc"] = 1,
["Inscription_Misc"] = 4,
["LeatherworkingLeatherWildDraenishA"] = 4,
["MCRagnaros"] = 1,
["DS3Cloth"] = 2,
["MCGeddon"] = 1,
["GnomereganRep"] = 1,
["T456PaladinRetribution"] = 2,
["STRATTimmytheCruel"] = 1,
["AQ20Kurinnaxx"] = 1,
["JewelcraftingDailyYellow"] = 4,
["LBRSHalycon"] = 1,
["TailoringNeatherVest"] = 4,
["DMWPrinceTortheldrin"] = 1,
["TKBotSarannis"] = 2,
["AB2039"] = 1,
["T10Hunter"] = 3,
["NaxxRogue"] = 3,
["LeatherworkingLeatherIronfeatherArmor"] = 4,
["MountHyjalArchimonde"] = 2,
["BRDHoundmaster"] = 1,
["ArchaeologyTroll"] = 4,
["CookingAgiStrInt"] = 4,
["KaraOperaEvent"] = 2,
["JewelcraftingDailyRemoved"] = 4,
["BilgewaterCartel"] = 1,
["LeatherworkingMailFrostscaleBinding"] = 4,
["MountsRemoved"] = 3,
["BWLTrashMobs"] = 1,
["AQEnchants"] = 1,
["Terokkar"] = 2,
["LakeWintergrasp"] = 3,
["AuchShadowMurmur"] = 2,
["BRDGeneralAngerforge"] = 1,
["STRATBlackGuardSwordsmith"] = 1,
["UBRSRend"] = 1,
["AVBlue"] = 1,
["UldArchaedas"] = 1,
["TrialoftheCrusaderTwinValkyrs"] = 3,
["TheNexusKeristrasza"] = 3,
["DMNChoRush"] = 1,
["CoTHillsbradHunter"] = 2,
["UldAncientStoneKeeper"] = 1,
["DMBooks"] = 1,
["SCHOLOBloodStewardofKirtonos"] = 1,
["DrakTharonKeepKingDred"] = 3,
["BWLLashlayer"] = 1,
["JewelcraftingDailyRed"] = 4,
["ICCLadyDeathwhisper"] = 3,
["ArchaeologyNerubian"] = 4,
["UBRSFLAME"] = 1,
["TKBotThorngrin"] = 2,
["ScaleSands"] = 2,
["MountsRareRaid"] = 3,
["AlchemyMisc"] = 4,
["SmithingWeaponOld"] = 4,
["CoTMorassAeonus"] = 2,
["SCHOLOMardukVectus"] = 1,
["TailoringArmorCata"] = 4,
["PVP60Weapons"] = 1,
["LeatherworkingLeatherOvercasterBattlegear"] = 4,
["TKMechCapacitus"] = 2,
["PVP70Hunter"] = 2,
["T456ShamanEnhancement"] = 2,
["PVP70DruidFeral"] = 2,
["UldGalgannFirehammer"] = 1,
["HCRampOmor"] = 2,
["ICCSaurfang"] = 3,
["GruulsLairHighKingMaulgar"] = 2,
["JewelMeta"] = 4,
["TailoringFrostsavageBattlegear"] = 4,
["CFRUnderSwamplord"] = 2,
["HallsofLightningIonar"] = 3,
["VioletHoldXevozz"] = 3,
["LBRSSpirestoneLord"] = 1,
["TheOracles"] = 3,
["ArgentTournamentFaction"] = 3,
["EngineeringGem"] = 4,
["ArchaeologyVrykul"] = 4,
["HCRampVazruden"] = 2,
["FrenzyheartTribe"] = 3,
["STAvatarofHakkar"] = 1,
["DS3Leather"] = 2,
["EnchantingShield"] = 4,
["T0Druid"] = 1,
["UtgardeKeepIngvar"] = 3,
["OcuEregos"] = 3,
["Hellfire"] = 2,
["MountsHorde"] = 3,
["LeatherworkingMailStormhideBattlegear"] = 4,
["STRATBaronessAnastari"] = 1,
["BRDGuzzler"] = 1,
["HallsofLightningTrash"] = 3,
["AQ20Rajaxx"] = 1,
["TrialoftheChampionConfessorPaletress"] = 3,
["EngineeringFirework"] = 4,
["BlacksmithingPlateOrnateSaroniteBattlegear"] = 4,
["HardModeLeather"] = 2,
["LeatherMailArmorOld"] = 4,
["SmithingArmorCata"] = 4,
["PVP70ShamanElemental"] = 2,
["KaraNamed"] = 2,
["HardModeCloth"] = 2,
["HonorHold"] = 2,
["LeatherworkingLeatherThickDraenicA"] = 4,
["HardModeWeapons"] = 2,
["T9PriestHoly"] = 3,
["TransformationNonconsumedItems"] = 3,
["SPKiljaeden"] = 2,
["FirstAid"] = 4,
["PetsQuest"] = 3,
["JewelcraftingDailyNeckRing"] = 4,
["AlchemyFlask"] = 4,
["JewelcraftingDailyPurple"] = 4,
["UPPalehoof"] = 3,
["TKMechCacheoftheLegion"] = 2,
["EngineeringScope"] = 4,
["Hammersmith"] = 4,

["MythicTKMechCacheoftheLegion"] = 6,
["MythicTKMechCapacitus"] = 6,
["MythicTKMechSepethrea"] = 6,
["MythicTKMechCalc"] = 6,
["MythicCFRUnderHungarfen"] = 6,
["MythicCFRUnderGhazan"] = 6,
["MythicCFRUnderSwamplord"] = 6,
["MythicCFRUnderStalker"] = 6,
["MythicAuchManaPanademonius"] = 6,
["MythicAuchManaTavarok"] = 6,
["MythicAuchManaNexusPrince"] = 6,
["MythicAuchManaYor"] = 6,
["MythicRampWatchkeeper"] = 6,
["MythicRampOmor"] = 6,
["MythicRampVazruden"] = 6,
["MythicAuchShadowHellmaw"] = 6,
["MythicAuchShadowBlackheart"] = 6,
["MythicAuchShadowGrandmaster"] = 6,
["MythicAuchShadowMurmur"] = 6,
["MythicTKArcUnbound"] = 6,
["MythicTKArcScryer"] = 6,
["MythicTKArcDalliah"] = 6,
["MythicTKArcHarbinger"] = 6,
["MythicCoTMorassDeja"] = 6,
["MythicCoTMorassTemporus"] = 6,
["MythicCoTMorassAeonus"] = 6,
["MythicAuchCryptsShirrak"] = 6,
["MythicAuchCryptsExarch"] = 6,
["MythicAuchCryptsAvatar"] = 6,
["MythicAuchSethekkDarkweaver"] = 6,
["MythicAuchSethekkRavenGod"] = 6,
["MythicAuchSethekkTalonKing"] = 6,
["MythicTKBotSarannis"] = 6,
["MythicTKBotFreywinn"] = 6,
["MythicTKBotThorngrin"] = 6,
["MythicTKBotLaj"] = 6,
["MythicTKBotSplinter"] = 6,
["MythicCoTHillsbradDrake"] = 6,
["MythicCoTHillsbradSkarloc"] = 6,
["MythicCoTHillsbradHunter"] = 6,
["MythicHCFurnaceMaker"] = 6,
["MythicHCFurnaceBroggok"] = 6,
["MythicHCFurnaceBreaker"] = 6,
["MythicCFRSlaveMennu"] = 6,
["MythicCFRSlaveRokmar"] = 6,
["MythicCFRSlaveQuagmirran"] = 6,
["MythicHCHallsNethekurse"] = 6,
["MythicHCHallsPorung"] = 6,
["MythicHCHallsOmrogg"] = 6,
["MythicHCHallsKargath"] = 6,
["MythicCFRSteamThespia"] = 6,
["MythicCFRSteamSteamrigger"] = 6,
["MythicCFRSteamWarlord"] = 6,
["MythicSMTFireheart"] = 6,
["MythicSMTVexallus"] = 6,
["MythicSMTDelrissa"] = 6,
["MythicSMTKaelthas"] = 6,
}