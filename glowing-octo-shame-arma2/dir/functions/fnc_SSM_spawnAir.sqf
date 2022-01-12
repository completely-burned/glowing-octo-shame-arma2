
#define BIS_SSM_BIKB "\ca\modules_e\SSM\data\bikb\ssmradio.bikb"

private ["_var","_val","_caller","_act","_requestPos","_spawnPos","_pilot",
  "_class","_vehicle","_disp","_rvx","_rvy","_wp","_target","_grp","_side",
  "_z"];

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

// TODO: траспорт можно взять готовый

// create the vehicle and the pilot
//_pilot = ObjNull;

// можно использовать уже созданный транспорт
_vehicle = [_caller, _side] call gosa_fnc_SSM_findReadyVehicle;
if (count _vehicle > 0) then {
  _vehicle = _vehicle call BIS_fnc_selectRandom;
  _grp = group _vehicle;

  // TODO: нужно временно разделить отряд если в нем множество тс

  _grp setVariable ["gosa_SSM_SupportCaller",_caller]; // FIXME: на тс может надо?


} else {
_grp = createGroup _side;

_grp setVariable ["gosa_SSM_SupportCaller",_caller]; // FIXME: на тс может надо?

switch (_side) do { // TODO: нужна функция
  case west: {_class = airTransportsWest call BIS_fnc_selectRandom};
  case east: {_class = airTransportsEast call BIS_fnc_selectRandom};
  case resistance: {_class = airTransportsGuer call BIS_fnc_selectRandom};
  default {_class = ""};
};
_spawnPos = ([_requestPos]+[3500,7000, -1, -1, (100 * (pi / 180)), 0, [], _requestPos, [false, 0]]+[_side] call gosa_fnc_findSafePos) select 0;
_vehicle = ([_spawnPos, random 360, _class, _grp] call gosa_fnc_spawnVehicle) select 0;
};

  if (!isNil "_vehicle" && {alive _vehicle}) then {

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

  //} else {
    //[nil, leader _grp, rKBTELL, _caller, _act, _act+"Denied"] call RE;
  };


  // set 'fly out' final waypoint
  //_wp = _grp addWaypoint [[0,0], 0]; // TODO: позицию для авиации можно за пределами карты
  //_wp setWaypointStatements ["true", "call gosa_fnc_SSM_FinalWaypointReached"];

_grp;
