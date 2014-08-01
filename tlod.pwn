/*
 ________  __                        __                                 __
|        \|  \                      |  \                               |  \
 \$$$$$$$$| $$____    ______        | $$       ______   _______    ____| $$
   | $$   | $$    \  /      \       | $$      |      \ |       \  /      $$
   | $$   | $$$$$$$\|  $$$$$$\      | $$       \$$$$$$\| $$$$$$$\|  $$$$$$$
   | $$   | $$  | $$| $$    $$      | $$      /      $$| $$  | $$| $$  | $$
   | $$   | $$  | $$| $$$$$$$$      | $$_____|  $$$$$$$| $$  | $$| $$__| $$
   | $$   | $$  | $$ \$$     \      | $$     \\$$    $$| $$  | $$ \$$    $$
    \$$    \$$   \$$  \$$$$$$$       \$$$$$$$$ \$$$$$$$ \$$   \$$  \$$$$$$$
    
    
                ______
	           /      \
	  ______  |  $$$$$$\
	 /      \ | $$_  \$$
	|  $$$$$$\| $$ \
	| $$  | $$| $$$$
	| $$__/ $$| $$
	 \$$    $$| $$
	  \$$$$$$  \$$
	  
	 _______                        __      __
	|       \                      |  \    |  \
	| $$$$$$$\  ______    ______  _| $$_   | $$____
	| $$  | $$ /      \  |      \|   $$ \  | $$    \
	| $$  | $$|  $$$$$$\  \$$$$$$\\$$$$$$  | $$$$$$$\
	| $$  | $$| $$    $$ /      $$ | $$ __ | $$  | $$
	| $$__/ $$| $$$$$$$$|  $$$$$$$ | $$|  \| $$  | $$
	| $$    $$ \$$     \ \$$    $$  \$$  $$| $$  | $$
	 \$$$$$$$   \$$$$$$$  \$$$$$$$   \$$$$  \$$   \$$
									|--------------------------------|
									|Project Land Of Death by VinPure|
									|-Script Start 5:30pm 18/07/2014-|
									|===========Status Devlop========|
|===================================|
|Credits :
Y_less |for Y_ini |Y_timers| sscanf2
Zeex |For Zcmd
Southclaw| for playerprogressbar
|Mionee| for campfire and tree :)
OrMisicL| For FCNPC
d0| for mSelection
Incognito|for streamer
VinPure| Owner this gamemode
|===================================|
*/
#define GNAME "LoD:Z 1.2b"
#define MNAME "mapname |-[LandDeath]-|"
#define HNAME "hostname The Land Of Death [Status:Dev]"

#include <a_samp>// SAMP TEAM
#include <sscanf2>
#include <streamer>
#include <YSI\y_ini>
#include <YSI\y_timers>
#include <FCNPC>
#include <playerprogress>
#include <mSelection>
#include <zcmd>
#include "../include/gl_common.inc"
//zombie

#define MAX_ZOMBIES 500
//key
#define PRESSED(%0) \
        (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
//message
#define SCM SendClientMessage
//color
#define COLOR_FADE1 0xFFFFFFFF
#define COL_WHITE "{FFFFFF}"
#define COL_RED "{F81414}"
#define COL_GREEN "{00FF22}"
#define COL_LIGHTBLUE "{00CED1}"
#define COLOR_LIGHTBLUE 0x006FDD96
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_FADE 0xC8C8C8C8
#define COLOR_PURPLE 0xC2A2DAAA
#define COLOR_GRAD2 0xBFC0C2FF

#define COLOR_FADE2 0xC8C8C8C8
#define COLOR_GRAD1 0xB4B5B7FF
#define COLOR_FADE3 0xAAAAAAAA
#define COLOR_FADE4 0x8C8C8C8C
#define COLOR_FADE5	0x6E6E6E6E
#define yellow 0xFFFF00AA
#define COLOR_RED 0xFF0000FF
#define	RADIO "{DC9508}"
#define COLOR_BLUE 0x0000BBAA
#define COLOR_GREEN 0x33AA33AA
#define FACTION_CHAT "{13B600}"
#define COLOR_GREEN 0x33AA33AA
#define COLOR_LIGHTRED 0xFF6347AA
#define orange 0xFF9900AA
#define	COLOR_LIGHTGREEN 0x9ACD32AA
#define	COLOR_PINK 0xFF66FFAA
#define COLOR_WHITE 0xFFFFFFAA
#define greenyellow 0xADFF2FAA
#define COLOR_GOLD 0xB8860BAA
//dialog
#define DIALOG_CRAFT 9999
#define DIALOG_CRAFT1 9998
#define DIALOG_GPS 9997
#define INV_DIALOG_ID 13337
#define INV_DIALOG_DROP 13336
#define DIALOG_SBAN 13335
#define DIALOG_CHANGELOG 13334
#define DIALOG_REGISTER 1
#define DIALOG_LOGIN 2
#define DIALOG_GRNDER 3
//dialog craft item

#define DIALOG_CRAFTFISH 4
#define DIALOG_CRAFTCHAIN 5
#define DIALOG_CRAFTSH 6
#define DIALOG_CRAFTBED 7
#define DIALOG_CRAFTBOX 8
#define DIALOG_CRAFTKNIFE 9
#define DIALOG_CRAFTENGINE 10
#define DIALOG_CRAFTACOLT 11
#define DIALOG_CRAFTASHOT 12
#define DIALOG_CRAFTASMS 13
#define DIALOG_CRAFTAAUS 14
#define DIALOG_CRAFTARIFLE 15
#define DIALOG_CRAFTTOOLBOX 16
#define DIALOG_CRAFTHAMMER 17
#define DIALOG_CRAFTWALL 18
#define DIALOG_CRAFTWALLDOOR 19
#define DIALOG_CRAFTGATE 20
#define DIALOG_CSKIN1 21
#define DIALOG_CSKIN2 22
#define DIALOG_CSKIN3 23
#define DIALOG_CSKIN4 24
#define Dialog_Edit 500
#define Dialog_Down 501
#define Dialog_GetRangeBase 502
///
#define CUSTOM_MENU 1
#define MENUCRAFTSKIN 2
#define MENUCRAFTSKIN2 3
//path user
#define PATH "/Users/%s.ini"
//ITEM
#define MAX_BASES 2000
#define RangeInBase 3
#define MAX_DEERS 100
#define MAX_SZ 100
#define MAX_DROP_ITEMS 100
#define MAX_ITEMS 99
#define MAX_ITEM_STACK 99
#define MAX_ITEM_NAME 24
#define MAX_BOXS 100

//item model
#define ModelDeerSkin 2386
#define ModelBandage 1575
#define ModelMedkit 1580
#define ModelPizza 1582
#define ModelBurger 2703//CreateObject(19094, 232.88930, 1788.97241, 16.69864,   -17.34000, -89.34000, -28.20000);
#define ModelSoda 2601
#define ModelWater 1950
#define ModelEWater 1951
#define ModelHammer 18635
#define ModelGate1 2930
#define ModelGate2 3050
#define ModelWall 19356
#define ModelWalldoor 19386
new VR[3] =
{
470,
471,
468
};
new IRB[5] =
{
ModelHammer,
ModelGate1,
ModelGate2,
ModelWall,
ModelWalldoor
};
new IRH[2]=
{
ModelBandage,
ModelMedkit
};
new IFoodR[11] =
{
1582,2703,2601,1950,1951,346,348,349,352,372,19513
};
#define ModelBalo5 363
#define ModelBalo10 3026//CreateObject(3026, 239.05396, 1702.35413, 21.63291,   -88.19998, -64.43996, -57.05999);
#define ModelBalo20 371
#define ModelBalo30 2663
#define ModelBalo40 2060
#define ModelBalo50 1310
new IBaloR[8] =
{
3026,371,2663,2060,1310,19513,1650,2057
};
#define ModelToolbox 2694
#define ModelBox 1271
#define ModelBed 2384
#define ModelEngine 920
#define ModelMeatUC 2806
#define ModelMeatC 2804
#define ModelFishUC 1600
#define ModelFishC 1599
#define ModelFishRob 18632
#define ModelIron 905
#define ModelCU 2936
#define ModelGolf 333
#define ModelNight 334
#define ModelKnife 335
#define ModelBaseball 336
#define ModelShovel 337
#define ModelPool 338
#define ModelKatana 339
#define ModelChainsaw 341
#define ModelPurple 321
#define ModelDildo 322
#define ModelVibrator 323
#define ModelSilver 324
#define ModelFlowers 325
#define ModelCane 326
#define ModelGrenade 342
#define ModelTearGas 343
#define ModelMolotov 344
#define Model9mm 346
#define ModelSilenced 347
#define ModelDeagle 348
#define ModelShotgun 349
#define ModelSawnoff 350
#define ModelCombat 351
#define ModelUzi 352
#define ModelMp5 353
#define ModelAK47 355
#define ModelM4 356
#define ModelTec9 372
#define ModelRifle 357
#define ModelSniper 358
#define ModelSpraycan 365
#define ModelFire 366
#define ModelCamera 367
//Ammo
#define ModelAColt 2037
#define ModelAShotgun 2039
#define ModelASMS 2038
#define ModelAAus 2040
#define ModelARifle 2969
//gas
#define ModelGascan 1650
#define ModelEGascan 2057
//GPS
#define ModelGpsMap 19513
#define ModelWood 1463
//
#define GetPlayerCash(%0) PlayerInfo[%0][pCash]
#define GivePlayerCash(%0,%1) PlayerInfo[%0][pCash] += (%1)
//=============================================
#define GetPlayerHunger(%0) PlayerInfo[%0][pHunger]
#define SetPlayerHunger(%0,%1) PlayerInfo[%0][pHunger] = (%1)
#define GivePlayerHunger(%0,%1) PlayerInfo[%0][pHunger] += (%1)
#define GivePlayerHP(%0,%1) PlayerInfo[%0][hp] += (%1)
#define SetPlayerHP(%0,%1) PlayerInfo[%0][hp] = (%1)
//
#define GetPlayerThirst(%0) PlayerInfo[%0][pThirst]
#define SetPlayerThirst(%0,%1) PlayerInfo[%0][pThirst] = (%1)
#define GivePlayerThirst(%0,%1) PlayerInfo[%0][pThirst] += (%1)
//
#define GetPlayerHP(%0) PlayerInfo[%0][hp]
#define MAX_FUEL 100
#define FUEL_DECREASE 1
#define MAX_TREES 100
//enum
#define MAX_CAMPFIRES 100
#define MAX_BEDS 100
enum CampfireInfo
{
    LogObj,
    FireObj,
    Float: xPos,
    Float: yPos,
    Float: zPos,
}
new cfInfo[MAX_CAMPFIRES][CampfireInfo];
new cfCount;
enum BoInfo
{
    ID,
    Obj,
    Float: xPos,
    Float: yPos,
    Float: zPos,
	Item[10],
}

new BoxInfo[MAX_BOXS][BoInfo];


enum bedi
{
	bObj,
Float:bx,
Float:by,
Float:bz,
}

new BedInfo[MAX_BEDS][bedi];
new bedCount;
new MINERT[MAX_PLAYERS];
new CutT[MAX_PLAYERS];
new FishTimer[MAX_PLAYERS];
new CookTimer[MAX_PLAYERS];
enum TreeInfo
{
    ID,
    Obj,
    Type,
    TModel,
    Float: Health,
    Float: xPos,
    Float: yPos,
    Float: zPos,
    Float: rxPos,
    Float: ryPos,
    Float: rzPos,
}
new tInfo[MAX_TREES][TreeInfo];
new tCount;
new Text3D:Text[MAX_TREES];
enum szInfo
{
 Float:szPosX,
 Float:szPosY,
 Float:szPosZ,
 szSize,
 szPickupID,
 Text3D: szTextID,
};
new SafeZoneInfo[MAX_SZ][szInfo];
enum pInfo
{
    pPass,
	pLog,
    pCash,
    pBleed,
    pSleep,
    pEXP,
    pNEXP,
    pLv,
    pAdmin,
    pKills,
    pDeaths,
    pSpawn,
    pSkin,
	pSlot,
	pSlotu,
	pBanned,
	pHunger,
	pThirst,
	pMale,
	pHas,
	pNoR,
	pWeapon[13],
	pWeapona[13],
	pAmmoColt,
	pAmmoShotgun,
	pAmmoSMS,
	pAmmoAus,
	pAmmoRifle,
Float:hp,
Float:sposx,
Float:sposy,
Float:sposz,
}
new PlayerInfo[MAX_PLAYERS][pInfo];
enum wc
{
Weapon1,
Weapon2,
Weapon3,
Weapon4,
Weapon5,
Weapon6,
Weapon7,
Weapon8,
Weapon9,
Weapon10,
Weapon11,
Weapon12
}
new WeaponAnti[MAX_PLAYERS][wc];
//item
new DropObject[MAX_DROP_ITEMS]; // object drop id
new    Text3D:Label[MAX_DROP_ITEMS]; // Label Model
//vehicle data
enum vd
{
	SEngine,
	Engine,
	Lights,
	Fuel
}
new VInfo[MAX_VEHICLES][vd];
//=================
enum ItemData
{
    ItemModel,//Model object
    ItemAmount,//Amount for gun
    Float:ItemPosX,
    Float:ItemPosY,
    Float:ItemPosZ,
    Float:ItemRotX,
    Float:ItemRotY,
    Float:ItemRotZ,
    ItemVWorld,
    ItemInterior,
};
new ItemInfo[MAX_DROP_ITEMS][ItemData];
enum baInfo
{
	bID,
	bObject,
	bModel,
	bLock,
	bPass,
	Float:bX,
	Float:bY,
	Float:bZ,
	Float:bRX,
	Float:bRY,
	Float:bRZ,
	bvID,
	bInt,
	bool:bLifup,
}
new BaseInfo[MAX_BASES][baInfo];

new PlayerUseingBase[MAX_PLAYERS];
new bool:PlayerLiftup[MAX_PLAYERS];
new bool:PlayerPutDown[MAX_PLAYERS];

new RecoveryLiftTimer;
new ShowPlayerRangeBase[MAX_PLAYERS][MAX_BASES];

//TEXT
new Text:FuelText[MAX_PLAYERS];
new FuelTimer[MAX_PLAYERS];
new Text:TLOGIN0;
new Text:TLOGIN1;
new Text:TLOGIN2;
new Text:TLOGIN3;
new Text:TLOGIN4;
new Text:TLOGIN5;
new Text:TLOGIN6;
new Text:TLOGIN7;

new Text:Radar0;
new Text:Radar1;
new Text:Radar2;
new Text:Radar3;
new Text:TextPick;
new Text:TextFull;


new PlayerText:TextAmmo;
new PlayerText:TextLv;
new PlayerText:TextXP;
new PlayerText:Gender0[MAX_PLAYERS];
new PlayerText:Gender1[MAX_PLAYERS];
new PlayerText:Gender2[MAX_PLAYERS];
new PlayerText:Gender3[MAX_PLAYERS];
//new
new Deer[MAX_DEERS];
new DeerC[MAX_DEERS];
new gPlayerUsingLoopingAnim[MAX_PLAYERS];
//random
new Float:DeerSpawn[21][3]=
{
{-475.22012, -387.80862, 14.93388},//
{-814.95184, -789.86145, 152.69458},
{-820.04846, -801.82751, 149.54356},
{-843.11810, -812.59625, 149.03250},

{-1061.10583, -989.05859, 128.63142},
{-1087.23853, -975.28485, 128.63142},
{-1095.62305, -949.64294, 128.63142},
{-998.71204, -1580.69971, 75.74928},
{-993.51556, -1585.88379, 75.74928},
{-815.17487, -2020.73645, 14.63516},
{-448.08316, -2160.36255, 86.19398},
{-710.33075, -2455.31836, 67.16925},
{-692.01318, -2439.49121, 64.41492},
{-1322.94849, -2110.92896, 27.15998},
{-1264.87451, -2112.70215, 24.73434},
{-1659.87561, -2194.57227, 32.78931},
{ -1792.07507, -2175.78125, 72.54773},
{ -1939.97278, -1903.64844, 83.94247},
{ -2087.59448, -2138.61768, 47.42846},
{-2066.40259, -2158.11450, 47.42846},
{-2079.26050, -2160.11963, 47.42846}
};
Float:frandom(Float:max, Float:min = 0.0, dp = 4)
{
    new
        Float:mul = floatpower(10.0, dp),
        imin = floatround(min * mul),
        imax = floatround(max * mul);
    return float(random(imax - imin) + imin) / mul;
}
//
new Float:RandomZombieSpawns[][] =
{
{-171.1855,-1631.5089,3.0859},
{-569.2733,-1504.4659,9.4300},
{-771.5753,-1722.9033,96.5381},
{-974.9813,-1729.6044,78.1577},
{-1040.8915,-1502.0973,72.7646},
{-210.0729,-1154.0865,6.4385},
{-56.6684,-1046.6082,20.7571},
{-290.9406,-960.0486,43.8138},
{-421.1462,-774.7028,31.2973},
{-516.3077,-490.7904,25.5234},
{-915.1376,-483.6267,26.0283},
{-1035.9385,-644.3250,32.0078},
{-1034.8837,-653.5448,32.0078},
{-1195.3049,-805.4581,64.9957},
{-1300.3389,-900.9330,169.0190},
{-1416.7313,-962.2136,201.0080},
{-2061.6296,-845.2054,32.1719},
{-1977.6667,-856.6808,32.0312},
{-2002.3461,-1019.0225,41.3583},
{-1949.1593,-1060.1122,31.9603},
{-1989.8132,-1551.7104,86.4067},
{-2260.8750,-1705.7930,479.7042},
{-2453.0610,-1735.8219,427.6735},
{-2527.0295,-1796.0148,376.9681},
{-2816.6704,-1527.2837,140.8438},
{-2220.6394,-2319.7439,30.6079},
{-2117.5376,-2435.5769,30.4688},
{-2077.2063,-2515.4985,30.4219},
{-2032.1549,-2357.4792,41.5254},
{-1973.2440,-2810.5413,3.5095},
{-1622.9867,-2756.9170,46.9219},
{-1456.1862,-2593.5620,66.6937},
{-1238.8818,-2324.2847,19.1776},
{-1504.8674,-2140.5615,0.9986},
{-1639.7543,-2240.9470,31.4766},
{-1827.9250,-2194.4907,79.8057},
{-1798.2489,-1941.5621,94.5565},
{-1112.3979,-2132.9417,36.2541},
{-1001.8624,-2298.1890,60.8083},
{-888.0666,-2244.5369,32.3320},
{-580.9300,-2351.6145,27.6216},
{-322.1050,-2538.2227,111.2268},
{-18.6324,-2516.2568,36.6555},
{-238.1391,-2238.8904,28.8496},
{-705.0992,-1897.1550,9.3610},
{-462.9381,-1875.1792,6.8230},
{-240.5152,-1766.3812,6.1464},
{-275.2093,-1518.4501,5.1434},
{-324.0306,-1110.0482,58.5214},
{-557.0024,-956.1263,61.6290}
};
new Float:RandomSpawns[][] =
{
{-89.0351,-1564.9932,3.0043,105.2555},
{-88.2427,-1202.1268,2.8906,295.5774},
{-359.7300,-1042.5619,59.3953,151.4224},
{-583.7015,-1056.2892,23.1733,220.9766},
{-572.4352,-1498.3156,9.5611,315.5179},
{-365.9491,-1418.1000,25.7266,197.9067},
{-1097.9579,-1622.5590,76.3672,62.8151},
{-1059.6812,-1193.8805,129.2188,87.8313},
{-1434.7700,-1496.1621,101.7292,186.8205},
{-1845.9764,-1707.5901,41.1129,25.4613},
{-2204.0164,-2309.8787,31.3750,49.2681}
};
//new Forward

forward CreateBase(idx);
forward Lift(playerid);
forward PutDown(playerid);
forward RecoveryLift();
forward CookFish(Float:x,Float:y,Float:z);
forward CookMeat(Float:x,Float:y,Float:z);
forward ExtFire(fireid);

forward MINET(playerid);
forward CuTi(playerid);
forward FishingT(playerid);
forward FuelDown(playerid);
forward OnPlayerUseItem(playerid,ItemName[]);
forward OnPlayerDropItem(playerid,ItemName[]);
forward LoadUser_data(playerid,name[],value[]);
forward OnPlayerPickupItem(playerid);
forward ZMOVE(npcid);
forward ResetNPCKeys(npcid);
forward HungerSystem(playerid);
forward SleepSystem(playerid);
forward AntiCheat(playerid);
forward MessageToAdmins(color, str[]);
new iItemList[(MAX_ITEMS+1)*(MAX_ITEM_NAME+3)];
//vehicle


//bar
new PlayerBar:mining;
new PlayerBar:sleepb;
new PlayerBar:cutting;
new PlayerBar:bhealth;
new PlayerBar:bhunger;
new PlayerBar:bwater;
new PlayerBar:devb;
//new PlayerBar:Crafting;
/* Pawno/Infernus Pawn Editor function list
native PlayerBar:CreatePlayerProgressBar(playerid, Float:x, Float:y, Float:width=55.5, Float:height=3.2, color, Float:max=100.0);
native DestroyPlayerProgressBar(playerid, PlayerBar:barid);
native ShowPlayerProgressBar(playerid, PlayerBar:barid);
native HidePlayerProgressBar(playerid, PlayerBar:barid);
native SetPlayerProgressBarValue(playerid, PlayerBar:barid, Float:value);
native Float:GetPlayerProgressBarValue(playerid, PlayerBar:barid);
native SetPlayerProgressBarMaxValue(playerid, PlayerBar:barid, Float:max);
native SetPlayerProgressBarColor(playerid, PlayerBar:barid, color);
native UpdatePlayerProgressBar(playerid, PlayerBar:barid);
*/
main()
{
	print("----------------------------------");
	print("---------The Land of Death--------");
	print("----------------------------------");
}

new hidemap;

public OnGameModeInit()
{
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
    ShowNameTags(0);
	SetGameModeText(GNAME);
	SendRconCommand(MNAME);
	SendRconCommand(HNAME);
	ZombieInit();
	TextC();
	ItemInit();
	ManualVehicleEngineAndLights();
	LoadTrees();
	LoadBox();
	LoadBase();
	LoadSafeZones();
	SetTimer("Bleeding",5000,1);
    RecoveryLiftTimer = SetTimer("RecoveryLift", 2000, true);
	Create3DTextLabel("Fish Point /fish", 0x008080FF,-1219.8186,-2363.8599,1.0119, 40.0, 0, 0);
	Create3DTextLabel("Fish Point /fish", 0x008080FF,-1207.7113,-2602.2327,1.0976, 40.0, 0, 0);
	Create3DTextLabel("Fish Point /fish", 0x008080FF,-1178.8430,-2632.9854,11.7578, 40.0, 0, 0);
	return 1;
}
public OnGameModeExit()
{
    KillTimer(RecoveryLiftTimer);
	ZombieExit();

	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SpawnPlayer(playerid);
	return 1;
}
forward UnHass(playerid);
public UnHass(playerid)
{
    PlayerInfo[playerid][pHas] = 0;
	return 1;
}
public OnPlayerUpdate(playerid)
{
    if(GetPlayerAnimationIndex(playerid))
    {
        new animlib[32];
        new animname[32];
        GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,animname,32);
        if(!strcmp(animname,"FALL_COLLAPSE",true))
		{
		if(PlayerInfo[playerid][pHas] == 0)
		{
		GivePlayerHP(playerid,-10);
		SCM(playerid,COLOR_RED,"You fall and will -10 hp");
		PlayerInfo[playerid][pHas] = 1;
		SetTimerEx("UnHass",3000,0,"i",playerid);
		}
		}
		if(!strcmp(animname,"KO_SKID_BACK",true))
		{
		if(PlayerInfo[playerid][pHas] == 0)
		{
		GivePlayerHP(playerid,-20);
		SCM(playerid,COLOR_RED,"You fall and will -20 hp");
		PlayerInfo[playerid][pHas] = 1;
		SetTimerEx("UnHass",3000,0,"i",playerid);
		}
		}
        //SCM(playerid, 0xFFFFFFFF, msg);
    }
    
	for(new Sz; Sz < MAX_SZ; Sz++)
	{
		if(IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
		{
		SetPlayerArmedWeapon(playerid, 0);
		}
	}
    for(new i = 0; i < sizeof(ItemInfo); i++)
    {
        if (IsPlayerInRangeOfPoint(playerid, 2.0,ItemInfo[i][ItemPosX],ItemInfo[i][ItemPosY],ItemInfo[i][ItemPosZ]))//when player in range of point item
        {
            if(GetPlayerVirtualWorld(playerid) == ItemInfo[i][ItemVWorld] && GetPlayerInterior(playerid) == ItemInfo[i][ItemInterior])
            {
            TextDrawShowForPlayer(playerid, TextPick);
            }
		}
	}
	if(PlayerHasItem(playerid,"GpsMap"))
	{
	GangZoneHideForPlayer(playerid,hidemap);
	radarhide(playerid);
	}
	else
	{
	GangZoneShowForPlayer(playerid,hidemap,0x000000FF);
	radarshow(playerid);
	}
 	ResetPlayerMoney(playerid);
    GivePlayerMoney(playerid, PlayerInfo[playerid][pCash]);

	if(GetPlayerHP(playerid) <=0)
	{
	PlayerInfo[playerid][pSpawn] = 0;
	PlayerInfo[playerid][hp] = 100;
	SetPlayerHealth(playerid,0);
	}
	new Float:hpz = PlayerInfo[playerid][hp];
	SetPlayerProgressBarValue(playerid,bhealth,hpz);
	SetPlayerProgressBarValue(playerid,sleepb,PlayerInfo[playerid][pSleep]);
	SetPlayerProgressBarValue(playerid,devb,PlayerInfo[playerid][pEXP]);
	SetPlayerProgressBarMaxValue(playerid,devb,PlayerInfo[playerid][pNEXP]);
	SetPlayerProgressBarValue(playerid,bhunger,GetPlayerHunger(playerid));
	SetPlayerProgressBarValue(playerid,bwater,GetPlayerThirst(playerid));
	UpdatePlayerProgressBar(playerid,sleepb);
	UpdatePlayerProgressBar(playerid,bhealth);
	UpdatePlayerProgressBar(playerid,bhunger);
	UpdatePlayerProgressBar(playerid,bwater);
	UpdatePlayerProgressBar(playerid,devb);
	SetPlayerBackpack(playerid);
	new slv[128];
	format(slv, sizeof(slv), "%d",PlayerInfo[playerid][pLv]);
	PlayerTextDrawSetString(playerid,TextLv,slv);
	PlayerTextDrawShow(playerid,TextLv);
	SetPlayerScore(playerid,PlayerInfo[playerid][pLv]);
	GetTAmmo(playerid);
	GetNEXP(playerid);
	return 1;
}
public AntiCheat(playerid)
{
    new weaponid = GetPlayerWeapon(playerid);
	new Float:ar;
	GetPlayerArmour(playerid,ar);
    if(ar > 0)
    {
    new string[128];
    format(string,sizeof(string),"Player %s was banned by System .Reason:Armour hack[%f]",GetName(playerid),ar);
    PlayerInfo[playerid][pBanned] = 1;
    SendClientMessageToAll(COLOR_RED,string);
	Kick(playerid);
    }
    new weapon1 = WeaponAnti[playerid][Weapon1],
    weapon2 =WeaponAnti[playerid][Weapon2],
    weapon3 =WeaponAnti[playerid][Weapon3],
    weapon4 =WeaponAnti[playerid][Weapon4],
    weapon5 =WeaponAnti[playerid][Weapon5],
    weapon6 =WeaponAnti[playerid][Weapon6],
    weapon7 =WeaponAnti[playerid][Weapon7],
    weapon8 =WeaponAnti[playerid][Weapon8],
    weapon9 =WeaponAnti[playerid][Weapon9],
    weapon10 =WeaponAnti[playerid][Weapon10],
    weapon11 =WeaponAnti[playerid][Weapon11],
    weapon12 =WeaponAnti[playerid][Weapon12];
    new string[128];
    switch(weaponid)
    {
    case 2..46:
    {
    if(weapon1 != weaponid&&weapon2 != weaponid&&weapon3 != weaponid&&weapon4 != weaponid&&weapon5 != weaponid&&weapon6 != weaponid&&weapon7 != weaponid&&weapon8!= weaponid&&weapon9 != weaponid&&weapon10 != weaponid&&weapon11 != weaponid&&weapon12 != weaponid)
    {
    format(string,sizeof(string),"Player Id:%d has hack weapon id:%s",playerid,weaponid);
    SendClientMessageToAll(-1,string);
    RemovePlayerWeapon(playerid, weaponid);
    }
    }
    }
	TextDrawHideForPlayer(playerid, TextFull);
	TextDrawHideForPlayer(playerid, TextPick);
	if(GetPlayerSkin(playerid) != PlayerInfo[playerid][pSkin])
	{
	SetPlayerSkin(playerid,PlayerInfo[playerid][pSkin]);
	SCM(playerid,COLOR_RED,"Please you does not use skin hack");
	}
}
public OnPlayerConnect(playerid)
{
//852308735
    PlayerUseingBase[playerid] = 0;
    PlayerLiftup[playerid] = false;
    PlayerPutDown[playerid] = false;
	//
	PreloadAnimLib(playerid, "CARRY");
	PreloadAnimLib(playerid, "Freeweights");
	gPlayerUsingLoopingAnim[playerid] =0;
	textconnect(playerid);//256.00, 435.00, 128.50, 10.50, -16776961, 100.0);
	sleepb = CreatePlayerProgressBar(playerid,548.00, 47.00, 57.50, 3.19, -1048321, 100.0);
	cutting = CreatePlayerProgressBar(playerid,256.00, 435.00, 128.50, 10.50, -16776961, 100.0);
	mining = CreatePlayerProgressBar(playerid,256.00, 435.00, 128.50, 10.50, -16776961, 100.0);
//	Crafting = CreatePlayerProgressBar(playerid,256.00, 435.00, 128.50, 10.50, -16776961, 100.0);
	bhealth = CreatePlayerProgressBar(playerid, 549.00, 69.00, 56.50, 3.20, 852308735, 100.0);
	bhunger = CreatePlayerProgressBar(playerid, 513.00, 101.00, 44.50, 4.19, -1048321, 100.0);
	bwater =	CreatePlayerProgressBar(playerid,560.00, 101.00, 45.50, 4.19, 869072810, 100.0);
	devb = CreatePlayerProgressBar(playerid,500.00, 112.00, 106.50, 9.50, -1048321, 100.0);
	LoadInventory(playerid);
    if(fexist(UserPath(playerid)))
    {
        INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
        if(PlayerInfo[playerid][pBanned] == 1) return ShowBan(playerid);
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Login",""COL_WHITE"Wellcome back "COL_RED"The Land Of Death\n"COL_WHITE"Please write password to login","Login","Quit");
    }
    else
    {
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT,""COL_WHITE"Register",""COL_WHITE"Wellcome to "COL_RED"The Land of Death\n"COL_WHITE"Please register before player.","Register","Quit");
    }
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{

	SetPVarInt(playerid,"Cut", 0);
	SetPVarInt(playerid,"InCut",0);
	HidePlayerProgressBar(playerid,cutting);
    TextDrawDestroy(FuelText[playerid]);
    if(PlayerLiftup[playerid] == true)
	{
	    PlayerLiftup[playerid] = false;
    	BaseInfo[PlayerUseingBase[playerid]][bLifup] = false;
    	CreateBase(PlayerUseingBase[playerid]);
    	RemovePlayerAttachedObject(playerid, 9);
	}
	if(PlayerInfo[playerid][pLog] == 1)
	{
	SaveDatabase(playerid);
	SaveInventory(playerid);
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerColor(playerid,COLOR_WHITE);
	textspawn(playerid);
	barsystem(playerid);
	if(IsPlayerNPC(playerid))
	{
		SetTimerEx("ZMOVE",100,1,"i",playerid);
	}
	
	SetTimerEx("HungerSystem",40000,1,"i",playerid);
	SetTimerEx("AntiCheat",2000,1,"i",playerid);
	SetTimerEx("SleepSystem",60000,1,"i",playerid);
    PlayerInfo[playerid][pLog] = 1;
    
    new Random = random(sizeof(RandomSpawns));
	if(PlayerInfo[playerid][pSpawn] == 1)
	{
	SetPlayerPos(playerid,PlayerInfo[playerid][sposx],PlayerInfo[playerid][sposy],PlayerInfo[playerid][sposz]);
	GivePlayerHP(playerid,PlayerInfo[playerid][hp]);
	GivePlayerSkin(playerid,PlayerInfo[playerid][pSkin]);
	GiveGun(playerid);
	}
	else
	{
	PlayerInfo[playerid][pSleep] = 100;
	
	ResetPlayerWeapons(playerid);
	TogglePlayerControllable(playerid,0);
	ShowSelectGender(playerid);
 	SetPlayerPos(playerid, RandomSpawns[Random][0], RandomSpawns[Random][1], RandomSpawns[Random][2]);
    SetPlayerFacingAngle(playerid, RandomSpawns[Random][3]);
    PlayerInfo[playerid][pSlot] = 5;
    PlayerInfo[playerid][pSlotu] = 0;
    PlayerInfo[playerid][hp] = 100;
    SetPlayerHunger(playerid,100);
    SetPlayerThirst(playerid,100);
	AddItem(playerid,"Shovel",1);
	PlayerInfo[playerid][pSlotu] +=1;
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    HidePlayerProgressBar(playerid,mining);
    HidePlayerProgressBar(playerid,cutting);
	SendDeathMessage(killerid,playerid,reason);
	PlayerInfo[playerid][pDeaths] += 1;
	if(!IsPlayerNPC(playerid))
	{
	PlayerInfo[killerid][pKills] += 1;
	}
	new slot = PlayerInfo[playerid][pSlot],Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	
	PlayerInfo[playerid][pSpawn] = 0;
	PlayerInfo[playerid][pHas] = 0;
	PlayerInfo[playerid][hp] = 100.0;
	SetPlayerHunger(playerid,100);
	SetPlayerThirst(playerid,100);

	PlayerInfo[killerid][pEXP]+= 2;
	if(PlayerInfo[killerid][pEXP] == PlayerInfo[killerid][pNEXP])
	{
	PlayerInfo[killerid][pLv] += 1;
	PlayerInfo[killerid][pEXP] = 0;
	}
	
	switch(slot)
	{
	case 10:CreateItem(ModelBalo10,1,x,y,z-1,0,0,0,0,0);
	case 20:CreateItem(ModelBalo20,1,x,y,z-1,0,0,0,0,0);
	case 30:CreateItem(ModelBalo30,1,x,y,z-1,0,0,0,0,0);
	case 40:CreateItem(ModelBalo40,1,x,y,z-1,0,0,0,0,0);
	case 50:CreateItem(ModelBalo50,1,x,y,z-1,0,0,0,0,0);
	}
	CreateItem(ModelMeatUC,1,x-2,y+1,z-1,0,0,0,0,0);
	if(PlayerInfo[playerid][pNoR] == 0)
	{
	ResetPlayerInventory(playerid);
	}
    PlayerInfo[playerid][pNoR] -= 1;
    if(PlayerInfo[playerid][pNoR] <0)
    {
    PlayerInfo[playerid][pNoR] = 0;
    }
    for(new i=1;i<13;i++)
    {
    PlayerInfo[playerid][pWeapon][i] = 0;
    }
	return 1;
}
public SleepSystem(playerid)
{
	PlayerInfo[playerid][pSleep] --;
	if(PlayerInfo[playerid][pSleep] <= 0)
	{
	TogglePlayerControllable(playerid,0);
	SetTimerEx("USleep",120000,0,"i",playerid);
	}
}
forward USleep(playerid);
public USleep(playerid)
{
	TogglePlayerControllable(playerid,1);
	return 1;
}
public HungerSystem(playerid)
{
	if(PlayerInfo[playerid][pThirst] <= 0)
	{
	SetPlayerHP(playerid,-100);
	SetPlayerHunger(playerid,100);
	SetPlayerThirst(playerid,100);
	PlayerInfo[playerid][hp] = 100;
	PlayerInfo[playerid][pSpawn] = 0;
	}
	if(PlayerInfo[playerid][pHunger] <= 0)
	{
	SetPlayerHP(playerid,-100);
	SetPlayerHunger(playerid,100);
	SetPlayerThirst(playerid,100);
	PlayerInfo[playerid][hp] = 100;
	PlayerInfo[playerid][pSpawn] = 0;
	}
	PlayerInfo[playerid][pThirst] -= 2;
	PlayerInfo[playerid][pHunger] -= 1;
    return 1;
}
public OnVehicleSpawn(vehicleid)
{

    SetVehicleParamsEx(vehicleid,0,0,0,0,0,0,0);
    VInfo[vehicleid][Fuel] = 0;
	VInfo[vehicleid][SEngine] = 0;
	VInfo[vehicleid][Lights] = 0;
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	new weapon = GetPlayerWeapon(playerid);
	//Rifle , Sniper
	if(weapon == 33 || weapon == 34)
	{
	if(PlayerInfo[playerid][pAmmoRifle] >0)
	{
	PlayerInfo[playerid][pAmmoRifle] --;
	}
	else if(PlayerInfo[playerid][pAmmoRifle] <=0)
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	//M4 AK
	if(weapon == 30||weapon == 31)
	{
	if(PlayerInfo[playerid][pAmmoAus] >0)
	{
	PlayerInfo[playerid][pAmmoAus]--;
	}
	else if(PlayerInfo[playerid][pAmmoAus] <=0)
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	//UZI MP5 TEC9
	if(weapon == 28 || weapon == 29||weapon == 32)
	{
	if(PlayerInfo[playerid][pAmmoSMS] > 0)
	{
	PlayerInfo[playerid][pAmmoSMS] --;
	}
	else if(PlayerInfo[playerid][pAmmoSMS] <= 0)
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	//Shotgun Sawnoff CombatS
	if(weapon == 25 || weapon == 26||weapon == 27)
	{
	if(PlayerInfo[playerid][pAmmoShotgun] > 0)
	{
	PlayerInfo[playerid][pAmmoShotgun] --;
	}
	else if(PlayerInfo[playerid][pAmmoShotgun] <= 0)
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	//9mm s9mm DE
	if(weapon == 22 || weapon == 23||weapon == 24)
	{
	if(PlayerInfo[playerid][pAmmoColt] > 0 )
	{
	PlayerInfo[playerid][pAmmoColt] --;
	}
	else if(PlayerInfo[playerid][pAmmoColt] <= 0 )
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	return 1;
}
forward UnF(playerid);
public UnF(playerid)
{
    TogglePlayerControllable(playerid,1);
	return 1;
}
public OnPlayerText(playerid, text[])
{
    new pname[MAX_PLAYER_NAME], str[128],Float:x,Float:y,Float:z;
    GetPlayerPos(playerid,x,y,z);
    GetPlayerName(playerid, pname, sizeof(pname));
    format(str, sizeof(str), "%s [:0] %s", pname, text);
	for(new m =0;m<MAX_PLAYERS;m++)
	{
	if(IsPlayerInRangeOfPoint(m,20,x,y,z))
	{
	SCM(m,COLOR_FADE1,str);
	}
	}
    return 0;
}
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
    if(issuerid == INVALID_PLAYER_ID) return 1;
	if(bodypart == 9)
    {
	SetPlayerHP(playerid,-1);
    }
    
	if(IsPlayerNPC(issuerid))
	{
	if(FCNPC_GetWeapon(issuerid) == 0)
	{
	GivePlayerHP(playerid,-20);
	}
	}
	if(weaponid >= 22) return PlayerInfo[playerid][pBleed] = 1;
	return 1;
}
public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
	if(!IsPlayerNPC(playerid) || !IsPlayerNPC(damagedid))
	{
	if(damagedid != INVALID_PLAYER_ID)
	{
	if(weaponid == 0) { PlayerInfo[damagedid][hp] -= 5; }
	if(weaponid == 1) { PlayerInfo[damagedid][hp] -= 8; }
	if(weaponid == 2) { PlayerInfo[damagedid][hp] -= 10; }
	if(weaponid == 3) { PlayerInfo[damagedid][hp] -= 10; }
	if(weaponid == 4) { PlayerInfo[damagedid][hp] -= 12; }
	if(weaponid == 5) { PlayerInfo[damagedid][hp] -= 13; }
	if(weaponid == 6) { PlayerInfo[damagedid][hp] -= 10; }
	if(weaponid == 7) { PlayerInfo[damagedid][hp] -= 10; }
	if(weaponid == 8) { PlayerInfo[damagedid][hp] -= 20; }
	if(weaponid == 9) { PlayerInfo[damagedid][hp] -= 25; }
	if(weaponid == 10) { PlayerInfo[damagedid][hp] -= 50; }
	if(weaponid == 11) { PlayerInfo[damagedid][hp] -= 20; }
	if(weaponid == 12) { PlayerInfo[damagedid][hp] -= 25; }
	if(weaponid == 13) { PlayerInfo[damagedid][hp] -= 25; }
	if(weaponid == 16) { PlayerInfo[damagedid][hp] -= 70; }
	if(weaponid == 22) { PlayerInfo[damagedid][hp] -= 25; }
	if(weaponid == 25) { PlayerInfo[damagedid][hp] -= 35; }
	if(weaponid == 26) { PlayerInfo[damagedid][hp] -= 30; }
	if(weaponid == 27) { PlayerInfo[damagedid][hp] -= 35; }
	if(weaponid == 28) { PlayerInfo[damagedid][hp] -= 15; }
	if(weaponid == 29) { PlayerInfo[damagedid][hp] -= 25; }
	if(weaponid == 30) { PlayerInfo[damagedid][hp] -= 25; }
	if(weaponid == 31) { PlayerInfo[damagedid][hp] -= 30; }
	if(weaponid == 32) { PlayerInfo[damagedid][hp] -= 15; }
	if(weaponid == 33) { PlayerInfo[damagedid][hp] -= 35; }
	if(weaponid == 34) { PlayerInfo[damagedid][hp] -= 50; }
	if(IsPlayerConnected(playerid))
	{
	PlayerPlaySound(playerid, 17802, 0.0, 0.0, 0.0);
	}
	}
	}
	
	for(new Sz; Sz < MAX_SZ; Sz++)
	{
	if(IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
	{
	if(!IsPlayerAdmin(playerid))
	{
	GameTextForPlayer(playerid, "~r~Unauthorized Attack", 5000, 3);
	TogglePlayerControllable(playerid, 0);
	SetTimer("LoadPlayer", 5000, false);

	GivePlayerHP(playerid,-amount*2);

	}
	}
	if(!IsPlayerInRangeOfPoint(playerid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
	{
	if(IsPlayerInRangeOfPoint(damagedid, SafeZoneInfo[Sz][szSize], SafeZoneInfo[Sz][szPosX], SafeZoneInfo[Sz][szPosY], SafeZoneInfo[Sz][szPosZ]))
	{
	if(!IsPlayerAdmin(playerid))
	{
	GameTextForPlayer(playerid, "~r~Unauthorized Attack", 5000, 3);
	TogglePlayerControllable(playerid, 0);
	SetTimer("LoadPlayer", 5000, false);
	GivePlayerHP(playerid,-70);
	}
	}
	}
	}
	return 1;
}
forward LoadPlayer(playerid);
public LoadPlayer(playerid)
{
    TogglePlayerControllable(playerid,1);
	return 1;
}
CMD:gps(playerid,params[])
{
	if(PlayerHasItem(playerid,"GpsMap"))
	{
	ShowPlayerDialog(playerid,DIALOG_GPS,2,"Gps Point","Miner1\nMiner2\nFish1\nFish2\nFish3","Ok","Close");
	}
	else
	{
	SCM(playerid,-1,"You no have gps");
	}
	return 1;
}
CMD:sleep(playerid,params[])
{
	for(new i; i < MAX_BEDS; i ++)
    {
    if(IsPlayerInRangeOfPoint(playerid, 5.0, BedInfo[i][bx],BedInfo[i][by],BedInfo[i][bz]))
    {
	if(PlayerInfo[playerid][pSleep] > 20) return SCM(playerid,COLOR_RED,"You can not sleep now");
	TogglePlayerControllable(playerid, 0);
	LoopingAnim(playerid,"CRACK","crckdeth2",4,1,1,1,0,58000);
	GameTextForPlayer(playerid, "~w~Sleeping....", 5000, 1);
	SetTimerEx("Sleep",60000,0,"i",playerid);
	}
	}
	return 1;
}
forward Sleep(playerid);
public Sleep(playerid)
{
	PlayerInfo[playerid][pSleep] = 100;
	ClearAnimations(playerid);
	TogglePlayerControllable(playerid, 1);
	return 1;
}
CMD:craft(playerid,params[])
{
	ShowPlayerDialog(playerid,DIALOG_CRAFT,2,"CRAFT ITEM","FishingRob\nChainsaw\nShovel\nBedPack\nBox\nKnife\nEngine\nAmmoPistol\nAmmoShotgun\nAmmoSMS\nAmmoAus\nAmmoRifle\nToolbox","Ok","Close");
	return 1;
}
CMD:craftweapon(playerid,params[])
{
	return 1;
}
CMD:craft2(playerid,params[])
{
	ShowPlayerDialog(playerid,DIALOG_CRAFT1,2,"Craft Item","Hammer\nWall\nWalldoor\nGate","Choose","Close");
	return 1;
	
}
CMD:craftskin(playerid,params[])
{
	if(PlayerInfo[playerid][pMale]  == 1)
	{
	new cskin[2];
	cskin[0] = 170;
	cskin[1] = 294;
	ShowModelSelectionMenuEx(playerid,cskin,2, "Craft Skin",MENUCRAFTSKIN, 0.0, 0.0, 0.0);
	}
	else
	{
	new fskin[2];
	fskin[0]=157;
	fskin[1]=169;
	ShowModelSelectionMenuEx(playerid,fskin,2, "Craft Skin",MENUCRAFTSKIN2, 0.0, 0.0, 0.0);
	}
	return 1;
}
CMD:putdown(playerid,params[])
{
	if(PlayerLiftup[playerid] == true && PlayerPutDown[playerid] == false)
	{
	ShowPlayerDialog(playerid, Dialog_Down, DIALOG_STYLE_MSGBOX, "Base Operate", "PutDown", "PutDown", "Close");
	}
	return 1;
}
CMD:editbase(playerid,params[])
{
	new string[256];
	if(!PlayerHasItem(playerid,"Hammer")) return SCM(playerid,COLOR_RED,"You need hammer to edit and build");
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
	PlayerUseingBase[playerid] = GetClosestBase(playerid);
	if(BaseInfo[PlayerUseingBase[playerid]][bLock] == 1) return SCM(playerid,-1,"This base is lock");
	if(PlayerUseingBase[playerid] != -1)
	{
	if(PlayerLiftup[playerid] == true) return SCM(playerid, 0xFFFF00C8, "* You are using a Base So, You can not use other Base!");
	if(GetPlayerVirtualWorld(playerid) != BaseInfo[PlayerUseingBase[playerid]][bvID] || GetPlayerInterior(playerid) != BaseInfo[PlayerUseingBase[playerid]][bInt]) return 1;	format(string, sizeof(string), "[Base ID]: %d", BaseInfo[PlayerUseingBase[playerid]][bID]);
	ShowPlayerDialog(playerid, Dialog_Edit, DIALOG_STYLE_LIST, string, "Liftup\nEdit Position\nLock", "Select", "Close");
	}
	}
	return 1;
}
CMD:setpassgatebase(playerid,params[])
{
	new passw;
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
	PlayerUseingBase[playerid] = GetClosestBase(playerid);
	if(BaseInfo[PlayerUseingBase[playerid]][bModel] != ModelGate1&&BaseInfo[PlayerUseingBase[playerid]][bModel] != ModelGate2) return SCM(playerid,-1,"This is not gate");
	if(BaseInfo[PlayerUseingBase[playerid]][bLock] == 1) return SCM(playerid,-1,"This base is lock");
	if(BaseInfo[PlayerUseingBase[playerid]][bPass] > 0) return SCM(playerid,-1,"This base has password");
	if(PlayerUseingBase[playerid] != -1)
	{
	if(sscanf(params, "d",passw)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /setpassgatebase [password]");
	if(passw > 9999) return SCM(playerid,-1,"Password has 4 number");
	if(passw <0)return SCM(playerid,-1,"Password has 4 number");
	BaseInfo[PlayerUseingBase[playerid]][bPass] = passw;
	SaveBase(PlayerUseingBase[playerid]);
	}
	}
	return 1;
}
CMD:opengatebase(playerid,params[])
{
	new Float:x,Float:y,Float:z,passw;
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
	for(new i=1;i<MAX_BASES;i++)
	{
	GetDynamicObjectPos(i,x,y,z);
	PlayerUseingBase[playerid] = GetClosestBase(playerid);
	if(IsPlayerInRangeOfPoint(playerid,2,x,y,z))
	{
	
	if(BaseInfo[PlayerUseingBase[playerid]][bModel] != ModelGate1&&BaseInfo[PlayerUseingBase[playerid]][bModel] != ModelGate2) return SCM(playerid,-1,"This is not gate");
	if(BaseInfo[PlayerUseingBase[playerid]][bPass] == 0) return SCM(playerid,-1,"This gate no have password");
	if(sscanf(params, "d",passw)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /opengatebase [password]");
	if(passw !=BaseInfo[PlayerUseingBase[playerid]][bPass]) return SCM(playerid,-1,"Error Password");
	SetDynamicObjectRot(i,0,0,90);
	PlayerUseingBase[playerid] = -1;
	}
	}
	}
	return 1;
}
CMD:closegatebase(playerid,params[])
{
	new Float:x,Float:y,Float:z,Float:rz;
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
	for(new i=1;i<MAX_BASES;i++)
	{
	GetDynamicObjectPos(i,x,y,z);
	PlayerUseingBase[playerid] = GetClosestBase(playerid);
	if(IsPlayerInRangeOfPoint(playerid,2,x,y,z))
	{
	if(BaseInfo[PlayerUseingBase[playerid]][bModel] != ModelGate1&&BaseInfo[PlayerUseingBase[playerid]][bModel] != ModelGate2) return SCM(playerid,-1,"This is not gate");
	rz =BaseInfo[PlayerUseingBase[playerid]][bRZ];
	SetDynamicObjectRot(i,0,0,rz);
	PlayerUseingBase[playerid] = -1;
	}
	}
	}
	return 1;
}
CMD:checkbox(playerid,params[])
{
	new string[128];
	for(new i =0;i<MAX_BOXS;i++)
	{
		if(IsPlayerInRangeOfPoint(playerid,2,BoxInfo[i][xPos],BoxInfo[i][yPos],BoxInfo[i][zPos]))
		{
			for(new it = 0;it<10;it++)
			{
				new bi = BoxInfo[i][Item][it];
				switch(bi)
				{
				case ModelBurger:
				{
				format(string,sizeof(string),"Slot %d : Burger",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelPizza:
				{
				format(string,sizeof(string),"Slot %d : Pizza",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelSoda:
				{
				format(string,sizeof(string),"Slot %d : Soda",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelWater:
				{
				format(string,sizeof(string),"Slot %d : Water bottle",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelEWater:
				{
				format(string,sizeof(string),"Slot %d : Empty Water bottle",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelMeatC:
				{
				format(string,sizeof(string),"Slot %d : Meat [Cook]",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelMeatUC:
				{
				format(string,sizeof(string),"Slot %d : Meat un Cook",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelEngine:
				{
				format(string,sizeof(string),"Slot %d : Engine",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelFishRob:
				{
				format(string,sizeof(string),"Slot %d : Fishing Rob",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelGascan:
				{
				format(string,sizeof(string),"Slot %d : Gas can",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelEGascan:
				{
				format(string,sizeof(string),"Slot %d : Empty gas can",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelBox:
				{
				format(string,sizeof(string),"Slot %d : Box",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelBed:
				{
				format(string,sizeof(string),"Slot %d : Bedpack",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelBandage:
				{
				format(string,sizeof(string),"Slot %d : Bandage",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelMedkit:
				{
				format(string,sizeof(string),"Slot %d : Medkit",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelFishUC:
				{
				format(string,sizeof(string),"Slot %d : Fish Uncook",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelFishC:
				{
				format(string,sizeof(string),"Slot %d : Fish Cook",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelIron:
				{
				format(string,sizeof(string),"Slot %d : Iron",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				case ModelCU:
				{
				format(string,sizeof(string),"Slot %d : Copper",it);
				SCM(playerid,COLOR_GREEN,string);
				}
    			case ModelWood:
				{
				format(string,sizeof(string),"Slot %d : Wood",it);
				SCM(playerid,COLOR_GREEN,string);
				}
				default:
				{
				format(string,sizeof(string),"Slot %d : Empty",it);
				SCM(playerid,COLOR_BLUE,string);
				}
				}
				
			}
		}
	}
	return 1;
}
CMD:checkitemid(playerid,params[])
{
	new string[128];
	SCM(playerid,COLOR_RED,"|==========================================[ITEM ID]=================================|");
	format(string,sizeof(string),"FOOD :Burger:%d|Pizza:%d|Soda:%d|WaterBottle:%d|EWater:%d",ModelBurger,ModelPizza,ModelSoda,ModelWater,ModelEWater,ModelMeatUC,ModelMeatC);
	SCM(playerid,COLOR_GREEN,string);
	format(string,sizeof(string),"Food: FishCook:%d |FishUnCook:%d|MeatUnCook:%d|MeatCook:%d",ModelFishC,ModelFishUC,ModelMeatUC,ModelMeatC);
	SCM(playerid,COLOR_GREEN,string);
	format(string,sizeof(string),"TOOLS:Engine:%d |FishingRob:%d|Gascan:%d|EmptyGasCan:%d|Box:%d|BedPack:%d",ModelEngine,ModelFishRob,ModelGascan,ModelEGascan,ModelBox,ModelBed);
	SCM(playerid,COLOR_GREEN,string);
	format(string,sizeof(string),"Metal:Copper:%d|Iron:%d|Wood:%d",ModelCU,ModelIron,ModelWood);
	SCM(playerid,COLOR_GREEN,string);
	format(string,sizeof(string),"Hospital:Medkit:%d|Bandage;%d",ModelMedkit,ModelBandage);
	SCM(playerid,COLOR_GREEN,string);
	SCM(playerid,COLOR_RED,"|==========================================[*******]=================================|");
	return 1;
}
CMD:addboxitem(playerid,params[])
{
	new slotid,item;
	for(new i =0;i<MAX_BOXS;i++)
	{
	if(IsPlayerInRangeOfPoint(playerid,2,BoxInfo[i][xPos],BoxInfo[i][yPos],BoxInfo[i][zPos]))
	{
	if(sscanf(params, "dd",slotid,item)) return SCM(playerid,COLOR_GOLD, "USAGE:{FFFFFF} /additembox [slot[0-9]] [itemid(/checkitemid)]");
	if(slotid >9) return SCM(playerid,-1,"Slot only 0->9 = 10 slot one box");
	switch(item)
	{
		case ModelBurger:
		{
			if(PlayerHasItem(playerid,"Burger")) 
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Burger",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item burger");}
		}
		case ModelPizza:
		{
			if(PlayerHasItem(playerid,"Pizza"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Pizza",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item Pizza");}
		}
		case ModelSoda:
		{
			if(PlayerHasItem(playerid,"Soda"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Soda",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item Soda");}
		}
		case ModelWater:
		{
			if(PlayerHasItem(playerid,"Water"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Water",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item Water");}
		}
		case ModelEWater:
		{
			if(PlayerHasItem(playerid,"EWater"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"EWater",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item empty water");}
		}
		case ModelMeatUC:
		{
			if(PlayerHasItem(playerid,"MeatUnCook"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"MeatUnCook",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item meat un cook");}
		}
		case ModelMeatC:
		{
			if(PlayerHasItem(playerid,"MeatCook"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"MeatCook",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item meat cook");}
		}
		case ModelMedkit:
		{
			if(PlayerHasItem(playerid,"Medkit"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Medkit",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need medkit");}
		}
		case ModelBandage:
		{
			if(PlayerHasItem(playerid,"Bandage"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Bandage",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item bandage");}
		}
		case ModelFishC:
		{
			if(PlayerHasItem(playerid,"FishCook"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"FishCook",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item fish cook");}
		}
		case ModelFishUC:
		{
			if(PlayerHasItem(playerid,"FishUnCook"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"FishUnCook",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item Fish UnCook");}
		}
		case ModelEngine:
		{
			if(PlayerHasItem(playerid,"Engine"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Engine",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item Engine");}
		}
		case ModelFishRob:
		{
			if(PlayerHasItem(playerid,"FishingRob"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"FishingRob",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item Fishing rob");}
		}
		case ModelGascan:
		{
			if(PlayerHasItem(playerid,"Gascan"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Gascan",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item Gas can full");}
		}
		case ModelEGascan:
		{
			if(PlayerHasItem(playerid,"EGascan"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"EGascan",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item empty gas can");}
		}
		case ModelBox:
		{
			if(PlayerHasItem(playerid,"Box"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Box",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item box");}
		}
		case ModelBed:
		{
			if(PlayerHasItem(playerid,"Bedpack"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Bedpack",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item bed pack");}
		}
		case ModelCU:
		{
			if(PlayerHasItem(playerid,"Copper"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Copper",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item Copper");}
		}
		case ModelIron:
		{
			if(PlayerHasItem(playerid,"Iron"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Iron",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item iron");}
		}
		case ModelWood:
		{
			if(PlayerHasItem(playerid,"Wood"))
			{
			BoxInfo[i][Item][slotid] = item;
			RemoveItem(playerid,"Wood",1);
			PlayerInfo[playerid][pSlotu] --;
			}
			else{SCM(playerid,COLOR_RED,"You need item wood");}
		}
		default:SCM(playerid,COLOR_RED,"Error ID Item");

	}
	SaveThisBox(i);
	}
	}
	return 1;
}
CMD:takeboxitem(playerid,params[])
{
	new slotid,Float:p[3];
	GetPlayerPos(playerid,p[0],p[1],p[2]);
	for(new i =0;i<MAX_BOXS;i++)
	{
	if(IsPlayerInRangeOfPoint(playerid,2,BoxInfo[i][xPos],BoxInfo[i][yPos],BoxInfo[i][zPos]))
	{
	if(sscanf(params, "d",slotid)) return SCM(playerid,-1, "USAGE:{FFFFFF} /takeboxitem [slot[0-9]]");
	if(slotid >9) return SCM(playerid,COLOR_RED,"Slot only 0-9");
	if(BoxInfo[i][Item][slotid] == 0) return SCM(playerid,COLOR_BLUE,"Empty");
	CreateItem(BoxInfo[i][Item][slotid],1,p[0],p[1],p[2]-1,0,0,0,0,0);
	BoxInfo[i][Item][slotid] =0;
	SaveThisBox(i);
	}
	}
	return 1;
}
CMD:packbox(playerid,params[])
{
	new string[128],Float:p[3];
	GetPlayerPos(playerid,p[0],p[1],p[2]);
	for(new i =0;i<MAX_BOXS;i++)
	{
		if(IsPlayerInRangeOfPoint(playerid,2,BoxInfo[i][xPos],BoxInfo[i][yPos],BoxInfo[i][zPos]))
		{
			DestroyObject(BoxInfo[i][Obj]);
			BoxInfo[i][xPos]=0;
			BoxInfo[i][yPos]=0;
			BoxInfo[i][zPos]=0;
 			for(new it=0;it<10;it++)
			{
				format(string,sizeof(string),"Item%d",it);
				BoxInfo[i][Item][it] = 0;
			}
			CreateItem(ModelBox,1,p[0],p[1],p[2]-1,0,0,0,0,0);
			SaveThisBox(i);
		}
	}
	return 1;
}
CMD:packbed(playerid, params[])
{
    new string[40];
    for(new i; i < MAX_BEDS; i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 4.0, BedInfo[i][bx],BedInfo[i][by],BedInfo[i][bz]))
        {
            format(string, sizeof(string), "You've close bed id %d.", i);
            ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 0, 0);
            SetTimerEx("ExtBed",5000, false, "ii", i,playerid);
            break;
        }
    }
    SCM(playerid, 0xA3A3A3FF, string);
    return true;
}

CMD:killfire(playerid, params[])
{
    new string[40];
    for(new i; i < MAX_CAMPFIRES; i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 2.0, cfInfo[i][xPos], cfInfo[i][yPos], cfInfo[i][zPos]))
        {
            ApplyAnimation(playerid, "PED", "FightA_G", 4.1, 0, 1, 1, 0, 0, 1);
            format(string, sizeof(string), "You've extinguished campfire ID %d.", i);
            SCM(playerid, 0xA3A3A3FF, string);
            SetTimerEx("ExtFire", 900, false, "i", i);
            break;
        }
    }
    return true;
}
forward ExtBed(bedid,playerid);
public ExtBed(bedid,playerid)
{
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	BedInfo[bedid][bx] = 0;
	BedInfo[bedid][by] = 0;
	BedInfo[bedid][bz] = 0;
	DestroyDynamicObject(BedInfo[bedid][bObj]);
	ClearAnimations(playerid);
	CreateItem(ModelBed,1,x,y,z-1,0,0,0,0,0);
	bedCount--;
    return true;
}
public ExtFire(fireid)
{
	cfInfo[fireid][xPos]=0;
 	cfInfo[fireid][yPos]=0;
 	cfInfo[fireid][zPos]=0;
    DestroyDynamicObject(cfInfo[fireid][LogObj]);
    DestroyDynamicObject(cfInfo[fireid][FireObj]);
    cfCount --;
    return true;
}

CMD:createtree(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return SCM(playerid,COLOR_RED,"You can not use this cmd");
    new type,randobj, Float: X, Float: Y, Float: Z,stat[200];
    GetPlayerPos(playerid, X, Y, Z);
    if(sscanf(params, "i", type)) return SCM(playerid, 0x783800FF, "/createtree [type]");

    if(type == 1)
    {
        switch(random(5))
        {
            case 0: randobj = 661;
            case 1: randobj = 657;
            case 2: randobj = 654;
            case 3: randobj = 655;
            case 4: randobj = 656;
        }
    }

    else if(type == 2)
    {
        switch(random(5))
        {
            case 0: randobj = 615;
            case 1: randobj = 616;
            case 2: randobj = 617;
            case 3: randobj = 618;
            case 4: randobj = 700;
        }
    }

    tInfo[tCount][Obj] = CreateDynamicObject(randobj, X +1, Y +1, Z -1, 0.0, 0.0, 0.0);
	format(stat,sizeof(stat),"TreeID :%d",tCount);
	SetPVarInt(playerid,"Edito",tCount);
	Text[tCount] = Create3DTextLabel(stat, 0x008080FF, X+1,Y+1,Z, 40.0, 0, 0);
    new INI:File = INI_Open(TreePath(tCount));
    INI_SetTag(File, "Tree Data");


    INI_WriteInt(File, "TModel", randobj);
    tInfo[tCount][TModel] = randobj;

    INI_WriteInt(File, "Type", type);
    tInfo[tCount][Type] = type;

    INI_WriteFloat(File, "Health", 100);
    tInfo[tCount][Health] = 100;

    INI_WriteFloat(File, "xPos", X);
    tInfo[tCount][xPos] = X;

    INI_WriteFloat(File, "yPos", Y);
    tInfo[tCount][yPos] = Y;

    INI_WriteFloat(File, "zPos", Z);
    tInfo[tCount][zPos] = Z;

    INI_WriteFloat(File, "rxPos", 0.0);
    INI_WriteFloat(File, "ryPos", 0.0);
    INI_WriteFloat(File, "rzPos", 0.0);

    INI_Close(File);
    tCount ++;

    SCM(playerid, 0xA3A3A3FF, "Create trees .");

    return true;
}

CMD:deletetree(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 4) return SCM(playerid,COLOR_RED,"You can not use this cmd");
    new tid, string[40];
    if(sscanf(params, "i", tid)) return SCM(playerid, -1, "/deletetree [hid]");

    format(string, sizeof(string), "Trees/%d.ini", tid);

    if(!fexist(string)) return SCM(playerid, -1, "The tree ID you entered doesn't exist.");

    else if(fexist(string))
    {
        DestroyDynamicObject(tInfo[tid][Obj]);
        tCount --;

        fremove(string);
    }

    format(string, sizeof(string), "You have deleted tree ID: %d", tid);
    SCM(playerid, 0xA3A3A3FF, string);

    return true;
}

CMD:gototree(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 4) return SCM(playerid,COLOR_RED,"You can not use this cmd");
    new treeid, string[60];

    if(sscanf(params, "i", treeid)) return SCM(playerid, 0xDEDEDEFF, "/gototree [id]");
    if(!IsValidDynamicObject(treeid)) return SCM(playerid, 0xDEDEDEFF, "That tree doesn't exist!");

    format(string, sizeof(string), "You have been warped near tree ID %d.", treeid);
    SCM(playerid, 0xA3A3A3FF, string);

    SetPlayerPos(playerid, tInfo[treeid][xPos] +1, tInfo[treeid][yPos] +1, tInfo[treeid][zPos]);

    return true;
}

CMD:deathtrees(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 4) return SCM(playerid,COLOR_RED,"You can not use this cmd");
    new string[80];

    SCM(playerid, 0xDEDEDEFF, "Damaged Trees");

    for(new i; i < MAX_TREES; i ++)
    {
        if(tInfo[i][Health] < 10.0)
        {
            format(string, sizeof(string), "Tree ID: %d, health: %f", i, tInfo[i][Health]);
            SCM(playerid, 0xA3A3A3FF, string);
        }
    }

    return true;
}

CMD:fish(playerid,params[])
{
	if(IsPlayerInPointFish(playerid))
	{
	if(GetPVarInt(playerid,"InFish")) return SCM(playerid,COLOR_RED,"Error:Please wait");
	if(!PlayerHasItem(playerid,"FishingRob"))return SCM(playerid,COLOR_RED,"Error:You need fishing rob form craft");
	FishTimer[playerid] = SetTimerEx("FishingT",RandomEx(20000,80000),0,"i",playerid);
	SetPlayerAttachedObject(playerid, 0, 18632, 6, 0.000000, 0.015999, 0.000000, -172.100006, 20.499998, 0.000000, 1.000000, 1.000000, 1.000000, 0, 0);
	TogglePlayerControllable(playerid,0);
	SetPVarInt(playerid,"InFish",1);
	}
	else
	{
	SCM(playerid,COLOR_GREEN,"You no in point fish");
	}
	return 1;
}

public FishingT(playerid)
{
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	SetPVarInt(playerid,"InFish",0);
	TogglePlayerControllable(playerid,1);
	RemovePlayerAttachedObject(playerid,0);
	CreateItem(ModelFishUC,1,x,y,z-0.80, -0.17997, -74.46001, -12.54000,0,0);
	return 1;
}
public MINET(playerid)
{
	SetPlayerProgressBarValue(playerid,mining,0);
	HidePlayerProgressBar(playerid,mining);

	return 1;
}
public CuTi(playerid)
{
	SetPlayerProgressBarValue(playerid,cutting,0);
	HidePlayerProgressBar(playerid,cutting);
	return 1;
}
CMD:gotosz(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin]< 4)
	{
	new housenum;
	if(sscanf(params, "d", housenum)) return SCM(playerid, -1, "USAGE: /gotosz [ID SafeZone]");

	SetPlayerPos(playerid,SafeZoneInfo[housenum][szPosX],SafeZoneInfo[housenum][szPosY],SafeZoneInfo[housenum][szPosZ]);
	SetPlayerInterior(playerid, 0);
	}
	return 1;
}
CMD:szedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin]< 4)
	{
		SCM(playerid, -1, "You can not use this commands`.");
		return 1;
	}
	new string[128], choice[32], szid, amount;
	if(sscanf(params, "s[32]dd", choice, szid, amount))
	{
		SCM(playerid, -1, "USAGE: /szedit [name] [SafeZone ID] [Amount]");
		SCM(playerid, -1, "Name: location, size");
		return 1;
	}
	if(strcmp(choice, "location", true) == 0)
 	{
		GetPlayerPos(playerid, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]);
		SCM( playerid, -1, "You have edit location Safe Zone!" );
  		DestroyPickup(SafeZoneInfo[szid][szPickupID]);
		SaveSafeZones();
  		DestroyPickup(SafeZoneInfo[szid][szPickupID]);
  		DestroyDynamic3DTextLabel(SafeZoneInfo[szid][szTextID]);
  		format(string, sizeof(string), "{FFFFFF}Safe Zone(ID: %d)\n{24D12F}%d Meters\n{DB8B35}Non-Kill",szid,SafeZoneInfo[szid][szSize]);
  		SafeZoneInfo[szid][szTextID] = CreateDynamic3DTextLabel( string, -1, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]+0.5,10.0, .testlos = 1, .streamdistance = 10.0);
  		SafeZoneInfo[szid][szPickupID] = CreatePickup(1254, 23, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]);
 	}
 	else if(strcmp(choice, "size", true) == 0)
 	{
     	SafeZoneInfo[szid][szSize] = amount;
  		SCM( playerid, -1, "You have edit size Safe Zone!" );
  		SaveSafeZones();

  		DestroyDynamic3DTextLabel(SafeZoneInfo[szid][szTextID]);
  		format(string, sizeof(string), "{FFFFFF}Safe Zone(ID: %d)\n{24D12F}%d Meters\n{DB8B35}Non-Kill",szid,SafeZoneInfo[szid][szSize]);
  		SafeZoneInfo[szid][szTextID] = CreateDynamic3DTextLabel( string, -1, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]+0.5,10.0, .testlos = 1, .streamdistance = 10.0);
 	}
 	SaveSafeZones();
 	return 1;
}
CMD:szdelete(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin]< 4)
	{
		SCM(playerid, -2, "You can not use this commands`!");
		return 1;
	}
	new h, string[128];
	if(sscanf(params,"d",h)) return SCM(playerid, -1,"USAGE: /szdelete [SafeZone ID]");
	if(!IsValidDynamicPickup(SafeZoneInfo[h][szPickupID])) return SCM(playerid, -1,"Wrong ID Safe Zone.");
	SafeZoneInfo[h][szPosX] = 0;
	SafeZoneInfo[h][szPosY] = 0;
	SafeZoneInfo[h][szPosZ] = 0;
	DestroyDynamicPickup(SafeZoneInfo[h][szPickupID]);
	DestroyDynamic3DTextLabel(SafeZoneInfo[h][szTextID]);
	SaveSafeZones();
	format(string, sizeof(string), "You have delete Safe Zone (ID %d).", h);
	SCM(playerid, -1, string);
	return 1;
}
CMD:shop(playerid,params[])
{
	if(!IsPlayerInRangeOfPoint(playerid,3,64.8254,-3172.5413,12.9431)) return SCM(playerid,COLOR_RED,"You not in shop in safe zone");
	new iobject[6];
	iobject[0] = 1582;
	iobject[1] = 19094;
	iobject[2] = 1486;
	iobject[3] = 1950;
	iobject[4] =1581;
	iobject[5] =1310;
	SCM(playerid,COLOR_GREEN,"Burger&Pizza :50$/1 | Soda&Water 100$/1 |Card no reset inventory 1000$|Balo 50slot 500$");
	ShowModelSelectionMenuEx(playerid,iobject,6, "SHOP SURVIVAL", CUSTOM_MENU, 0.0, 0.0, 0.0);
	return 1;
}
///CMD TEST
CMD:eg(playerid,params[])
{
	VInfo[GetPlayerVehicleID(playerid)][Fuel] = 100;
	VInfo[GetPlayerVehicleID(playerid)][Engine] = 1;
	return 1;
}
CMD:gun(playerid,params[])
{
	GivePlayerWeaponAC(playerid,33,9999);
	PlayerInfo[playerid][pAmmoRifle] = 900;
	return 1;
}
///////////////////////
CMD:engine(playerid, params[])
{
    if(strcmp(params,"on",true) == 0)
    {
    	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    	{
			new Vehicle = GetPlayerVehicleID(playerid);
			if(VInfo[Vehicle][Engine] == 1)
			{
			if(VInfo[Vehicle][Fuel] <= 0) return SCM(playerid,COLOR_RED,"This vehicle no fuel");
			ToggleVehicleEngine(Vehicle,true);
			SCM(playerid, -1, "You have turned your engine >{FFFFFF} ON");
			VInfo[Vehicle][SEngine] = 1;
			}
			else
			{
            SCM(playerid, -1, "This vehicle no engine");
			}
		}
	}
	if(strcmp(params,"off",true) == 0)
	{
		 if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    	{
			new Vehicle = GetPlayerVehicleID(playerid);
			ToggleVehicleEngine(Vehicle,false);
			SCM(playerid, -1, "You have turned your engine >{FFFFFF} OFF");
			VInfo[Vehicle][SEngine] = 0;
		}
	}
	return 1;
}
CMD:lights(playerid, params[])
{
    if(strcmp(params,"on",true) == 0)
    {
    	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    	{
			new Vehicle = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
			if(VInfo[Vehicle][Engine] == 1)
			{
			if(VInfo[Vehicle][Fuel] <= 0) return SCM(playerid,COLOR_RED,"This vehicle no fuel");
			GetVehicleParamsEx(Vehicle, engine, lights, alarm, doors, bonnet, boot, objective);
			SCM(playerid, -1, "You have turned your lights >{FFFFFF} ON");
			VInfo[Vehicle][SEngine] = 1,SetVehicleParamsEx(Vehicle, engine, 1, alarm, doors, bonnet, boot, objective);
			}
			else
			{
            SCM(playerid, -1, "This vehicle no engine");
			}
		}
	}
	if(strcmp(params,"off",true) == 0)
	{
		 if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    	{
			new Vehicle = GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective;
			GetVehicleParamsEx(Vehicle, engine, lights, alarm, doors, bonnet, boot, objective);
			SCM(playerid, -1, "You have turned your lights >{FFFFFF} OFF");
			VInfo[Vehicle][SEngine] = 0,SetVehicleParamsEx(Vehicle, engine, 0, alarm, doors, bonnet, boot, objective);
		}
	}
	return 1;
}
CMD:kill(playerid,params[])
{
	new slot = PlayerInfo[playerid][pSlot],Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	PlayerInfo[playerid][pSpawn] = 0;
	switch(slot)
	{
	case 10:CreateItem(ModelBalo10,1,x,y,z-1,0,0,0,0,0);
	case 20:CreateItem(ModelBalo20,1,x,y,z-1,0,0,0,0,0);
	case 30:CreateItem(ModelBalo30,1,x,y,z-1,0,0,0,0,0);
	case 40:CreateItem(ModelBalo40,1,x,y,z-1,0,0,0,0,0);
	case 50:CreateItem(ModelBalo50,1,x,y,z-1,0,0,0,0,0);
	}
	ResetPlayerInventory(playerid);
	SetPlayerHP(playerid,-100);
	return 1;
}
CMD:pm(playerid, params[])
{
    new str[256], str2[256], id, Name1[MAX_PLAYER_NAME], Name2[MAX_PLAYER_NAME];
    if(sscanf(params, "us", id, str2))
    {
        SCM(playerid, 0xFF0000FF, "Usage: /pm <id> <message>");
        return 1;
    }
    if(!IsPlayerConnected(id)) return SCM(playerid, 0xFF0000FF, "ERROR: Player not connected");
    if(playerid == id) return SCM(playerid, 0xFF0000FF, "ERROR: You cannot pm yourself!");
    {
        GetPlayerName(playerid, Name1, sizeof(Name1));
        GetPlayerName(id, Name2, sizeof(Name2));
        format(str, sizeof(str), "PM To %s(ID %d): %s", Name2, id, str2);
        SCM(playerid, 0xFF0000FF, str);
        format(str, sizeof(str), "PM From %s(ID %d): %s", Name1, playerid, str2);
        SCM(id, 0xFF0000FF, str);
    }
    return 1;
}
CMD:s(playerid,params[])
{
	new stext[30],Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	if(sscanf(params, "s[30]",stext)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /s [text]");
	for(new i=0;i<MAX_PLAYERS;i++)
	{
	if(IsPlayerInRangeOfPoint(i,40,x,y,z))
	{
	format(stext, sizeof(stext), "%s Should:%s.", GetName(playerid),stext);
	SCM(playerid,COLOR_GREY,stext);
	}
	}
	return 1;
}
CMD:g(playerid,params[])
{
	new stext[30],Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	if(sscanf(params, "s[30]",stext)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /g [text]");
	format(stext, sizeof(stext), "[G]%s :%s.", GetName(playerid),stext);
	SendClientMessageToAll(COLOR_GOLD,stext);

	return 1;
}
CMD:createitem(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return SCM(playerid,-1,"You can not use this command");
	new modelid,Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
    if(sscanf(params, "d",modelid)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /creatiem [modelid(/checkitemid)]");
    CreateItem(modelid,1,x,y,z-0.8,0,0,0,0,0);
	return 1;
}

CMD:cmds(playerid,params[])
{
	SCM(playerid,COLOR_GREEN,"|=========================================HELP===============================|");
	SCM(playerid,COLOR_GREEN,"|===================================The Land of Death========================|");
	SCM(playerid,COLOR_GREY,"CMD: /stats show your stats./editbase /gps /engine[on/off]");
	SCM(playerid,COLOR_GREY,"Chat : /s for should , /g for golb bar");
	SCM(playerid,COLOR_GREY,"Shop: /shop to buy if you in shop");
	SCM(playerid,COLOR_GREY,"Sleep: /sleep in bed");
	SCM(playerid,COLOR_GREY,"Box: /checkbox /addboxitem /takeboxitem");
	SCM(playerid,COLOR_GREY,"EXT: /packbed |/packbox|/killfire|/packbox");
	SCM(playerid,COLOR_GREEN,"|============================================================================|");
	return 1;
}
CMD:acmds(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] <1 ) return SCM(playerid,-1,"You can not use this command");
	SCM(playerid,COLOR_GREEN,"ADMIN CMD");
	SCM(playerid,COLOR_GREEN,"/kick |/ban /banip|/unban /unbanip|/ann|/spec /endspec|/a /createitem");
	SCM(playerid,COLOR_GREEN,"/szedit /gotosz |/createtree /deletetree /gototree /createbase /removebase");
	return 1;
}
CMD:stats(playerid,params[])
{
	new string[128],string1[128],string2[128];
	format(string, sizeof(string), "Name:%s | Kills: %d | Death :%d  |  Money :%d|LV:%d|EXP:%d|NeedEXP:%d", GetName(playerid),
	PlayerInfo[playerid][pKills],
	PlayerInfo[playerid][pDeaths],
	GetPlayerCash(playerid),
	PlayerInfo[playerid][pLv],
	PlayerInfo[playerid][pEXP],
	PlayerInfo[playerid][pNEXP]);
	format(string1, sizeof(string1),"BaloSlot :%d | BaloSlotUsed :%d |Hunger:%d|Thirst:%d",PlayerInfo[playerid][pSlot],
	PlayerInfo[playerid][pSlotu],
	GetPlayerHunger(playerid),
	GetPlayerThirst(playerid));
	format(string2,sizeof(string2),"Blood[hp]:%f",GetPlayerHP(playerid));
	
	SCM(playerid,COLOR_GREEN,"|==============================STATS============================|");
	SCM(playerid,COLOR_GREEN,"|========================The Land of Death======================|");
	SCM(playerid,COLOR_GREY,string);
	SCM(playerid,COLOR_GREY,string1);
	SCM(playerid,COLOR_GREY,string2);
	SCM(playerid,COLOR_GREEN,"|===============================================================|");
	return 1;
}
//ADMIN CMD
CMD:a(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
	    new string[128], text[128];
		if(PlayerInfo[playerid][pAdmin] < 1) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
		if(sscanf(params,"s[128]", text)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /a [message]");
		format(string, sizeof(string), "{FFD700}ADMIN CHAT:{9C9C8A} %s: %s", GetName(playerid), text);
		MessageToAdmins(yellow, string);
	}
	return 1;
}
CMD:ban(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
		new string[128], targetid, reason[60], IP[16];
		if(PlayerInfo[playerid][pAdmin] < 2) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
		if(sscanf(params,"us[60]", targetid, reason)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /ban [playerid] [reason]");
		if(!IsPlayerConnected(targetid)) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} Error ID or Name.");
		if(PlayerInfo[targetid][pAdmin] > PlayerInfo[playerid][pAdmin]) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} That player is a higher ranked Administrator.");
		PlayerInfo[targetid][pBanned] = 1;
		new Day, Month, Year;
		getdate(Year, Month, Day);
	    format(string, sizeof(string), "BAN:{FFFFFF} %s has been banned by %s", GetName(targetid), GetName(playerid));
		SendClientMessageToAll(COLOR_RED, string);
		format(string, sizeof(string), "%s Banned ,Reason:%s- %04d/%02d/%02d", GetName(targetid),reason, Year, Month, Day);
		Log("Logs/ban.txt", string);
	    GetPlayerIp(targetid, IP, sizeof(IP));
		format(string, sizeof(string), "Player's IP:{FFFFFF} %s (/banip to ban it)", IP);
		SCM(playerid, COLOR_RED, string);
		KickWithMessage(targetid, reason);
	}
    return 1;
}

CMD:banip(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
		new string[128], ip[16];
		if(PlayerInfo[playerid][pAdmin] < 2) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
	    if(sscanf(params, "s[16]", ip)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /banip [IP]");
        format(string, sizeof(string), "banip %s", ip);
		SendRconCommand(string);
	    format(string, sizeof(string), "INFO:{FFFFFF} Ban da thuc hien thanh cong banned the ip '%s'", ip);
	    SCM(playerid, COLOR_GREY, string);
	    format(string, sizeof(string), "AdmWarn:{FFFFFF} %s has banned the IP %s.", GetName(playerid), ip);
	    MessageToAdmins(COLOR_RED, string);
	    format(string, sizeof(string), "IP Ban: %s", ip);
	    Log("Logs/IPBan.txt", string);
	}
	return 1;
}
CMD:unban(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
	    new string[128], file[128], account[30];
	    if(PlayerInfo[playerid][pAdmin] < 4) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
	    if(sscanf(params, "s[30]", account)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /unban [AccountName]");
	    format(file, sizeof(file), "Users/%s.ini", account);
	    if(fexist(file))
    	{
    	    new INI:File = INI_Open(UserPath(playerid));
    	    INI_SetTag(File,"data");
    	    INI_WriteInt(File,"Banned",0);
    	    INI_Close(File);
    	    format(string, sizeof(string), "INFO:{FFFFFF} You have succesfully unbanned %s", account);
    	    SCM(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "AdmWarn:{FFFFFF} %s has unbanned %s", GetName(playerid), account);
            MessageToAdmins(COLOR_RED, string);
			format(string, sizeof(string), "%s unbanned %s", GetName(playerid), account);
    	    Log("Logs/Unban.txt.", string);
    	}
    	else
    	{
    	    SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} That account doesn't exist.");
    	}
    }
    return 1;
}
CMD:unbanip(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
		new string[128], ip[16];
		if(PlayerInfo[playerid][pAdmin] < 2) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
	    if(sscanf(params, "s[16]", ip)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /unbanip [IP]");
        format(string, sizeof(string), "unbanip %s", ip);
		SendRconCommand(string);
	    format(string, sizeof(string), "INFO:{FFFFFF} Ban da thuc hien thanh cong unbanned the ip '%s'", ip);
	    SCM(playerid, COLOR_GREY, string);
	    format(string, sizeof(string), "AdmWarn:{FFFFFF} %s has unbanned the IP %s.", GetName(playerid), ip);
	    MessageToAdmins(COLOR_RED, string);
	    format(string, sizeof(string), "IP unban: %s", ip);
	    Log("Logs/IPUnban.txt", string);
	}
	return 1;
}
CMD:spec(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
	    new string[128], targetid;
	    if(PlayerInfo[playerid][pAdmin] < 1) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
		if(sscanf(params,"u", targetid)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /spec [playerid]");
		if(!IsPlayerConnected(targetid)) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} Error ID or Name.");
		TogglePlayerSpectating(playerid, 1);
		if(IsPlayerInAnyVehicle(targetid))
  		{
    		PlayerSpectateVehicle(playerid, GetPlayerVehicleID(targetid), SPECTATE_MODE_NORMAL);
		}
		else
		{
		    PlayerSpectatePlayer(playerid, targetid, SPECTATE_MODE_NORMAL);
      	}
		format(string, sizeof(string), "INFO:{FFFFFF} You're currently spectating %s, use /endspec to stop spectating.", GetName(targetid));
		SCM(playerid, COLOR_GREY, string);
		format(string, sizeof(string), "AdmWarn:{FFFFFF} %s is spectating %s", GetName(playerid), GetName(targetid));
		MessageToAdmins(COLOR_RED, string);
	}
	return 1;
}

CMD:endspec(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
		if(PlayerInfo[playerid][pAdmin] < 1) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
		TogglePlayerSpectating(playerid, 0);
	}
	return 1;
}
CMD:removebase(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 3) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
	new mid, id, string[256];
	if(sscanf(params, "d",mid)) return SCM(playerid, 0xFF0000FF, "Usage: /removebase <id>");
	id = mid;
	if(BaseInfo[id][bLifup] == true) return SCM(playerid, 0xFFFF00C8, "* Someone is using this Base! (Can not delete)");
	DestroyDynamicObject(BaseInfo[id][bObject]);
	BaseInfo[id][bID] = 0;
	BaseInfo[id][bLifup] = true;
	format(string, sizeof(string), "Base/%d.ini", id);
	if(fexist(string))
	{
		fremove(string);
		format(string, sizeof(string), "* Successfully removed (Base ID: %d).", id);
		SCM(playerid, 0xFF0000C8, string);
	}
	else
	{
		format(string, sizeof(string), "* Error (Base ID: %d).", id);
		SCM(playerid, 0xFF0000C8, string);
	}
	return 1;
}
CMD:rangebase(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 3) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
	new string[256];
	new id = 0;
	for(new i=1; i<MAX_BASES; i++)
	{
	if(IsPlayerInRangeOfPoint(playerid,RangeInBase, BaseInfo[i][bX], BaseInfo[i][bY], BaseInfo[i][bZ]) && BaseInfo[i][bLifup] == false)
	{
	new Smg[128];
	format(Smg, sizeof(Smg), "[Base ID: %d][Model: %d]\n", BaseInfo[i][bID], BaseInfo[i][bModel]);
	strcat(string, Smg);
	ShowPlayerRangeBase[playerid][id] = BaseInfo[i][bID];
	id ++;
	}
	}
	ShowPlayerDialog(playerid, Dialog_GetRangeBase, DIALOG_STYLE_LIST, "[Near Base]", string, "Select","Close");
	return 1;
}

CMD:createbase(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 3) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
	new mod, Model, Float:x, Float:y, Float:z;
	new NewID = GetBaseID();
	if(sscanf(params, "d",mod)) return SCM(playerid, 0xFF0000FF, "Usage: /createbase <modelid>");
	if(NewID == -1) return SCM(playerid, 0xFF0000C8, "* No extra Base that you can not continue to create.");
	Model = mod;
	GetPlayerPos(playerid,x,y,z);
	BaseInfo[NewID][bID] = NewID;
	BaseInfo[NewID][bModel] = Model;
	BaseInfo[NewID][bX] = x +1;
	BaseInfo[NewID][bY] = y +1;
	BaseInfo[NewID][bZ] = z;
	BaseInfo[NewID][bRX] = 0;
	BaseInfo[NewID][bRY] = 0;
	BaseInfo[NewID][bRZ] = 0;
	BaseInfo[NewID][bvID] = GetPlayerVirtualWorld(playerid);
	BaseInfo[NewID][bInt] = GetPlayerInterior(playerid);
	BaseInfo[NewID][bLifup] = false;
	CreateBase(NewID);
	SaveBase(NewID);
	return 1;
}
CMD:kick(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
		new string[128], targetid, reason[128];
		if(PlayerInfo[playerid][pAdmin] < 1) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can not use this command.");
		if(sscanf(params,"us[128]", targetid, reason)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /kick [playerid] [reason]");
		if(!IsPlayerConnected(targetid)) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} Error ID or Name.");
		if(PlayerInfo[targetid][pAdmin] > PlayerInfo[playerid][pAdmin]) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You can't kick higher ranked Administrators.");
		format(string, sizeof(string), "KICK:{FFFFFF} %s has been kicked by %s.", GetName(targetid), GetName(playerid));
		SendClientMessageToAll(COLOR_RED, string);
		KickWithMessage(targetid, reason);
	}
	return 1;
}

CMD:goto(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
		new targetid, string[128];
	    if(PlayerInfo[playerid][pAdmin] < 1) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You are not authorized to use that command.");
		if(sscanf(params, "u", targetid)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /goto [playerid]");
	    else if(!IsPlayerConnected(targetid)) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} Error ID or Name.");
	    else
	    {
		    new Float:x, Float:y, Float:z;
		    GetPlayerPos(targetid, x, y, z);
		    SetPlayerPos(playerid, x+1, y+1, z);
		    format(string, sizeof(string), "AdmCmd:{FFFFFF} You have sucesfully teleported to %s.", GetName(targetid));
			SCM(playerid, COLOR_RED, string);
			format(string, sizeof(string), "INFO:{FFFFFF} Administrator %s has teleported to you.", GetName(playerid));
			SCM(targetid, COLOR_GREY, string);
	    }
	}
    return 1;
}
CMD:ann(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
		new text[60];
		if(PlayerInfo[playerid][pAdmin] < 2) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You are not authorized to use that command.");
		if(sscanf(params, "s[60]", text)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /ann [message]");
		GameTextForAll(text, 3000, 3);
	}
	return 1;
}

CMD:fixveh(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF}You can not use this command.");
	if(IsPlayerInAnyVehicle(playerid))
	{
 		RepairVehicle(GetPlayerVehicleID(playerid));
 		SCM(playerid, COLOR_GREY, "INFO:{FFFFFF} Your vehicle has been successfully repaired.");
	}
	else SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You need to be in a vehicle to use that command");
    return 1;
}
CMD:sethealth(playerid, params[])
{
	if(PlayerInfo[playerid][pLog] == 1)
	{
	    new string[128], targetid, amount;
	    if(PlayerInfo[playerid][pAdmin] < 3) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You are not authorized to use that command.");
	    if(sscanf(params, "ui", targetid, amount)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /sethealth [playerid] [amount]");
	    if(!IsPlayerConnected(targetid)) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} Invali ID.");
	    SetPlayerHP(targetid, amount);
	    format(string, sizeof(string), "AdmCmd:{FFFFFF} You set %s's health to %d.", GetName(targetid), amount);
	    SCM(playerid, COLOR_RED, string);
	    format(string, sizeof(string), "INFO:{FFFFFF} Administrator %s has set your health to %d.", GetName(playerid), amount);
	    SCM(targetid, COLOR_GREY, string);
	}
	return 1;
}
CMD:makeadmin(playerid, params[])
{
    if(PlayerInfo[playerid][pLog] == 1)
	{
		new targetid, amount, string[128];
		if(PlayerInfo[playerid][pAdmin] < 5) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} You are not authorized to use that command.");
	    if(sscanf(params, "ud", targetid, amount)) return SCM(playerid, COLOR_GREY, "USAGE:{FFFFFF} /makeadmin [playerid] [adminrank]");
	    if(targetid == INVALID_PLAYER_ID) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} Nguoi choi khong online.");
		if(amount > 5) return SCM(playerid, COLOR_RED,"ERROR:{FFFFFF} You can only choose from 0-5.");
		if(amount < 0) return SCM(playerid, COLOR_RED, "ERROR:{FFFFFF} Invalid Administrator Level.");
	    else
		{
			format(string, sizeof(string), "AdmWarn:{FFFFFF} %s has set %s's administrator level to %d.", GetName(playerid), GetName(targetid), amount);
			MessageToAdmins(COLOR_RED, string);
			PlayerInfo[targetid][pAdmin] = amount;
		    format(string, sizeof(string), "INFO:{FFFFFF} %s has made you level %d Administrator.", GetName(playerid), amount);
			SCM(targetid, COLOR_GREY, string);
			format(string, sizeof(string), "MAKE-ADMIN: %s has made %s a level %i adminstrator.", GetName(playerid), GetName(targetid), amount);
			Log("Logs/administration.txt", string);
		}
	}
    return 1;
}
CMD:adminmax(playerid,params[])
{
	if(!IsPlayerAdmin(playerid)) return SCM(playerid,COLOR_RED,"You can not use this command");
	PlayerInfo[playerid][pAdmin] = 9999;
	return 1;
}
CMD:resetdeers(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3) return SCM(playerid,COLOR_RED,"You can not use this command");
	for(new i=0;i<MAX_DEERS;i++)
	{
	if(DeerC[i] == 1)
	{
	ReSpawnDeer(i);
	}
	}
	return 1;
}
CMD:createdeer(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3) return SCM(playerid,COLOR_RED,"You can not use this command");
	new id,Random = random(sizeof(DeerSpawn)),string[128];
    if(sscanf(params, "d", id)) return SCM(playerid, 0xFF0000FF, "Usage: /createdeer <id>");
    format(string,sizeof(string),"Create finish deer id %d",id);
    SCM(playerid,-1,string);
	Deer[id] = CreateDynamicObject(19315,DeerSpawn[Random][0],DeerSpawn[Random][1],DeerSpawn[Random][2],0,0,0);
	DeerC[id] = 1;
	SetTimerEx("MoveSpawn",10000,1,"i",id);
	return 1;
}
CMD:gotodeer(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3) return SCM(playerid,COLOR_RED,"You can not use this command");
	new id,Float:x,Float:y,Float:z;
    if(sscanf(params, "d", id)) return SCM(playerid, 0xFF0000FF, "Usage: /gotodeer <id>");
	GetDynamicObjectPos(Deer[id],x,y,z);
	SetPlayerPos(playerid,x,y,z);
	return 1;
}
forward ReSpawnDeer(deerid);
public ReSpawnDeer(deerid)
{
	new Random = random(sizeof(DeerSpawn));
	DestroyDynamicObject(deerid);
	Deer[deerid] = CreateDynamicObject(19315,DeerSpawn[Random][0],DeerSpawn[Random][1],DeerSpawn[Random][2],0,0,0);

	SetTimerEx("MoveSpawn",10000,1,"i",deerid);
	return 1;
}
forward MoveSpawn(deerid);
public MoveSpawn(deerid)
{
	new Float:x,Float:y,Float:z,Float:rx,Float:ry,Float:rz;
	GetDynamicObjectRot(Deer[deerid],rx,ry,rz);
	if(rx < 90)
	{
	GetDynamicObjectPos(Deer[deerid],x,y,z);
	MoveDynamicObject(Deer[deerid],x+frandom(2,-2),y+frandom(2,-2),z,2);
	}
	return 1;
}
LoopingAnim(playerid,animlib[],animname[], Float:Speed, looping, lockx, locky, lockz, lp)
{
        gPlayerUsingLoopingAnim[playerid] = 1;
        ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, lockz, lp,1);
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	SCM(playerid,COLOR_GREEN,"/engine [on/off]|/ligts [on/off]");
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid,newstate,oldstate)
{
	new string[128];
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    if(floatround(VInfo[GetPlayerVehicleID(playerid)][Fuel]) <= 0)
		{
			format(string,sizeof(string),"~g~ Fuel: ~w~ 0");
			SCM(playerid, COLOR_RED, "This vehicle has ran out of fuel");
			KillTimer(FuelTimer[playerid]);
			ToggleVehicleEngine(GetPlayerVehicleID(playerid), false);
			TextDrawSetString(FuelText[playerid], string);
		}
		else
		{
			FuelTimer[playerid] = SetTimerEx("FuelDown", 1000, true, "i", playerid); // Fueldown timer
			TextDrawShowForPlayer(playerid, FuelText[playerid]);
		}
	}
	else
	{
		TextDrawHideForPlayer(playerid,FuelText[playerid]);
		TextDrawSetString(FuelText[playerid], "         ");
	}
	return 1;
}
public FuelDown(playerid)
{
	new string[128];
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsPlayerInAnyVehicle(playerid))
	{
		if(floatround(VInfo[vehicleid][Fuel]) <= 0 || VInfo[vehicleid][Fuel] - GetPlayerSpeed(playerid) * FUEL_DECREASE / 100 < 0)
		{
			format(string,sizeof(string),"~g~ Fuel: ~w~ 0");
			SCM(playerid, COLOR_RED, "This vehicle has ran out of fuel");
			KillTimer(FuelTimer[playerid]);
			ToggleVehicleEngine(vehicleid, false);
			TextDrawSetString(FuelText[playerid], string);
		}
		else
		{
			VInfo[vehicleid][Fuel] = VInfo[vehicleid][Fuel] - GetPlayerSpeed(playerid) * FUEL_DECREASE / 100;
			format(string,sizeof(string),"~g~ Fuel: ~w~ %d", floatround(VInfo[vehicleid][Fuel]));
			TextDrawSetString(FuelText[playerid], string);
		}
	}
	else
	{
		format(string,sizeof(string),"~g~ Fuel: ~w~ ");
		KillTimer(FuelTimer[playerid]);
	}
}


public OnPlayerEnterCheckpoint(playerid)
{
	DisablePlayerCheckpoint(playerid);
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    SpawnPlayer(playerid);
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

stock ResetTree(treeid)
{
    tInfo[treeid][Health] = 0;
    DestroyDynamicObject(tInfo[treeid][Obj]);
    tInfo[treeid][Obj] = CreateDynamicObject(832, tInfo[treeid][xPos], tInfo[treeid][yPos], tInfo[treeid][zPos], tInfo[treeid][rxPos], tInfo[treeid][ryPos], tInfo[treeid][rzPos]);

    SetTimerEx("RegrowDeadTrees", 1200000, false, "i", treeid);
	Delete3DTextLabel(Text[treeid]);
    printf("Tree %d has been replaced with a stump.", treeid);

    return true;
}

forward RegrowDeadTrees(treeid);
public RegrowDeadTrees(treeid)
{
	new stat[128];
    if(tInfo[treeid][Health] == 0)
    {
        DestroyDynamicObject(tInfo[treeid][Obj]);
        tInfo[treeid][Obj] = CreateDynamicObject(tInfo[treeid][TModel], tInfo[treeid][xPos], tInfo[treeid][yPos], tInfo[treeid][zPos], tInfo[treeid][rxPos], tInfo[treeid][ryPos], tInfo[treeid][rzPos]);
		format(stat,sizeof(stat),"TreeID :%d",treeid,tInfo[treeid][Health]);
		Text[treeid] = Create3DTextLabel(stat, 0x008080FF, tInfo[treeid][xPos], tInfo[treeid][yPos], tInfo[treeid][zPos], 40.0, 0, 0);

        printf("Tree %d has regrown and set to 100.0 health.", treeid);
        tInfo[treeid][Health] = 100;
    }

    return true;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PRESSED(KEY_WALK ))
	{

	}
	if(PRESSED(KEY_FIRE))
	{
	
	for(new d=0;d<MAX_DEERS;d++)
	{
		new Float:x,Float:y,Float:z,Float:rx,Float:ry,Float:rz;
		GetDynamicObjectPos(Deer[d],x,y,z);
		if(IsPlayerInRangeOfPoint(playerid,2,x,y,z))
		{
			
			GetDynamicObjectRot(Deer[d],rx,ry,rz);
			if(rx >= 90 )
			{
			SetObjectRot(Deer[d],89,ry,rz);
			if(GetPlayerWeapon(playerid) != 4 && GetPlayerWeapon(playerid) != 9) return SCM(playerid,COLOR_RED,"You need knife or chainsaw to pickup meat");
			LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,4000);
			GameTextForPlayer(playerid,"Picking up the meat...",3000,6);
			CreateItem(ModelMeatUC,1,x,y,z,0,0,0,0,0);
			CreateItem(ModelDeerSkin,1,x+1,y,z,0,0,0,0,0);
			SetTimerEx("ReSpawnDeer",100,0,"i",Deer[d]);
			break;
			}
		}
	}
	if(IsPlayerInPointMine(playerid))
	{
	if(GetPlayerWeapon(playerid) != 6) return SCM(playerid,COLOR_RED,"You need sholve");
	new Float:mb = GetPlayerProgressBarValue(playerid,mining);
	KillTimer(MINERT[playerid]);
	ShowPlayerProgressBar(playerid,mining);
 	SetPlayerProgressBarValue(playerid,mining,mb+1);
 	UpdatePlayerProgressBar(playerid,mining);
 	MINERT[playerid] = SetTimerEx("MINET",10000,0,"i",playerid);
 	if(mb == 100)
 	{
 	
 	new Float:x,Float:y,Float:z;
 	GetPlayerPos(playerid,x,y,z);
 	SetPlayerProgressBarValue(playerid,mining,0);
 	HidePlayerProgressBar(playerid,mining);
 	switch(random(2))
 	{
 	case 0:CreateItem(ModelIron,1,x,y,z-1,0,0,0,0,0);
 	case 1:CreateItem(ModelCU,1,x,y,z-1,0,0,0,0,0);
 	}
 	
 	}
	}
//=============================================================================
    for(new i; i < MAX_TREES; i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 2.2, tInfo[i][xPos], tInfo[i][yPos], tInfo[i][zPos]))
        {
        	if(GetPlayerWeapon(playerid) != 9) return SCM(playerid,COLOR_RED,"You need chain saw to cut tree");
            if(tInfo[i][Health] <= 0) return SCM(playerid, 0xA3A3A3FF, "This tree has already been cut down!");
            new Float:x,Float:y,Float:z;
 			GetPlayerPos(playerid,x,y,z);
 			if(GetPVarInt(playerid,"TreeCID") != i)
 			{
 			SetPlayerProgressBarValue(playerid,cutting,0);
 			}
 			SetPVarInt(playerid,"TreeCID",i);
 			KillTimer(CutT[playerid]);
 			
            new Float:cb = GetPlayerProgressBarValue(playerid,cutting);
            ShowPlayerProgressBar(playerid,cutting);
            SetPlayerProgressBarValue(playerid,cutting,cb+5);
            UpdatePlayerProgressBar(playerid,cutting);
            
			CutT[playerid] = SetTimerEx("CuTi",10000,0,"i",playerid);
            if(cb == 100 || tInfo[i][Health] <= 0)
            {
            ResetTree(i);
            SetPVarInt(playerid,"TreeCID",-1);
            SetPlayerProgressBarValue(playerid,cutting,0);
 			HidePlayerProgressBar(playerid,cutting);
			CreateItem(ModelWood,1,x,y,z-1,0,0,0,0,0);
            
            }
            break;
        }
    }
    
	return 1;
	}
	if(PRESSED(KEY_HANDBRAKE))
	{
	GetEmptyAmmo(playerid);
	}
	if(PRESSED(KEY_CTRL_BACK))
	{
	PutWeaponINV(playerid);
	}
	if (PRESSED(KEY_CROUCH))
	{
	OnPlayerPickupItem(playerid);
	}
	if (PRESSED(KEY_YES)) 
	{
	ShowInventory(playerid);
	}
	if (PRESSED(KEY_NO))
	{
	ShowInvDrop(playerid);
	}
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}



public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	InventoryOnDialogResponse(playerid, dialogid, response, inputtext);
	InventoryDropOnDialogResponse(playerid, dialogid, response, inputtext);
	if(dialogid == DIALOG_CRAFT1)
	{
	if(!response) return 1;
	if(response)
	{
	if(listitem == 0)
	{
	ShowPlayerDialog(playerid,DIALOG_CRAFTHAMMER,0,"Craft Hammer","Need 1 iron and 1 wood","Craft","Close");
	}
	if(listitem == 1)
	{
	ShowPlayerDialog(playerid,DIALOG_CRAFTWALL,0,"Craft Wall","Need  15 wood","Craft","Close");
	}
	if(listitem == 2)
	{
	ShowPlayerDialog(playerid,DIALOG_CRAFTWALLDOOR,0,"Craft Wall door","Need 10 wood","Craft","Close");
	}
	if(listitem == 3)
	{
	ShowPlayerDialog(playerid,DIALOG_CRAFTGATE,0,"Craft Gate","Need 10 iron ","Craft","Close");
	}
	}
	}
	if(dialogid == DIALOG_GPS)
	{
	if(!response) return 1;
	if(response)
	{
	if(listitem == 0)//m1
	{
	SetPlayerCheckpoint(playerid,-1310.1714,-2407.3848,32.0838,3);
	}
	if(listitem == 1)//m2
	{
	SetPlayerCheckpoint(playerid,-1040.0635,-2286.8508,59.0006,3);
	}
	if(listitem == 2)//fish1
	{
	SetPlayerCheckpoint(playerid,-1219.8186,-2363.8599,1.0119,3);
	}
	if(listitem == 3)//fish2
	{
	SetPlayerCheckpoint(playerid,-1207.7113,-2602.2327,1.0976,3);
	}
	if(listitem == 4)//fish3
	{
	SetPlayerCheckpoint(playerid,-1178.8430,-2632.9854,11.7578,3);
	}
	}
	}
	if(dialogid == DIALOG_CRAFT)
	{
	if(response)
	{
	if(listitem ==0)
	{
	    ShowPlayerDialog(playerid,DIALOG_CRAFTFISH,0,"Craft FishingRob","You need 1 wood and 1 iron to craft","Craft","Close");
	}
	if(listitem ==1)
	{
	    ShowPlayerDialog(playerid,DIALOG_CRAFTCHAIN,0,"Craft ChainSaw","You need Copper and Iron to Craft","Craft","Close");
	}
	if(listitem ==2)
	{
	    ShowPlayerDialog(playerid,DIALOG_CRAFTSH,0,"Craft Shovel","You need Copper and Iron to craft","Craft","Close");
	}
	if(listitem == 3)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTBED,0,"Craft Bed","You need 2 wood to craft","Craft","Close");
	}
	if(listitem == 4)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTBOX,0,"Craft Box","You need 10 wood to craft","Craft","Close");
	}
	if(listitem == 5)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTKNIFE,0,"Craft Knife","You need 1 wood and 1 iron to craft","Craft","Close");
	}
	if(listitem == 6)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTENGINE,0,"Craft Engine","You need 1 Copper and 2 iron to craft","Craft","Close");
	}
	if(listitem == 7)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTACOLT,0,"Craft Ammo Colt","You need 5 Copper to craft","Craft","Close");
	}
	if(listitem == 8)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTASHOT,0,"Craft Ammo Showgun","You need 10 Copper to craft","Craft","Close");
	}
	if(listitem == 9)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTASMS,0,"Craft Ammo SMS","You need 10 Copper to craft","Craft","Close");
	}
	if(listitem == 10)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTAAUS,0,"Craft Ammo Aus","You need 15 Copper to craft","Craft","Close");
	}
	if(listitem == 11)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTARIFLE,0,"Craft Ammo Rifle","You need 20 Copper and 2 Iron to craft","Craft","Close");
	}
	if(listitem == 12)
	{
		ShowPlayerDialog(playerid,DIALOG_CRAFTTOOLBOX,0,"Craft Tools box","You need 3 Copper and 2 Iron and 1 wood to craft","Craft","Close");
	}
	}
	}
	if(dialogid == DIALOG_CSKIN1)
	{
	if(!response) return 1;
	if(response)
	{
	if(PlayerHasItem(playerid,"DeerSkin") >= 5)
	{
	GivePlayerSkin(playerid,170);
	RemoveItem(playerid,"DeerSkin",5);
	PlayerInfo[playerid][pSlotu] -=5;
	}
	}
	}
	if(dialogid == DIALOG_CSKIN2)
	{
	if(!response) return 1;
	if(response)
	{
	if(PlayerHasItem(playerid,"DeerSkin") >= 10)
	{
	GivePlayerSkin(playerid,294);
	RemoveItem(playerid,"DeerSkin",10);
	PlayerInfo[playerid][pSlotu] -=10;
	}
	}
	}
	if(dialogid == DIALOG_CSKIN3)
	{
	if(!response) return 1;
	if(response)
	{
	if(PlayerHasItem(playerid,"DeerSkin") >= 5)
	{
	GivePlayerSkin(playerid,157);
	RemoveItem(playerid,"DeerSkin",5);
	PlayerInfo[playerid][pSlotu] -=5;
	}
	}
	}
	if(dialogid == DIALOG_CSKIN4)
	{
	if(!response) return 1;
	if(response)
	{
	if(PlayerHasItem(playerid,"DeerSkin") >= 10)
	{
	GivePlayerSkin(playerid,169);
	RemoveItem(playerid,"DeerSkin",10);
	PlayerInfo[playerid][pSlotu] -=10;
	}
	}
	}
	//////////////////////////
	if(dialogid == DIALOG_CRAFTHAMMER)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Wood") && PlayerHasItem(playerid,"Iron"))
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,4000);
		CreateItem(ModelHammer,1,x,y,z-1,180.05988, 90.42004,0,0,0);
		RemoveItem(playerid,"Wood",1);
		RemoveItem(playerid,"Iron",1);
		PlayerInfo[playerid][pSlotu] -=2;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need Wood and iron to craft");
		}
	}
	}
	if(dialogid == DIALOG_CRAFTWALL)
	{
	if(!response) return 1;
	if(response)
	{
	    if(!PlayerHasItem(playerid,"Hammer")) return SCM(playerid,-1,"You need hammer to craft it");
		if(PlayerHasItem(playerid,"Wood") >= 15)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,15000);
		CreateItem(ModelWall,1,x,y,z-1,180.05988, 90.42004,0,0,0);
		RemoveItem(playerid,"Wood",15);
		PlayerInfo[playerid][pSlotu] -=15;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 15 wood to craft");
		}
	}
	}
	if(dialogid == DIALOG_CRAFTWALLDOOR)
	{
	if(!response) return 1;
	if(response)
	{
		if(!PlayerHasItem(playerid,"Hammer")) return SCM(playerid,-1,"You need hammer to craft it");
		if(PlayerHasItem(playerid,"Wood") >= 10)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,14000);
		CreateItem(ModelWall,1,x,y,z-1,180.05988, 90.42004,0,0,0);
		RemoveItem(playerid,"Wood",10);
		PlayerInfo[playerid][pSlotu] -=10;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 10 wood to craft");
		}
	}
	}
	if(dialogid == DIALOG_CRAFTGATE)
	{
	if(!response) return 1;
	if(response)
	{
	    if(!PlayerHasItem(playerid,"Hammer")) return SCM(playerid,-1,"You need hammer to craft it");
		if(PlayerHasItem(playerid,"Iron") >= 10)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,20000);
		CreateItem(ModelWall,1,x,y,z-1,180.05988, 90.42004,0,0,0);
		RemoveItem(playerid,"Iron",10);
		PlayerInfo[playerid][pSlotu] -=10;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 10 iron to craft");
		}
	}
	}
	//////////////////////////
	if(dialogid == DIALOG_CRAFTFISH)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Wood") && PlayerHasItem(playerid,"Iron"))
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,4000);
		CreateItem(ModelFishRob,1,x,y,z-1,180.05988, 90.42004,0,0,0);
		RemoveItem(playerid,"Wood",1);
		RemoveItem(playerid,"Iron",1);
		PlayerInfo[playerid][pSlotu] -=2;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need Wood and iron to craft");
		}
	}
	}
	/////////////////////////
	if(dialogid == DIALOG_CRAFTCHAIN)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Copper") && PlayerHasItem(playerid,"Iron"))
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,6000);
		CreateItem(ModelChainsaw,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Iron",1);
		RemoveItem(playerid,"Copper",1);
		PlayerInfo[playerid][pSlotu] -=2;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need Copper and iron to craft");
		}
	}
	}
	/////////////////////////
	if(dialogid == DIALOG_CRAFTBOX)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Wood") >= 10)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,10000);
		CreateItem(ModelBox,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Wood",5);
		PlayerInfo[playerid][pSlotu] -=5;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 5 wood to craft");
		}
	}
	}
	/////////////////////////
	if(dialogid == DIALOG_CRAFTBED)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Wood") >= 2)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,10000);
		CreateItem(ModelBed,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Wood",2);
		PlayerInfo[playerid][pSlotu] -=2;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 2 wood to craft");
		}
	}
	}
	/////////////////////////
	/////////////////////////

	if(dialogid == DIALOG_CRAFTSH)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Copper") && PlayerHasItem(playerid,"Iron"))
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,4000);
		CreateItem(ModelShovel,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Iron",1);
		RemoveItem(playerid,"Copper",1);
		PlayerInfo[playerid][pSlotu] -=2;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need Copper and iron to craft");
		}
	}
	}
	//
	if(dialogid == DIALOG_CRAFTKNIFE)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Wood") && PlayerHasItem(playerid,"Iron"))
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,4000);
		CreateItem(ModelKnife,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Iron",1);
		RemoveItem(playerid,"Copper",1);
		PlayerInfo[playerid][pSlotu] -=2;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need wood and iron to craft");
		}
	}
	}
	/////////////////////////////////////
	if(dialogid == DIALOG_CRAFTENGINE)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Copper") && PlayerHasItem(playerid,"Iron") >=2)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,20000);
		CreateItem(ModelEngine,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Iron",2);
		RemoveItem(playerid,"Copper",1);
		PlayerInfo[playerid][pSlotu] -=3;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need Copper and iron to craft");
		}
	}
	}
	/////////////////////////////////////
	if(dialogid == DIALOG_CRAFTACOLT)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Copper") >= 5)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,15000);
		CreateItem(ModelAColt,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Copper",5);
		PlayerInfo[playerid][pSlotu] -=5;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 5 Copper to craft");
		}
	}
	}
	/////////////////////////////////////
	if(dialogid == DIALOG_CRAFTASHOT)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Copper") >= 10)
		{
        LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,20000);
		CreateItem(ModelAShotgun,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Copper",10);
		PlayerInfo[playerid][pSlotu] -=10;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 10 Copper to craft");
		}
	}
	}
	if(dialogid == DIALOG_CRAFTASMS)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Copper") >= 10)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,20000);
		CreateItem(ModelASMS,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Copper",10);
		PlayerInfo[playerid][pSlotu] -=10;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 10 Copper to craft");
		}
	}
	}
	if(dialogid == DIALOG_CRAFTAAUS)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Copper") >= 15)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,24000);
		CreateItem(ModelAAus,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Copper",15);
		PlayerInfo[playerid][pSlotu] -=15;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 15 Copper to craft");
		}
	}
	}
	if(dialogid == DIALOG_CRAFTARIFLE)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Copper") >= 20 && PlayerHasItem(playerid,"Iron") >= 2)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,30000);
		CreateItem(ModelARifle,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Copper",20);
		RemoveItem(playerid,"Iron",2);
		PlayerInfo[playerid][pSlotu] -=22;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 20 Copper and 2 iron to craft");
		}
	}
	}
	if(dialogid == DIALOG_CRAFTTOOLBOX)
	{
	if(!response) return 1;
	if(response)
	{
		if(PlayerHasItem(playerid,"Copper") >= 3 && PlayerHasItem(playerid,"Iron") >= 2&& PlayerHasItem(playerid,"Wood") >= 1)
		{
		LoopingAnim(playerid,"BOMBER","BOM_Plant_Loop",4,1,1,1,0,15000);
		CreateItem(ModelARifle,1,x,y,z-1,0,0,0,0,0);
		RemoveItem(playerid,"Copper",3);
		RemoveItem(playerid,"Iron",2);
		RemoveItem(playerid,"Wood",1);
		PlayerInfo[playerid][pSlotu] -=6;
		}
		else
		{
		SCM(playerid,COLOR_RED,"You need 3 Copper 2 iron and 1 wood  to craft");
		}
	}
	}
	if(dialogid == Dialog_Edit)
	{
        if(!response) return 1;
		if(listitem == 0)
		{
			ApplyAnimation(playerid, "CARRY", "liftup", 4, 0, 0, 0, 0, 0);
			SetTimerEx("Lift", 1500, false, "i", playerid);
			SCM(playerid, 0xFFFFFFC8, "* /putdown, can put down Base.");
		}
		if(listitem == 1)
		{
  			BaseInfo[PlayerUseingBase[playerid]][bLifup] = true;
			EditDynamicObject(playerid, BaseInfo[PlayerUseingBase[playerid]][bObject]);
		}
		if(listitem == 2)
		{
		    BaseInfo[PlayerUseingBase[playerid]][bLock] = 1;
		    SaveBase(PlayerUseingBase[playerid]);
		}
		if(listitem == 3)
		{
		    BaseInfo[PlayerUseingBase[playerid]][bLock] = 0;
		    SaveBase(PlayerUseingBase[playerid]);
		}
	}
	if(dialogid == Dialog_Down)
	{
	    if(!response) return 1;
		ApplyAnimation(playerid, "Freeweights", "gym_free_putdown", 2, 0, 0, 0, 0, 0);
      	SetTimerEx("PutDown", 1500, false, "i", playerid);
		RemovePlayerAttachedObject(playerid,8);
		PlayerPutDown[playerid] = true;
		PlayerLiftup[playerid] = false;
	}
	if(dialogid == Dialog_GetRangeBase)
	{
		if(!response) return 1;
      	new string[256];
     	PlayerUseingBase[playerid] = ShowPlayerRangeBase[playerid][listitem];
		format(string, sizeof(string), "[Base ID]: %d", BaseInfo[PlayerUseingBase[playerid]][bID]);
       	ShowPlayerDialog(playerid, Dialog_Edit, DIALOG_STYLE_LIST, string, "Liftup\nEdit Position\nLock\nUnLock\nMove\nNoMove", "Select", "Close");
	}
	/////////////////////
	if(dialogid == DIALOG_SBAN)
	{
	if(!response) return Kick(playerid);
	if(response) return Kick(playerid);
	}

    switch( dialogid )
    {
        case DIALOG_REGISTER:
        {
            if (!response) return Kick(playerid);
            if(response)
            {
                if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""COL_WHITE"Registering...",""COL_RED"You have entered an invalid password.\n"COL_WHITE"Type your password below to register a new account.","Register","Quit");
                new INI:File = INI_Open(UserPath(playerid));
                INI_SetTag(File,"data");
                INI_WriteInt(File,"Password",udb_hash(inputtext));
                INI_WriteInt(File,"Cash",0);
                INI_WriteInt(File,"Admin",0);
                INI_WriteInt(File,"Kills",0);
                INI_WriteInt(File,"Deaths",0);
                INI_WriteInt(File,"Spawn",0);
                INI_Close(File);
                PlayerInfo[playerid][hp] = 100;
                PlayerInfo[playerid][pHunger] = 100;
                PlayerInfo[playerid][pThirst] = 100;
    			PlayerInfo[playerid][pSlot] = 5;
   				PlayerInfo[playerid][pSlotu] = 0;
                SpawnPlayer(playerid);
                
            }
        }

        case DIALOG_LOGIN:
        {
            if ( !response ) return Kick ( playerid );
            if( response )
            {
                if(udb_hash(inputtext) == PlayerInfo[playerid][pPass])
                {
                    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
                    PlayerInfo[playerid][pSpawn] =1;
                }
                else
                {
                    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,""COL_WHITE"Login",""COL_RED"You have entered an incorrect password.\n"COL_WHITE"Type your password below to login.","Login","Quit");
                }
                return 1;
            }
        }
    }
	return 1;
}
public OnPlayerModelSelectionEx(playerid, response, extraid, modelid)
{
    if(extraid == MENUCRAFTSKIN)
	{
	    if(response)
	    {
	    if(modelid == 170)
	    {
	    
	    HideModelSelectionMenu(playerid);
		ShowPlayerDialog(playerid,DIALOG_CSKIN1,0,"Skin Surival","You need 5 deerskin to craft","Craft","Close");
	    }
	    if(modelid == 294)
	    {

	    HideModelSelectionMenu(playerid);
		ShowPlayerDialog(playerid,DIALOG_CSKIN2,0,"Skin Wuzimu","You need 10 deerskin to craft","Craft","Close");
	    }
	    }
	}
	if(extraid == MENUCRAFTSKIN2)
	{
	    if(response)
	    {
	    if(modelid == 157)
	    {

	    HideModelSelectionMenu(playerid);
		ShowPlayerDialog(playerid,DIALOG_CSKIN3,0,"Skin cwfyhb","You need 5 deerskin to craft","Craft","Close");
	    }
	    if(modelid == 169)
	    {

	    HideModelSelectionMenu(playerid);
		ShowPlayerDialog(playerid,DIALOG_CSKIN4,0,"Skin sofyri","You need 10 deerskin to craft","Craft","Close");
	    }
	    }
	}
	if(extraid == CUSTOM_MENU)
	{
	    
	    if(response)
	    {
		if(modelid == ModelBurger)
		{
		if(GetPlayerCash(playerid) < 50) return HideModelSelectionMenu(playerid),SCM(playerid,COLOR_RED,"You not have $50");
		AddItem(playerid,"Burger",1);
		GivePlayerCash(playerid,-50);
		}
		if(modelid == ModelPizza)
		{
		if(GetPlayerCash(playerid) < 50) return HideModelSelectionMenu(playerid),SCM(playerid,COLOR_RED,"You not have $50");
		AddItem(playerid,"Pizza",1);
		GivePlayerCash(playerid,-50);
		}
		if(modelid == ModelWater)
		{
		if(GetPlayerCash(playerid) < 100) return HideModelSelectionMenu(playerid),SCM(playerid,COLOR_RED,"You not have $100");
		AddItem(playerid,"Water",1);
		GivePlayerCash(playerid,-100);
		}
		if(modelid == ModelSoda)
		{
		if(GetPlayerCash(playerid) < 100) return HideModelSelectionMenu(playerid),SCM(playerid,COLOR_RED,"You not have $100");
		AddItem(playerid,"Soda",1);
		GivePlayerCash(playerid,-100);
		}
		if(modelid == 1581)
		{
		if(GetPlayerCash(playerid) < 1000) return HideModelSelectionMenu(playerid),SCM(playerid,COLOR_RED,"You not have $1000");
		PlayerInfo[playerid][pNoR] +=1;
		GivePlayerCash(playerid,-1000);
		}
		if(modelid == 1310)
		{
		if(GetPlayerCash(playerid) < 500) return HideModelSelectionMenu(playerid),SCM(playerid,COLOR_RED,"You not have $500");
		AddItem(playerid,"Soda",1);
		PlayerInfo[playerid][pSlot] = 50;
		GivePlayerCash(playerid,-500);
		}
		}
	    else SCM(playerid, 0xFF0000FF, "Canceled buy");
	}
	return 1;
}
public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if(_:playertextid != INVALID_TEXT_DRAW)
    {
        if(playertextid == Gender1[playerid])
        {
		PlayerInfo[playerid][pMale] = 1;
		GivePlayerSkin(playerid,29);
		TogglePlayerControllable(playerid,1);
  		PlayerTextDrawHide(playerid,Gender0[playerid]);
        PlayerTextDrawHide(playerid,Gender1[playerid]);
        PlayerTextDrawHide(playerid,Gender2[playerid]);
        PlayerTextDrawHide(playerid,Gender3[playerid]);
        CancelSelectTextDraw(playerid);
        }
        if(playertextid == Gender2[playerid])
        {
		PlayerInfo[playerid][pMale] = 2;
		GivePlayerSkin(playerid,93);
		TogglePlayerControllable(playerid,1);
  		PlayerTextDrawHide(playerid,Gender0[playerid]);
        PlayerTextDrawHide(playerid,Gender1[playerid]);
        PlayerTextDrawHide(playerid,Gender2[playerid]);
        PlayerTextDrawHide(playerid,Gender3[playerid]);
        CancelSelectTextDraw(playerid);
        }

    }
    return 1;
}
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
public OnPlayerDropItem(playerid,ItemName[])
{
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);

	new wo = GetPlayerVirtualWorld(playerid),
		in =GetPlayerInterior(playerid);
	if(!strcmp(ItemName,"Bandage",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateItem(ModelBandage,1,x,y,z-1,0,0,0,wo,in);
    return 0;
    }
    if(!strcmp(ItemName,"DeerSkin",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateItem(ModelDeerSkin,1,x,y,z-1,0,0,0,wo,in);
    return 0;
    }
    if(!strcmp(ItemName,"Medkit",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateItem(ModelMedkit,1,x,y,z-1,0,0,0,wo,in);
    return 0;
    }
	if(!strcmp(ItemName,"AmmoColt",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateAmmo(ModelAColt,x,y,z-1);
    return 0;
    }
    if(!strcmp(ItemName,"AmmoShotgun",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateAmmo(ModelAShotgun,x,y,z-1);
    return 0;
    }
    if(!strcmp(ItemName,"AmmoSMS",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateAmmo(ModelASMS,x,y,z-1);
    return 0;
    }
    if(!strcmp(ItemName,"AmmoAus",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateAmmo(ModelAAus,x,y,z-1);
    return 0;
    }
    if(!strcmp(ItemName,"AmmoRifle",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateAmmo(ModelARifle,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"GolfClub",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelGolf,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Nightstick",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelNight,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Knife",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelKnife,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Baseball",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelBaseball,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Shovel",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelShovel,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Pool",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelPool,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Katana",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelKatana,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Chainsaw",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelChainsaw,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Purple",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelPurple,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Dildo",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelDildo,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Vibrator",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelVibrator,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Silver",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelSilver,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Flowers",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelFlowers,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Cane",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelCane,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Grenade",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelGrenade,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"TearGas",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelTearGas,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Molotov",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelMolotov,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"9mm",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(Model9mm,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Silenced",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelSilenced,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Deagle",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelDeagle,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Shotgun",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelShotgun,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Sawnoff",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelSawnoff,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Spas12",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelCombat,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Uzi",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelUzi,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Mp5",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelMp5,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"AK47",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelAK47,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"M4",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelM4,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Tec9",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelTec9,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Rifle",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelRifle,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Sniper",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelSniper,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Spraycan",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelSpraycan,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Camera",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelCamera,x,y,z-1);
    return 0;
    }
    if(!strcmp(ItemName,"Fire",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    CreateGun(ModelFire,x,y,z-1);
    return 0;
    }
	if(!strcmp(ItemName,"Pizza",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelPizza,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    return 0;
    }
	if(!strcmp(ItemName,"Burger",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelBurger,1,x,y,z-1,-17.34000, -89.34000, -28.20000,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item burger");
    return 0;
    }
	if(!strcmp(ItemName,"Soda",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelSoda,1,x,y,z-0.7,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Soda");
    return 0;
    }
	if(!strcmp(ItemName,"Water",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelWater,1,x,y,z-0.7,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Water");
    return 0;
    }
	if(!strcmp(ItemName,"EWater",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelEWater,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item empty water");
    return 0;
    }
	if(!strcmp(ItemName,"GpsMap",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelGpsMap,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item GpsMap");
    return 0;
    }
	if(!strcmp(ItemName,"GasCan",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelGascan,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Gas can");
    return 0;
    }
	if(!strcmp(ItemName,"EGasCan",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelEGascan,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item empty gas can");
    return 0;
    }
	if(!strcmp(ItemName,"Wood",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelWood,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item wood");
    return 0;
    }
    if(!strcmp(ItemName,"Iron",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelIron,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item iron");
    return 0;
    }
    if(!strcmp(ItemName,"Copper",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelCU,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item CU");
    return 0;
    }
	if(!strcmp(ItemName,"FishingRob",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelFishRob,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item FishingRob");
    return 0;
    }
	if(!strcmp(ItemName,"FishUnCook",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelFishUC,1,x,y,z-1,-0.17997, -74.46001, -12.54000,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Fish un cook");
    return 0;
    }
    if(!strcmp(ItemName,"FishCook",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelFishC,1,x,y,z-1,-0.17997, -74.46001, -12.54000,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Fish has cook");
    return 0;
    }
    if(!strcmp(ItemName,"MeatCook",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelMeatC,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item meat has cook");
    return 0;
    }
    if(!strcmp(ItemName,"MeatUnCook",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelMeatUC,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item meat un cook");
    return 0;
    }
    if(!strcmp(ItemName,"Engine",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelEngine,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Engine");
    return 0;
    }
    if(!strcmp(ItemName,"Bedpack",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelBed,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item bed pack");
    return 0;
    }
    if(!strcmp(ItemName,"Box",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelBox,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item box");
    return 0;
    }
    if(!strcmp(ItemName,"ToolBox",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelToolbox,1,x,y,z-1,0,0,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Toolbox");
    return 0;
    }
    if(!strcmp(ItemName,"Hammer",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelHammer,1,x,y,z-1, 180.05988, 90.42004,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Hammer");
    return 0;
    }
    if(!strcmp(ItemName,"Wall",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelWall,1,x,y,z-1, 180.05988, 90.42004,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Wall");
    return 0;
    }
    if(!strcmp(ItemName,"Walldoor",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelWalldoor,1,x,y,z-1, 180.05988, 90.42004,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item Walldoor");
    return 0;
    }
    if(!strcmp(ItemName,"Gate1",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelGate1,1,x,y,z-0.8, 180.05988, 90.42004,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item gate");
    return 0;
    }
    if(!strcmp(ItemName,"Gate2",true))
	{
    RemoveItem(playerid,ItemName,1);
    CreateItem(ModelGate2,1,x,y,z-1, 180.05988, 90.42004,0,wo,in);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You drop item gate");
    return 0;
    }
	return 0;
}
public OnPlayerUseItem(playerid,ItemName[])
{
	if(!strcmp(ItemName,"Hammer",true))
	{
    SCM(playerid,-1,"This Item use for bulding");
    return 0;
    }
    //////////////////////////////
    if(!strcmp(ItemName,"Wall",true))
	{
	if(PlayerHasItem(playerid,"Hammer"))
	{
	new Float:x, Float:y, Float:z;
	new NewID = GetBaseID();
	if(NewID == -1) return SCM(playerid, 0xFF0000C8, "* No extra Base that you can not continue to create.");
	GetPlayerPos(playerid,x,y,z);
	BaseInfo[NewID][bID] = NewID;
	BaseInfo[NewID][bModel] = ModelWall;
	BaseInfo[NewID][bX] = x +1;
	BaseInfo[NewID][bY] = y +1;
	BaseInfo[NewID][bZ] = z;
	BaseInfo[NewID][bRX] = 0;
	BaseInfo[NewID][bRY] = 0;
	BaseInfo[NewID][bRZ] = 0;
	BaseInfo[NewID][bvID] = GetPlayerVirtualWorld(playerid);
	BaseInfo[NewID][bInt] = GetPlayerInterior(playerid);
	BaseInfo[NewID][bLifup] = false;
	CreateBase(NewID);
	SaveBase(NewID);
	RemoveItem(playerid,ItemName,1);
	PlayerInfo[playerid][pSlotu] --;
	}
	else
	{
	SCM(playerid,-1,"You need item hammer");
	}
    return 0;
    }
    //////////////////////////////
    if(!strcmp(ItemName,"Walldoor",true))
	{
	if(PlayerHasItem(playerid,"Hammer"))
	{
	new Float:x, Float:y, Float:z;
	new NewID = GetBaseID();
	if(NewID == -1) return SCM(playerid, 0xFF0000C8, "* No extra Base that you can not continue to create.");
	GetPlayerPos(playerid,x,y,z);
	BaseInfo[NewID][bID] = NewID;
	BaseInfo[NewID][bModel] = ModelWalldoor;
	BaseInfo[NewID][bX] = x +1;
	BaseInfo[NewID][bY] = y +1;
	BaseInfo[NewID][bZ] = z;
	BaseInfo[NewID][bRX] = 0;
	BaseInfo[NewID][bRY] = 0;
	BaseInfo[NewID][bRZ] = 0;
	BaseInfo[NewID][bvID] = GetPlayerVirtualWorld(playerid);
	BaseInfo[NewID][bInt] = GetPlayerInterior(playerid);
	BaseInfo[NewID][bLifup] = false;
	CreateBase(NewID);
	SaveBase(NewID);
	RemoveItem(playerid,ItemName,1);
	PlayerInfo[playerid][pSlotu] --;
	}
	else
	{
	SCM(playerid,-1,"You need item hammer");
	}
    return 0;
    }
	////////////////////////////////
    if(!strcmp(ItemName,"Gate1",true))
	{
	if(PlayerHasItem(playerid,"Hammer"))
	{
	new Float:x, Float:y, Float:z;
	new NewID = GetBaseID();
	if(NewID == -1) return SCM(playerid, 0xFF0000C8, "* No extra Base that you can not continue to create.");
	GetPlayerPos(playerid,x,y,z);
	BaseInfo[NewID][bID] = NewID;
	BaseInfo[NewID][bModel] = ModelGate1;
	BaseInfo[NewID][bX] = x +1;
	BaseInfo[NewID][bY] = y +1;
	BaseInfo[NewID][bZ] = z;
	BaseInfo[NewID][bRX] = 0;
	BaseInfo[NewID][bRY] = 0;
	BaseInfo[NewID][bRZ] = 0;
	BaseInfo[NewID][bvID] = GetPlayerVirtualWorld(playerid);
	BaseInfo[NewID][bInt] = GetPlayerInterior(playerid);
	BaseInfo[NewID][bLifup] = false;
	CreateBase(NewID);
	SaveBase(NewID);
	RemoveItem(playerid,ItemName,1);
	PlayerInfo[playerid][pSlotu] --;
	}
	else
	{
	SCM(playerid,-1,"You need item hammer");
	}
    return 0;
    }
    //////////////////////////////////////
    if(!strcmp(ItemName,"Gate2",true))
	{
	if(PlayerHasItem(playerid,"Hammer"))
	{
	new Float:x, Float:y, Float:z;
	new NewID = GetBaseID();
	if(NewID == -1) return SCM(playerid, 0xFF0000C8, "* No extra Base that you can not continue to create.");
	GetPlayerPos(playerid,x,y,z);
	BaseInfo[NewID][bID] = NewID;
	BaseInfo[NewID][bModel] = ModelGate2;
	BaseInfo[NewID][bX] = x +1;
	BaseInfo[NewID][bY] = y +1;
	BaseInfo[NewID][bZ] = z;
	BaseInfo[NewID][bRX] = 0;
	BaseInfo[NewID][bRY] = 0;
	BaseInfo[NewID][bRZ] = 0;
	BaseInfo[NewID][bvID] = GetPlayerVirtualWorld(playerid);
	BaseInfo[NewID][bInt] = GetPlayerInterior(playerid);
	BaseInfo[NewID][bLifup] = false;
	CreateBase(NewID);
	SaveBase(NewID);
	RemoveItem(playerid,ItemName,1);
	PlayerInfo[playerid][pSlotu] --;
	}
	else
	{
	SCM(playerid,-1,"You need item hammer");
	}
    return 0;
    }
    ////////////////////////////////
	if(!strcmp(ItemName,"Wood",true))
	{
    new Float: X, Float: Y, Float: Z;
    GetPlayerPos(playerid, X, Y, Z);

    cfInfo[cfCount][xPos] = X;
    cfInfo[cfCount][yPos] = Y;
    cfInfo[cfCount][zPos] = Z;

    cfInfo[cfCount][LogObj] = CreateDynamicObject(1463, X, Y, Z - 1, 0.0, 0.0, 0.0);
    cfInfo[cfCount][FireObj] = CreateDynamicObject(18692, X, Y, Z - 2.5, 0.0, 0.0, 0.0);

    SCM(playerid, 0xA3A3A3FF, "A campfire has been placed underneath your feet. It will last for ten minutes.");
    SetTimerEx("ExtFire", 600000, false, "i", cfCount);

    cfCount ++;
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You for fire or craft");
    return 0;
    }
    if(!strcmp(ItemName,"Bedpack",true))
	{
    new Float: X, Float: Y, Float: Z;
    GetPlayerPos(playerid, X, Y, Z);
    BedInfo[bedCount][bx] = X;
    BedInfo[bedCount][by] = Y;
    BedInfo[bedCount][bz] = Z;
    BedInfo[bedCount][bObj] = CreateDynamicObject(1793, X, Y, Z - 1.5, 0.0, 0.0, 0.0);
    SCM(playerid, 0xA3A3A3FF, "A bed has been placed.");
    bedCount ++;
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You for sleep");
    return 0;
    }
	if(!strcmp(ItemName,"Engine",true))
	{
	new Float:vx,Float:vy,Float:vz;
	if(PlayerHasItem(playerid,"Toolbox"))
	{
    for(new v=0;v<MAX_VEHICLES;v++)
    {
    GetVehiclePos(v,vx,vy,vz);
	if(IsPlayerInRangeOfPoint(playerid,3,vx,vy,vz))
	{
	if(VInfo[v][Engine] == 1)
	{
	SCM(playerid,COLOR_RED,"This vehicle has engine");
	return 0;
	}
	VInfo[v][Engine] = 1;
 	RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
	}
    }
    }
    else
    {
    SCM(playerid,COLOR_RED,"You need tool box");
    }
    return 0;
    }
	if(!strcmp(ItemName,"GasCan",true))
	{
	new Float:vx,Float:vy,Float:vz;
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    for(new v=0;v<MAX_VEHICLES;v++)
    {
    GetVehiclePos(v,vx,vy,vz);
	if(IsPlayerInRangeOfPoint(playerid,3,vx,vy,vz))
	{
	VInfo[v][Fuel] += 50;
	if(VInfo[v][Fuel] > 100)
	{
	VInfo[v][Fuel] = 100;
	}
	}
    }
    return 0;
    }
    if(!strcmp(ItemName,"Box",true))
	{
    new Float: X, Float: Y, Float: Z,string[128];
    GetPlayerPos(playerid, X, Y, Z);
	for(new i=0;i<MAX_BOXS;i++)
	{
	if(BoxInfo[i][xPos] == 0&&BoxInfo[i][yPos] == 0&&BoxInfo[i][zPos] == 0)
	{
    BoxInfo[i][Obj] = CreateObject(1271, X +1, Y, Z-0.6, 0.0, 0.0, 0.0);
	BoxInfo[i][xPos] = X+1;
	BoxInfo[i][yPos] = Y;
	BoxInfo[i][zPos] = Z-0.6;
    new INI:File = INI_Open(BoxPath(i));
    INI_SetTag(File, "Box Data");
    INI_WriteFloat(File, "xPos", X+1);
    INI_WriteFloat(File, "yPos", Y);
    INI_WriteFloat(File, "zPos", Z-0.6);
    for(new is=0;is<10;is++)
	{
	format(string,sizeof(string),"Item%d",is);
	INI_WriteInt(File,string,0);
	}
    INI_Close(File);
    SCM(playerid, 0xA3A3A3FF, "Please move this box to a realistic, appropiate position.");
    RemoveItem(playerid,ItemName,1);
	PlayerInfo[playerid][pSlotu] -=1;
	break;
	}
	
	}
    return 0;
    }
    if(!strcmp(ItemName,"Toolbox",true))
	{
    SCM(playerid,-1,"This Item use for fix car engine");
    return 0;
    }
    if(!strcmp(ItemName,"DeerSkin",true))
	{

    SCM(playerid,-1,"This Item use for Craft");
    return 0;
    }
    if(!strcmp(ItemName,"Iron",true))
	{

    SCM(playerid,-1,"This Item use for Craft");
    return 0;
    }
    if(!strcmp(ItemName,"Copper",true))
	{

    SCM(playerid,-1,"This Item use for Craft");
    return 0;
    }
    if(!strcmp(ItemName,"FishingRob",true))
	{

    SCM(playerid,-1,"This Item use for fish /fish");
    return 0;
    }
    if(!strcmp(ItemName,"FishUnCook",true))
	{
    for(new i; i < MAX_CAMPFIRES; i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 2.0, cfInfo[i][xPos], cfInfo[i][yPos], cfInfo[i][zPos]))
        {
            CookTimer[playerid] = SetTimerEx("CookFish",RandomEx(10000,20000),0,"fff",cfInfo[i][xPos], cfInfo[i][yPos], cfInfo[i][zPos]);
            RemoveItem(playerid,ItemName,1);
    		PlayerInfo[playerid][pSlotu] -=1;
    		SCM(playerid,-1,"You use fish un cook");
            break;
        }
    }

    return 0;
    }
	if(!strcmp(ItemName,"FishCook",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
	SetPlayerHunger(playerid,100);
    SCM(playerid,-1,"You use fish has cook");
    return 0;
    }
    if(!strcmp(ItemName,"MeatUnCook",true))
	{
    for(new i; i < MAX_CAMPFIRES; i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 2.0, cfInfo[i][xPos], cfInfo[i][yPos], cfInfo[i][zPos]))
        {
            CookTimer[playerid] = SetTimerEx("CookMeat",RandomEx(10000,20000),0,"fff",cfInfo[i][xPos], cfInfo[i][yPos], cfInfo[i][zPos]);
            RemoveItem(playerid,ItemName,1);
    		PlayerInfo[playerid][pSlotu] -=1;
    		SCM(playerid,-1,"You use meat un cook");
            break;
        }
    }
    
    return 0;
    }
    if(!strcmp(ItemName,"MeatCook",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
	SetPlayerHunger(playerid,100);
    SCM(playerid,-1,"You use meat has cook");
    return 0;
    }
	if(!strcmp(ItemName,"Bandage",true))
	{
	PlayerInfo[playerid][pBleed] = 0;
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You use bandage");
    return 0;
    }
	if(!strcmp(ItemName,"Medkit",true))
	{
	SetPlayerHP(playerid,100);
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    SCM(playerid,-1,"You use medit");
    return 0;
    }
	if(!strcmp(ItemName,"EGasCan",true))
	{
	if(IsPlayerInPointGas(playerid))
	{
    RemoveItem(playerid,ItemName,1);
    AddItem(playerid,"GasCan",1);
    SCM(playerid,-1,"Full Gas can");
    }
    return 0;
    }
	if(!strcmp(ItemName,"AmmoColt",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    PlayerInfo[playerid][pAmmoColt] += 30;
    return 0;
    }
	if(!strcmp(ItemName,"AmmoShotgun",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    PlayerInfo[playerid][pAmmoShotgun] += 16;
    return 0;
    }
    if(!strcmp(ItemName,"AmmoSMS",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    PlayerInfo[playerid][pAmmoSMS] += 60;
    return 0;
    }
	if(!strcmp(ItemName,"AmmoAus",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    PlayerInfo[playerid][pAmmoAus] += 60;
    return 0;
    }
	if(!strcmp(ItemName,"AmmoRifle",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    PlayerInfo[playerid][pAmmoRifle] += 5;
    return 0;
    }
	if(!strcmp(ItemName,"GolfClub",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,2,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Nightstick",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,3,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Knife",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,4,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Baseball",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,5,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Shovel",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,6,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Pool",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,7,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Katana",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,8,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Chainsaw",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,9,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Purple",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,10,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Dildo",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,11,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Vibrator",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,12,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Silver",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,13,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Flowers",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,14,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Cane",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,15,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Grenade",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,16,99999);
    return 0;
    }
	if(!strcmp(ItemName,"TearGas",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,17,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Molotov",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,18,99999);
    return 0;
    }
	if(!strcmp(ItemName,"9mm",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,22,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Silenced",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,23,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Deagle",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,24,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Shotgun",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,25,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Sawnoff",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,26,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Spas12",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,27,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Uzi",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,28,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Mp5",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,29,99999);
    return 0;
    }
	if(!strcmp(ItemName,"AK47",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,30,99999);
    return 0;
    }
	if(!strcmp(ItemName,"M4",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,31,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Tec9",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,32,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Rifle",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,33,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Sniper",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,34,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Spraycan",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,41,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Camera",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,43,99999);
    return 0;
    }
    if(!strcmp(ItemName,"Fire",true))
	{
    RemoveItem(playerid,ItemName,1);
    PlayerInfo[playerid][pSlotu] -=1;
    GivePlayerWeaponAC(playerid,42,99999);
    return 0;
    }
	if(!strcmp(ItemName,"Pizza",true))
	{

    if(GetPlayerHunger(playerid)>=100)return SCM(playerid,0xFFFFFFFF,"You not hungy.");
	GivePlayerHunger(playerid,50);
	if(GetPlayerHunger(playerid) > 100) SetPlayerHunger(playerid,100);
    RemoveItem(playerid,ItemName,1); 
    SCM(playerid,0xFFFFFFFF,"You used a pizza.");
    PlayerInfo[playerid][pSlotu] -=1;
    return 0;
    }
	if(!strcmp(ItemName,"Burger",true))
	{
    if(GetPlayerHunger(playerid)>=100)return SCM(playerid,0xFFFFFFFF,"You not hungy.");
	GivePlayerHunger(playerid,30);
	if(GetPlayerHunger(playerid) > 100) SetPlayerHunger(playerid,100);
    RemoveItem(playerid,ItemName,1);
    SCM(playerid,0xFFFFFFFF,"You used a burger.");
    PlayerInfo[playerid][pSlotu] -=1;
    return 0;
    }
 	if(!strcmp(ItemName,"Soda",true))
	{
    if(GetPlayerThirst(playerid)>=100)return SCM(playerid,0xFFFFFFFF,"You not Thirst.");
	GivePlayerThirst(playerid,50);
	if(GetPlayerThirst(playerid) > 100) SetPlayerThirst(playerid,100);
    RemoveItem(playerid,ItemName,1);
    SCM(playerid,0xFFFFFFFF,"You used a Soda.");
    PlayerInfo[playerid][pSlotu] -=1;
    return 0;
    }
	if(!strcmp(ItemName,"Water",true))
	{
    if(GetPlayerThirst(playerid)>=100)return SCM(playerid,0xFFFFFFFF,"You not Thirst.");
	GivePlayerThirst(playerid,50);
	if(GetPlayerThirst(playerid) > 100) SetPlayerThirst(playerid,100);
    RemoveItem(playerid,ItemName,1);
    SCM(playerid,0xFFFFFFFF,"You used a Water bottle.");
	AddItem(playerid,"EWater",1);
    return 0;
    }
	if(!strcmp(ItemName,"EWater",true))
	{
	if(IsPlayerInPointWater(playerid))
	{
    RemoveItem(playerid,ItemName,1);
    SCM(playerid,0xFFFFFFFF,"add item water.");
	AddItem(playerid,"Water",1);
    return 0;
    }
    }
	if(!strcmp(ItemName,"GpsMap",true))
	{
    SCM(playerid,0xFFFFFFFF,"Item can not use . This item auto use");
    return 0;
    }
	return 0;
}
public CookMeat(Float:x,Float:y,Float:z)
{
	CreateItem(ModelMeatC,1,x,y,z,0,0,0,0,0);
	return 1;
}
public CookFish(Float:x,Float:y,Float:z)
{
	CreateItem(ModelFishC,1,x,y,z,-0.17997, -74.46001, -12.54000,0,0);
	return 1;
}
public OnPlayerPickupItem(playerid)
{
    for(new i = 0; i < sizeof(ItemInfo); i++)
    {
        if (IsPlayerInRangeOfPoint(playerid, 2.0,ItemInfo[i][ItemPosX],ItemInfo[i][ItemPosY],ItemInfo[i][ItemPosZ]))//when player in range of point item
        {
            if(GetPlayerVirtualWorld(playerid) == ItemInfo[i][ItemVWorld] && GetPlayerInterior(playerid) == ItemInfo[i][ItemInterior])
            {
                if(PlayerInfo[playerid][pSlotu] == PlayerInfo[playerid][pSlot]) return TextDrawShowForPlayer(playerid, TextFull);

                if(ItemInfo[i][ItemModel] == ModelBalo10)
                {
                if(PlayerInfo[playerid][pSlot] >= 10) return SCM(playerid,COLOR_RED,"This balo is small");
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item balo 10 slot");
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlot] = 10;
                cleani(i);
                }
                if(ItemInfo[i][ItemModel] == ModelBalo20)
                {
                if(PlayerInfo[playerid][pSlot] >= 20) return SCM(playerid,COLOR_RED,"This balo is small");
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item balo 20 slot");
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlot] = 20;
                cleani(i);
                }

                if(ItemInfo[i][ItemModel] == ModelBalo30)
                {
                if(PlayerInfo[playerid][pSlot] >= 30) return SCM(playerid,COLOR_RED,"This balo is small");
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item balo 30 slot");
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlot] = 30;
                cleani(i);
                }
                if(ItemInfo[i][ItemModel] == ModelBalo40)
                {
                if(PlayerInfo[playerid][pSlot] >= 40) return SCM(playerid,COLOR_RED,"This balo is small");
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item balo 40 slot");
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlot] = 40;
                cleani(i);
                }
                if(ItemInfo[i][ItemModel] == ModelBalo50)
                {
                if(PlayerInfo[playerid][pSlot] >= 50) return SCM(playerid,COLOR_RED,"This balo is small");
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item balo 50 slot");
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlot] = 50;
                cleani(i);
                }
                cleani(i);
                if(ItemInfo[i][ItemModel] == ModelHammer)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Hammer");
                AddItem(playerid,"Hammer",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelGate1)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Gate1");
                AddItem(playerid,"Gate1",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelGate2)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Gate2");
                AddItem(playerid,"ToolBox",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelWall)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Wall");
                AddItem(playerid,"Wall",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelWalldoor)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Walldoor");
                AddItem(playerid,"Walldoor",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelToolbox)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Toolbox");
                AddItem(playerid,"ToolBox",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelBox)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item box");
                AddItem(playerid,"Box",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelDeerSkin)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item deer skin");
                AddItem(playerid,"DeerSkin",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelBed)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item bed pack");
                AddItem(playerid,"Bedpack",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelEngine)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Engine");
                AddItem(playerid,"Engine",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelMeatC)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup meat cook");
                AddItem(playerid,"MeatCook",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelMeatUC)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup meat un cook");
                AddItem(playerid,"MeatUnCook",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelFishC)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup fish cook");
                AddItem(playerid,"FishCook",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelFishUC)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup fish un cook");
                AddItem(playerid,"FishUnCook",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelFishRob)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Fishing Rob");
                AddItem(playerid,"FishingRob",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelIron)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item iron");
                AddItem(playerid,"Iron",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelCU)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item CU");
                AddItem(playerid,"Copper",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelBandage)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item bandage");
                AddItem(playerid,"Bandage",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelMedkit)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item medkit");
                AddItem(playerid,"Medkit",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelWood)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Wood");
                AddItem(playerid,"Wood",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelAColt)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item ammo colt");
                AddItem(playerid,"AmmoColt",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelAShotgun)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item ammo shotgun");
                AddItem(playerid,"AmmoShotgun",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelASMS)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item ammo SMS");
                AddItem(playerid,"AmmoSMS",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelAAus)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item ammo Ausult");
                AddItem(playerid,"AmmoAus",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelARifle)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item ammo Rifle");
                AddItem(playerid,"AmmoRifle",1);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelGolf)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"GolfClub",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelNight)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Nightstick",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelKnife)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Knife",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelBaseball)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Baseball",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelShovel)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Shovel",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelPool)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Pool",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelKatana)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Katana",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelChainsaw)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Chainsaw",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelPurple)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Purple",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelDildo)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Dildo",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelVibrator)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Vibrator",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelSilver)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Silver",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelFlowers)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Flowers",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelCane)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Cane",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelGrenade)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Grenade",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelTearGas)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"TearGas",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelMolotov)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Molotov",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == Model9mm)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"9mm",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelSilenced)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Silenced",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelDeagle)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Deagle",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelShotgun)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Shotgun",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelSawnoff)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Sawnoff",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelCombat)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Spas12",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelUzi)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Uzi",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelMp5)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Mp5",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelAK47)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"AK47",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelM4)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"M4",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelTec9)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Tec9",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelRifle)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Rifle",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelSniper)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Sniper",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelSpraycan)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Spraycan",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelFire)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Fire",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
				if(ItemInfo[i][ItemModel] == ModelCamera)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item weapon");

                AddItem(playerid,"Camera",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelGpsMap)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item map gps");

                AddItem(playerid,"GpsMap",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelPizza)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Pizza");

                AddItem(playerid,"Pizza",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelBurger)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Burger");

                AddItem(playerid,"Burger",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
				}
                if(ItemInfo[i][ItemModel] == ModelSoda)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Soda");

                AddItem(playerid,"Soda",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelWater)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Water Bottle");

                AddItem(playerid,"Water",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                if(ItemInfo[i][ItemModel] == ModelEWater)
                {
                Delete3DTextLabel(Label[i]);
                DestroyObject(DropObject[i]);
                SCM(playerid,-1,"You pickup item Empty Water");

                AddItem(playerid,"EWater",ItemInfo[i][ItemAmount]);
                ItemInfo[i][ItemAmount] = 0;
                PlayerInfo[playerid][pSlotu] += 1;
                }
                return 1;
            }
        }
    }
    return 1;
}
stock cleani(i)
{
ItemInfo[i][ItemPosX] = 0.0;
ItemInfo[i][ItemPosY] = 0.0;
ItemInfo[i][ItemPosZ] = 0.0;
ItemInfo[i][ItemRotX] = 0.0;
ItemInfo[i][ItemRotY] = 0.0;
ItemInfo[i][ItemRotZ] = 0.0;
}
forward Bleeding();
public Bleeding()
{
	for(new i=0;i<MAX_PLAYERS;i++)
	{
	if(PlayerInfo[i][pBleed] == 1)
	{
	GivePlayerHP(i,-1);
	SCM(i,COLOR_RED,"Bleeding -1hp/5s :( ......");
	}
	}
	return 1;
}
//zombie data
public ZMOVE(npcid)
{
	new Float:p[3];
	foreach(Player,i)
	{
	GetPlayerPos(i,p[0],p[1],p[2]);
	if(IsPlayerInRangeOfPoint(npcid,50,p[0],p[1],p[2]))
	{
	FCNPC_GoTo(npcid,p[0],p[1],p[2],MOVE_TYPE_RUN,10,1);
 	if(IsPlayerInRangeOfPoint(npcid,1,p[0],p[1],p[2]))
	{
	FCNPC_Punch(npcid,p[0],p[1],p[2],125);
	}
	}
	}
	return 1;
}
public ResetNPCKeys(npcid) { FCNPC_SetKeys(npcid, 0); }
public FCNPC_OnTakeDamage(npcid, damagerid, weaponid, bodypart)
{
    new Float:HP = FCNPC_GetHealth(npcid);
    if(weaponid == 34) FCNPC_SetHealth(npcid, HP-120) ; // Sniper
	return 1;
}

public FCNPC_OnDeath(npcid, killerid, weaponid)
{
	defer RespawnZ(npcid);
	return 1;
}
public FCNPC_OnRespawn(npcid)
{
    new Random = random(sizeof(RandomZombieSpawns));
    FCNPC_SetSkin(npcid,162);
    FCNPC_SetPosition(npcid,RandomZombieSpawns[Random][0],RandomZombieSpawns[Random][1],RandomZombieSpawns[Random][2]);
	return 1;
}
timer RespawnZ[6000](npcid)
{
	FCNPC_Respawn(npcid);
    return 1;
}

stock ZombieExit()
{
	for(new i = 0; i < MAX_NODES; i++)
	{
	    if(FCNPC_IsNodeOpen(i))
			FCNPC_CloseNode(i);
	}
	return 1;
}

public FCNPC_OnCreate(npcid)
{
	return 1;
}

public FCNPC_OnChangeNode(playerid, nodeid)
{
 	return LosSantosNodes(nodeid) ? 1 : 0;
}

stock LosSantosNodes(zoneid)
{
	if((zoneid >= 5 && zoneid <= 7) || (zoneid >= 12 && zoneid <= 15) || (zoneid >= 20 && zoneid <= 23)) return 1;
	return 0;
}
//
public MessageToAdmins(color, str[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
        if(IsPlayerConnected(i) && PlayerInfo[i][pAdmin] >= 1)
        {
            SCM(i, color, str);
        }
    }
	return 1;
}
//database

public LoadUser_data(playerid,name[],value[])
{
    INI_Int("Password",PlayerInfo[playerid][pPass]);
    INI_Int("Banned",PlayerInfo[playerid][pBanned]);
    INI_Int("Cash",PlayerInfo[playerid][pCash]);
    INI_Int("EXP",PlayerInfo[playerid][pEXP]);
    INI_Int("NEXP",PlayerInfo[playerid][pNEXP]);
    INI_Int("Lv",PlayerInfo[playerid][pLv]);
    INI_Int("Admin",PlayerInfo[playerid][pAdmin]);
    INI_Int("Kills",PlayerInfo[playerid][pKills]);
	INI_Int("Has",PlayerInfo[playerid][pHas]);

    INI_Int("Hunger",PlayerInfo[playerid][pHunger]);
    INI_Int("Thirst",PlayerInfo[playerid][pThirst]);
    //ammo
    INI_Int("AmmoColt",PlayerInfo[playerid][pAmmoColt]);
    INI_Int("AmmoShotgun",PlayerInfo[playerid][pAmmoShotgun]);
    INI_Int("AmmoSMS",PlayerInfo[playerid][pAmmoSMS]);
    INI_Int("AmmoAus",PlayerInfo[playerid][pAmmoAus]);
    INI_Int("AmmoRifle",PlayerInfo[playerid][pAmmoRifle]);
    INI_Int("Deaths",PlayerInfo[playerid][pDeaths]);
    INI_Int("Bleed",PlayerInfo[playerid][pBleed]);
    INI_Int("Sleep",PlayerInfo[playerid][pSleep]);
    INI_Int("NoR",PlayerInfo[playerid][pNoR]);
    INI_Int("Spawn",PlayerInfo[playerid][pSpawn]);
    INI_Int("Slot",PlayerInfo[playerid][pSlot]);
    INI_Int("Slotu",PlayerInfo[playerid][pSlotu]);
    INI_Int("Skin",PlayerInfo[playerid][pSkin]);
    INI_Int("Male",PlayerInfo[playerid][pMale]);
    INI_Float("hp",PlayerInfo[playerid][hp]);
    INI_Float("sposx",PlayerInfo[playerid][sposx]);
    INI_Float("sposy",PlayerInfo[playerid][sposy]);
    INI_Float("sposz",PlayerInfo[playerid][sposz]);
    INI_Int("Weapon1",PlayerInfo[playerid][pWeapon][1]);
    INI_Int("Weapon2",PlayerInfo[playerid][pWeapon][2]);
    INI_Int("Weapon3",PlayerInfo[playerid][pWeapon][3]);
    INI_Int("Weapon4",PlayerInfo[playerid][pWeapon][4]);
    INI_Int("Weapon5",PlayerInfo[playerid][pWeapon][5]);
    INI_Int("Weapon6",PlayerInfo[playerid][pWeapon][6]);
    INI_Int("Weapon7",PlayerInfo[playerid][pWeapon][7]);
    INI_Int("Weapon8",PlayerInfo[playerid][pWeapon][8]);
    INI_Int("Weapon9",PlayerInfo[playerid][pWeapon][9]);
    INI_Int("Weapon10",PlayerInfo[playerid][pWeapon][10]);
    INI_Int("Weapon11",PlayerInfo[playerid][pWeapon][11]);
    INI_Int("Weapon12",PlayerInfo[playerid][pWeapon][12]);
    return 1;
}
SaveDatabase(playerid)
{
    PlayerInfo[playerid][pLog] = 0;
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid,x,y,z);
    for(new i=1;i<13;i++)
    {
    GetPlayerWeaponData(playerid,i, PlayerInfo[playerid][pWeapon][i],PlayerInfo[playerid][pWeapona][i]);
    }
    new INI:File = INI_Open(UserPath(playerid));
    INI_SetTag(File,"data");
    INI_WriteInt(File,"Weapon1",PlayerInfo[playerid][pWeapon][1]);
    INI_WriteInt(File,"Weapon2",PlayerInfo[playerid][pWeapon][2]);
    INI_WriteInt(File,"Weapon3",PlayerInfo[playerid][pWeapon][3]);
    INI_WriteInt(File,"Weapon4",PlayerInfo[playerid][pWeapon][4]);
    INI_WriteInt(File,"Weapon5",PlayerInfo[playerid][pWeapon][5]);
    INI_WriteInt(File,"Weapon6",PlayerInfo[playerid][pWeapon][6]);
    INI_WriteInt(File,"Weapon7",PlayerInfo[playerid][pWeapon][7]);
    INI_WriteInt(File,"Weapon8",PlayerInfo[playerid][pWeapon][8]);
    INI_WriteInt(File,"Weapon9",PlayerInfo[playerid][pWeapon][9]);
    INI_WriteInt(File,"Weapon10",PlayerInfo[playerid][pWeapon][10]);
    INI_WriteInt(File,"Weapon11",PlayerInfo[playerid][pWeapon][11]);
    INI_WriteInt(File,"Weapon12",PlayerInfo[playerid][pWeapon][12]);

	INI_WriteInt(File,"AmmoColt",PlayerInfo[playerid][pAmmoColt]);
	INI_WriteInt(File,"AmmoShotgun",PlayerInfo[playerid][pAmmoShotgun]);
	INI_WriteInt(File,"AmmoSMS",PlayerInfo[playerid][pAmmoSMS]);
	INI_WriteInt(File,"AmmoAus",PlayerInfo[playerid][pAmmoAus]);
	INI_WriteInt(File,"AmmoRifle",PlayerInfo[playerid][pAmmoRifle]);
    INI_WriteInt(File,"Banned",PlayerInfo[playerid][pBanned]);
    INI_WriteInt(File,"Cash",PlayerInfo[playerid][pCash]);
    INI_WriteInt(File,"EXP",PlayerInfo[playerid][pEXP]);
    INI_WriteInt(File,"NEXP",PlayerInfo[playerid][pNEXP]);
    INI_WriteInt(File,"Lv",PlayerInfo[playerid][pLv]);
    INI_WriteInt(File,"Admin",PlayerInfo[playerid][pAdmin]);
    INI_WriteInt(File,"Kills",PlayerInfo[playerid][pKills]);
    INI_WriteInt(File,"Has",PlayerInfo[playerid][pHas]);

    INI_WriteInt(File,"Deaths",PlayerInfo[playerid][pDeaths]);
    INI_WriteInt(File,"Bleed",PlayerInfo[playerid][pBleed]);
    INI_WriteInt(File,"Sleep",PlayerInfo[playerid][pSleep]);
    INI_WriteInt(File,"NoR",PlayerInfo[playerid][pNoR]);
    INI_WriteInt(File,"Hunger",PlayerInfo[playerid][pHunger]);
    INI_WriteInt(File,"Thirst",PlayerInfo[playerid][pThirst]);
    INI_WriteInt(File,"Spawn",PlayerInfo[playerid][pSpawn]);
    INI_WriteInt(File,"Slot",PlayerInfo[playerid][pSlot]);
    INI_WriteInt(File,"Slotu",PlayerInfo[playerid][pSlotu]);
    INI_WriteInt(File,"Skin",PlayerInfo[playerid][pSkin]);
    INI_WriteInt(File,"Male",PlayerInfo[playerid][pMale]);
    INI_WriteFloat(File,"hp",PlayerInfo[playerid][hp]);
    INI_WriteFloat(File,"sposx",x);
    INI_WriteFloat(File,"sposy",y);
    INI_WriteFloat(File,"sposz",z);
    INI_Close(File);

}
//stock
forward KickPublic(targetid);
public KickPublic(targetid) { Kick(targetid); }

//******************** [ Stocks ] ********************************************//
stock SaveSafeZones()
{
 new
 szFileStr[1024],
 File: fHandle = fopen("SafeZones.cfg", io_write);

 for(new iIndex; iIndex < MAX_SZ; iIndex++)
 {
  format(szFileStr, sizeof(szFileStr), "%f|%f|%f|%d|%d\r\n",
  SafeZoneInfo[iIndex][szPosX],
  SafeZoneInfo[iIndex][szPosY],
  SafeZoneInfo[iIndex][szPosZ],
  SafeZoneInfo[iIndex][szSize],
  SafeZoneInfo[iIndex][szPickupID]);
  fwrite(fHandle, szFileStr);
 }
 return fclose(fHandle);
}

stock LoadSafeZones()
{
	if(!fexist("SafeZones.cfg")) return 1;

	new string[128],
	szFileStr[128],
	File: iFileHandle = fopen("SafeZones.cfg", io_read),
	iIndex;

	while(iIndex < sizeof(SafeZoneInfo) && fread(iFileHandle, szFileStr))
	{
	sscanf(szFileStr, "p<|>fffii",
	SafeZoneInfo[iIndex][szPosX],
	SafeZoneInfo[iIndex][szPosY],
	SafeZoneInfo[iIndex][szPosZ],
	SafeZoneInfo[iIndex][szSize],
	SafeZoneInfo[iIndex][szPickupID]
	);

	format(string, sizeof(string), "{FFFFFF}Safe Zone(ID: %d)\n{24D12F}%d Meters\n{DB8B35}Non-Kill",iIndex,SafeZoneInfo[iIndex][szSize]);

	if(SafeZoneInfo[iIndex][szPosX] != 0.0)
	{
	SafeZoneInfo[iIndex][szPickupID] = CreateDynamicPickup(1254, 23, SafeZoneInfo[iIndex][szPosX], SafeZoneInfo[iIndex][szPosY], SafeZoneInfo[iIndex][szPosZ]);
	SafeZoneInfo[iIndex][szTextID] = CreateDynamic3DTextLabel(string, -1, SafeZoneInfo[iIndex][szPosX], SafeZoneInfo[iIndex][szPosY], SafeZoneInfo[iIndex][szPosZ]+0.5,30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1,  -1, 30.0);
	}
	++iIndex;
	}
	return fclose(iFileHandle);
}
stock ToggleVehicleEngine(vehicleid, bool: Mode)
{
    new engine,lights,alarm,doors,bonnet,boot,objective;
    GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
    if(Mode == false) SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
    else SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
}

stock GetPlayerSpeed(playerid)
{
	new Float:ST[4];
	if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]); else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
	ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 180;
	return floatround(ST[3]);
}

//This one also sends the reason inserted
KickWithMessage(targetid, reason[])
{
	new string[128];
	format(string, sizeof(string), "REASON:{FFFFFF} %s", reason);
	SendClientMessageToAll(COLOR_RED, string);
    SetTimerEx("KickPublic", 100, 0, "d", targetid);
    return 1;
}
stock Log(FileName[], Input[]) {

    new string[128];
	new date[2][3], File: fileHandle = fopen(FileName, io_append);
	gettime(date[0][0], date[0][1], date[0][2]);
	getdate(date[1][0], date[1][1], date[1][2]);
	format(string, sizeof(string), "[%i/%i/%i - %i:%i:%i] %s\r\n", date[1][2], date[1][1], date[1][0], date[0][0], date[0][1], date[0][2], Input);
	fwrite(fileHandle, string);
	return fclose(fileHandle);
}
stock ShowBan(playerid)
{
	ShowPlayerDialog(playerid,DIALOG_SBAN,0,"Banned","You has banned from Server\n Please PM Admin to Unban","Quit","");
	return 1;
}
stock GivePlayerSkin(playerid,skinid)
{
	PlayerInfo[playerid][pSkin] = skinid;
	SetPlayerSkin(playerid,skinid);
	return 1;
}

stock barsystem(playerid)
{
    ShowPlayerProgressBar(playerid,bhealth);
	ShowPlayerProgressBar(playerid,bhealth);
	ShowPlayerProgressBar(playerid,bhunger);
	ShowPlayerProgressBar(playerid,bwater);
	ShowPlayerProgressBar(playerid,devb);
	ShowPlayerProgressBar(playerid,sleepb);
}
stock ItemInit()
{
AddStaticVehicle(VR[random(3)], -703.2856, -460.0826, 24.2007, 0.0000, -1, -1);
AddStaticVehicle(VR[random(3)], -896.2865, -834.3787, 140.1516, 0.0000, -1, -1);
AddStaticVehicle(VR[random(3)], -493.1586, -1748.8538, 21.0187, 0.0000, -1, -1);
AddStaticVehicle(VR[random(3)], -647.5472, -2207.3872, 11.1439, 0.0000, -1, -1);
AddStaticVehicle(VR[random(3)], -1546.9398, -2157.4653, 9.1657, 0.0000, -1, -1);
AddStaticVehicle(VR[random(3)], -1436.1733, -1522.7813, 101.6155, 0.0000, -1, -1);
//balo
CreateRandomBalo( -515.66669, -504.97794, 24.58485);
CreateRandomBalo( -36.03949, -1125.33630, 0.09212);
CreateRandomBalo(-1120.65540, -1634.79883, 75.37995);
CreateRandomBalo(-1666.03125, -1943.64819, 100.27818);
CreateRandomBalo( -2154.94434, -2553.75220, 29.61515);
CreateRandomBalo( -2235.35840, -2301.30664, 29.59167);
CreateRandomBalo( -2426.65332, -1820.76318, 411.97064);
CreateRandomBalo( -1854.73926, -1561.16321, 20.74270);
CreateRandomBalo(-1428.39807, -1524.82520, 100.73086);
CreateRandomBalo( -1435.34900, -965.86151, 200.00656);
//food
CreateRandomFood( -1061.62134, -1196.55786, 128.82202,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1060.42175, -1208.04944, 128.23296,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1069.90393, -1152.97253, 128.21492,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1084.95068, -1096.02405, 128.21423,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1177.99121, -1138.79517, 129.28386,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1419.55725, -957.97424, 200.08612,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1039.93066, -637.39893, 30.99092,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1030.81335, -715.12640, 30.98761,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1117.40112, -1625.81677, 75.37422,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1111.28699, -1671.96130, 75.36563,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1019.78827, -1653.08862, 75.67480,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -665.69769, -1940.29700, 14.23305,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -366.21558, -1417.35632, 24.74050,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -399.16702, -1435.31519, 24.71194,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -579.37341, -1497.79895, 8.91460,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -72.52994, -1544.72229, 1.62373,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -107.52736, -1572.75647, 1.63076,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -79.62660, -1593.26306, 1.63595,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -77.77959, -1165.45911, 1.16716,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -65.45100, -1119.50073, 0.09049,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -60.84087, -1133.18469, 0.09049,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -259.80237, -2178.05591, 28.01373,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -282.93250, -2174.05786, 27.63176,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -266.31702, -2213.01660, 28.01658,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -185.19353, -2556.98462, 34.22816,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -15.64095, -2497.55005, 35.61897,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -40.42854, -2494.32910, 35.63488,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -12.31828, -2525.11084, 35.62525,   0.00000, 0.00000, 0.00000);
CreateRandomFood( 33.79253, -2648.41553, 39.71916,   0.00000, 0.00000, 0.00000);
CreateRandomFood( 21.71138, -2655.79761, 39.50742,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1198.88159, -2645.21509, 9.59232,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1561.68616, -2733.49536, 47.73783,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1559.35107, -2722.90894, 47.73361,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1623.43799, -2693.27197, 47.73619,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2015.91687, -2398.79712, 29.63170,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2091.70825, -2415.83057, 29.61980,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2100.94653, -2434.54834, 29.61397,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2079.94165, -2448.05591, 29.66593,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2057.07300, -2464.93140, 30.17298,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2154.38623, -2460.15869, 29.83916,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2119.70581, -2484.28687, 29.61318,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2113.38916, -2460.16968, 29.61182,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2112.92261, -2414.19849, 30.23941,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2133.83105, -2433.32129, 29.70439,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2120.24512, -2363.02148, 29.61830,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2165.50122, -2416.91528, 30.02202,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2164.21753, -2420.02197, 29.68202,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2164.70068, -2479.77466, 30.81020,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2173.75781, -2481.87183, 30.81464,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2191.75269, -2433.00757, 30.25781,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2215.89014, -2449.48535, 30.81195,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2183.01855, -2403.64038, 29.61472,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2199.51343, -2443.79492, 29.61300,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2224.93335, -2481.39307, 30.81331,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2177.19165, -2519.85474, 30.81260,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2192.05786, -2510.24829, 30.80534,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2152.17529, -2549.29224, 29.60550,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2158.63281, -2534.83984, 30.81379,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2233.53223, -2556.52563, 30.91700,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2409.47241, -2190.17456, 33.03909,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2813.53296, -1524.57935, 139.84207,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2816.98364, -1520.19763, 139.84207,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -2229.52881, -1741.80737, 479.89172,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1865.87195, -1564.52637, 20.74075,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1845.20630, -1709.99280, 40.10149,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1438.47375, -1542.17017, 100.77849,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1636.85437, -2234.92993, 30.46943,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1632.81372, -2235.14600, 30.46943,   0.00000, 0.00000, 0.00000);
CreateRandomFood( -1632.72681, -2242.16577, 30.46943,   0.00000, 0.00000, 0.00000);
CreateRandomFood(-1636.17810, -2245.20557, 30.46943,   0.00000, 0.00000, 0.00000);
CreateRandHos(-575.8083,-518.5717,26.1053);
CreateRandHos(-569.0913,-510.3520,25.5513);
CreateRandHos(-576.7633,-524.2413,26.1053);
CreateRandHos(-566.6174,-525.5504,25.5234);
CreateRandHos(-591.6748,-528.3994,25.5234);
CreateRandBuld( -1090.08752, -663.30518, 30.99996);
CreateRandBuld( -1034.47705, -637.52014, 31.00340);
CreateRandBuld( -992.96991, -728.65363, 30.97700);
CreateRandBuld( -785.90155, -813.60248, 148.00473);
CreateRandBuld( -548.09631, -1015.50775, 23.12158);
CreateRandBuld( -388.61990, -1141.18298, 68.17400);
CreateRandBuld( -350.97046, -1056.69226, 58.27672);
CreateRandBuld( -391.84604, -1417.95520, 24.70884);
CreateRandBuld( -263.68704, -2155.44312, 27.88354);
CreateRandBuld( 23.21601, -2657.35010, 39.46700);

}
stock CreateRandBuld(Float:X,Float:Y,Float:Z)
{
CreateItem(IRB[random(5)],1,Float:X, Float:Y, Float:Z,89.82000, 30.90000,0,0,0);
}
stock CreateRandHos(Float:X,Float:Y,Float:Z)
{
CreateItem(IRH[random(2)],1,Float:X, Float:Y, Float:Z-1,0,0,0,0,0);
}
stock CreateAmmo(Model,Float:X, Float:Y, Float:Z)
{
CreateItem(Model,1,Float:X, Float:Y, Float:Z,0,0,0,0,0);
}
stock CreateGun(Model,Float:X, Float:Y, Float:Z)//CreateObject(356, 164.15533, 1916.64905, 17.51417,   85.08002, -35.52000, 0.00000);
{
CreateItem(Model,1,Float:X, Float:Y, Float:Z,85.08002, -35.52000, 0.00000,0,0);
}
stock CreateRandomBalo(Float:X, Float:Y, Float:Z)
{
CreateItem(IBaloR[random(8)],0,Float:X, Float:Y, Float:Z,-88.19998, -64.43996, -57.05999,0,0);
}
stock CreateRandomFood(Float:X, Float:Y, Float:Z,Float:RX,Float:RY,Float:RZ)
{
CreateItem(IFoodR[random(11)],1,Float:X, Float:Y, Float:Z,Float:RX,Float:RY,Float:RZ,0,0);
}
stock CreateItem(Model,Amount,Float:X, Float:Y, Float:Z,Float:RX,Float:RY,Float:RZ, world, interior)
{
    if(Model != 0)
    {
        for(new i = 0; i < sizeof(ItemInfo); i++)
        {
            if(ItemInfo[i][ItemPosX] == 0.0 && ItemInfo[i][ItemPosY] == 0.0 && ItemInfo[i][ItemPosZ] == 0.0)
            {
                ItemInfo[i][ItemModel] = Model;
                ItemInfo[i][ItemAmount] = Amount;
                ItemInfo[i][ItemPosX] = X;
                ItemInfo[i][ItemPosY] = Y;
                ItemInfo[i][ItemPosZ] = Z;
                ItemInfo[i][ItemRotX] = RX;
                ItemInfo[i][ItemRotY] = RY;
                ItemInfo[i][ItemRotZ] = RZ;
                ItemInfo[i][ItemVWorld] = world;
                ItemInfo[i][ItemInterior] = interior;
                Label[i] = Create3DTextLabel("Item", 0x008080FF,X,Y,Z,2.0,world, 0);
                DropObject[i] = CreateObject(Model, X, Y, Z,RX,RY,RZ, world);
                if(Model == ModelDeerSkin)
                {
                SetObjectMaterial(DropObject[i], 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0);
                }
                return 1;
            }
        }
        return 1;
    }
    return 1;
}

stock UserPath(playerid)
{
    new string[128],playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid,playername,sizeof(playername));
    format(string,sizeof(string),PATH,playername);
    return string;
}
stock udb_hash(buf[]) {
    new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}
stock _GetItemNamePVar(playerid,item)
{
	new tmp[32];
	new tmp2[MAX_ITEM_NAME];
	format(tmp,32,"PITEMNAME%d",item);
	GetPVarString(playerid,tmp,tmp2,MAX_ITEM_NAME);
	return tmp2;
}
stock _SetItemNamePVar(playerid,item,ItemName[])
{
	new tmp[MAX_ITEM_NAME];
	format(tmp,MAX_ITEM_NAME,"PITEMNAME%d",item);
	SetPVarString(playerid,tmp,ItemName);
}
stock _GetItemAmountPVar(playerid,item)
{
	new tmp[16];
	format(tmp,16,"PITEMAMOUNT%d",item);
	return GetPVarInt(playerid,tmp);
}
stock _SetItemAmountPVar(playerid,item,Amount)
{
	new tmp[16];
	format(tmp,16,"PITEMAMOUNT%d",item);
	SetPVarInt(playerid,tmp,Amount);
}
stock AddItem(playerid,ItemName[],Amount)
{
	new slot=-1;
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!_GetItemAmountPVar(playerid,item))
		{
			if(slot==-1)slot=item;
			continue;
		}
		if(!strcmp(_GetItemNamePVar(playerid,item),ItemName,true))
		{
			_SetItemAmountPVar(playerid,item,_GetItemAmountPVar(playerid,item)+Amount);
			if(_GetItemAmountPVar(playerid,item)<=0)_SetItemAmountPVar(playerid,item,0);
			if(_GetItemAmountPVar(playerid,item)>MAX_ITEM_STACK)
			{
				_SetItemAmountPVar(playerid,item,MAX_ITEM_STACK);
				return 2;
			}
			return 1;
		}
	}
	if(slot>-1)
	{
		_SetItemNamePVar(playerid,slot,ItemName);
		_SetItemAmountPVar(playerid,slot,Amount);
		if(_GetItemAmountPVar(playerid,slot)>MAX_ITEM_STACK)
		{
			_SetItemAmountPVar(playerid,slot,MAX_ITEM_STACK);
			return 2;
		}
		return 1;
	}
	return 0;
}
stock RemoveItem(playerid,ItemName[],Amount)
{
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!_GetItemAmountPVar(playerid,item))continue;
		if(!strcmp(_GetItemNamePVar(playerid,item),ItemName,true))
		{
			_SetItemAmountPVar(playerid,item,_GetItemAmountPVar(playerid,item)-Amount);
			if(_GetItemAmountPVar(playerid,item)<=0)_SetItemAmountPVar(playerid,item,0);
			if(_GetItemAmountPVar(playerid,item)>MAX_ITEM_STACK)
			{
				_SetItemAmountPVar(playerid,item,MAX_ITEM_STACK);
				return 2;
			}
			return 1;
		}
	}
	return 0;
}
stock PlayerHasItem(playerid,ItemName[])
{
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!_GetItemAmountPVar(playerid,item))continue;
		if(!strcmp(_GetItemNamePVar(playerid,item),ItemName,false))return _GetItemAmountPVar(playerid,item);
	}
	return 0;
}
stock GetPlayerItemInfo(playerid,&idx,ItemName[],len=sizeof(ItemName),&Amount)
{
	if(idx>=MAX_ITEMS)return 0;
	format(ItemName,len,_GetItemNamePVar(playerid,idx));
	Amount=_GetItemAmountPVar(playerid,idx);
	idx++;
	return 1;
}
stock ResetPlayerInventory(playerid)
{
	for(new item;item<MAX_ITEMS;item++)_SetItemAmountPVar(playerid,item,0);
}
stock ShowInventory(playerid)
{
	iItemList="";
	new invstring[128];
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!strlen(_GetItemNamePVar(playerid,item))||!_GetItemAmountPVar(playerid,item))continue;
		format(iItemList,sizeof(iItemList),"%s\n%d\t\t%s",iItemList,_GetItemAmountPVar(playerid,item),_GetItemNamePVar(playerid,item));
	}
	format(iItemList,sizeof(iItemList),"Amount\t\tItem Name%s",iItemList);
	format(invstring,sizeof(invstring),"Backpack [%d/%d][Item Use]",PlayerInfo[playerid][pSlotu],PlayerInfo[playerid][pSlot]);
	ShowPlayerDialog(playerid,INV_DIALOG_ID,DIALOG_STYLE_LIST,invstring,iItemList,"Use","Close");
	SetPVarInt(playerid,"PUSINGDIALOG",1);
}
stock ShowInvDrop(playerid)
{
	iItemList="";
	new invstring[128];
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!strlen(_GetItemNamePVar(playerid,item))||!_GetItemAmountPVar(playerid,item))continue;
		format(iItemList,sizeof(iItemList),"%s\n%d\t\t%s",iItemList,_GetItemAmountPVar(playerid,item),_GetItemNamePVar(playerid,item));
	}
	format(iItemList,sizeof(iItemList),"Amount\t\tItem Name%s",iItemList);
	format(invstring,sizeof(invstring),"Backpack [%d/%d][Item DROP]",PlayerInfo[playerid][pSlotu],PlayerInfo[playerid][pSlot]);
	ShowPlayerDialog(playerid,INV_DIALOG_DROP,DIALOG_STYLE_LIST,invstring,iItemList,"Drop","Close");
	SetPVarInt(playerid,"DROPDIALOG",1);
}
stock SaveInventory(playerid)
{
	iItemList="";
	new filename[48];
	GetPlayerName(playerid,filename,24);
	format(filename,48,"Inventory/%s.inv",filename);
	new File:file=fopen(filename,io_write);
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!strlen(_GetItemNamePVar(playerid,item))||!_GetItemAmountPVar(playerid,item))continue;
		format(iItemList,sizeof(iItemList),"%s%s\n%d\n",iItemList,_GetItemNamePVar(playerid,item),_GetItemAmountPVar(playerid,item));
	}
	fwrite(file,iItemList);
	fclose(file);
	GetPlayerName(playerid,filename,24);
	printf("[INV] %s[%d]'s inventory saved.",filename,playerid);
}
stock LoadInventory(playerid)
{
	new tstring[48];
	new tstring2[12];
	GetPlayerName(playerid,tstring,48);
	format(tstring,48,"Inventory/%s.inv",tstring);
	if(!fexist(tstring))return 0;
	new File:file=fopen(tstring,io_read);
	fread(file,tstring);
	while(tstring[0])
	{
		format(tstring,strlen(tstring),"%s",tstring); //Delete last character
		fread(file,tstring2);
		AddItem(playerid,tstring,strval(tstring2));
		fread(file,tstring);
	}
	fclose(file);
	GetPlayerName(playerid,tstring,24);
	printf("[INV] %s[%d]'s inventory loaded.",tstring,playerid);
	return 1;
}
InventoryDropOnDialogResponse(playerid, dialogid, response, inputtext[])
{
	if(dialogid!=INV_DIALOG_DROP)return 1;
	if(!GetPVarInt(playerid,"DROPDIALOG"))return 1;
	if(!response)return 1;
	if(!strcmp(inputtext,"Amount",true,6))
	{
		ShowInventory(playerid);
		return 1;
	}
	format(iItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
	if(CallLocalFunction("OnPlayerDropItem","is",playerid,iItemList))ShowInventory(playerid);
	else SetPVarInt(playerid,"DROPDIALOG",0);
	return 1;
}
InventoryOnDialogResponse(playerid, dialogid, response, inputtext[])
{
	if(dialogid!=INV_DIALOG_ID)return 1;
	if(!GetPVarInt(playerid,"PUSINGDIALOG"))return 1;
	if(!response)return 1;
	if(!strcmp(inputtext,"Amount",true,6))
	{
		ShowInventory(playerid);
		return 1;
	}
	format(iItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
	if(CallLocalFunction("OnPlayerUseItem","is",playerid,iItemList))ShowInventory(playerid);
	else SetPVarInt(playerid,"PUSINGDIALOG",0);
	return 1;
}
stock ZombieInit()
{
	FCNPC_SetUpdateRate(100);
	for(new i = 0; i < MAX_ZOMBIES; i++)
	{
		new name[24];
  		format(name, 24, "Zombie_%d", i + 1);
		new npcid = FCNPC_Create(name);
		new Random = random(sizeof(RandomZombieSpawns));
		FCNPC_Spawn(npcid,162,RandomZombieSpawns[Random][0],RandomZombieSpawns[Random][1],RandomZombieSpawns[Random][2]);
		FCNPC_SetHealth(npcid, 100);
		SetTimerEx("ZMOVE",100,1,"i",npcid);
		SetPlayerColor(npcid,COLOR_RED);
	}
	return 1;
}
stock FCNPC_GoToPlayerEx(npcid, playerid, Float:dist, Float:rangle, movetype = MOVE_TYPE_WALK, UseZMap = 0)
{
    new Float:x, Float:y, Float:z, Float:fa;
    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, fa);
    rangle += fa;
    x = (x + dist * floatsin(-rangle,degrees));
    y = (y + dist * floatcos(-rangle,degrees));
    FCNPC_GoTo(npcid, x, y, z,movetype,10,UseZMap);
}
stock FCNPC_Punch(npcid, Float:x, Float:y, Float:z, PunchResetDelay = 125)
{
	FCNPC_AimAt(npcid, x, y, z, 0);
    FCNPC_StopAim(npcid);
    FCNPC_SetKeys(npcid, 0x80 + 4);
    SetTimerEx("ResetNPCKeys", PunchResetDelay, false, "i", npcid);
}
stock TextC()
{
hidemap = GangZoneCreate(-5000.0, -5000.0, 5000.0, 5000.0);
TextPick = TextDrawCreate(1.000000, 196.000000, "Press C to pickup item");
TextDrawBackgroundColor(TextPick, 255);
TextDrawFont(TextPick, 2);
TextDrawLetterSize(TextPick, 0.190000, 1.100000);
TextDrawColor(TextPick, -1);
TextDrawSetOutline(TextPick, 0);
TextDrawSetProportional(TextPick, 1);
TextDrawSetShadow(TextPick, 1);
TextDrawUseBox(TextPick, 1);
TextDrawBoxColor(TextPick, 255);
TextDrawTextSize(TextPick, 94.000000, 0.000000);
TextDrawSetSelectable(TextPick, 0);

TextFull = TextDrawCreate(266.000000, 433.000000, "Backpack Full");
TextDrawBackgroundColor(TextFull, 255);
TextDrawFont(TextFull, 2);
TextDrawLetterSize(TextFull, 0.290000, 0.899999);
TextDrawColor(TextFull, -1);
TextDrawSetOutline(TextFull, 0);
TextDrawSetProportional(TextFull, 1);
TextDrawSetShadow(TextFull, 1);
TextDrawUseBox(TextFull, 1);
TextDrawBoxColor(TextFull, 255);
TextDrawTextSize(TextFull, 360.000000, 20.000000);
TextDrawSetSelectable(TextFull, 0);
	
TLOGIN0 = TextDrawCreate(644.000000, 0.000000, "_");
TextDrawBackgroundColor(TLOGIN0, 255);
TextDrawFont(TLOGIN0, 1);
TextDrawLetterSize(TLOGIN0, 7.679994, 54.000000);
TextDrawColor(TLOGIN0, -1);
TextDrawSetOutline(TLOGIN0, 0);
TextDrawSetProportional(TLOGIN0, 1);
TextDrawSetShadow(TLOGIN0, 1);
TextDrawUseBox(TLOGIN0, 1);
TextDrawBoxColor(TLOGIN0, 255);
TextDrawTextSize(TLOGIN0, -8.000000, 10.000000);
TextDrawSetSelectable(TLOGIN0, 0);

TLOGIN1 = TextDrawCreate(213.000000, 26.000000, "The Land of Death");
TextDrawBackgroundColor(TLOGIN1, 16711935);
TextDrawFont(TLOGIN1, 2);
TextDrawLetterSize(TLOGIN1, 0.529999, 1.800000);
TextDrawColor(TLOGIN1, 255);
TextDrawSetOutline(TLOGIN1, 1);
TextDrawSetProportional(TLOGIN1, 1);
TextDrawSetSelectable(TLOGIN1, 0);

TLOGIN2 = TextDrawCreate(149.000000, 43.000000, "------------------------------------------------");
TextDrawBackgroundColor(TLOGIN2, 16711935);
TextDrawFont(TLOGIN2, 1);
TextDrawLetterSize(TLOGIN2, 0.500000, 1.000000);
TextDrawColor(TLOGIN2, 255);
TextDrawSetOutline(TLOGIN2, 1);
TextDrawSetProportional(TLOGIN2, 1);
TextDrawSetSelectable(TLOGIN2, 0);

TLOGIN3 = TextDrawCreate(417.000000, 50.000000, "Version Alpha 1");
TextDrawBackgroundColor(TLOGIN3, -1);
TextDrawFont(TLOGIN3, 3);
TextDrawLetterSize(TLOGIN3, 0.329999, 1.200000);
TextDrawColor(TLOGIN3, 255);
TextDrawSetOutline(TLOGIN3, 1);
TextDrawSetProportional(TLOGIN3, 1);
TextDrawSetSelectable(TLOGIN3, 0);

TLOGIN4 = TextDrawCreate(440.000000, 12.000000, "hud:fist");
TextDrawBackgroundColor(TLOGIN4, 16711935);
TextDrawFont(TLOGIN4, 4);
TextDrawLetterSize(TLOGIN4, 0.480000, 1.000000);
TextDrawColor(TLOGIN4, 16711935);
TextDrawSetOutline(TLOGIN4, 1);
TextDrawSetProportional(TLOGIN4, 1);
TextDrawUseBox(TLOGIN4, 1);
TextDrawBoxColor(TLOGIN4, 255);
TextDrawTextSize(TLOGIN4, 34.000000, 34.000000);
TextDrawSetSelectable(TLOGIN4, 0);

TLOGIN5 = TextDrawCreate(90.000000, 160.000000, "human");
TextDrawBackgroundColor(TLOGIN5, 255);
TextDrawFont(TLOGIN5, 5);
TextDrawLetterSize(TLOGIN5, 0.500000, 1.000000);
TextDrawColor(TLOGIN5, -1);
TextDrawSetOutline(TLOGIN5, 0);
TextDrawSetProportional(TLOGIN5, 1);
TextDrawSetShadow(TLOGIN5, 1);
TextDrawUseBox(TLOGIN5, 1);
TextDrawBoxColor(TLOGIN5, 255);
TextDrawTextSize(TLOGIN5, 110.000000, 171.000000);
TextDrawSetPreviewModel(TLOGIN5, 294);
TextDrawSetPreviewRot(TLOGIN5, 0.000000, 0.000000, -20.000000, 1.000000);
TextDrawSetSelectable(TLOGIN5, 0);

TLOGIN6 = TextDrawCreate(171.000000, 168.000000, "Zom");
TextDrawBackgroundColor(TLOGIN6, 255);
TextDrawFont(TLOGIN6, 5);
TextDrawLetterSize(TLOGIN6, 0.500000, 1.000000);
TextDrawColor(TLOGIN6, -1);
TextDrawSetOutline(TLOGIN6, 0);
TextDrawSetProportional(TLOGIN6, 1);
TextDrawSetShadow(TLOGIN6, 1);
TextDrawUseBox(TLOGIN6, 1);
TextDrawBoxColor(TLOGIN6, 255);
TextDrawTextSize(TLOGIN6, 90.000000, 179.000000);
TextDrawSetPreviewModel(TLOGIN6, 162);
TextDrawSetPreviewRot(TLOGIN6, -16.000000, 0.000000, 0.000000, 1.000000);
TextDrawSetSelectable(TLOGIN6, 0);

TLOGIN7 = TextDrawCreate(240.000000, 154.000000, "woman");
TextDrawBackgroundColor(TLOGIN7, 255);
TextDrawFont(TLOGIN7, 5);
TextDrawLetterSize(TLOGIN7, 0.500000, 1.000000);
TextDrawColor(TLOGIN7, -1);
TextDrawSetOutline(TLOGIN7, 0);
TextDrawSetProportional(TLOGIN7, 1);
TextDrawSetShadow(TLOGIN7, 1);
TextDrawUseBox(TLOGIN7, 1);
TextDrawBoxColor(TLOGIN7, 255);
TextDrawTextSize(TLOGIN7, 89.000000, 199.000000);
TextDrawSetPreviewModel(TLOGIN7, 93);
TextDrawSetPreviewRot(TLOGIN7, -16.000000, 0.000000, 20.000000, 1.000000);
TextDrawSetSelectable(TLOGIN7, 0);

Radar0 = TextDrawCreate(32.000000, 335.440032, "LD_POOL:ball");
TextDrawLetterSize(Radar0, 0.000000, 0.000000);
TextDrawTextSize(Radar0, 108.000000, 95.199989);
TextDrawAlignment(Radar0, 1);
TextDrawColor(Radar0, -2139062017);
TextDrawSetShadow(Radar0, 0);
TextDrawSetOutline(Radar0, 0);
TextDrawFont(Radar0, 4);

Radar1 = TextDrawCreate(36.000000, 427.839813, "hud:siteM16");
TextDrawLetterSize(Radar1, 0.000000, 0.000000);
TextDrawTextSize(Radar1, 50.500000, -46.480049);
TextDrawAlignment(Radar1, 1);
TextDrawColor(Radar1, 16711935);
TextDrawSetShadow(Radar1, 0);
TextDrawSetOutline(Radar1, 0);
TextDrawFont(Radar1, 4);

Radar2 = TextDrawCreate(38.500000, 344.400024, "hud:radarRingPlane");
TextDrawLetterSize(Radar2, 0.000000, 0.000000);
TextDrawTextSize(Radar2, 95.500000, 26.320028);
TextDrawAlignment(Radar2, 1);
TextDrawColor(Radar2, 16711935);
TextDrawSetShadow(Radar2, 0);
TextDrawSetOutline(Radar2, 0);
TextDrawFont(Radar2, 4);

Radar3 = TextDrawCreate(77.500000, 374.080017, "hud:arrow");
TextDrawLetterSize(Radar3, 0.000000, 0.000000);
TextDrawTextSize(Radar3, 17.500000, 16.799991);
TextDrawAlignment(Radar3, 1);
TextDrawColor(Radar3, 16711935);
TextDrawSetShadow(Radar3, 0);
TextDrawSetOutline(Radar3, 0);
TextDrawBackgroundColor(Radar3, 16711935);
TextDrawFont(Radar3, 4);



}
stock ShowSelectGender(playerid)
{

PlayerTextDrawShow(playerid,Gender0[playerid]);
PlayerTextDrawShow(playerid,Gender1[playerid]);
PlayerTextDrawShow(playerid,Gender2[playerid]);
PlayerTextDrawShow(playerid,Gender3[playerid]);
SelectTextDraw(playerid,0xFF0000FF);
}
stock textconnect(playerid)
{
TextDrawShowForPlayer(playerid,TLOGIN0);
TextDrawShowForPlayer(playerid,TLOGIN1);
TextDrawShowForPlayer(playerid,TLOGIN2);
TextDrawShowForPlayer(playerid,TLOGIN3);
TextDrawShowForPlayer(playerid,TLOGIN4);
TextDrawShowForPlayer(playerid,TLOGIN5);
TextDrawShowForPlayer(playerid,TLOGIN6);
TextDrawShowForPlayer(playerid,TLOGIN7);


FuelText[playerid] = TextDrawCreate(450.0, 405.0,"         ");
TextDrawHideForPlayer(playerid,FuelText[playerid]);
TextDrawAlignment(FuelText[playerid],0);
TextDrawSetProportional(FuelText[playerid],1);
TextDrawSetShadow(FuelText[playerid], 1);
TextDrawSetOutline(FuelText[playerid], 2);
TextDrawLetterSize(FuelText[playerid],0.60,2.0);
TextDrawFont(FuelText[playerid], 3);

TextAmmo = CreatePlayerTextDraw(playerid,500.000000, 67.000000, "9999");
PlayerTextDrawBackgroundColor(playerid,TextAmmo, -1);
PlayerTextDrawFont(playerid,TextAmmo, 3);
PlayerTextDrawLetterSize(playerid,TextAmmo, 0.519999, 1.000000);
PlayerTextDrawColor(playerid,TextAmmo, 255);
PlayerTextDrawSetOutline(playerid,TextAmmo, 1);
PlayerTextDrawSetProportional(playerid,TextAmmo, 1);
PlayerTextDrawUseBox(playerid,TextAmmo, 1);
PlayerTextDrawBoxColor(playerid,TextAmmo, 255);
PlayerTextDrawTextSize(playerid,TextAmmo, 540.000000, -2.000000);
PlayerTextDrawSetSelectable(playerid,TextAmmo, 0);

TextXP = CreatePlayerTextDraw(playerid,529.000000, 122.000000, "50/50");
PlayerTextDrawBackgroundColor(playerid,TextXP, -65281);
PlayerTextDrawFont(playerid,TextXP, 3);
PlayerTextDrawLetterSize(playerid,TextXP, 0.500000, 1.000000);
PlayerTextDrawColor(playerid,TextXP, 255);
PlayerTextDrawSetOutline(playerid,TextXP, 1);
PlayerTextDrawSetProportional(playerid,TextXP, 1);
PlayerTextDrawSetSelectable(playerid,TextXP, 0);

TextLv = CreatePlayerTextDraw(playerid,499.000000, 97.000000, "00");
PlayerTextDrawBackgroundColor(playerid,TextLv, 16711935);
PlayerTextDrawFont(playerid,TextLv, 3);
PlayerTextDrawLetterSize(playerid,TextLv, 0.290000, 1.200000);
PlayerTextDrawColor(playerid,TextLv, 255);
PlayerTextDrawSetOutline(playerid,TextLv, 1);
PlayerTextDrawSetProportional(playerid,TextLv, 1);
PlayerTextDrawSetSelectable(playerid,TextLv, 0);

Gender0[playerid] = CreatePlayerTextDraw(playerid,185.000000, 110.000000, "_");
PlayerTextDrawBackgroundColor(playerid,Gender0[playerid], 255);
PlayerTextDrawFont(playerid,Gender0[playerid], 1);
PlayerTextDrawLetterSize(playerid,Gender0[playerid], 0.829999, 25.200000);
PlayerTextDrawColor(playerid,Gender0[playerid], -1);
PlayerTextDrawSetOutline(playerid,Gender0[playerid], 0);
PlayerTextDrawSetProportional(playerid,Gender0[playerid], 1);
PlayerTextDrawSetShadow(playerid,Gender0[playerid], 1);
PlayerTextDrawUseBox(playerid,Gender0[playerid], 1);
PlayerTextDrawBoxColor(playerid,Gender0[playerid], 1666731330);
PlayerTextDrawTextSize(playerid,Gender0[playerid], 464.000000, 1.000000);
PlayerTextDrawSetSelectable(playerid,Gender0[playerid], 0);

Gender1[playerid] = CreatePlayerTextDraw(playerid,195.000000, 130.000000, "male");
PlayerTextDrawBackgroundColor(playerid,Gender1[playerid], 16711935);
PlayerTextDrawFont(playerid,Gender1[playerid], 5);
PlayerTextDrawLetterSize(playerid,Gender1[playerid], 0.500000, 1.000000);
PlayerTextDrawColor(playerid,Gender1[playerid], -1);
PlayerTextDrawSetOutline(playerid,Gender1[playerid], 0);
PlayerTextDrawSetProportional(playerid,Gender1[playerid], 1);
PlayerTextDrawSetShadow(playerid,Gender1[playerid], 1);
PlayerTextDrawUseBox(playerid,Gender1[playerid], 1);
PlayerTextDrawBoxColor(playerid,Gender1[playerid], 255);
PlayerTextDrawTextSize(playerid,Gender1[playerid], 131.000000, 202.000000);
PlayerTextDrawSetPreviewModel(playerid, Gender1[playerid], 29);
PlayerTextDrawSetPreviewRot(playerid, Gender1[playerid], -16.000000, 0.000000, -30.000000, 1.000000);
PlayerTextDrawSetSelectable(playerid,Gender1[playerid], 1);

Gender2[playerid] = CreatePlayerTextDraw(playerid,327.000000, 130.000000, "Famale");
PlayerTextDrawBackgroundColor(playerid,Gender2[playerid], -16711681);
PlayerTextDrawFont(playerid,Gender2[playerid], 5);
PlayerTextDrawLetterSize(playerid,Gender2[playerid], 0.500000, 1.000000);
PlayerTextDrawColor(playerid,Gender2[playerid], -1);
PlayerTextDrawSetOutline(playerid,Gender2[playerid], 0);
PlayerTextDrawSetProportional(playerid,Gender2[playerid], 1);
PlayerTextDrawSetShadow(playerid,Gender2[playerid], 1);
PlayerTextDrawUseBox(playerid,Gender2[playerid], 1);
PlayerTextDrawBoxColor(playerid,Gender2[playerid], 255);
PlayerTextDrawTextSize(playerid,Gender2[playerid], 124.000000, 202.000000);
PlayerTextDrawSetPreviewModel(playerid, Gender2[playerid], 93);
PlayerTextDrawSetPreviewRot(playerid, Gender2[playerid], -16.000000, 0.000000, 30.000000, 1.000000);
PlayerTextDrawSetSelectable(playerid,Gender2[playerid], 1);

Gender3[playerid] = CreatePlayerTextDraw(playerid,243.000000, 114.000000, "Select Your Gender");
PlayerTextDrawBackgroundColor(playerid,Gender3[playerid], -1);
PlayerTextDrawFont(playerid,Gender3[playerid], 3);
PlayerTextDrawLetterSize(playerid,Gender3[playerid], 0.500000, 1.000000);
PlayerTextDrawColor(playerid,Gender3[playerid], 1666731330);
PlayerTextDrawSetOutline(playerid,Gender3[playerid], 0);
PlayerTextDrawSetProportional(playerid,Gender3[playerid], 1);
PlayerTextDrawSetShadow(playerid,Gender3[playerid], 1);
PlayerTextDrawSetSelectable(playerid,Gender3[playerid], 0);


}
stock radarshow(playerid)
{
	TextDrawShowForPlayer(playerid,Radar0);
	TextDrawShowForPlayer(playerid,Radar1);
	TextDrawShowForPlayer(playerid,Radar2);
	TextDrawShowForPlayer(playerid,Radar3);

}
stock radarhide(playerid)
{
	TextDrawHideForPlayer(playerid,Radar0);
	TextDrawHideForPlayer(playerid,Radar1);
	TextDrawHideForPlayer(playerid,Radar2);
	TextDrawHideForPlayer(playerid,Radar3);
}
stock textspawn(playerid)
{
	TextDrawHideForPlayer(playerid,TLOGIN0);
	TextDrawHideForPlayer(playerid,TLOGIN1);
	TextDrawHideForPlayer(playerid,TLOGIN2);
	TextDrawHideForPlayer(playerid,TLOGIN3);
	TextDrawHideForPlayer(playerid,TLOGIN4);
	TextDrawHideForPlayer(playerid,TLOGIN5);
	TextDrawHideForPlayer(playerid,TLOGIN6);
	TextDrawHideForPlayer(playerid,TLOGIN7);

}
stock GetName(playerid)
{
    new string[128];
	GetPlayerName(playerid,string,24);
    new str[24];
    strmid(str,string,0,strlen(string),24);
    return str;
}

stock SetPlayerBackpack(playerid)
{
	if(PlayerInfo[playerid][pSlot] == 5)
	{
	SetPlayerAttachedObject(playerid, 9, 363,1, -0.074000, -0.155000, 0.050000, 0.000000, 85.199981, 14.900001, 1.000000, 1.000000, 1.000000, 0, 0);
	}
	else if(PlayerInfo[playerid][pSlot] == 10)
	{
	SetPlayerAttachedObject(playerid, 9, 3026, 1, -0.122999, -0.059000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000, 0, 0);
	}
	else if(PlayerInfo[playerid][pSlot] == 20)
	{
	SetPlayerAttachedObject(playerid, 9, 371, 1, 0.102999, -0.137999, 0.000000, 0.000000, 87.400016, 0.000000, 1.000000, 1.000000, 1.000000, 0, 0);
	}
	else if(PlayerInfo[playerid][pSlot] == 30)
	{
	SetPlayerAttachedObject(playerid, 9, 2663, 1, 0.059999, -0.102999, -0.016000, 0.000000, 88.199966, -179.500030, 1.000000, 1.166999, 1.084000, 0, 0);
	}
	else if(PlayerInfo[playerid][pSlot] == 40)
	{
	SetPlayerAttachedObject(playerid, 9, 2060, 1, 0.000000, -0.164000, 0.000000, 84.100006, 0.000000, 0.000000, 0.616999, 0.782999, 1.258000, 0, 0);
	}
	else if(PlayerInfo[playerid][pSlot] == 50)
	{
	SetPlayerAttachedObject(playerid, 9, 1310, 1, -0.091999, -0.201999, 0.000000, -3.599999, 88.500000, 0.000000, 0.936000, 1.000000, 1.000000, 0, 0);
	}
}
stock GetTAmmo(playerid)
{
new w = GetPlayerWeapon(playerid);
new stam[128];

if(w == 22 || w == 23 ||w==24)
{
format(stam, sizeof(stam), "%d",PlayerInfo[playerid][pAmmoColt]);
PlayerTextDrawSetString(playerid,TextAmmo,stam);
PlayerTextDrawShow(playerid,TextAmmo);
}
if(w == 25 || w == 26 ||w==27)
{
format(stam, sizeof(stam), "%d",PlayerInfo[playerid][pAmmoShotgun]);
PlayerTextDrawSetString(playerid,TextAmmo,stam);
PlayerTextDrawShow(playerid,TextAmmo);
}
if(w == 28 || w == 29 ||w==32)
{
format(stam, sizeof(stam), "%d",PlayerInfo[playerid][pAmmoSMS]);
PlayerTextDrawSetString(playerid,TextAmmo,stam);
PlayerTextDrawShow(playerid,TextAmmo);
}
if(w == 30 || w == 31)
{
format(stam, sizeof(stam), "%d",PlayerInfo[playerid][pAmmoAus]);
PlayerTextDrawSetString(playerid,TextAmmo,stam);
PlayerTextDrawShow(playerid,TextAmmo);
}
if(w == 33 || w == 34)
{
format(stam, sizeof(stam), "%d",PlayerInfo[playerid][pAmmoRifle]);
PlayerTextDrawSetString(playerid,TextAmmo,stam);
PlayerTextDrawShow(playerid,TextAmmo);
}

}
stock GetNEXP(playerid)
{
	if(PlayerInfo[playerid][pLv] == 0)
	{
	PlayerInfo[playerid][pNEXP] = 10;
	}
	if(PlayerInfo[playerid][pLv] == 1)
	{
	PlayerInfo[playerid][pNEXP] = 20;
	}
	if(PlayerInfo[playerid][pLv] == 2)
	{
	PlayerInfo[playerid][pNEXP] = 30;
	}
	if(PlayerInfo[playerid][pLv] == 3)
	{
	PlayerInfo[playerid][pNEXP] = 40;
	}
	if(PlayerInfo[playerid][pLv] == 4)
	{
	PlayerInfo[playerid][pNEXP] = 50;
	}
	if(PlayerInfo[playerid][pLv] ==5)
	{
	PlayerInfo[playerid][pNEXP] = 60;
	}
	new stxp[128];
	format(stxp, sizeof(stxp), "%d/%d",PlayerInfo[playerid][pEXP],PlayerInfo[playerid][pNEXP]);
	PlayerTextDrawSetString(playerid,TextXP,stxp);
	PlayerTextDrawShow(playerid,TextXP);
}
stock GiveGun(playerid)
{
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][1],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][2],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][3],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][4],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][5],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][6],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][7],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][8],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][9],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][10],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][11],99999);
GivePlayerWeaponAC(playerid,PlayerInfo[playerid][pWeapon][12],99999);
}
stock PutWeaponINV(playerid)
{
if(PlayerInfo[playerid][pSlotu] == PlayerInfo[playerid][pSlot]) return TextDrawShowForPlayer(playerid, TextFull);
new ww = GetPlayerWeapon(playerid);
switch(ww)
{
case 2://Golf
{
AddItem(playerid,"GolfClub",1);
RemovePlayerWeapon(playerid,2);
PlayerInfo[playerid][pSlotu] += 1;
}
case 3://Nightstick
{
AddItem(playerid,"Nightstick",1);
RemovePlayerWeapon(playerid,3);
PlayerInfo[playerid][pSlotu] += 1;
}
case 4://Knife
{
AddItem(playerid,"Knife",1);
RemovePlayerWeapon(playerid,4);
PlayerInfo[playerid][pSlotu] += 1;
}
case 5://Baseball
{
AddItem(playerid,"Baseball",1);
RemovePlayerWeapon(playerid,5);
PlayerInfo[playerid][pSlotu] += 1;
}
case 6:
{
AddItem(playerid,"Shovel",1);
RemovePlayerWeapon(playerid,6);
PlayerInfo[playerid][pSlotu] += 1;
}
case 7://Pool
{
AddItem(playerid,"Pool",1);
RemovePlayerWeapon(playerid,7);
PlayerInfo[playerid][pSlotu] += 1;
}
case 8://Katana
{
AddItem(playerid,"Katana",1);
RemovePlayerWeapon(playerid,8);
PlayerInfo[playerid][pSlotu] += 1;
}
case 9://Chainsaw
{
AddItem(playerid,"Chainsaw",1);
RemovePlayerWeapon(playerid,9);
PlayerInfo[playerid][pSlotu] += 1;
}
case 10://Purple
{
AddItem(playerid,"Purple",1);
RemovePlayerWeapon(playerid,10);
PlayerInfo[playerid][pSlotu] += 1;
}
case 11:
{
AddItem(playerid,"Dildo",1);
RemovePlayerWeapon(playerid,11);
PlayerInfo[playerid][pSlotu] += 1;
}
case 12:
{
AddItem(playerid,"Vibrator",1);
RemovePlayerWeapon(playerid,12);
PlayerInfo[playerid][pSlotu] += 1;
}
case 13:
{
AddItem(playerid,"Silver",1);
RemovePlayerWeapon(playerid,13);
PlayerInfo[playerid][pSlotu] += 1;
}
case 14://Flowers
{
AddItem(playerid,"Flowers",1);
RemovePlayerWeapon(playerid,14);
PlayerInfo[playerid][pSlotu] += 1;
}
case 15://Cane
{
AddItem(playerid,"Cane",1);
RemovePlayerWeapon(playerid,15);
PlayerInfo[playerid][pSlotu] += 1;
}
case 16:
{
AddItem(playerid,"Grenade",1);
RemovePlayerWeapon(playerid,16);
PlayerInfo[playerid][pSlotu] += 1;
}
case 17:
{
AddItem(playerid,"TearGas",1);
RemovePlayerWeapon(playerid,17);
PlayerInfo[playerid][pSlotu] += 1;
}
case 18:
{
AddItem(playerid,"Molotov",1);
RemovePlayerWeapon(playerid,18);
PlayerInfo[playerid][pSlotu] += 1;
}
case 22:
{
AddItem(playerid,"9mm",1);
RemovePlayerWeapon(playerid,22);
PlayerInfo[playerid][pSlotu] += 1;
}
case 23:
{
AddItem(playerid,"Silenced",1);
RemovePlayerWeapon(playerid,23);
PlayerInfo[playerid][pSlotu] += 1;
}
case 24:
{
AddItem(playerid,"Deagle",1);
RemovePlayerWeapon(playerid,24);
PlayerInfo[playerid][pSlotu] += 1;
}
case 25:
{
AddItem(playerid,"Shotgun",1);
RemovePlayerWeapon(playerid,25);
PlayerInfo[playerid][pSlotu] += 1;
}
case 26:
{
AddItem(playerid,"Sawnoff",1);
RemovePlayerWeapon(playerid,26);
PlayerInfo[playerid][pSlotu] += 1;
}
case 27:
{
AddItem(playerid,"Spas12",1);
RemovePlayerWeapon(playerid,27);
PlayerInfo[playerid][pSlotu] += 1;
}
case 28:
{
AddItem(playerid,"Uzi",1);
RemovePlayerWeapon(playerid,28);
PlayerInfo[playerid][pSlotu] += 1;
}
case 29:
{
AddItem(playerid,"Mp5",1);
RemovePlayerWeapon(playerid,29);
PlayerInfo[playerid][pSlotu] += 1;
}
case 30:
{
AddItem(playerid,"AK47",1);
RemovePlayerWeapon(playerid,30);
PlayerInfo[playerid][pSlotu] += 1;
}
case 31:
{
AddItem(playerid,"M4",1);
RemovePlayerWeapon(playerid,31);
PlayerInfo[playerid][pSlotu] += 1;
}
case 32:
{
AddItem(playerid,"Tec9",1);
RemovePlayerWeapon(playerid,32);
PlayerInfo[playerid][pSlotu] += 1;
}
case 33:
{
AddItem(playerid,"Rifle",1);
RemovePlayerWeapon(playerid,33);
PlayerInfo[playerid][pSlotu] += 1;
}
case 34:
{
AddItem(playerid,"Sniper",1);
RemovePlayerWeapon(playerid,34);
PlayerInfo[playerid][pSlotu] += 1;
}
case 41:
{
AddItem(playerid,"Spraycan",1);
RemovePlayerWeapon(playerid,41);
PlayerInfo[playerid][pSlotu] += 1;
}
case 42:
{
AddItem(playerid,"Fire",1);
RemovePlayerWeapon(playerid,42);
PlayerInfo[playerid][pSlotu] += 1;
}
case 43:
{
AddItem(playerid,"Camera",1);
RemovePlayerWeapon(playerid,43);
PlayerInfo[playerid][pSlotu] += 1;
}

}
return 1;
}
stock RemovePlayerWeapon(playerid, weaponid)
{
	new plyWeapons[12];
	new plyAmmo[12];

	for(new slot = 0; slot != 12; slot++)
	{
		new wep, ammo;
		GetPlayerWeaponData(playerid, slot, wep, ammo);

		if(wep != weaponid)
		{
			GetPlayerWeaponData(playerid, slot, plyWeapons[slot], plyAmmo[slot]);
		}
	}

	ResetPlayerWeapons(playerid);
	for(new slot = 0; slot != 12; slot++)
	{
		GivePlayerWeaponAC(playerid, plyWeapons[slot],99999);
	}
}
stock GivePlayerWeaponAC(playerid,weaponid,ammo)
{
    switch(weaponid)
    {
    case 2..9:
    {
    WeaponAnti[playerid][Weapon1] = weaponid;
    }
    case 10..15:
    {
    WeaponAnti[playerid][Weapon10] = weaponid;
    }
    case 16..18:
    {
    WeaponAnti[playerid][Weapon8] = weaponid;
    }
    case 22..24:
    {
    WeaponAnti[playerid][Weapon2] = weaponid;
    }
    case 25..27:
    {
    WeaponAnti[playerid][Weapon3] = weaponid;
    }
    case 28..29:
    {
    WeaponAnti[playerid][Weapon4] = weaponid;
    }
    case 30..31:
    {
    WeaponAnti[playerid][Weapon5] = weaponid;
    }
    case 32:
    {
    WeaponAnti[playerid][Weapon4] = weaponid;
    }
    case 33..34:
    {
    WeaponAnti[playerid][Weapon6] = weaponid;
    }
    case 35..38:
    {
    WeaponAnti[playerid][Weapon7] = weaponid;
    }
    case 41..42:
    {
    WeaponAnti[playerid][Weapon9] = weaponid;
    }
    case 44..46:
    {
    WeaponAnti[playerid][Weapon11] = weaponid;
    }
    case 39:
    {
    WeaponAnti[playerid][Weapon8] = weaponid;
    }
    case 40:
    {
    WeaponAnti[playerid][Weapon12] = weaponid;
    }
    }
    GivePlayerWeapon(playerid,weaponid,ammo);
    return 1;
}
stock GetEmptyAmmo(playerid)
{
	new weapon = GetPlayerWeapon(playerid);
	//Rifle , Sniper
	if(weapon == 33 || weapon == 34)
	{
	if(PlayerInfo[playerid][pAmmoRifle] <=0)
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	//M4 AK
	if(weapon == 30||weapon == 31)
	{
	if(PlayerInfo[playerid][pAmmoAus] <=0)
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	//UZI MP5 TEC9
	if(weapon == 28 || weapon == 29||weapon == 32)
	{
	if(PlayerInfo[playerid][pAmmoSMS] <= 0)
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	//Shotgun Sawnoff CombatS
	if(weapon == 25 || weapon == 26||weapon == 27)
	{
	if(PlayerInfo[playerid][pAmmoShotgun] <= 0)
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	//9mm s9mm DE
	if(weapon == 22 || weapon == 23||weapon == 24)
	{
	if(PlayerInfo[playerid][pAmmoColt] <= 0 )
	{
	TogglePlayerControllable(playerid,0);
	SCM(playerid,COLOR_RED,"You no have ammo for this weapon");
	SetTimerEx("UnF",2000,0,"i",playerid);
	}
	}
	return 1;
}


forward LoadTreeData(i, name[], value[]);
public LoadTreeData(i, name[], value[])
{
    INI_Int("Type", tInfo[i][Type]);
    INI_Int("TModel", tInfo[i][TModel]);
    INI_Float("Health", tInfo[i][Health]);
    INI_Float("xPos", tInfo[i][xPos]);
    INI_Float("yPos", tInfo[i][yPos]);
    INI_Float("zPos", tInfo[i][zPos]);

    INI_Float("rxPos", tInfo[i][rxPos]);
    INI_Float("ryPos", tInfo[i][ryPos]);
    INI_Float("rzPos", tInfo[i][rzPos]);

    return true;
}

stock SaveTrees()
{
    new file[64];

    for(new i; i < MAX_TREES; i ++)
    {
        format(file, sizeof(file), "Trees/%d.ini", i);

        if(fexist(file))
        {
            new INI:File = INI_Open(file);

            INI_SetTag(File, "Tree Data");

            INI_WriteInt(File, "Type", tInfo[i][Type]);
            INI_WriteInt(File, "TModel", tInfo[i][TModel]);
            INI_WriteFloat(File, "Health", tInfo[i][Health]);

            INI_WriteFloat(File, "xPos", tInfo[i][xPos]);
            INI_WriteFloat(File, "yPos", tInfo[i][yPos]);
            INI_WriteFloat(File, "zPos", tInfo[i][zPos]);

            INI_WriteFloat(File, "rxPos", tInfo[i][rxPos]);
            INI_WriteFloat(File, "ryPos", tInfo[i][ryPos]);
            INI_WriteFloat(File, "rzPos", tInfo[i][rzPos]);

            INI_Close(File);
        }
    }

    return true;
}
stock IsPlayerInPointFish(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid,2,-1219.8186,-2363.8599,1.0119))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,2,-1207.7113,-2602.2327,1.0976))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,2,-1178.8430,-2632.9854,11.7578))
	{
	return 1;
	}
	return 0;
}
stock IsPlayerInPointWater(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid,2,-1619.5463,-2696.4153,48.7427))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,2,-84.4512,-1182.4219,1.8539))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,2,24.3789,-2651.4944,40.4897))
	{
	return 1;
	}
	return 0;
}
stock IsPlayerInPointGas(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid,5,-1609.7786,-2700.4292,48.5391))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,5,-84.7098,-1185.9546,1.7500))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,5,-565.2042,-1027.6069,24.0065))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,5,25.7284,-2660.3860,40.5381))
	{
	return 1;
	}
	return 0;
}
stock IsPlayerInPointMine(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid,10,-1310.1714,-2407.3848,32.0838))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,10,-1318.8688,-2423.9114,34.1446))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,10,-1336.1146,-2415.1379,44.8470))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,10,-1047.7969,-2321.9717,64.8014))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,10,-1040.0635,-2286.8508,59.0006))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,10,-1026.2584,-2277.8066,69.3670))
	{
	return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,10,-1002.6541,-2315.4692,70.3881))
	{
	return 1;
	}
	return 0;
	
}
stock LoadTrees()
{
    new file[64],stat[200];

    print("\n  Loading Trees: \n");

    for(new i; i < MAX_TREES; i ++)
    {
        format(file, sizeof(file), "Trees/%d.ini", i);

        if(fexist(file))
        {
            INI_ParseFile(TreePath(i), "LoadTreeData", false, true, i, true, false);

            tInfo[i][Obj] = CreateDynamicObject(tInfo[i][TModel], tInfo[i][xPos], tInfo[i][yPos], tInfo[i][zPos] -1, tInfo[i][rxPos], tInfo[i][ryPos], tInfo[i][rzPos]);
			format(stat,sizeof(stat),"TreeID :%d |Health :%f",i,tInfo[i][Health]);
			Text[i] = Create3DTextLabel(stat, 0x008080FF, tInfo[i][xPos], tInfo[i][yPos], tInfo[i][zPos], 40.0, 0, 0);
            if(tInfo[i][Health] == 0)
            {
                ResetTree(i);
            }
            tCount ++;
        }
    }

    printf("\n  %d trees loaded!", tCount);

    return true;
}
public OnPlayerShootDynamicObject(playerid, weaponid, objectid, Float:x, Float:y, Float:z)
{
	for(new i=0;i<MAX_DEERS;i++)
	{
	if(weaponid != 33) return SCM(playerid,-1,"Need weapon melee");
	if(objectid == Deer[i])
	{
	SetDynamicObjectRot(Deer[i],90,0,0);
	}
	}
	return 1;
}
public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	new Float:oldX, Float:oldY, Float:oldZ,Float:oldRotX, Float:oldRotY, Float:oldRotZ;
	GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
	GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
	if(response == EDIT_RESPONSE_FINAL)
	{
		BaseInfo[PlayerUseingBase[playerid]][bX] = x;
		BaseInfo[PlayerUseingBase[playerid]][bY] = y;
		BaseInfo[PlayerUseingBase[playerid]][bZ] = z;
		BaseInfo[PlayerUseingBase[playerid]][bRX] = rx;
		BaseInfo[PlayerUseingBase[playerid]][bRY] = ry;
		BaseInfo[PlayerUseingBase[playerid]][bRZ] = rz;
		BaseInfo[PlayerUseingBase[playerid]][bvID] = GetPlayerVirtualWorld(playerid);
		BaseInfo[PlayerUseingBase[playerid]][bInt] = GetPlayerInterior(playerid);
		SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
		SaveBase(BaseInfo[PlayerUseingBase[playerid]][bID]);
	}
	if(response == EDIT_RESPONSE_CANCEL)
	{
		SetDynamicObjectPos(objectid, oldX, oldY, oldZ);
		SetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
		BaseInfo[PlayerUseingBase[playerid]][bX] = oldX;
		BaseInfo[PlayerUseingBase[playerid]][bY] = oldY;
		BaseInfo[PlayerUseingBase[playerid]][bZ] = oldZ;
		BaseInfo[PlayerUseingBase[playerid]][bRX] = oldRotX;
		BaseInfo[PlayerUseingBase[playerid]][bRY] = oldRotY;
		BaseInfo[PlayerUseingBase[playerid]][bRZ] = oldRotZ;
		BaseInfo[PlayerUseingBase[playerid]][bvID] = GetPlayerVirtualWorld(playerid);
		BaseInfo[PlayerUseingBase[playerid]][bInt] = GetPlayerInterior(playerid);
	}
	SaveBase(BaseInfo[PlayerUseingBase[playerid]][bID]);
	BaseInfo[PlayerUseingBase[playerid]][bLifup] = false;
    return 1;
}
stock TreePath(treeid)
{
    new tree[64];

    format(tree, 30, "Trees/%d.ini", treeid);
    tInfo[treeid][ID] ++;

    return tree;
}
stock RandomEx(min, max)
{
    return random(max - min) + min;
}
stock BoxPath(boxid)
{
    new box[64];

    format(box, 30, "Box/%d.ini", boxid);
    BoxInfo[boxid][ID] ++; // multiplying

    return box;
}

forward LoadBoxData(i, name[], value[]);
public LoadBoxData(i, name[], value[])
{
    INI_Float("xPos", BoxInfo[i][xPos]);
    INI_Float("yPos", BoxInfo[i][yPos]);
    INI_Float("zPos", BoxInfo[i][zPos]);
	INI_Int("Item0",BoxInfo[i][Item][0]);
	INI_Int("Item1",BoxInfo[i][Item][1]);
	INI_Int("Item2",BoxInfo[i][Item][2]);
	INI_Int("Item3",BoxInfo[i][Item][3]);
	INI_Int("Item4",BoxInfo[i][Item][4]);
	INI_Int("Item5",BoxInfo[i][Item][5]);
	INI_Int("Item6",BoxInfo[i][Item][6]);
	INI_Int("Item7",BoxInfo[i][Item][7]);
	INI_Int("Item8",BoxInfo[i][Item][8]);
	INI_Int("Item9",BoxInfo[i][Item][9]);


    return true;
}
stock SaveThisBox(boxid)
{
	new file[64];
	format(file, sizeof(file), "Box/%d.ini",boxid);
	if(fexist(file))
	{
	new INI:File = INI_Open(file);
	INI_SetTag(File, "Box Data");
	INI_WriteFloat(File, "xPos", BoxInfo[boxid][xPos]);
	INI_WriteFloat(File, "yPos", BoxInfo[boxid][yPos]);
	INI_WriteFloat(File, "zPos", BoxInfo[boxid][zPos]);
	INI_WriteInt(File,"Item0",BoxInfo[boxid][Item][0]);
	INI_WriteInt(File,"Item1",BoxInfo[boxid][Item][1]);
	INI_WriteInt(File,"Item2",BoxInfo[boxid][Item][2]);
	INI_WriteInt(File,"Item3",BoxInfo[boxid][Item][3]);
	INI_WriteInt(File,"Item4",BoxInfo[boxid][Item][4]);
	INI_WriteInt(File,"Item5",BoxInfo[boxid][Item][5]);
	INI_WriteInt(File,"Item6",BoxInfo[boxid][Item][6]);
	INI_WriteInt(File,"Item7",BoxInfo[boxid][Item][7]);
	INI_WriteInt(File,"Item8",BoxInfo[boxid][Item][8]);
	INI_WriteInt(File,"Item9",BoxInfo[boxid][Item][9]);

	INI_Close(File);
	}
	return true;
}
stock SaveBox()
{
    new file[64];

    for(new i; i < MAX_BOXS; i ++)
    {
        format(file, sizeof(file), "Box/%d.ini", i);

        if(fexist(file))
        {
            new INI:File = INI_Open(file);

            INI_SetTag(File, "Box Data");
            INI_WriteFloat(File, "xPos", BoxInfo[i][xPos]);
            INI_WriteFloat(File, "yPos", BoxInfo[i][yPos]);
            INI_WriteFloat(File, "zPos", BoxInfo[i][zPos]);
			INI_WriteInt(File,"Item0",BoxInfo[i][Item][0]);
			INI_WriteInt(File,"Item1",BoxInfo[i][Item][1]);
			INI_WriteInt(File,"Item2",BoxInfo[i][Item][2]);
			INI_WriteInt(File,"Item3",BoxInfo[i][Item][3]);
			INI_WriteInt(File,"Item4",BoxInfo[i][Item][4]);
			INI_WriteInt(File,"Item5",BoxInfo[i][Item][5]);
			INI_WriteInt(File,"Item6",BoxInfo[i][Item][6]);
			INI_WriteInt(File,"Item7",BoxInfo[i][Item][7]);
			INI_WriteInt(File,"Item8",BoxInfo[i][Item][8]);
			INI_WriteInt(File,"Item9",BoxInfo[i][Item][9]);

            INI_Close(File);
        }
    }

    return true;
}
new bload=0;
stock LoadBox()
{
    new file[64];

    print("\n  Loading Box: \n");

    for(new i; i < MAX_BOXS; i ++)
    {
        format(file, sizeof(file), "Box/%d.ini", i);
        if(fexist(file))
        {
            INI_ParseFile(BoxPath(i), "LoadBoxData", false, true, i, true, false);
            BoxInfo[i][Obj] = CreateObject(1271, BoxInfo[i][xPos], BoxInfo[i][yPos], BoxInfo[i][zPos],0,0,0);
            bload ++;
        }
        
    }
    printf("\n  %d Box loaded!",bload);
    return true;
}
stock SaveBase(idx)
{
	new strings[256];
	format(strings,sizeof(strings),"Base/%d.ini",idx);
 	new INI:string = INI_Open(strings);
	INI_WriteInt(string,"Model",BaseInfo[idx][bModel]);
	INI_WriteInt(string,"Lock",BaseInfo[idx][bLock]);
	INI_WriteInt(string,"Pass",BaseInfo[idx][bPass]);
	INI_WriteFloat(string,"X",BaseInfo[idx][bX]);
	INI_WriteFloat(string,"Y",BaseInfo[idx][bY]);
	INI_WriteFloat(string,"Z",BaseInfo[idx][bZ]);
	INI_WriteFloat(string,"RX",BaseInfo[idx][bRX]);
	INI_WriteFloat(string,"RY",BaseInfo[idx][bRY]);
	INI_WriteFloat(string,"RZ",BaseInfo[idx][bRZ]);
	INI_WriteInt(string,"vID",BaseInfo[idx][bvID]);
	INI_WriteInt(string,"Int",BaseInfo[idx][bInt]);
	INI_Close(string);
	return 1;
}
forward LoadBaseData(idx, name[], value[]);
public LoadBaseData(idx,name[],value[])
{
	INI_Int("Model",BaseInfo[idx][bModel]);
	INI_Int("Lock",BaseInfo[idx][bLock]);
	INI_Int("Pass",BaseInfo[idx][bPass]);
	INI_Float("X",BaseInfo[idx][bX]);
	INI_Float("Y",BaseInfo[idx][bY]);
	INI_Float("Z",BaseInfo[idx][bZ]);
	INI_Float("RX",BaseInfo[idx][bRX]);
	INI_Float("RY",BaseInfo[idx][bRY]);
	INI_Float("RZ",BaseInfo[idx][bRZ]);
	INI_Int("vID",BaseInfo[idx][bvID]);
	INI_Int("Int",BaseInfo[idx][bInt]);
	return 1;
}
new baseload = 0;
stock LoadBase()
{
	for(new idx=1;idx<MAX_BASES;idx++)
	{
		new string[256];
        format(string,sizeof(string),"Base/%d.ini",idx);
        if(fexist(string))
        {
        BaseInfo[idx][bID] = idx;
        INI_ParseFile(string,"LoadBaseData",false, true, idx, true, false);
        BaseInfo[idx][bObject] = CreateDynamicObject(BaseInfo[idx][bModel], BaseInfo[idx][bX], BaseInfo[idx][bY], BaseInfo[idx][bZ], BaseInfo[idx][bRX], BaseInfo[idx][bRY], BaseInfo[idx][bRZ], BaseInfo[idx][bvID], BaseInfo[idx][bInt]);
        baseload ++;
        }
	}
	printf("\n  %d Base loaded!",baseload);
	return 1;

}
public CreateBase(idx)
{
	BaseInfo[idx][bObject] = CreateDynamicObject(BaseInfo[idx][bModel], BaseInfo[idx][bX], BaseInfo[idx][bY], BaseInfo[idx][bZ], BaseInfo[idx][bRX], BaseInfo[idx][bRY], BaseInfo[idx][bRZ], BaseInfo[idx][bvID], BaseInfo[idx][bInt]);
	return 1;
}
public Lift(playerid)
{
    BaseInfo[PlayerUseingBase[playerid]][bLifup] = true;
	PlayerLiftup[playerid] = true;
	ClearAnimations(playerid);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 1, 1, 1);
    DestroyDynamicObject(BaseInfo[PlayerUseingBase[playerid]][bObject]);
	SetPlayerAttachedObject(playerid,8, BaseInfo[PlayerUseingBase[playerid]][bModel], 1, 0, 0.6, 0, 0, 90, 0, 1, 1, 1);
    SCM(playerid,0xFFFF00C8,"* You lift the Base!");
	return 1;
}

public PutDown(playerid)
{
	PlayerPutDown[playerid] = false;
    BaseInfo[PlayerUseingBase[playerid]][bLifup] = false;
    GetPlayerPos(playerid, BaseInfo[PlayerUseingBase[playerid]][bX], BaseInfo[PlayerUseingBase[playerid]][bY], BaseInfo[PlayerUseingBase[playerid]][bZ]);
    BaseInfo[PlayerUseingBase[playerid]][bZ] -= 0.5;
    BaseInfo[PlayerUseingBase[playerid]][bvID] = GetPlayerVirtualWorld(playerid);
    BaseInfo[PlayerUseingBase[playerid]][bInt] = GetPlayerInterior(playerid);
    CreateBase(PlayerUseingBase[playerid]);
    SCM(playerid,0xFFFF00C8,"* You put down the Base!");
    SaveBase(BaseInfo[PlayerUseingBase[playerid]][bID]);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0); //ClearAnimation
	return 1;
}

public RecoveryLift()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	    if(!IsPlayerInAnyVehicle(i))
	    {
		    if(GetPlayerAnimationIndex(i))
		    {
		        if(PlayerLiftup[i] == true)
		        {
					new animlib[32];
			        new animname[32];
			        GetAnimationName(GetPlayerAnimationIndex(i), animlib, 32, animname, 32);
		            if(strcmp(animname, "crry_prtial", true) != 0)
		    		{
			            ApplyAnimation(i, "CARRY", "crry_prtial", 4.0, 0, 0, 1, 1, 1);
					}
				}
			}
		}
	}
	return 1;
}

//Stock

stock GetBaseID()
{
	new i=1;
	while(i != MAX_BASES) {
	    if(BaseInfo[i][bID] == 0) {
	        return i;
		}
		i++;
	}
	return -1;
}

stock GetClosestBase(playerid)
{
	new i=1;
	while(i != MAX_BASES) {
	    if(IsPlayerInRangeOfPoint(playerid, 2, BaseInfo[i][bX], BaseInfo[i][bY], BaseInfo[i][bZ]) && BaseInfo[i][bLifup] == false) {
	        return i;
		}
		i++;
	}
	return -1;
}

PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0);
}
