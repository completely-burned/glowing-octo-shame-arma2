#define __A2OA__
private ["_grp","_n"];

// FIXME: Возможно при использовании одной группы на все объекты,
// то при изменении одного синхронизируются все их параметры по сети.
_grp = createGroup sideLogic;
gosa_grpLogic = _grp;
publicVariable "gosa_grpLogic";
// Совместимость.
if (isNil "group_logic") then {group_logic = _grp};
#ifndef __ARMA3__
	BIS_missionScope = _grp createUnit ["FunctionsManager",[1000,10,0],[],0,"none"];
	publicVariable "BIS_missionScope";
#endif

OnPlayerDisconnected "[_id, _uid, _name] ExecVM (""dir\server\eh_PlayerDisconnected.sqf"")";

[] execVM ("dir\server\" + "server_update_respawnVehicles.sqf");

//--- настройки миссии

gosa_ai_skill = (missionNamespace getVariable "gosa_ai_skill") / 100;

#ifdef __ARMA3__
	_n = missionNamespace getVariable "gosa_setTimeMultiplier";
	if (_n != 1) then {
		diag_log format ["Log: [init_server] setTimeMultiplier %1", _n];
		setTimeMultiplier _n;
	};
#endif

// отключение возможность сохраняться
enableSaving [false,false];
// enableRadio false;
// 0 fadeRadio 0;
// enableSentences false;

if(debug)then{
	diag_log format ["diag_log: worldname == %1", worldname];
};

///--- I don't know what that is
// "AwareFormationSoft" enableAIFeature false;
// "CombatFormationSoft" enableAIFeature false;

diag_log format ["Log: [init_server] Создаём белый список объектов.", nil];
_arr = [] call gosa_fnc_availableVehicles;
availableVehicles = _arr; publicVariable "availableVehicles";
_arr = [] call gosa_fnc_availableWeapons;
availableWeapons = _arr; publicVariable "availableWeapons";
_arr = [] call gosa_fnc_availableMagazines;
availableMagazines = _arr; publicVariable "availableMagazines";
_arr = [] call gosa_fnc_availableBackpacks;
availableBackpacks = _arr; publicVariable "availableBackpacks";
diag_log format ["Log: [init_server] Создан белый список объектов. %1", [count availableVehicles, count availableWeapons, count availableMagazines, count availableBackpacks]];

[] call compile preprocessFileLineNumbers "dir\server\init_groups.sqf";
[] call compile preprocessFileLineNumbers "dir\server\config_server.sqf";

//--- создание сторон
if (( sideLogic CountSide AllUnits ) < 1) then { CreateCenter sideLogic };
if (( civilian CountSide AllUnits ) < 1) then { CreateCenter civilian };
if (gosa_pvp) then {
	west setFriend [east, 0];
	west setFriend [resistance, 0];
	west setFriend [civilian, 1];
	east setFriend [west, 0];
	east setFriend [resistance, 0];
	east setFriend [civilian, 1];
	resistance setFriend [west, 0];
	resistance setFriend [east, 0];
	resistance setFriend [civilian, 1];
	civilian setFriend [west, 1];
	civilian setFriend [east, 1];
	civilian setFriend [resistance, 1];
	civilian setFriend [civilian, 1];
} else {
{
	if ((_x CountSide AllUnits) < 1) then {
		CreateCenter _x;
	};
	Private["_sideCreated"];
	_sideCreated = _x;
	{
		if (_x != _sideCreated) then {
			if ((_x in gosa_friendlyside && !(_sideCreated in gosa_friendlyside)) or (!(_x in gosa_friendlyside) && _sideCreated in gosa_friendlyside)) then {
				_x SetFriend [_sideCreated,0];
				_sideCreated SetFriend [_x,0];
			}else{
				_x SetFriend [_sideCreated,1];
				_sideCreated SetFriend [_x,1];
			};
		};
	} ForEach [East,West,Resistance];
	if (_sideCreated in gosa_friendlyside) then {
		_sideCreated SetFriend [civilian,1];
		civilian SetFriend [_sideCreated,1];
	}else{
		// стреляют по машинам и бочкам при <0.6
		_sideCreated SetFriend [civilian,1];
		civilian SetFriend [_sideCreated,1];
	};
	// _x SetFriend [sideUnknown ,0];
	// sideUnknown  SetFriend [_x,0];
} ForEach [East,West,Resistance];
};

gosa_logic_ArsenalBox = _grp createUnit ["logic",[1000,10,0],[],0,"none"];
publicVariable "gosa_logic_ArsenalBox";

//-- Модули.
gosa_HC_logic = (group_logic) createUnit ["logic",[1000,10,0],[],0,"none"];;
publicVariable "gosa_HC_logic";

BIS_silvie_mainscope = objNull;
// мусоросборник, изменен
#ifndef __A2OA__
	allDead = [];
#endif
gosa_gc_array = [];
BIS_GC_trashItFunc = {
#ifndef __A2OA__
	allDead set [count allDead, _this select 0];
#endif
};
waitUntil {!isNil "BIS_GC_trashItFunc"};

// командование
// if (isNil "BIS_HC_mainscope") then	{
// _logic = group_logic createUnit ["HighCommand",[1000,10,0],[],0,"NONE"];
// _logic SetVariable ["addAllGroups",false];
// BIS_HC_mainscope = _logic;
// publicVariable "BIS_HC_mainscope";
// };
// эффекты
// if ( LIB_ahAvail ) then {
	// (group_logic) createUnit ["WeatherPostprocessManager",[1000,10,0],[],0,"none"];
	// (group_logic) createUnit ["WeatherParticlesManager",[1000,10,0],[],0,"none"];
// };
// (group_logic) createUnit ["BIS_clouds_Logic",[1000,10,0],[],0,"none"];

// гражданские
// if(toLower worldname in ["chernarus", "utes", "fdf_isle1_a",  "woodland_acr","namalsk"])then{
	// (group_logic) createUnit ["AliceManager",[1000,10,0],[],0,"none"];
// }else{
	// (group_logic) createUnit ["Alice2Manager",[1000,10,0],[],0,"none"];
// };

// животные
// (group_logic) createUnit ["BIS_animals_Logic",[1000,10,0],[],0,"none"];

if ( configName(LIB_cfgVeh >> "ACE_Logic") != "" ) then {
	// отключение усталость
	#ifndef __ARMA3__
	(group_logic) createUnit ["ACE_NoStamina",[1000,10,0],[],0,"none"];
	#endif
}else{
	// первая помощь, не работает
	// _logic = (group_logic) createUnit ["FirstAidSystem",[1000,10,0],[],0,"none"];
	// _logic synchronizeObjectsAdd playableUnits;
	// _logic = (group_logic) createUnit ["BattleFieldClearance",[1000,10,0],[],0,"none"];
	// _logic synchronizeObjectsAdd playableUnits;
	// _logic = (group_logic) createUnit ["AlternativeInjurySimulation",[1000,10,0],[],0,"none"];
	// _logic synchronizeObjectsAdd playableUnits;
};

#ifdef __ARMA3__
	if (missionNamespace getVariable "gosa_ModuleSlingload" != 0) then {
		_grp createUnit ["ModuleSlingload_F",[1000,10,0],[],0,"none"];
	};
#endif

waitUntil{!isNil "gosa_fnc_init"};

//-- Стартовый список штабов и построек.
[] execVM "dir\server\init_hq.sqf";
[] execVM "dir\server\while_hq.sqf";
[] execVM "dir\server\init_LocationBase.sqf";

//--- создание и удаление объектов, базы
if(worldName == "Chernarus")then{
	// [] call compile preprocessFileLineNumbers "\ca\missions\campaign\missions\C3_Manhattan.Chernarus\manhattansetup.sqf";
	{
		_x = [4727.5889,8.9828243,2543.7881] nearestObject _x;
		_x setDamage 1;
		hideObject _x;
	}forEach [345558,345623,345624,1026474,1026365,343785];
};


if(isMultiplayer)then{
	EnableTeamSwitch false;
	{RemoveSwitchableUnit _x} ForEach SwitchableUnits;
};

// локации, города
if (missionNamespace getVariable "gosa_mission" == 2) then {
	[] spawn gosa_fnc_mission_capture_location;
}else{
[] execVM "dir\server\init_towns.sqf";
};

if (missionNamespace getVariable "gosa_locations" == 2) then {
	[] call compile preprocessFileLineNumbers "dir\towns\twn_get_locations_map.sqf";
	[] call compile preprocessFileLineNumbers "dir\towns\twn_init_alltowns.sqf";
}else{
#ifndef __ARMA3__
[] execVM "dir\server\init_alltowns.sqf";
#endif
};

// обновление техники и ботов, удаление
[] execVM "dir\server\updateServer.sqf";

// с авторестартом
[] execVM "dir\server\while_failover.sqf";

if (missionNamespace getVariable "gosa_flares" > 0) then {
	[] execVM "dir\server\while_flare.sqf";
};
