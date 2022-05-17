/*
  TODO: Нужен порядок.
*/

#define BIS_SSM_BIKB "\ca\modules_e\SSM\data\bikb\ssmradio.bikb"

private ["_var","_val","_caller","_act","_requestPos","_spawnPos","_pilot",
  "_class","_vehicle","_disp","_rvx","_rvy","_wp","_target","_grp","_side",
  "_z","_crew"];

diag_log format ["Log: [fnc_SSM_spawnAir] %1", _this];

// First of all, free the channel (in Multiplayer)
// first argument, _this select 0 is the Publicvariable (string)
_var = _this select 0;
missionnamespace setVariable [_var,objNull];

// _caller reaquested the supply drop
_caller = _this select 1;
//type of action (string)
_act = _this select 2;

_requestPos = _caller getVariable "gosa_SSM_RequestPos";

_side = side _caller;


// Устранить повторные вызовы.
{
  _z = _x getVariable "gosa_SSM_SupportCaller";
  if (!isNil "_z") exitWith {
    _grp = _x;
    _vehicle = vehicle leader _grp;
    _crew = crew _vehicle;
  };
} forEach allGroups;


// create the vehicle and the pilot
//_pilot = ObjNull;

if (isNil "_vehicle" or {!canMove _vehicle}) then {
  // можно использовать уже созданный транспорт
  // TODO: >=3 места под 3 ящика
  _vehicle = [_caller, _side, [0,3]] call gosa_fnc_SSM_findReadyVehicle;
  if (count _vehicle > 0) then {
    _vehicle = _vehicle call BIS_fnc_selectRandom;
    _grp = group _vehicle;
    _crew = crew _vehicle;

    // TODO: нужно временно разделить отряд если в нем множество тс

    // FIXME: на тс может надо?
    _grp setVariable ["gosa_SSM_SupportCaller",_caller];


  } else {
    if (missionNamespace getVariable "gosa_AmmoDrop" == 1) then {
    _grp = createGroup _side;
    _grp setVariable ["gosa_tmpObj","AmmoDrop"];

    // FIXME: на тс может надо?
    _grp setVariable ["gosa_SSM_SupportCaller",_caller];

    // TODO: нужна функция
    switch (_side) do {
      case west: {_class = airTransportsWest call BIS_fnc_selectRandom};
      case east: {_class = airTransportsEast call BIS_fnc_selectRandom};
      case resistance: {_class = airTransportsGuer call BIS_fnc_selectRandom};
      default {_class = ""};
    };
    _spawnPos = ([_requestPos]+[3500,7000, -1, -1, (100 * (pi / 180)), 0, [], _requestPos, [false, 0]]+[_side] call gosa_fnc_findSafePos) select 0;
    _z = ([_spawnPos, random 360, _class, _grp] call gosa_fnc_spawnVehicle);
    _crew = _z select 1;
    _vehicle = _z select 0;
      _vehicle setVariable ["gosa_tmpObj","AmmoDrop"];
      {
        _x setVariable ["gosa_tmpObj","AmmoDrop"];
      } forEach _crew;
    }else{
      _vehicle = nil;
      _crew = [];
    };
  };
};

diag_log format ["Log: [fnc_SSM_spawnAir] %1, %2", _vehicle, _crew];

if (!isNil "_vehicle" && {canMove _vehicle}) then {
  {
    if (_grp == group _x) then {
      //_x disableAI "FSM";
    };
  } forEach _crew;
  _vehicle FlyInHeight 150; // BIS_SSM_FLYINHEIGHT

  _z = leader _grp;

  for "_i" from count waypoints _grp - 1 to 0 step -1 do {
    deleteWaypoint [_grp, _i];
  };

  // Units or Ammo Drop
  // Set Primary waypoint
  _wp = _grp addWaypoint [_requestPos, 0];
  _wp setWaypointbehaviour "STEALTH";
  _wp setWaypointCombatMode "GREEN";

  // setWaypointStatement expression call cant have any arguments. We pass it with setVariable on the pilot object.
  _wp setWaypointStatements ["true", "call gosa_fnc_SSM_"+_act+"WaypointReached"];

    _z kbAddtopic[_act, BIS_SSM_BIKB];
    [nil, _z, rKBTELL, _caller, _act, _act+"Accepted"] call RE;

} else {
  _caller kbAddtopic[_act, BIS_SSM_BIKB];
  [nil, _caller, rKBTELL, _caller, _act, _act+"Denied"] call RE;
};


  // set 'fly out' final waypoint
  // TODO: позицию для авиации можно за пределами карты
  //_wp = _grp addWaypoint [[0,0], 0];
  //_wp setWaypointStatements ["true", "call gosa_fnc_SSM_FinalWaypointReached"];

_grp;
