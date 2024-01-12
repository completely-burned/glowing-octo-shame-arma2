/*
 * №1 Тип.
 * 100 - Зима
 * 160 - Лес, Зима, Вода.
 * 180 - Лес, вокруг много воды.
 * 190 - Лес, у моря
 * 200 - Лес
 * 225 - Джунгли
 * 250 - Пустыня, Лес
 * 300 - Пустыня
 * 
 * №2 Дата.
 * 
 * TODO: Проверка по зависимостям карты и другой информации.
 */

if !(isNil "gosa_IslandType") exitWith {gosa_IslandType};

private ["_w","_r"];
_w = toLower worldName;
_r = [250,2012];

// Тип.
if (_w in ["plr_bulge","mcn_neaville_winter","i44_merderet_winter"]) then {_r set [0,100]};
if (_w in ["namalsk"]) then {_r set [0,160]};
if (_w in ["utes","i44_omaha"]) then {_r set [0,180]};
if (_w in ["fdf_isle1_a","chernarus","i44_omaha_v2","cup_chernarus_a3"]) then {_r set [0,190]};
if (_w in ["enoch","woodland_acr","bootcamp_acr","dogechnya",
	"mcn_neaville","i44_merderet_v2","i44_merderet"]) then {_r set [0,200]};
if (_w in ["tanoa","rhspkl"]) then {_r set [0,225]};
if (_w in ["altis","vr"]) then {_r set [0,250]};
if (_w in ["zargabad","takistan","desert_e","shapur_baf","mountains_acr"]) then {_r set [0,300]};

// Дата.
if (_w in ["i44_omaha","i44_omaha_v2","mcn_neaville","i44_merderet_winter",
	"plr_bulge","mcn_neaville_winter","i44_merderet","i44_merderet_v2"]) then
{
	_r set [1,1944];
};
if (_w in ["utes","chernarus"]) then
{
	_r set [1,2009];
};
if (_w in ["zargabad","takistan","desert_e"]) then
{
	_r set [1,2012];
};
if (_w in ["rhspkl","dogechnya"]) then
{
	_r set [1,2019];
};
if (_w in ["cup_chernarus_a3"]) then
{
	_r set [1,2020];
};
if (_w in ["altis","tanoa","enoch","vr"]) then
{
	_r set [1,2035];
};


_r;
