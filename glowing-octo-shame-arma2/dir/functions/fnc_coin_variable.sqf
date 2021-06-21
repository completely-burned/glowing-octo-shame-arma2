_logic = _this select 0;


if(count _this > 1)then{
	_logic setVariable ["BIS_COIN_areasize", [_this select 3 select 2, _this select 3 select 2]];
	_logic setVariable ["BIS_COIN_items", (_this select 3 select 1)];
};

_logic setvariable ["BIS_COIN_categories", ["Base","Defence"]];


//--- Get custom params ----------------------------------------------------------------------------------
//debuglog format ["Log: %1  |  %2",_logic getvariable "BIS_COIN_rules",_logic getvariable "BIS_COIN_name"];
//---Name of construction site
_name = if (isnil {_logic getvariable "BIS_COIN_name"}) then {""} else {_logic getvariable "BIS_COIN_name"};
_logic setvariable ["BIS_COIN_name",_name];

//--- Units with access
_rules = if (isnil {_logic getvariable "BIS_COIN_rules"}) then {synchronizedObjects _logic} else {(_logic getvariable "BIS_COIN_rules") + synchronizedObjects _logic};
if (typename _rules != "ARRAY") then {_rules = [_rules]};
_logic setvariable ["BIS_COIN_rules",_rules];

//--- Categories
_categories = if (isnil {_logic getvariable "BIS_COIN_categories"}) then {[]} else {_logic getvariable "BIS_COIN_categories"};
_logic setvariable ["BIS_COIN_categories",_categories];

//--- Items
_items = if (isnil {_logic getvariable "BIS_COIN_items"}) then {[]} else {_logic getvariable "BIS_COIN_items"};
_logic setvariable ["BIS_COIN_items",_items];

//--- Funds
_funds = if (isnil {_logic getvariable "BIS_COIN_funds"}) then {["0"]} else {_logic getvariable "BIS_COIN_funds"};
if (typename _funds == "STRING") then {_funds = [_funds]};
_logic setvariable ["BIS_COIN_funds",_funds];

//--- Funds Description
_fundsDescription = if (isnil {_logic getvariable "BIS_COIN_fundsDescription"}) then {["$"]} else {_logic getvariable "BIS_COIN_fundsDescription"};
if (typename _fundsDescription == "STRING") then {_fundsDescription = [_fundsDescription]};
_logic setvariable ["BIS_COIN_fundsDescription",_fundsDescription];

//--- Area size
_areasize = if (isnil {_logic getvariable "BIS_COIN_areasize"}) then {[150,50]} else {_logic getvariable "BIS_COIN_areasize"};
_logic setvariable ["BIS_COIN_areasize",_areasize];

//--- actionCondition code - if true (+ in area and in rules), action will be showed
_actionCondition = if (isnil {_logic getvariable "BIS_COIN_actionCondition"}) then {"true"} else {_logic getvariable "BIS_COIN_actionCondition"};
_logic setvariable ["BIS_COIN_actionCondition",_actionCondition];

/*
//--- Start code - by this adding action can be disabled
_onStart = if (isnil {_logic getvariable "BIS_COIN_onStart"}) then {{}} else {_logic getvariable "BIS_COIN_onStart"};
_logic setvariable ["BIS_COIN_onStart",_onStart];

//--- Select code
_onSelect = if (isnil {_logic getvariable "BIS_COIN_onSelect"}) then {{}} else {_logic getvariable "BIS_COIN_onSelect"};
_logic setvariable ["BIS_COIN_onSelect",_onSelect];

//--- Purchase code
_onPurchase = if (isnil {_logic getvariable "BIS_COIN_onPurchase"}) then {{}} else {_logic getvariable "BIS_COIN_onPurchase"};
_logic setvariable ["BIS_COIN_onPurchase",_onPurchase];

//--- Construct code
_onConstruct = if (isnil {_logic getvariable "BIS_COIN_onConstruct"}) then {{}} else {_logic getvariable "BIS_COIN_onConstruct"};
_logic setvariable ["BIS_COIN_onConstruct",_onConstruct];

//--- Repair code (set empty code to disable this function)
_onRepair = if (isnil {_logic getvariable "BIS_COIN_onRepair"}) then {{}} else {_logic getvariable "BIS_COIN_onRepair"};
_logic setvariable ["BIS_COIN_onRepair",_onRepair];

//--- Sell code (set empty code to disable this function)
_onSell = if (isnil {_logic getvariable "BIS_COIN_onSell"}) then {{}} else {_logic getvariable "BIS_COIN_onSell"};
_logic setvariable ["BIS_COIN_onSell",_onSell];
*/


//--- Temporary variables
_logic setvariable ["BIS_COIN_params",[]];
//_logic setvariable ["BIS_COIN_preview",objnull,true];
_logic setvariable ["BIS_COIN_buildings",[]];
