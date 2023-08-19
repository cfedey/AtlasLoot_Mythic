local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = AtlasLoot_GetLocaleLibBabble("LibBabble-Boss-3.0")

	------------------------
	--- Dungeons & Raids ---
	------------------------

		----------------------------------
		--- Tempest Keep: The Mechanar ---
		----------------------------------

	AtlasLoot_Data["MythicTKMechCacheoftheLegion"] = {
		{ 3, 60134, "", "=q3=Capacitus' Cloak of Calibration", "=ds=#s4#", "", "21.16%"};
		{ 4, 60136, "", "=q3=Vestia's Pauldrons of Inner Grace", "=ds=#s3#, #a1#", "", "17.89%"};
		{ 5, 60133, "", "=q3=Bloodfyre Robes of Annihilation", "=ds=#s5#, #a1#", "", "22.53%"};
		{ 6, 60135, "", "=q3=Boots of the Glade-Keeper", "=ds=#s12#, #a2#", "", "18.74%"};
		{ 7, 60137, "", "=q3=Totem of the Void", "=ds=#s16#, #w15#", "", "19.58%"};
		Next = "MythicTKMechCapacitus";
	};

	AtlasLoot_Data["MythicTKMechCapacitus"] = {
		{ 1, 60129, "", "=q3=Thoriumweave Cloak", "=ds=#s4#", "", "14.81%"};
		{ 2, 60131, "", "=q3=Lunar-Claw Pauldrons", "=ds=#s3#, #a2#", "", "16.98%"};
		{ 3, 60132, "", "=q3=Warp Engineer's Prismatic Chain", "=ds=#s2#", "", "16.81%"};
		{ 4, 60130, "", "=q3=Hammer of the Penitent", "=ds=#h3#, #w6#", "", "14.36%"};
		{ 5, 60128, "", "=q3=Plasma Rat's Hyper-Scythe", "=ds=#w7#", "", "17.69%"};
		Prev = "MythicTKMechCacheoftheLegion";
		Next = "MythicTKMechSepethrea";
	};

	AtlasLoot_Data["MythicTKMechSepethrea"] = {
		{ 1, 60142, "", "=q3=Jade-Skull Breastplate", "=ds=#s5#, #a4#", "", "15.37%"};
		{ 2, 60140, "", "=q3=Cosmic Lifeband", "=ds=#s13#", "", "18.06%"};
		{ 3, 60138, "", "=q3=Manual of the Nethermancer", "=ds=#s15#", "", "15.61%"};
		{ 4, 60139, "", "=q3=Stellaris", "=ds=#h1#, #w1#", "", "15.58%"};
		{ 5, 60141, "", "=q3=Nethershrike", "=ds=#w11#", "", "15.88%"};
		Prev = "MythicTKMechCapacitus";
		Next = "MythicTKMechCalc";
	};

	AtlasLoot_Data["MythicTKMechCalc"] = {
		{ 1, 60150, "", "=q3=Baba's Cloak of Arcanistry", "=ds=#s4#", "", "11.78%"};
		{ 2, 60146, "", "=q3=Molten Earth Kilt", "=ds=#s11#, #a3#", "", "12.26%"};
		{ 3, 60143, "", "=q3=Dath'Remar's Ring of Defense", "=ds=#s13#", "", "10.61%"};
		{ 4, 60149, "", "=q3=Abacus of Violent Odds", "=ds=#s14#", "", "10.54%"};
		{ 5, 60153, "", "=q3=Mana Wrath", "=ds=#h3#, #w10#", "", "11.38%"};
		{ 6, 60152, "", "=q3=Edge of the Cosmos", "=ds=#h1#, #w10#", "", "11.13%"};
		{ 7, 60148, "", "=q3=Telescopic Sharprifle", "=ds=#w5#", "", "12.28%"};
		{ 16, 60145, "", "=q3=Incanter's Cowl", "=ds=#s1#, #a1# (D3)", "", "13.39%"};
		{ 17, 60147, "", "=q3=Moonglade Robe", "=ds=#s5#, #a2# (D3)", "", "11.92%"};
		{ 18, 60154, "", "=q3=Tunic of Assassination", "=ds=#s5#, #a2# (D3)", "", "12.44%"};
		{ 19, 60151, "", "=q3=Beast Lord Helm", "=ds=#s1#, #a3# (D3)", "", "12.37%"};
		{ 20, 60144, "", "=q3=Helm of the Righteous", "=ds=#s1#, #a4# (D3)", "", "10.88%"};
		{ 22, 60155, "", "=q4=Boots of the Pious", "=ds=#s12#, #a1#", "", "7.88%"};
		{ 23, 60157, "", "=q4=Handguards of the Steady", "=ds=#s9#, #a3#"};
		{ 24, 60156, "", "=q4=Vanquisher's Legplates", "=ds=#s11#, #a4#", "", "6.90%"};
		{ 25, 60158, "", "=q4=The Sun Eater", "=ds=#h1#, #w10#", "", "1.48%"};
		Prev = "MythicTKMechSepethrea";
	};

		----------------------------------------
		--- Coilfang Reservoir: The Underbog ---
		----------------------------------------

	AtlasLoot_Data["MythicCFRUnderHungarfen"] = {
		{ 23, 60176, "", "=q3=Hungarhide Gauntlets", "=ds=#s9#, #a3#", "", "13.79%"};
		{ 24, 60173, "", "=q3=Girdle of Living Flame", "=ds=#s10#, #a3#", "", "13.79%"};
		{ 25, 60172, "", "=q3=Cassock of the Loyal", "=ds=#s11#, #a4#", "", "7.39%"};
		{ 26, 60175, "", "=q3=Idol of Ursoc", "=ds=#s16#, #w14#", "", "16.26%"};
		{ 27, 60174, "", "=q3=Boggspine Knuckles", "=ds=#h4#, #w13#", "", "12.81%"};
		Next = "MythicCFRUnderGhazan";
	};

	AtlasLoot_Data["MythicCFRUnderGhazan"] = {
		{ 22, 60177, "", "=q3=Dunewind Sash", "=ds=#s10#, #a2#", "", "14.67%"};
		{ 23, 60182, "", "=q3=Headdress of the Tides", "=ds=#s1#, #a3#", "", "13.33%"};
		{ 24, 60181, "", "=q3=Girdle of Gallantry", "=ds=#s10#, #a4#", "", "7.33%"};
		{ 25, 60180, "", "=q3=Hydra-fang Necklace", "=ds=#s2#", "", "12.00%"};
		{ 26, 60179, "", "=q3=Ring of the Shadow Deeps", "=ds=#s13#", "", "18.67%"};
		{ 27, 60178, "", "=q3=Greatstaff of the Leviathan", "=ds=#w9#", "", "16.00%"};
		Prev = "MythicCFRUnderHungarfen";
		Next = "MythicCFRUnderSwamplord";
	};

	AtlasLoot_Data["MythicCFRUnderSwamplord"] = {
		{ 1, 60185, "", "=q3=Hands of the Sun", "=ds=#s9#, #a1#", "", "12.14%"};
		{ 2, 60187, "", "=q3=Crown of the Forest Lord", "=ds=#s1#, #a2#", "", "20.00%"};
		{ 3, 60184, "", "=q3=Armwraps of Disdain", "=ds=#s8#, #a2#", "", "9.29%"};
		{ 4, 60188, "", "=q3=Swampstone Necklace", "=ds=#s2#", "", "17.14%"};
		{ 5, 60186, "", "=q3=Weathered Band of the Swamplord", "=ds=#s13#"};
		{ 6, 60183, "", "=q3=Bogreaver", "=ds=#h1#, #w1#", "", "9.29%"};
		Prev = "MythicCFRUnderGhazan";
		Next = "MythicCFRUnderStalker";
	};

	AtlasLoot_Data["MythicCFRUnderStalker"] = {
		{ 2, 60190, "", "=q4=Barkchip Boots", "=ds=#s12#, #a2#", "", "8.54%"};
		{ 3, 60189, "", "=q4=Stormsong Kilt", "=ds=#s11#, #a3#", "", "6.50%"};
		{ 4, 60195, "", "=q4=Eye of the Stalker", "=ds=#s13#"};
		{ 5, 60191, "", "=q4=The Black Stalk", "=ds=#w12#", "", "4.88%"};
		{ 7, 60193, "", "=q3=Demonfang Ritual Helm", "=ds=#s1#, #a1#", "", "8.94%"};
		{ 8, 60203, "", "=q3=Oracle Belt of Timeless Mystery", "=ds=#s10#, #a1#", "", "14.63%"};
		{ 9, 60194, "", "=q3=Savage Mask of the Lynx Lord", "=ds=#s1#, #a2#", "", "1.63%"};
		{ 11, 60196, "", "=q3=Bone Chain Necklace", "=ds=#s2#", "", "14.23%"};
		{ 12, 60198, "", "=q3=Ring of Fabled Hope", "=ds=#s13#", "", "9.90%"};
		{ 13, 60199, "", "=q3=Alembic of Infernal Power", "=ds=#s14#", "", "12.60%"};
		{ 14, 60192, "", "=q3=Argussian Compass", "=ds=#s14#", "", "3.66%"};
		{ 20, 60201, "", "=q3=Mana-Etched Pantaloons", "=ds=#s11#, #a1# (D3)", "", "4.88%"};
		{ 21, 60200, "", "=q3=Doomplate Shoulderguards", "=ds=#s3#, #a4# (D3)", "", "6.50%"};
		{ 23, 60197, "", "=q3=Endbringer", "=ds=#h2#, #w10#", "", "9.35%"};
		{ 24, 60202, "", "=q3=Stormshield of Renewal", "=ds=#w8#", "", "13.01%"};
		Prev = "MythicCFRUnderSwamplord";
	};