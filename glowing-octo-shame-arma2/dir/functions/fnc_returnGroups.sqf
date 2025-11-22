/*
Конвертирует CfgGroups в формат этого сценария.
Примеры:
copyToClipboard ([["East"],["CUP_O_RUS_M"],["Infantry_VKPO_Desert]] call gosa_fnc_returnGroups select 1);
copyToClipboard ([["East"],["INS","RU"],[]] call gosa_fnc_returnGroups select 1);
copyToClipboard ([["I44_A"],[],[]] call gosa_fnc_returnGroups select 1);
copyToClipboard ([["West"],["BLU_F"],[]] call gosa_fnc_returnGroups select 1);
copyToClipboard ([["Indep"],["IND_F"],[]] call gosa_fnc_returnGroups select 1);
copyToClipboard ([["Guerrila"],["FDF"],[]] call gosa_fnc_returnGroups select 1);
copyToClipboard ([["West"],["CUP_B_US_Army"],[]] call gosa_fnc_returnGroups select 1);
copyToClipboard ([["Indep"],["LIB_UK_DR"],[]] call gosa_fnc_returnGroups select 1) ;
*/


private ["_cfgGroups","_Blacklist","_args","_side", "_type", "_cfgFaction",
	"_str","_comma","_item","_groups","_groups0","_grp","_weight","_side_x",
	"_cfgFaction_x","_types","_positions","_ranks"];

_args = _this;
_br = toString [13,10];
_comma = false;
_str = "[" + _br;

_cfgGroups = configFile >> "CfgGroups";
_Blacklist=[
_cfgGroups >> "West" >> "USMC" >> "Infantry" >> "USMC_FRTeam_Razor",
_cfgGroups >> "Guerrila" >> "PMC_BAF" >> "Infantry" >> "PMC_Team_Sword"
];
_side = _args select 0;
if ((count(_args select 1)) > 0) then{
	_cfgFaction = _args select 1;
}
else{
	_cfgFaction=[];
		for "_z" from 0 to ((count _cfgGroups) - 1) do {
			_side_x = _cfgGroups select _z;
			for "_i" from 0 to ((count _side_x) - 1) do {
					_item = (_side_x select _i);

					if (isClass _item) then {
						_cfgFaction = (_cfgFaction  + [configName _item]);
					};
			};
		};

};
if ((count(_args select 2)) > 0) then {
	_type = _args select 2;
}
else {
	_type = [];
		for "_z" from 0 to ((count _side) - 1) do {
			_side_x = _cfgGroups >> (_side select _z);
			for "_i" from 0 to ((count _side_x) - 1) do {
				_cfgFaction_x = (_side_x select _i);
				for "_y" from 0 to ((count _cfgFaction_x) - 1) do {
					_item = (_cfgFaction_x select _y);
					if (isClass _item) then {
						_type = (_type  - [configName _item] + [configName _item]);
					};
				};
			};
		};
};
_groups = [];
_groups0 = [];
{
	_side_x = _x;
	{
		_cfgFaction_x = _x;
		{
			if (isClass (_cfgGroups >> _side_x >> _cfgFaction_x >> _x)) then {
				if (_comma) then {
					_str = _str + "," + _br;
					_comma = false;
				};
				_str = _str + "// " + _x + " " + getText(_cfgGroups >> _side_x >> _cfgFaction_x >> _x >> "name") + _br;
			};
			for "_i" from 0 to ((count (_cfgGroups >> _side_x >> _cfgFaction_x >> _x)) - 1) do {
				_item = (_cfgGroups >> _side_x >> _cfgFaction_x >> _x) select _i;
				if ((isClass _item)&&!(_item in _Blacklist)) then {
					_grp = ((_cfgGroups >> _side_x >> _cfgFaction_x >> _x) select _i);
					if(isNumber(_grp >> "rarityGroup"))then{_weight = getNumber(_grp >> "rarityGroup")}else{_weight=0};

					_types = []; _positions = []; _ranks = [];
					for "_i" from 0 to ((count _grp) - 1) do
					{
						_item = _grp select _i;

						if (isClass _item) then
						{
							_types = _types + [getText(_item >> "vehicle")];
							_ranks = _ranks + [getText(_item >> "rank")];
							_positions = _positions + [getArray(_item >> "position")];
						};
					};

					if (_comma) then {
						_str = _str + "," + _br;
					}else{
						_comma = true;
					};
					_str = _str + "// " + configName _grp + " " + getText(_grp >> "name") + _br + '[[[configFile >> "CfgGroups" >> ' + str _side_x + " >> " + str _cfgFaction_x + " >> " + str _x + " >> " + str configName _grp + "]]," + str _weight + "]";
					//_str = _str + "// " + configName _item + _br + str [[[_types,_positions,_ranks]],_weight];
					// FIXME: Зяпятая не всегда устанавливается.
					_groups = (_groups + [[[[_types,_positions,_ranks]],_weight]]);
					_groups0 = (_groups0 + [[[[_grp]],_weight]]);
				};
			};
		} forEach _type;
	} forEach _cfgFaction;
} forEach _side;

_str = _str + _br + "];" + _br;

[_groups, _str, _groups0];
