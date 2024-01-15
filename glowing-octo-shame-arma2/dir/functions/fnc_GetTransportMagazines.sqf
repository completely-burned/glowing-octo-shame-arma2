/*
 * Скрипт возвращает содержимое ящика по умолчанию.
 * TODO: Оптимизация.
 */

private ["_Magazines","_Weapons","_Backpacks","_Items","_chars","_item"];
_Magazines = [];
_Weapons = [];
_Backpacks = [];
_Items = [];

_chars = (configFile >> "CfgVehicles" >> _this >> "TransportMagazines");
for "_i" from 0 to ((count _chars) - 1) do
{
	_item = _chars select _i;
	if (isClass _item) then
	{
		_Magazines set [count _Magazines, [getText (_item >> "magazine"), getNumber(_item >> "count")]];
	};
};
_chars = (configFile >> "CfgVehicles" >> _this >> "TransportWeapons");
for "_i" from 0 to ((count _chars) - 1) do
{
	_item = _chars select _i;
	if (isClass _item) then
	{
		_Weapons set [count _Weapons, [getText (_item >> "weapon"), getNumber(_item >> "count")]];
	};
};
_chars = (configFile >> "CfgVehicles" >> _this >> "TransportBackpacks");
for "_i" from 0 to ((count _chars) - 1) do
{
	_item = _chars select _i;
	if (isClass _item) then
	{
		_Backpacks set [count _Backpacks, [getText (_item >> "Backpack"), getNumber(_item >> "count")]];
	};
};

#ifdef __ARMA3__
	_chars = (configFile >> "CfgVehicles" >> _this >> "TransportItems");
	for "_i" from 0 to ((count _chars) - 1) do
	{
		_item = _chars select _i;
		if (isClass _item) then
		{
			_Items set [count _Items, [getText (_item >> "name"), getNumber(_item >> "count")]];
		};
	};
#endif

[_Magazines,_Weapons,_Backpacks,_Items];
