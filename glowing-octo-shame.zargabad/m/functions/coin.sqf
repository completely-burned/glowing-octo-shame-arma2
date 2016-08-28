scriptName "CoIn\data\scripts\coin.sqf";
/*
	File: coin.sqf
	Author: Karel Moricky

	Description:
	Init script - Construction Interface

	Parameter(s):
	_this: the Coin logic unit which triggered this script.
*/
_logic = _this select 0;
//[_logic] join grpnull;

//--- Logic ID
if (isnil "BIS_coin_lastID") then {BIS_coin_lastID = -1};
BIS_coin_lastID = BIS_coin_lastID + 1;
_varname = "";

//debugLog format ["COIN_ BIS_coin_%1 %2",BIS_coin_lastID,[_logic, position _logic]];
//debugLog format ["COIN_ACTION BIS_coin_%1 %2",BIS_coin_lastID,[_logic, position _logic]];

call compile format ["BIS_coin_%1 = _logic; _logic setvehiclevarname 'BIS_coin_%1'; _varname = 'BIS_coin_%1'; publicvariable 'BIS_coin_%1'",BIS_coin_lastID];


_logic setvariable ["BIS_COIN_ID",BIS_coin_lastID, true];
publicvariable (vehiclevarname _logic);

//--- First call
if (BIS_coin_lastID == 0) then {

	//--- Execute Functions
	if (isnil "BIS_fnc_init") then {
		_logicFnc = (group _logic) createunit ["FunctionsManager",position player,[],0,"none"];
	};
	
};
waituntil {!(isNil "BIS_fnc_init")};

//--- Get custom params ----------------------------------------------------------------------------------
//debuglog format ["Log: %1  |  %2",_logic getvariable "BIS_COIN_rules",_logic getvariable "BIS_COIN_name"];
//---Name of construction site
_name = if (isnil {_logic getvariable "BIS_COIN_name"}) then {""} else {_logic getvariable "BIS_COIN_name"};
_logic setvariable ["BIS_COIN_name",_name,true];

//--- Units with access
_rules = if (isnil {_logic getvariable "BIS_COIN_rules"}) then {synchronizedObjects _logic} else {(_logic getvariable "BIS_COIN_rules") + synchronizedObjects _logic};
if (typename _rules != "ARRAY") then {_rules = [_rules]};
_logic setvariable ["BIS_COIN_rules",_rules,true];

//--- Categories
_categories = if (isnil {_logic getvariable "BIS_COIN_categories"}) then {[]} else {_logic getvariable "BIS_COIN_categories"};
_logic setvariable ["BIS_COIN_categories",_categories,true];

//--- Items
_items = if (isnil {_logic getvariable "BIS_COIN_items"}) then {[]} else {_logic getvariable "BIS_COIN_items"};
_logic setvariable ["BIS_COIN_items",_items,true];

//--- Funds
_funds = if (isnil {_logic getvariable "BIS_COIN_funds"}) then {["0"]} else {_logic getvariable "BIS_COIN_funds"};
if (typename _funds == "STRING") then {_funds = [_funds]};
_logic setvariable ["BIS_COIN_funds",_funds,true];

//--- Funds Description
_fundsDescription = if (isnil {_logic getvariable "BIS_COIN_fundsDescription"}) then {["$"]} else {_logic getvariable "BIS_COIN_fundsDescription"};
if (typename _fundsDescription == "STRING") then {_fundsDescription = [_fundsDescription]};
_logic setvariable ["BIS_COIN_fundsDescription",_fundsDescription,true];

//--- Area size
_areasize = if (isnil {_logic getvariable "BIS_COIN_areasize"}) then {[150,50]} else {_logic getvariable "BIS_COIN_areasize"};
_logic setvariable ["BIS_COIN_areasize",_areasize,true];

//--- actionCondition code - if true (+ in area and in rules), action will be showed
_actionCondition = if (isnil {_logic getvariable "BIS_COIN_actionCondition"}) then {"true"} else {_logic getvariable "BIS_COIN_actionCondition"};
_logic setvariable ["BIS_COIN_actionCondition",_actionCondition,true];

//--- Start code - by this adding action can be disabled
_onStart = if (isnil {_logic getvariable "BIS_COIN_onStart"}) then {{}} else {_logic getvariable "BIS_COIN_onStart"};
_logic setvariable ["BIS_COIN_onStart",_onStart,true];

//--- Select code
_onSelect = if (isnil {_logic getvariable "BIS_COIN_onSelect"}) then {{}} else {_logic getvariable "BIS_COIN_onSelect"};
_logic setvariable ["BIS_COIN_onSelect",_onSelect,true];

//--- Purchase code
_onPurchase = if (isnil {_logic getvariable "BIS_COIN_onPurchase"}) then {{}} else {_logic getvariable "BIS_COIN_onPurchase"};
_logic setvariable ["BIS_COIN_onPurchase",_onPurchase,true];

//--- Construct code
_onConstruct = if (isnil {_logic getvariable "BIS_COIN_onConstruct"}) then {{}} else {_logic getvariable "BIS_COIN_onConstruct"};
_logic setvariable ["BIS_COIN_onConstruct",_onConstruct,true];

//--- Repair code (set empty code to disable this function)
_onRepair = if (isnil {_logic getvariable "BIS_COIN_onRepair"}) then {{}} else {_logic getvariable "BIS_COIN_onRepair"};
_logic setvariable ["BIS_COIN_onRepair",_onRepair,true];

//--- Sell code (set empty code to disable this function)
_onSell = if (isnil {_logic getvariable "BIS_COIN_onSell"}) then {{}} else {_logic getvariable "BIS_COIN_onSell"};
_logic setvariable ["BIS_COIN_onSell",_onSell,true];


//--- Temporary variables
_logic setvariable ["BIS_COIN_params",[],true];
//_logic setvariable ["BIS_COIN_preview",objnull,true];
_logic setvariable ["BIS_COIN_buildings",[],true];
sleep 5.01;
[nil,nil,"per",rSPAWN,[_logic,_varname],{
	scriptname "COIN: Execute FSM";
	_logic = _this select 0;
	_varname = _this select 1;
	_logic setvehiclevarname _varname;
	_name = _logic getvariable "BIS_COIN_name";
	_id = _logic getvariable "BIS_COIN_id";
	_BIS_COIN_idAction = format ["BIS_COIN_action_%1",_id];
		
	BIS_COIN_evalCounter = 0;
	BIS_COIN_evalCounterDefault = 30; //number of frames to skip in all 
	
	_logic setvariable ["BIS_COIN_evalCounter", BIS_COIN_evalCounterDefault];
	
	if (isNil {_logic getVariable 'BIS_COIN_evalCondition'}) then {_logic setVariable ['BIS_COIN_evalCondition', false];};
	/*
	if (isNil {_logic getvariable "BIS_COIN_evalCounterDefault"}) then {BIS_COIN_evalCounterDefault = BIS_COIN_evalCounterDefaultFrames;} 
	else
	{
	BIS_COIN_evalCounterDefault = BIS_COIN_evalCounterDefault + BIS_COIN_evalCounterDefaultFrames; //adding default number of frames for each logic	
	debuglog format ["Log: [COIN]  default evalCounter %1",BIS_COIN_evalCounterDefault];
  };
  */
	
	while {!isnull _logic} do 
	  {
	  private["_player"];
	  _player = player;	  
	    
	  debuglog format ["Log: [COIN]  iter %1",[_logic,player]];
	  debuglog format ["COIN_ACTION_ITER %1",[_logic,player]];
		if (isnil {player getvariable _BIS_COIN_idAction} && !isnull player && alive _logic) then 
		{
		  _player = player;
			debuglog format ["Log: [COIN] Action %1 added to %2",_BIS_COIN_idAction,player];
			_name = _logic getvariable "BIS_COIN_name";
			_description = if (_name == "") then {localize "str_coin_action"} else {localize "str_coin_action" + " - " + _name};
			
						
			_action = player addaction [
				_description,
				"ca\modules\coin\data\scripts\coin_interface.sqf",
				_logic,
				1,
				false,
				false,
				"",
				format ["
					BIS_COIN_evalCounter=%1 getVariable 'BIS_COIN_evalCounter';
								
					if ((BIS_COIN_evalCounter)>0) then {
						%1 setVariable ['BIS_COIN_evalCounter',BIS_COIN_evalCounter-1];
						%1 getVariable 'BIS_COIN_evalCondition'
					} else {
						%1 setVariable ['BIS_COIN_evalCounter',BIS_COIN_evalCounterDefault];
						BIS_COIN_evalCounter = BIS_COIN_evalCounterDefault;
						_player = _target;
						_logic = %1;
						_rules = %1 getvariable 'BIS_COIN_rules';					
					
						_dis = (%1 getvariable 'BIS_COIN_areasize') select 0;
						_lpos = position %1;
						_ppos = position _player;
						_customCondition = %1 getvariable 'BIS_COIN_actionCondition';
						_isCustomCondition = if (_customCondition == 'true') then {true} else {call compile _customCondition};
										
						%1 setVariable ['BIS_COIN_evalCondition',
							player == _player && (_player in _rules || side _player in _rules) && ([_lpos select 0,_lpos select 1] distance [_ppos select 0,_ppos select 1]) < _dis && _isCustomCondition
						];
					
						%1 getVariable 'BIS_COIN_evalCondition'
					};
				",vehiclevarname _logic]
			];
			player setvariable [_BIS_COIN_idAction,_action];
			
			debuglog format ["COIN_ACTION %1 (%2) added to %3",_player getvariable _BIS_COIN_idAction, _BIS_COIN_idAction,_player];
				
		};
		
		//_dis = (_logic getvariable 'BIS_COIN_areasize') select 0; //distance to enable construction action in action menu
		
		debuglog format ["COIN_ACTION %1 ...before waituntil",[_player,_player getVariable _BIS_COIN_idAction,(_player distance _logic), _logic]];		
		waituntil {Sleep 0.1, ((_player != player) && (!isnull player)) || ((_player distance _logic) > 300 + ((_logic getvariable 'BIS_COIN_areasize') select 0)) || (!alive _logic)};
		//action is removed - dead or far
			
		
		debuglog format ["COIN_ACTION %1 (%2) removed from %3",_player getVariable _BIS_COIN_idAction, _BIS_COIN_idAction,_player];		
		_player removeAction (_player getVariable _BIS_COIN_idAction);
	  _player setvariable [_BIS_COIN_idAction, nil];
	  player setvariable [_BIS_COIN_idAction, nil];
		
		
		_dis = (_logic getvariable 'BIS_COIN_areasize') select 0; //distance to enable construction action in action menu
		
		waituntil {Sleep 3, (_player != player && !isnull player) || ((_player distance _logic) < (300 + _dis)) || (!alive _logic)};	//TODO:TESTME: if area of logic can grow much more than +1000 m in mission, direct area get should be used here (or action will be only in inner radius)
		//itearation - action will be added again					
	};

}] call RE;


/*
    	_description = if (_name == '') then {localize 'str_coin_action'} else {localize 'str_coin_action' + ' - ' + _name};
	_action = _player addaction [_description,'ca\modules\coin\data\scripts\coin_interface.sqf',_logic,1,false,false,'',(_logic getVariable 'BIS_COIN_actionCondition')];
*/

	/*
		_fsm = _this execfsm "ca\modules\coin\data\fsms\coin_actionmenu.fsm";
		_fsm setfsmvariable ["logic",_this];
		_this setvariable ["BIS_COIN_fsm",_fsm,true];
	*/