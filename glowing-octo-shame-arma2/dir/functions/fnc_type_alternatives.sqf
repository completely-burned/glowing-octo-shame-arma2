private ["_cfgVeh","_type","_entry","_model","_item","_types","_camo","_str",
	"_uniform",
	"_TextureSources","_camouflages","_role","_name","_b","_vehicles"];
_type = _this select 0;

_cfgVeh = LIB_cfgVeh;
_entry = _cfgVeh >> _type;
_model = getText(_entry >> "model");
if (getNumber(_entry >> "isMan") > 0) then {
	_role = getText(_entry >> "role");
	_name = getTextRaw(_entry >> "displayName");
	_uniform = getText(_entry >> "uniformClass");
};
_types = [];
_TextureSources = [];
_camouflages = [];
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
					if (getText(_item >> "role") == _role &&
						//getText(_item >> "uniformClass") == _uniform &&
						getTextRaw(_item >> "displayName") == _name) then
					{
							_b = true;
							//_str = configName _item;
							_str = _vehicles select _i;
							_types set [count _types, _str];
					}else{
						_b = false;
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
					_camouflages set [count _camouflages, _camo];
				};
			};
		};
	};
};

[_types, _camouflages];

