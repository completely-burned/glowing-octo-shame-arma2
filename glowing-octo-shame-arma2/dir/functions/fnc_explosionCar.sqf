  //waitUntil{isEngineOn _this select 0 or _t > time};

// саперы не взрываются
if ({getNumber(configFile >> "CfgVehicles" >> typeOf _x >> "engineer") == 1} count crew (_this select 0) == 0) then {

  //--- взрыв
  "HelicopterExploSmall" createVehicle getpos (_this select 0);

  //--- прочие повреждения
  _this select 0 engineOn false;

  //--- уничтожение экипажа
  {
    _x setDamage 1;
  } forEach crew (_this select 0);
};

//--- чистка
[_this select 0, 2] call gosa_fnc_mining;
