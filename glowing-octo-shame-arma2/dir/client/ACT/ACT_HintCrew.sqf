//Action: hint vehicle crew
private["_crew","_crewcount","_icon","_msg","_m1","_m2","_m3","_m4","_cnt","_unit","_name","_hint"];
_crew = (crew (_this select 0));
_crewcount = count _crew;
_icon = "";
_msg = "";
_m1 = parseText format["<t color='#FFFFCC'>  %1</t>","Crew"];
_m2 = parseText "<br /><br />";
_m3 = parseText format["<t size='2.2'><img image='%1'/></t>",getText (configFile >> "CfgVehicles" >> format["%1", typeOf (vehicle player)] >> "picture")];
_m4 = [_m3,_m1,_m2];
_cnt = 0;
while {_cnt < _crewcount} do 
{
	_unit = (_crew select _cnt);
	_name = name _unit;
	_icon = parseText "<img align='left' image='\ca\ui\data\i_cargo_ca.paa'/></t>";
	if(_unit == driver vehicle _unit) then 
	{
		_icon = parseText "<img align='left' image='\ca\ui\data\i_driver_ca.paa'/></t>"
	};	
	if(_unit == gunner vehicle _unit) then 
	{
		_icon = parseText "<img align='left' image='\ca\ui\data\i_gunner_ca.paa'/></t>"
	};	
	if(_unit == commander vehicle _unit) then 
	{
		_icon = parseText "<img align='left' image='\ca\ui\data\i_commander_ca.paa'/></t>"
	};	
	
	_m4 = _m4+[_icon];	
	_msg = parseText format["<t color='#FFFFFF' align='left'>   %1</t><br />",_name];	
	_m4 = _m4+[_msg];	
	_cnt=_cnt+1;
};
_hint = composeText _m4;
hint _hint;
