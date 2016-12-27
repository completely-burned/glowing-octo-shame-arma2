private["_Magazines","_Weapons","_Backpacks"];
_Magazines = [];
_Weapons = [];
_Backpacks = [];
private["_chars"];
_chars = (configFile >> "CfgVehicles" >> _this >> "TransportMagazines");
for "_i" from 0 to ((count _chars) - 1) do 
{
	private ["_item"];
	_item = _chars select _i;
	
	if (isClass _item) then 
	{
		_Magazines = _Magazines + [[getText(_item >> "magazine"),getNumber(_item >> "count")]];
	};
};
_chars = (configFile >> "CfgVehicles" >> _this >> "TransportWeapons");
for "_i" from 0 to ((count _chars) - 1) do 
{
	private ["_item"];
	_item = _chars select _i;
	
	if (isClass _item) then 
	{
		_Weapons = _Weapons + [[getText(_item >> "weapon"),getNumber(_item >> "count")]];
	};
};
_chars = (configFile >> "CfgVehicles" >> _this >> "TransportBackpacks");
for "_i" from 0 to ((count _chars) - 1) do 
{
	private ["_item"];
	_item = _chars select _i;
	
	if (isClass _item) then 
	{
		_Backpacks = _Backpacks + [[getText(_item >> "Backpack"),getNumber(_item >> "count")]];
	};
};

[_Magazines,_Weapons,_Backpacks];
