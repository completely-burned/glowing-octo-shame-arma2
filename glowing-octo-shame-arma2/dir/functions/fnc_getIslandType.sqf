/*
 * №1 Тип.
 * 100 - Зима
 * 150-160 - Лес, Зима, Вода.
 * 180 - Лес, вокруг много воды.
 * 190 - Лес, у моря
 * 200 - Лес
 * 225 - Джунгли
 * 250 - Пустыня, Лес
 * 300 - Пустыня
 * 
 * №2 Дата.
 * 
 * №3 Горы.
 *
 * TODO: Проверка по зависимостям карты и другой информации.
 */

if !(isNil "gosa_IslandType") exitWith {gosa_IslandType};

private ["_w","_r"];
_w = toLower worldName;
_r = [250,2012,100];

// Тип.
if (_w in ["plr_bulge","mcn_neaville_winter","i44_merderet_winter","chernarus_winter",
	"gm_weferlingen_winter"]) then {_r set [0,100]};
if (_w in ["namalsk"]) then {_r set [0,160]};
if (_w in ["utes","i44_omaha","sara"]) then {_r set [0,180]};
if (_w in ["fdf_isle1_a","chernarus","i44_omaha_v2","cup_chernarus_a3",
	"noe","thirsk","vt7"]) then {_r set [0,190]};
if (_w in ["enoch","woodland_acr","bootcamp_acr","dogechnya",
	"gm_weferlingen_summer","beketov","zdanice",
	"mcn_neaville","i44_merderet_v2","i44_merderet","stozec"]) then {_r set [0,200]};
if (_w in ["tanoa","rhspkl","vn_khe_sanh","vn_the_bra"]) then {_r set [0,225]};
if (_w in ["altis","vr","stratis","porto","tem_anizay","cain"]) then {_r set [0,250]};
if (_w in ["kunduz"]) then {_r set [0,275]};
if (_w in ["zargabad","takistan","desert_e","shapur_baf","mountains_acr","fallujah",
	"sefrouramal"]) then {_r set [0,300]};

// Дата.
if (_w in ["i44_omaha","i44_omaha_v2","mcn_neaville","i44_merderet_winter",
	"plr_bulge","mcn_neaville_winter","i44_merderet","i44_merderet_v2"]) then
{
	_r set [1,1944];
};
if (_w in ["vn_khe_sanh","vn_the_bra"]) then
{
	_r set [1,1968];
};
if (_w in ["gm_weferlingen_summer","gm_weferlingen_winter"]) then
{
	_r set [1,1983];
};
if (_w in ["noe"]) then
{
	_r set [1,1984];
};
if (_w in ["zdanice","stozec","cain"]) then
{
	_r set [1,1986];
};
if (_w in ["sara"]) then
{
	_r set [1,2007];
};
if (_w in ["porto"]) then
{
	_r set [1,2008];
};
if (_w in ["utes","chernarus","chernarus_winter",
	"kunduz"]) then
{
	_r set [1,2009];
};
if (_w in ["fallujah"]) then
{
	_r set [1,2010];
};
if (_w in ["zargabad","takistan","desert_e"]) then
{
	_r set [1,2012];
};
if (_w in ["thirsk"]) then
{
	_r set [1,2014];
};
if (_w in ["vt7"]) then
{
	_r set [1,2015];
};
if (_w in ["beketov"]) then
{
	_r set [1,2017];
};
if (_w in ["tem_anizay"]) then
{
	_r set [1,2018];
};
if (_w in ["rhspkl","dogechnya"]) then
{
	_r set [1,2019];
};
if (_w in ["cup_chernarus_a3"]) then
{
	_r set [1,2020];
};
if (_w in ["altis","tanoa","enoch","vr","stratis","sefrouramal"]) then
{
	_r set [1,2035];
};


// Горки.
// Особенности движка A3. Гусеничные машины при застревании дают задний ход и могут таким образом проехать несколько холмов, поэтому, например, на этих картах множитель гусеничных машин уменьшен.
if (_w in ["stratis","Malden","takistan"]) then
{
	_r set [2,1000];
};

_r;
