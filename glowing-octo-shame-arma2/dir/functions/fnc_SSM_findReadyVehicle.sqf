private["_caller","_side","_veh","_Commander","_grp","_tr","_list","_z"];

_caller = _this select 0;

if (count _this > 1 ) then {
  _side = _this select 1;
}else{
  _side = side _caller;
};

if (count _this > 2
  //&& !isNil {_this select 2}
) then {
  _tr = _this select 2;
}else{
  _tr = count units _caller;
};

diag_log format ["Log: [fnc_SSM_findReadyVehicle] %1 %2", _this, [_caller, _side, _tr]];

_list = [];
{
  _veh = _x;
  if(canMove _veh)then{

  if(getDammage _veh < 0.75)then{

  //if (isNil "_side") then {
  //  _side = side _caller;
  //}; //\

  if(side _veh getFriend _side >= 0.6)then{ // TODO: проверку лучше по cfg делать, тк игроки угоняют тс и выходят с сервера

  if(_veh isKindOf "Helicopter" or _veh isKindOf "MV22")then{

  if(isNil {_veh getVariable "transportPlayer"})then{

  _Commander = effectiveCommander _veh;
  if(alive _Commander)then{

  _grp = group _Commander;
  if(isNil {_grp getVariable "gosa_SSM_SupportCaller"})then{

  if(
    { group _x != _grp && // искл. посторонние группы
      group _x != group _caller // но вкл. юниты игрока
    }count crew _veh == 0
  )then{

  if({_x call gosa_fnc_isPlayer}count units _grp == 0)then{

  if({_x call gosa_fnc_isPlayer}count (crew _veh - units _caller) == 0)then{

  //if(_tr == 0 or _veh emptyPositions "cargo" >= _tr)then{
  //};
        _list set [count _list, _veh];  };};};};};};};};};};
} forEach vehicles;


//--- сортировка
// TODO: сортировка нужна по фракции, стороне, количеству во взводе == 1, вооружению

diag_log format ["Log: [fnc_SSM_findReadyVehicle] out %1", _list];

_list;
