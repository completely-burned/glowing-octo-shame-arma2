
/*
	Создаем граждан города.
	TODO: Совместимость с bis модулями.
	TODO: Задание <Не дать умереть гражданским>.
*/
_gosa_Alice_path = "dir\alice\";

if (isNil "gosa_ALICE_fnc_doorCreate") then {
	gosa_ALICE_fnc_doorCreate = compile preprocessFileLineNumbers (_gosa_Alice_path + "fnc_createdoor.sqf");
};
if (isNil "gosa_ALICE_fnc_civilianSet") then {
	gosa_ALICE_fnc_civilianSet = compile preprocessFileLineNumbers (_gosa_Alice_path + "fnc_civilianset.sqf");
};

///////////////////////////////////////////////////////////////////////////////////
///// Модели граждан
///////////////////////////////////////////////////////////////////////////////////
/*
	TODO: Пустыня.
*/
_unitrarity = [];
 //if (format ["%1",_logic getvariable "civilianRarity"] == "<null>") then {[]} else {_logic getvariable "civilianRarity";};
//_logic setvariable ["civilianRarity",_unitrarity];

_classlist = [];
_totobj = count (configfile >> "cfgVehicles");
for [{_i = 0}, {_i < _totobj}, {_i = _i + 1}] do {
	_actual = (configfile >> "cfgVehicles") select _i;
	if (isclass _actual) then {
		_class = configname _actual;
		_vehicleclass = gettext (configfile >> "cfgvehicles" >> _class >> "vehicleClass");
		if !(_vehicleclass in ["Sounds","Mines"]) then {
			_scope = getnumber (_actual >> "scope");
			if (_class iskindof "civilian" && _scope == 2) then {
				_rarity = if (_class in _unitrarity) then {
					_vehiclerarity select ((_vehiclerarity find _class)+1);
				} else {
					getnumber (_actual >> "rarityUrban");
				};
				_faction = gettext (_actual >> "faction");
				_classlist = _classlist + [[_class,_rarity,_faction]];
			};
		};
	};
};
diag_log Format ["Log: [ALICE] _classlist %1",_classlist];


///////////////////////////////////////////////////////////////////////////////////
///// Инициализация граждан города
///////////////////////////////////////////////////////////////////////////////////

// TODO: _twn
_twn = _this select 0;
//_classlist = _this select 1;
//_logic = BIS_alice_mainscope;
diag_log Format ["Log: [ALICE] _this %1",_this];


_factionCiv = ["CIV"] call BIS_fnc_getFactions;
diag_log Format ["Log: [ALICE] _factionCiv %1",_factionCiv];
_twnrespect = ["SET"] call BIS_fnc_respect;
diag_log Format ["Log: [ALICE] _twnrespect %1",_twnrespect];
_twnrespect set [_factionCiv,0.5];
	// TODO: Использование переменных на объекте локации плохо сказывается на производительности и менее гибкое.
	_type = _twn getvariable "type";
	_name = _twn getvariable "name";
	//if (isnil {_twn getvariable "respect"}) then {_twn setVariable ["respect",_twnrespect,true]};
	_twn setvariable ["ALICE_threat",-1,true];
	_twn setvariable ["ALICE_status","black",true];
	_twn setVariable ["ALICE_population",[],true];
	_twn setVariable ["ALICE_populationActive",[],true];
	_twn setVariable ["ALICE_populationCountDef",-1,true];
	_twn setVariable ["ALICE_populationCoef",0,true];
	_twn setVariable ["ALICE_playersNear",false,true];
	_twn setVariable ["ALICE_forcePopulation",false,true];
	_twn setvariable ["doorcountdef",0];

_twnpos = position _twn;
_twntype = _twn getvariable "type";
if (isnil "_twntype") then {_twntype = "ERROR: Missing type"};
_twnclass = _twn getvariable "class";
if (isnil "_twnclass") then{_twnclass = "ERROR: Missing class"};
_twnname = _twn getvariable "name";
if (isnil "_twnname") then {_twnname = "ERROR: Missing name"};
_twndemography = _twn getvariable "demography";
if (isnil "_twndemography") then {
	_twndemography = getarray(configfile >> "cfgworlds" >> worldname >> "names" >> _twnclass);
	if (count _twndemography == 0) then {
		_twndemography = ["CIV",1]; //--- Default value
	};
};



//--- Random values
_awareMultiplier = 0.3 + random 0.3;
_combatMultiplier = 0/*0.01 + random 0.1*/;


//--- Get custom params ---------------------------
_civilianCount = "round (2 * (sqrt %1))"; //_logic getvariable "civilianCount";
_blacklist = []; //_logic getvariable "blacklist";


_grp = creategroup civilian;
_twn setvariable ["ALICE_group",_grp];

//--- Remove small objects and objects on blacklist
_houselist = _twnpos nearobjects ["House",500];
_doorlist = [];
{
	_bbox = abs((boundingbox _x select 1) select 0) min abs((boundingbox _x select 1) select 1);
	if (_bbox < 3 || typeof _x in _blacklist) then {

		//--- Exclude
		_houselist = _houselist - [_x]
	} else {

		//--- Include
		_doors = _x call gosa_ALICE_fnc_doorCreate;
		_doorlist  = _doorlist  + _doors;
	};
} foreach _houselist;
diag_log Format ["Log: [ALICE] _houselist %1",_houselist];
diag_log Format ["Log: [ALICE] _doorlist %1",_doorlist];


_twn setvariable ["doorcountdef", count _doorlist];

_populationClasses = [];
_populationCount = call compile format [_civilianCount, count _doorlist]; //--- Total
_population = [];
_populationCoef = 0.4 + random 0.3;
//_twn setvariable ["ALICE_populationCoef",_populationCoef,true];


//--- Get rarityUrban value
private ["_twnRarityUrban"];
_twnRarityUrban = 1;
//_twnRarityUrban = _logic getvariable "rarityurban";
//_twnRarityUrban = ([_twn,["RARITY"]] call bis_fnc_locations);
diag_log Format ["Log: [ALICE] _twnRarityUrban %1",_twnRarityUrban];


//--- Calculate demographic
_demographyOrder = [];
_demographyTotal = 0;
for "_i" from 0 to (count _twndemography-1) step 2 do {
	_faction = _twndemography select _i;
	_part = (_twndemography select (_i+1)) * _populationCount;
	_demographyOrder = _demographyOrder + [_faction,_demographyTotal];
	_demographyTotal = _demographyTotal + _part;
};

//--- Calculate number of civilians (depends on town size, daytime and weather) ----------------
//--- Filter civilian classes through Urban Rarity number
_twnClasslist = [];
for "_i" from 0 to ((count _demographyOrder - 1) / 2) do {
	_twnClasslist = _twnClasslist + [[/*_demographyOrder select (_i*2)*/]];
};
_rarityRange = 0.3 + (0.2 * _twnRarityUrban);

//--- Filter civilians by urban rarity and nationality
{
	_class = _x select 0;
	_rarityUrban = _x select 1;
	_faction = _x select 2;
	_factionlimit = (_demographyOrder find _faction) / 2;
	if (
		_factionlimit >= 0 &&
		_rarityUrban >= 0 &&
		abs(_twnRarityUrban - _rarityUrban) < _rarityRange
	) then {
		_list = _twnClasslist select _factionlimit;
		_list = _list + [_class];
		_twnClasslist set [_factionlimit,_list];
	};
} foreach _classlist;
diag_log Format ["Log: [ALICE] _twnClasslist %1",_twnClasslist];

//--- Define civilians
_populationClasses = [];
// FIXME: _id_civ для чего?
//_id_civ = _logic getvariable "id";
for "_i" from 1 to _populationCount do {

	//--- Library of town inhabitants
	_faction = _demographyOrder select 0;
	_factionID = 0;
	for "_n" from 0 to (count _demographyOrder - 1) step 2 do {
		_factionTemp = _demographyOrder select _n;
		_limit = _demographyOrder select (_n + 1);
		if (_i > _limit) then {_faction = _factionTemp; _factionID = _n / 2};
	};
	_type = (_twnclasslist select _factionID) call BIS_fnc_selectRandom;
	//_id_civ = _id_civ + 1;
	_populationClasses = _populationClasses + [_type];
};
diag_log Format ["Log: [ALICE] _populationClasses %1",_populationClasses];

_populationCount = count _populationClasses;
_populationCountDef = _populationCount;
//_logic setvariable ["id",_id_civ];


private ["_id","_class","_door"];
for "_i" from 0 to (_populationCount -1) do {
  _class = _populationClasses select _i;

  if (_class != "") then {
  	//_grp = creategroup civilian,
  	_door = _doorlist call BIS_fnc_selectRandom;
  	[_class,_twn,_door,_grp] call gosa_ALICE_fnc_civilianSet;
  };
};
