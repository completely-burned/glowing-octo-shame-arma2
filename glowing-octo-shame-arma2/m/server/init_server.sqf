[] execVM ("m\server\" + "server_update_respawnVehicles.sqf");

///--- настройки миссии

// OnPlayerConnected "[_id, _uid, _name] ExecVM (corePath + ""Server\Server_PlayerConnected.sqf"")";
	// OnPlayerDisconnected "[_id, _uid, _name] ExecVM (corePath + ""Server\Server_PlayerDisconnected.sqf"")";

onPlayerConnected {
	"MainTown" setMarkerPos getMarkerPos "MainTown";
};

m_skill = (missionNamespace getVariable "m_skill") / 100;

enableSaving [false,false]; // отключение возможность сохраняться
// enableRadio false;
// 0 fadeRadio 0;
// enableSentences false;

if(debug)then{
	diag_log format ["diag_log: worldname == %1", worldname];
};

///--- I don't know what that is
// "AwareFormationSoft" enableAIFeature false;
// "CombatFormationSoft" enableAIFeature false;

[] call compile preprocessFileLineNumbers "m\server\config_server.sqf";

///--- создание сторон
if (( sideLogic CountSide AllUnits ) < 1) then { CreateCenter sideLogic };
if (( civilian CountSide AllUnits ) < 1) then { CreateCenter civilian };
{
	if ((_x CountSide AllUnits) < 1) then {
		CreateCenter _x;
	};
	Private["_sideCreated"];
	_sideCreated = _x;
	{
		if (_x != _sideCreated) then {
			if ((_x in m_friendlySide && !(_sideCreated in m_friendlySide)) or (!(_x in m_friendlySide) && _sideCreated in m_friendlySide)) then {
				_x SetFriend [_sideCreated,0];
				_sideCreated SetFriend [_x,0];
			}else{
				_x SetFriend [_sideCreated,1];
				_sideCreated SetFriend [_x,1];
			};
		};
	} ForEach [East,West,Resistance];
	if (_sideCreated in m_friendlySide) then {
		_sideCreated SetFriend [civilian,1];
		civilian SetFriend [_sideCreated,1];
	}else{
		_sideCreated SetFriend [civilian,0];
		civilian SetFriend [_sideCreated,0];
	};
	// _x SetFriend [sideUnknown ,0];
	// sideUnknown  SetFriend [_x,0];
} ForEach [East,West,Resistance];
// west setFriend [east, 1];
// west setFriend [resistance, 1];
// west setFriend [civilian, 0];
// east setFriend [west, 1];
// east setFriend [resistance, 0];
// east setFriend [civilian, 0];
// resistance setFriend [west, 1];
// resistance setFriend [east, 0];
// resistance setFriend [civilian, 0];
// civilian setFriend [west, 0];
// civilian setFriend [east, 0];
// civilian setFriend [resistance, 0];
// civilian setFriend [civilian, 0];

///--- модули
if (isNil "group_logic") then {
	group_logic = createGroup sideLogic;
};

draga_HC_logic = (group_logic) createUnit ["logic",[1000,10,0],[],0,"none"];;
publicVariable "draga_HC_logic";

BIS_silvie_mainscope = objNull;
// мусоросборник, изменен
m_GC_queue = [];
BIS_GC_trashItFunc = {
	m_GC_queue = (m_GC_queue + [[_this select 0, time + 60 ]]);
};
waitUntil {!isNil "BIS_GC_trashItFunc"};

// функции
BIS_missionScope = (group_logic) createUnit ["FunctionsManager",[1000,10,0],[],0,"none"];
publicVariable "BIS_missionScope";
waitUntil {!isNil "BIS_fnc_init"};

private ["_BIS_marta_mainscope"];
// военные обозначения
	_BIS_marta_mainscope = (group_logic) createUnit ["MartaManager",[1000,10,0],[],0,"none"];
	_BIS_marta_mainscope setVariable ["duration", 60, true];
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

if ( ACE_Avail ) then {
	// отключение усталость
	(group_logic) createUnit ["ACE_NoStamina",[1000,10,0],[],0,"none"];
}else{
	// первая помощь, не работает
	// _logic = (group_logic) createUnit ["FirstAidSystem",[1000,10,0],[],0,"none"];
	// _logic synchronizeObjectsAdd playableUnits;
	// _logic = (group_logic) createUnit ["BattleFieldClearance",[1000,10,0],[],0,"none"];
	// _logic synchronizeObjectsAdd playableUnits;
	// _logic = (group_logic) createUnit ["AlternativeInjurySimulation",[1000,10,0],[],0,"none"];
	// _logic synchronizeObjectsAdd playableUnits;
};
waitUntil{!isNil "m_fnc_init"};


///--- создание и удаление объектов, базы
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


//
[] call compile preprocessFileLineNumbers "m\server\init_objects.sqf";

// списки групп
[] call compile preprocessFileLineNumbers "m\server\init_groups.sqf";
// локации, города
[] execVM "m\server\init_towns.sqf";

// обновление техники и ботов, удаление
[] spawn compile preprocessFileLineNumbers "m\server\updateServer.sqf";
//--- патрули, боты создание
// [] spawn compile preprocessFileLineNumbers "m\server\updateFPS.sqf";
[] spawn compile preprocessFileLineNumbers "m\server\updateReinforcement.sqf";
