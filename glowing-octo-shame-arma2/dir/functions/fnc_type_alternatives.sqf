private ["_cfgVeh","_type","_entry","_model","_item","_types","_camo","_str",
	"_TextureSources","_alternatives","_role","_name","_b","_vehicles"];
_type = _this select 0;

_cfgVeh = LIB_cfgVeh;
_entry = _cfgVeh >> _type;
_model = getText(_entry >> "model");
if (getNumber(_entry >> "isMan") > 0) then {
	_role = getText(_entry >> "role");
	_name = getTextRaw(_entry >> "displayName");
};
_types = [];
_TextureSources = [];
_alternatives = [];
_vehicles = availableVehicles;

if (_model != "") then {
	//for "_i" from 0 to (count _cfgVeh -1) do
	for "_i" from 0 to (count _vehicles -1) do
	{
		//_item = _cfgVeh select _i;
		_item = _cfgVeh >> (_vehicles select _i);
		if (isClass _item) then {
			if ((getNumber(_item >> "scope")) in [1,2]) then {
				if (getNumber(_item >> "isMan") > 0) then {
					_b = false;
					if (getText(_item >> "role") == _role) then {
						if (getTextRaw(_item >> "displayName") == _name) then {
							_b = true;
							//_str = configName _item;
							_str = _vehicles select _i;
							_types set [count _types, _str];
						};
					};
				}else{
					if (getText(_item >> "model") == _model) then {
						_b = true;
						_str = getText(_item >> "crew");
						//_types set [count _types, configName _item];
						_types set [count _types, _vehicles select _i];
					}else{
						_b = false;
					};
				};
				if (_b) then {
					_camo = [_str] call gosa_fnc_type_camoClass;
					_alternatives set [count _alternatives, _camo];
				};
			};
		};
	};
};

[_types, _alternatives];

