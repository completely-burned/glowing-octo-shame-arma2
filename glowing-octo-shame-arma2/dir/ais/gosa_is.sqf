// scriptName "AIS\data\scripts\IS.sqf";
/*
Alternative Injury Simulation init - executed on all clients, parameter is group associated with AIS logic
*/



//BIS_DEBUG_AIS = "Yes"; //comment out to disable debug


// waitUntil {!isNil "BIS_MPF_JIPwaitFor"};
// [] call BIS_MPF_JIPwaitFor; //Waiting for synchronization (MP Framework must be loaded before);


//textLogFormat["AIS_ IS.sqf start %1",_this];

//if (!isNil "BIS_DEBUG_AIS") then
//{
//	textLogFormat["AIS- IS.sqf start %1",_this];
//};

// if (isNil "_this") exitWith{};

// private["_group"];
// _group = _this select 0;

//defined in all 3 modules (IS, FA, BC)
BIS_AIS_path = "\ca\Modules\AIS\";  //"//path for Injury system
BIS_FA_path = "\ca\Modules\FA\";  //"//path for First-Aid
BIS_BC_path = "\ca\Modules\BC\";  //"//path for Battlefield Clearance

BIS_PATH_SQF = "data\scripts\";
BIS_PATH_FSM = "data\fsms\";



BIS_IS_agonyDam = 0.6; //is set to all (see below) - if lower, no agony, if higher, soldier stays in agony

BIS_IS_initDamVars = compile
"
	(_this select 0) setVariable ['',0,true];
	(_this select 0) setVariable ['head_hit',0,true];
	(_this select 0) setVariable ['hands',0,true];
	(_this select 0) setVariable ['body',0,true];
	(_this select 0) setVariable ['legs',0,true];
	(_this select 0) setVariable ['bloodloss',0,true];
	(_this select 0) setVariable ['bloodlossPerSecond',0,true];
	(_this select 0) setVariable ['BIS_IS_inAgony',false,true];

";

//Used to set dir of healer (tied with healplaces (esp. healPlace0 below))
//BIS_FA_healInjuredModelChestPosition = [0,-0.2,0];

//BIS_FA_healInjuredModelChestPosition = [0,-0.08,0];
BIS_FA_healInjuredModelChestPosition = [0,+0.08,0];

//Used to setPos healer (tied with BIS_FA_healInjuredModelChestPosition)
//BIS_FA_healPlace0 = [-0.75,-0.05,0]; //to this relative (to injured) position healer is moved
//180- BIS_FA_healPlace0 = [-0.75,-0.15,0];
//180- BIS_FA_healPlace1 = [0.75,-0.1,0];

BIS_FA_healPlace0 = [0.75,0.15,0];
BIS_FA_healPlace1 = [-0.75,0.1,0];

BIS_FA_healPlace0who = objNull;
BIS_FA_healPlace1who = objNull;

//BIS_FA_healDist = 1.4; //to enable first-aid
BIS_FA_healDist = 2.5;

//BIS_FA_healingEfficiency = 5.0; //how good are ppl in first-aiding (0.1 means it takes 10 times longer to revive)
BIS_FA_healingEfficiency = 1.0; //how good are ppl in first-aiding (0.1 means it takes 10 times longer to revive)
BIS_FA_healingEfficiencyMedic = 1.5; //how good are medics (corpsmen) in first-aiding

BIS_AIS_bodyParts = ["", "body", "head_hit", "hands", "legs"]; //parts of body - used by setHit (dam | heal), for storing variables to injured (TODO)

BIS_FA_healInjuredModelHeadPosition = [-0.10,-0.35,0]; //position where injured is being held (shoulder) - in given animation (last coord may be 0?)
BIS_FA_healInjuredModelMiddlePosition = [0,0.2,0];
BIS_FA_healInjuredModelLegPosition = [0,0.75,0]; //for First-Aid action (distance 1+- meter from legs)

BIS_FA_healCondition =
format ["
	(_this!=_target)
	&&
		(
		(((_target modelToWorld BIS_FA_healInjuredModelHeadPosition) distance (_this)) < %1)
		||
		(((_target modelToWorld BIS_FA_healInjuredModelLegPosition) distance (_this)) < %1)
		||
		(((_target modelToWorld BIS_FA_healInjuredModelMiddlePosition) distance (_this)) < %1)
		)
	&& (_target getVariable ""BIS_IS_inAgony"")
	&& (if (isNil {_this getVariable ""BIS_IS_inAgony""}) then {true} else {(not (_this getVariable ""BIS_IS_inAgony""))})
	&& (if (isNil {_this getVariable ""BIS_BC_dragger""}) then {true} else {(not (_this getVariable ""BIS_BC_dragger""))})
	&& (if (isNil {_this getVariable ""BIS_BC_carrier""}) then {true} else {(not (_this getVariable ""BIS_BC_carrier""))})
	&& (alive _target)
	&& (if (isNil {_this getVariable ""BIS_FA_healEnabled""}) then {true} else {((_this getVariable ""BIS_FA_healEnabled""))}
	)
",BIS_FA_healDist];

//textLogFormat["AIS_START agony start GROUP: %1", _group];

if (!isDedicated) then {
	[] spawn {

		while {true} do {

			{

				if (isNil {_x getVariable "BIS_IS_agonyHandle"}) then {

					if (_x isKindOf "Man") then {
						if (local _x) then {

							//Injury system initialization
							//handled separately //variables accumulating damage
							_x setVariable ["head_hit",0,true];
							_x setVariable ["body",0,true];
							_x setVariable ["hands",0,true];
							_x setVariable ["legs",0,true];
							_x setVariable ["bloodlossPerSecond",0,true];
							_x setVariable ["bloodloss",0,true]; //blood loss in liters, 3+ is fatal
							_x setVariable ["",0,true]; //empty name variable works - accumulates structural dammage

							// if (!isNil "BIS_DEBUG_AIS") then {_x setVariable ["",5,true];};

							_x setVariable ["BIS_IS_agonyDam",BIS_IS_agonyDam,true]; //_x will be in agony if it has damage of BIS_FA_agonyDam or more
							_x setVariable ["BIS_IS_inAgony",false,true]; //not in agony at start

							// private["_nic"];


							// if (!isNil "BIS_DEBUG_AIS") then {textLogFormat["AIS_START %1 agony start %1", _x];};

							_x setVariable ["BIS_FA_healer",false,true];	//_x is first-aiding somebody
							_x setVariable ["BIS_FA_healEnabled",true,true]; //option to heal - gives action, prevents fast healer.sqf reexecute (see end of healer.sqf)
							_x setVariable ["BIS_FA_canHealTo",0.5,true]; //First-Aid given by _x will heal injured to no less than 0.5 damage //see at what damage agony ends

						}; //local

						// textLogFormat["AIS_START agony start %1", _x];

						private ["_agonyHandle"];
						_agonyHandle = [_x] execFSM BIS_AIS_path + "data\fsms\agony.fsm"; //Behavior of injured, "handleDamage" EH  //diagnostika:	//diag_debugFSM _nic;
						_x setVariable ["BIS_IS_agonyHandle", _agonyHandle, false]; //local!

						_x addEventHandler ["killed", "[_this select 0] call BIS_IS_initDamVars;"]; //switches AIS health variables to 0 (prevent Agony.fsm going to Agony state)

						if (true) then {
							_nic = [_x] execVM BIS_FA_Path + BIS_PATH_SQF + "FA_addActions.sqf"; //on this client add F-A actions for _x   //TODO: works when locality is changed?
						};

					}; //kind of man

					//variables needed in FA from other modules
					if (isNil {_x getVariable "BIS_BC_carrier"}) then {_x setVariable ["BIS_BC_carrier",false];};
					if (isNil {_x getVariable "BIS_BC_dragger"}) then {_x setVariable ["BIS_BC_dragger",false];};
					if (isNil {_x getVariable "BIS_IS_inAgony"}) then {_x setVariable ["BIS_IS_inAgony",false];};

				};
			} forEach units player;

			sleep 5;

		};
	};
}else{
	[] spawn {
		private["_gosa_FA_addActions"];
		while {true} do {
			{
				if (_x isKindOf "Man") then {
					_gosa_FA_addActions = _x getVariable "gosa_FA_addActions";
					if (isNil {_gosa_FA_addActions}) then {
						_gosa_FA_addActions = [_x] execVM BIS_FA_Path + BIS_PATH_SQF + "FA_addActions.sqf";
						_x setVariable ["gosa_FA_addActions", [_gosa_FA_addActions,_x]];
					}else{
						if (_gosa_FA_addActions select 1 != _x) then {
							_gosa_FA_addActions = [_x] execVM BIS_FA_Path + BIS_PATH_SQF + "FA_addActions.sqf";
							_x setVariable ["gosa_FA_addActions", [_gosa_FA_addActions,_x]];
						};
					};
				};
			} forEach playableUnits;
			sleep 5;
		};
	};
};


if (!isDedicated) then
{
	if (isNil {BIS_AIS_ppEFFECTSinit}) then
	{
		BIS_AIS_ppEFFECTSinit = "done";



	/*
		Post process effects - repeat until created (cannot create 2 pp effs with same priority NOW)
	*/

	private["_priorityRadial","_priorityCorrections"];
	_priorityRadial = 170; //priority also given by wanted order of pp effects
	_priorityCorrections = 1580;

	while {isNil {BIS_AIS_PP}} do
	{
		BIS_AIS_PP = ppEffectCreate  [["radialBlur", _priorityRadial], ["colorCorrections", _priorityCorrections]];
		_priorityRadial = _priorityRadial + 1;
		_priorityCorrections = _priorityCorrections + 1;
	};

	BIS_AIS_PPh0 =   BIS_AIS_PP  select 0;
	BIS_AIS_PPh1 =   BIS_AIS_PP  select 1;

	//textLogFormat["AIS_ AIS_EFFECT radial: BIS_AIS_PPh0 + corr %1", [BIS_AIS_PPh0,BIS_AIS_PPh1]];

	BIS_AIS_PP_switchFunc =
	{
		_bool = _this select 0;
		//BIS_AIS_PPh0 ppEffectEnable false;
		//BIS_AIS_PPh1 ppEffectEnable false;
		{
		_x ppEffectEnable _bool;
		} forEach BIS_AIS_PP;

		 //textLogFormat["AIS_ effects switched: %1", [player, _bool]];
	};


	[player,BIS_AIS_PP_switchFunc] spawn
	{//disable and enable effects for player - depending on agony state of player, only one instance runs on one client
		private ["_function", "_who"];
		_who = _this select 0;
		_function = _this select 1;
		if (!isNil {BIS_AIS_ppEff_switchSpawn}) exitWith {};
		BIS_AIS_ppEff_switchSpawn = "defined";

		//textLogFormat["AIS_ effects switch spawn: %1 func: %2", _who, _function];

		while {true} do
		{
			//TODO: ? dead check

			waitUntil {Sleep 0.05; player getVariable "BIS_IS_inAgony"};
			[true] call _function; //enable effects

			waitUntil {Sleep 0.05;if (isNil {player getVariable "BIS_IS_inAgony"}) then {player setVariable ["BIS_IS_inAgony", false];}; !(player getVariable "BIS_IS_inAgony")};
			[false] call _function;     //disable effects
		};
	};


	};
}
else
{
	BIS_AIS_PP_switchFunc = {};
};
