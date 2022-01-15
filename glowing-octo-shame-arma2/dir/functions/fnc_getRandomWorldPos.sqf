private ["_x", "_y", "_z", "_w", "_p"];

diag_log format ["Log: [fnc_getRandomWorldPos] %1 %2", time, _this];

//--- вода
if (count _this > 0) then {
  _w = _this select 0;
}else{
  _w = true;
};

// TODO: нужно ограничение
while {isNil "_p"} do {

  _z = 1000 min ((gosa_worldSize select 0)/4); // _z = отступ от края карты
    _x = gosa_worldSize select 0;
    _x = _x - (_z*2);
    _x = _z + random _x;
  _z = 1000 min ((gosa_worldSize select 1)/4);
    _y = gosa_worldSize select 1;
    _y = _y - (_z*2);
    _y = _z + random _y;

  if (_w) then {
    _p = [_x, _y];
  } else {
    if !(surfaceIsWater [_x, _y]) then {
      _p = [_x, _y];
    }else{ // diag_log
      diag_log format ["Log: [fnc_getRandomWorldPos] surfaceIsWater %1", [_x, _y]];
    };
  };

};

diag_log format ["Log: [fnc_getRandomWorldPos] %1 %2", time, _p];

_p;
