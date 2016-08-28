private["_grp","_Vehicles"];
_grp = _this select 0;
_Vehicles=[];
if((typeName _grp) == "GROUP")then
{
	{
			if!(vehicle _x in _Vehicles)then
			{
				_Vehicles = _Vehicles + [vehicle _x];
			};
	}foreach units _grp;
}
else
{
	if((typeName _grp) == "CONFIG")then{
		for "_i" from 0 to ((count _grp) - 1) do 
		{
		//sleep 0.01;
			private ["_item"];
			_item = _grp select _i;
			
			if (isClass _item) then 
			{
				_Vehicles = _Vehicles + [getText(_item >> "vehicle")];
			};
		};
	}else{
		_Vehicles=(_grp select 0);
	};
};
_Vehicles;
