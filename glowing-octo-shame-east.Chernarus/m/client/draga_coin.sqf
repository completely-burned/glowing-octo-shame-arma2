private["_objOld","_obj","_Objects","_coin"];
_objOld = objNull;
_obj = objNull;
while{true}do{
	_Objects = (nearestObjects [vehicle player, listMHQ + HQ + ["Base_WarfareBBarracks","Base_WarfareBLightFactory"], 150]);
	_coin = false;
	if ((count _Objects > 0)) then {
		ScopeName "_coin";
		{
			if (alive _x) then {
				_obj = _x;
				_coin = true;
				BreakTo "_coin";
			};
		} forEach _Objects;
	};
	if(!(_coin) or (_obj != _objOld))then{
		player removeAction (player getVariable "_coin");
		player setvariable ["_coin", nil];
	};
	if (_coin) then {
		if (isnil {player getvariable "_coin"} && !isnull player) then {
			_objOld = _obj;
			private ["_type"];
			_type = typeOf _obj;

			if(faction player in ["BIS_US", "BIS_CZ", "BIS_GER"] or playerSide == west)then{
				_obj setvariable ["BIS_COIN_items",
					[
						["WarfareBMGNest_M240_US_EP1","Defence",0],
						["M2StaticMG_US_EP1","Defence",0],
						["M2HD_mini_TriPod_US_EP1","Defence",0],
						["MK19_TriPod_US_EP1","Defence",0],
						["Stinger_Pod_US_EP1","Defence",0],
						["TOW_TriPod_US_EP1","Defence",0],
						["M119_US_EP1","Defence",0],
						["M252_US_EP1","Defence",0],
						["SearchLight_US_EP1","Defence",0],
						//
						// ["M1130_HQ_unfolded_Base_EP1","Base",0],
						["US_WarfareBBarracks_EP1","Base",0],
						["US_WarfareBLightFactory_EP1","Base",0],
						["US_WarfareBHeavyFactory_EP1","Base",0],
						["US_WarfareBAircraftFactory_EP1","Base",0],
						["US_WarfareBAntiAirRadar_EP1","Base",0],
						["US_WarfareBArtilleryRadar_EP1","Base",0],
						["US_WarfareBUAVterminal_EP1","Base",0],
						["US_WarfareBVehicleServicePoint_EP1","Base",0],
						["US_WarfareBFieldhHospital_EP1","Base",0]
						// ["WarfareBAirport","Base",0]
					]
				];
				_obj setvariable ["BIS_COIN_rules",[west]];
			};
			if(faction player in ["USMC"])then{
				_obj setvariable ["BIS_COIN_items",
					[
						["USMC_WarfareBMGNest_M240","Defence",0],
						["M2StaticMG","Defence",0],
						["M2HD_mini_TriPod","Defence",0],
						["MK19_TriPod","Defence",0],
						["Stinger_Pod","Defence",0],
						["TOW_TriPod","Defence",0],
						["M119","Defence",0],
						["M252","Defence",0],
						["SearchLight","Defence",0],
						//
						// ["LAV25_HQ_unfolded","Base",0],
						["USMC_WarfareBBarracks","Base",0],
						["USMC_WarfareBLightFactory","Base",0],
						["USMC_WarfareBHeavyFactory","Base",0],
						["USMC_WarfareBAircraftFactory","Base",0],
						["USMC_WarfareBAntiAirRadar","Base",0],
						["USMC_WarfareBArtilleryRadar","Base",0],
						["USMC_WarfareBUAVterminal","Base",0],
						["USMC_WarfareBVehicleServicePoint","Base",0],
						["USMC_WarfareBFieldhHospital","Base",0]
						// ["WarfareBAirport","Base",0]
					]
				];
				_obj setvariable ["BIS_COIN_rules",[west]];
			};
			if(faction player in ["CDF"])then{
				_obj setvariable ["BIS_COIN_items",
					[
						["CDF_WarfareBMGNest_PK","Defence",0],
						["DSHKM_CDF","Defence",0],
						["DSHkM_Mini_TriPod_CDF","Defence",0],
						["AGS_CDF","Defence",0],
						["ZU23_CDF","Defence",0],
						["SPG9_CDF","Defence",0],
						["D30_CDF","Defence",0],
						["2b14_82mm_CDF","Defence",0],
						["SearchLight_CDF","Defence",0],
						//
						// ["BMP2_HQ_CDF_unfolded","Base",0],
						["CDF_WarfareBBarracks","Base",0],
						["CDF_WarfareBLightFactory","Base",0],
						["CDF_WarfareBHeavyFactory","Base",0],
						["CDF_WarfareBAircraftFactory","Base",0],
						["CDF_WarfareBAntiAirRadar","Base",0],
						["CDF_WarfareBArtilleryRadar","Base",0],
						["CDF_WarfareBUAVterminal","Base",0],
						["CDF_WarfareBVehicleServicePoint","Base",0],
						["CDF_WarfareBFieldhHospital","Base",0]
						// ["WarfareBAirport","Base",0]
					]
				];
				_obj setvariable ["BIS_COIN_rules",[west]];
			};

			if(faction player in ["BIS_TK", "BIS_TK_INS"] or playerSide == east)then{
				_obj setvariable ["BIS_COIN_items",
					[
						["WarfareBMGNest_PK_TK_EP1","Defence",0],
						["KORD_high_TK_EP1","Defence",0],
						["KORD_TK_EP1","Defence",0],
						["AGS_TK_EP1","Defence",0],
						["ZU23_TK_EP1","Defence",0],
						["Igla_AA_pod_TK_EP1","Defence",0],
						["Metis_TK_EP1","Defence",0],
						["D30_TK_EP1","Defence",0],
						["2b14_82mm_TK_EP1","Defence",0],
						["SearchLight_TK_EP1","Defence",0],
						//
						// ["BMP2_HQ_TK_unfolded_Base_EP1","Base",0],
						["TK_WarfareBBarracks_EP1","Base",0],
						["TK_WarfareBLightFactory_EP1","Base",0],
						["TK_WarfareBHeavyFactory_EP1","Base",0],
						["TK_WarfareBAircraftFactory_EP1","Base",0],
						["TK_WarfareBAntiAirRadar_EP1","Base",0],
						["TK_WarfareBArtilleryRadar_EP1","Base",0],
						["TK_WarfareBUAVterminal_EP1","Base",0],
						["TK_WarfareBVehicleServicePoint_EP1","Base",0],
						["TK_WarfareBFieldhHospital_EP1","Base",0]
						// ["WarfareBAirport","Base",0]
					]
				];
				_obj setvariable ["BIS_COIN_rules",[east]];
			};
			if(faction player in ["RU"])then{
				_obj setvariable ["BIS_COIN_items",
					[
						["RU_WarfareBMGNest_PK","Defence",0],
						["KORD_high","Defence",0],
						["KORD","Defence",0],
						["AGS_RU","Defence",0],
						["Igla_AA_pod_East","Defence",0],
						["ZU23_Ins","Defence",0],
						["Metis","Defence",0],
						["D30_RU","Defence",0],
						["2b14_82mm","Defence",0],
						["SearchLight_RUS","Defence",0],
						//
						// ["BTR90_HQ_unfolded","Base",0],
						["RU_WarfareBBarracks","Base",0],
						["RU_WarfareBLightFactory","Base",0],
						["RU_WarfareBHeavyFactory","Base",0],
						["RU_WarfareBAircraftFactory","Base",0],
						["RU_WarfareBAntiAirRadar","Base",0],
						["RU_WarfareBArtilleryRadar","Base",0],
						["RU_WarfareBUAVterminal","Base",0],
						["RU_WarfareBVehicleServicePoint","Base",0],
						["RU_WarfareBFieldhHospital","Base",0]
						// ["WarfareBAirport","Base",0]
					]
				];
				_obj setvariable ["BIS_COIN_rules",[east]];
			};
			if(faction player in ["INS"])then{
				_obj setvariable ["BIS_COIN_items",
					[
						["Ins_WarfareBMGNest_PK","Defence",0],
						["DSHKM_Ins","Defence",0],
						["DSHkM_Mini_TriPod","Defence",0],
						["AGS_Ins","Defence",0],
						["ZU23_Ins","Defence",0],
						["SPG9_Ins","Defence",0],
						["D30_Ins","Defence",0],
						["2b14_82mm_INS","Defence",0],
						["SearchLight_INS","Defence",0],
						//
						// ["BMP2_HQ_INS_unfolded","Base",0],
						["Ins_WarfareBBarracks","Base",0],
						["Ins_WarfareBLightFactory","Base",0],
						["Ins_WarfareBHeavyFactory","Base",0],
						["Ins_WarfareBAircraftFactory","Base",0],
						["Ins_WarfareBAntiAirRadar","Base",0],
						["Ins_WarfareBArtilleryRadar","Base",0],
						["Ins_WarfareBUAVterminal","Base",0],
						["Ins_WarfareBVehicleServicePoint","Base",0],
						["Ins_WarfareBFieldhHospital","Base",0]
						// ["WarfareBAirport","Base",0]
					]
				];
				_obj setvariable ["BIS_COIN_rules",[east]];
			};

			if(faction player in ["BIS_TK_GUE", "BIS_UN"] or playerSide == resistance)then{
				_obj setvariable ["BIS_COIN_items",
					[
						["WarfareBMGNest_PK_TK_GUE_EP1","Defence",0],
						["DSHKM_TK_GUE_EP1","Defence",0],
						["DSHkM_Mini_TriPod_TK_GUE_EP1","Defence",0],
						["AGS_TK_GUE_EP1","Defence",0],
						["ZU23_TK_GUE_EP1","Defence",0],
						["SPG9_TK_GUE_EP1","Defence",0],
						["D30_TK_GUE_EP1","Defence",0],
						["2b14_82mm_TK_GUE_EP1","Defence",0],
						["SearchLight_TK_GUE_EP1","Defence",0],
						//
						// ["BRDM2_HQ_TK_GUE_unfolded_Base_EP1","Base",0],
						["TK_GUE_WarfareBBarracks_EP1","Base",0],
						["TK_GUE_WarfareBLightFactory_EP1","Base",0],
						["TK_GUE_WarfareBHeavyFactory_EP1","Base",0],
						["TK_GUE_WarfareBAircraftFactory_EP1","Base",0],
						["TK_GUE_WarfareBAntiAirRadar_EP1","Base",0],
						["TK_GUE_WarfareBArtilleryRadar_EP1","Base",0],
						["TK_GUE_WarfareBUAVterminal_EP1","Base",0],
						["TK_GUE_WarfareBVehicleServicePoint_EP1","Base",0],
						["TK_GUE_WarfareBFieldhHospital_EP1","Base",0]
						// ["WarfareBAirport","Base",0]
					]
				];
				_obj setvariable ["BIS_COIN_rules",[resistance]];
			};
			if(faction player in ["GUE"])then{
				_obj setvariable ["BIS_COIN_items",
					[
						["GUE_WarfareBMGNest_PK","Defence",0],
						["DSHKM_Gue","Defence",0],
						["ZU23_Gue","Defence",0],
						["SPG9_Gue","Defence",0],
						["2b14_82mm_GUE","Defence",0],
						["SearchLight_Gue","Defence",0],
						//
						// ["BRDM2_HQ_Gue_unfolded","Base",0],
						["Gue_WarfareBBarracks","Base",0],
						["Gue_WarfareBLightFactory","Base",0],
						["Gue_WarfareBHeavyFactory","Base",0],
						["Gue_WarfareBAircraftFactory","Base",0],
						["Gue_WarfareBAntiAirRadar","Base",0],
						["Gue_WarfareBArtilleryRadar","Base",0],
						["Gue_WarfareBUAVterminal","Base",0],
						["Gue_WarfareBVehicleServicePoint","Base",0],
						["Gue_WarfareBFieldhHospital","Base",0]
						// ["WarfareBAirport","Base",0]
					]
				];
				_obj setvariable ["BIS_COIN_rules",[resistance]];
			};

			_obj setvariable ["BIS_COIN_categories",["Base","Defence"]];
			_obj setvariable ["BIS_COIN_funds",["1000000","1000000"]];


			BIS_coin_lastID = 0;
			BIS_coin_0 = _obj;
			_obj setvehiclevarname "BIS_coin_0";
			_obj setvariable ["BIS_COIN_ID",BIS_coin_lastID];

			_name = if (isnil {_obj getvariable "BIS_COIN_name"}) then {""} else {_obj getvariable "BIS_COIN_name"};
			_obj setvariable ["BIS_COIN_name",_name];
			_rules = if (isnil {_obj getvariable "BIS_COIN_rules"}) then {synchronizedObjects _obj} else {(_obj getvariable "BIS_COIN_rules") + synchronizedObjects _obj};
			if (typename _rules != "ARRAY") then {_rules = [_rules]};
			_obj setvariable ["BIS_COIN_rules",_rules];
			_categories = if (isnil {_obj getvariable "BIS_COIN_categories"}) then {[]} else {_obj getvariable "BIS_COIN_categories"};
			_obj setvariable ["BIS_COIN_categories",_categories];
			_items = if (isnil {_obj getvariable "BIS_COIN_items"}) then {[]} else {_obj getvariable "BIS_COIN_items"};
			_obj setvariable ["BIS_COIN_items",_items];
			_funds = if (isnil {_obj getvariable "BIS_COIN_funds"}) then {["0"]} else {_obj getvariable "BIS_COIN_funds"};
			if (typename _funds == "STRING") then {_funds = [_funds]};
			_obj setvariable ["BIS_COIN_funds",_funds];
			_fundsDescription = if (isnil {_obj getvariable "BIS_COIN_fundsDescription"}) then {["$"]} else {_obj getvariable "BIS_COIN_fundsDescription"};
			if (typename _fundsDescription == "STRING") then {_fundsDescription = [_fundsDescription]};
			_obj setvariable ["BIS_COIN_fundsDescription",_fundsDescription];
			_areasize = if (isnil {_obj getvariable "BIS_COIN_areasize"}) then {[150,150]} else {_obj getvariable "BIS_COIN_areasize"};
			_obj setvariable ["BIS_COIN_areasize",_areasize];
			_actionCondition = if (isnil {_obj getvariable "BIS_COIN_actionCondition"}) then {"true"} else {_obj getvariable "BIS_COIN_actionCondition"};
			_obj setvariable ["BIS_COIN_actionCondition",_actionCondition];
			_onStart = if (isnil {_obj getvariable "BIS_COIN_onStart"}) then {{}} else {_obj getvariable "BIS_COIN_onStart"};
			_obj setvariable ["BIS_COIN_onStart",_onStart];
			_onSelect = if (isnil {_obj getvariable "BIS_COIN_onSelect"}) then {{}} else {_obj getvariable "BIS_COIN_onSelect"};
			_obj setvariable ["BIS_COIN_onSelect",_onSelect];
			_onPurchase = if (isnil {_obj getvariable "BIS_COIN_onPurchase"}) then {{}} else {_obj getvariable "BIS_COIN_onPurchase"};
			_obj setvariable ["BIS_COIN_onPurchase",_onPurchase];
			_onConstruct = if (isnil {_obj getvariable "BIS_COIN_onConstruct"}) then {{}} else {_obj getvariable "BIS_COIN_onConstruct"};
			_obj setvariable ["BIS_COIN_onConstruct",_onConstruct];
			_onRepair = if (isnil {_obj getvariable "BIS_COIN_onRepair"}) then {{}} else {_obj getvariable "BIS_COIN_onRepair"};
			_obj setvariable ["BIS_COIN_onRepair",_onRepair];
			_onSell = if (isnil {_obj getvariable "BIS_COIN_onSell"}) then {{}} else {_obj getvariable "BIS_COIN_onSell"};
			_obj setvariable ["BIS_COIN_onSell",_onSell];
			_obj setvariable ["BIS_COIN_params",[]];
			_obj setvariable ["BIS_COIN_buildings",[]];


			BIS_COIN_evalCounter = 0;
			BIS_COIN_evalCounterDefault = 30;

			_obj setvariable ["BIS_COIN_evalCounter", BIS_COIN_evalCounterDefault];
			if (isNil {_obj getVariable 'BIS_COIN_evalCondition'}) then {_obj setVariable ['BIS_COIN_evalCondition', false];};

			private ["_action"];
			_action = player addaction [
				localize "str_coin_action" + " - " + gettext(configFile >> "CfgVehicles" >> _type >> "displayName"),
				"ca\modules\coin\data\scripts\coin_interface.sqf",
				_obj,
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
				",vehiclevarname _obj]
			];
			player setvariable ["_coin",_action];
		};
	};
	sleep 1;
};
