private ["_cfgGroups","_Blacklist"];
_cfgGroups = configFile >> "CfgGroups";
_Blacklist=[
_cfgGroups >> "West" >> "USMC" >> "Infantry" >> "USMC_FRTeam_Razor",
_cfgGroups >> "Guerrila" >> "PMC_BAF" >> "Infantry" >> "PMC_Team_Sword"



];
private ["_side", "_type", "_cfgFaction"];
_side = _this select 0;
if ((count(_this select 1)) > 0) then{
	_cfgFaction = _this select 1;
}
else{
	_cfgFaction=[];
		for "_z" from 0 to ((count _cfgGroups) - 1) do {
			private ["_side_x"];
			_side_x = _cfgGroups select _z;
			for "_i" from 0 to ((count _side_x) - 1) do {
					private ["_item"];
					_item = (_side_x select _i);
					
					if (isClass _item) then {
						_cfgFaction = (_cfgFaction  + [configName _item]);
					};
			};
		};

};
if ((count(_this select 2)) > 0) then {
	_type = _this select 2;
} 
else {
	_type = [];
		for "_z" from 0 to ((count _side) - 1) do {
			private ["_side_x"];
			_side_x = _cfgGroups >> (_side select _z);
			for "_i" from 0 to ((count _side_x) - 1) do {
				private ["_cfgFaction_x"];
				_cfgFaction_x = (_side_x select _i);
				for "_y" from 0 to ((count _cfgFaction_x) - 1) do {
					private ["_item"];
					_item = (_cfgFaction_x select _y);
					if (isClass _item) then {
						_type = (_type  - [configName _item] + [configName _item]);
					};
				};
			};
		};
};
private ["_groups"];
_groups = [];
{
	private ["_side_x"];
	_side_x = _x;
	{
		private ["_cfgFaction_x"];
		_cfgFaction_x = _x;
		{
			for "_i" from 0 to ((count (_cfgGroups >> _side_x >> _cfgFaction_x >> _x)) - 1) do {
				private ["_item"];
				_item = (_cfgGroups >> _side_x >> _cfgFaction_x >> _x) select _i;
				if ((isClass _item)&&!(_item in _Blacklist)) then {
					private ["_grp"];
					_grp = ((_cfgGroups >> _side_x >> _cfgFaction_x >> _x) select _i);
					private ["_weight"];
					if(isNumber(_grp >> "rarityGroup"))then{_weight = getNumber(_grp >> "rarityGroup")}else{_weight=0};
					
					private ["_types","_positions","_ranks"];
					_types = []; _positions = []; _ranks = [];
					for "_i" from 0 to ((count _grp) - 1) do 
					{
						private ["_item"];
						_item = _grp select _i;
						
						if (isClass _item) then 
						{
							_types = _types + [getText(_item >> "vehicle")];
							_ranks = _ranks + [getText(_item >> "rank")];
							_positions = _positions + [getArray(_item >> "position")];
						};
					};
					
					_groups = (_groups + [[[_types,_positions,_ranks],_weight]]);
				};
			};
		} forEach _type;
	} forEach _cfgFaction;
} forEach _side;

_groups
