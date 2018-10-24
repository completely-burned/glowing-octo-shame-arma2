private["_Road","_Roads2","_maxDist"];
_Road = _this select 0;
_Road2 = _this select 1;
_maxDist = _this select 2;

draga_fnc_Roads_dist = {
  private["_Roads","_dist","_true","_maxDist"];
  _Roads = _this select 0;
  _dist = _this select 1;
  _true = false;
  _maxDist = _this select 3;
  if (_this select 2 in _Roads) then {
    _true = true;
  };

  if !(_true) then {
    if (_dist < _maxDist) then {
      {
        if !(_true) then {
          _true = [roadsConnectedTo _x, _dist + 1, _Road2, _maxDist] call draga_fnc_Roads_dist;
        };
      } forEach _Roads;
    }else{
     _true = false;
   };
  };

  _true;
};

private["_true"];
_true = [roadsConnectedTo _Road, 0, _Road2, _maxDist] call draga_fnc_Roads_dist;
_true;
