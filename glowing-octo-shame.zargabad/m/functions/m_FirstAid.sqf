private["_unit"];
_unit = _this;
if (_unit getvariable "BIS_lifestate" == "ALIVE") then {
	if (lifestate _unit == "UNCONSCIOUS" or captive _unit) then {
		_unit playactionnow "agonyStop";
		_unit setvariable ["BIS_lifeState","ALIVE",true];
		_unit setUnconscious false;
		_unit setcaptive false;
	};
};

private["_aliveAnimationState"];
_aliveAnimationState = ["aidlpercmstpsraswrfldnon_idlesteady02","amovpercmstpsraswrfldnon","aidlpercmstpsraswrfldnon","amovpercmstpslowwrfldnon","aidlpercmstpslowwrfldnon_player_0s","amovpercmstpslowwrfldnon_turnl","amovpercmstpslowwrfldnon_turnr","amovpercmstpslowwrfldnon_amovpknlmstpslowwrfldnon","amovpknlmstpslowwrfldnon","aidlpknlmstpslowwrfldnon_player_0s","aidlpknlmstpslowwrfldnon_player_idlesteady02","amovpknlmstpslowwrfldnon_turnl","amovpknlmstpslowwrfldnon_turnr","amovpknlmstpslowwrfldnon_amovpknlmstpsraswrfldnon","amovpknlmstpsraswrfldnon","amovpknlmstpsraswrfldnon_turnl","amovpknlmstpsraswrfldnon_turnr","amovpknlmstpsraswrfldnon_amovpercmstpsraswrfldnon","amovpercmstpsraswrfldnon_turnl","amovpercmstpsraswrfldnon_turnr","aidlpercmstpsraswrfldnon_aiming0s","amovpercmstpsraswrfldnon_amovpknlmstpsraswrfldnon","amovpknlmwlksraswrfldb","amovpknlmwlksraswrfldl","amovpknlmstpsraswrfldnon_amovppnemstpsraswrfldnon","amovppnemstpsraswrfldnon","amovppnemstpsraswrfldnon_amovpknlmstpsraswrfldnon","aidlpercmstpsraswrfldnon_idlesteady04","aidlpknlmstpslowwrfldnon_player_idlesteady01","amovpknlmstpslowwrfldnon_amovppnemstpsraswrfldnon","amovppnemstpsraswrfldnon_amovpercmstpsraswrfldnon","aidlpercmstpsraswrfldnon_aiming02","amovpercmstpsraswrfldnon_amovppnemstpsraswrfldnon","amovpercmstpslowwrfldnon_amovppnemstpsraswrfldnon","amovppnemstpsraswrfldnon_turnl","amovppnemstpsraswrfldnon_turnr","amovppnemrunslowwrfldb","amovppnemsprslowwrfldb","amovppnemrunslowwrfldr","amovppnemsprslowwrfldr","amovppnemsprslowwrfldfr","amovppnemsprslowwrfldf","amovppnemsprslowwrfldfl","amovppnemsprslowwrfldl","amovppnemsprslowwrfldbl","amovppnemsprslowwrfldbr","amovpknlmwlksraswrfldr","amovpknlmrunsraswrfldr","amovpknlmrunsraswrfldfr","amovpknlmrunsraswrfldf","amovpknlmrunsraswrfldfl","amovpknlmrunsraswrfldl","amovpknlmrunsraswrfldbl","amovpknlmrunsraswrfldb","amovpknlmrunsraswrfldbr","aidlpknlmstpslowwrfldnon_i01","amovpknlmwlkslowwrfldr","amovpknlmrunslowwrfldr","amovpknlmrunslowwrfldfr","amovpknlmrunslowwrfldf","amovpknlmrunslowwrfldfl","amovpknlmrunslowwrfldl","amovpknlmrunslowwrfldbl","amovpknlmrunslowwrfldb","amovpknlmrunslowwrfldbr","amovpknlmstpslowwrfldnon_amovpercmstpslowwrfldnon","amovpercmwlkslowwrfldf","amovpercmrunslowwrfldf","amovpercmrunslowwrfldfl","amovpercmrunslowwrfldl","amovpercmrunslowwrfldbl","amovpercmrunslowwrfldb","amovpercmrunslowwrfldbr","amovpercmrunslowwrfldr","amovpercmrunslowwrfldfr","amovpercmstpslowwrfldnon_amovpercmstpsraswrfldnon","aidlpercmstpsraswrfldnon_idlesteady03","amovpercmwlksraswrfldf","amovpercmrunsraswrfldf","amovpercmrunsraswrfldfl","amovpercmrunsraswrfldl","amovpercmrunsraswrfldbl","amovpercmrunsraswrfldb","amovpercmrunsraswrfldbr","amovpercmrunsraswrfldr","amovpercmrunsraswrfldfr","amovpercmevasraswrfldf","amovpercmevasraswrfldfl","amovpercmevasraswrfldfr","amovpercmsprslowwrfldf_amovppnemstpsraswrfldnon","amovpercmsprslowwrfldf_amovppnemstpsraswrfldnon_2","amovpercmrunslowwrfldf_amovppnemstpsraswrfldnon","aidlpercmstpsraswrfldnon_aiming01","amovppnemrunslowwrfldf","amovppnemstpsraswrfldnon_amovpercmsprslowwrfldf","amovppnemstpsraswrfldnon_amovpercmsprslowwrfldf_2","aidlpercmstpsraswrfldnon_idlesteady01","amovpknlmstpsraswrfldnon_amovpknlmrunslowwrfldf","amovpercmstpsraswrfldnon_ainvpknlmstpslaywrfldnon","ainvpknlmstpslaywrfldnon","ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic","ainvpknlmstpsnonwrfldnon_medic","ainvpknlmstpsnonwrfldnon_medic0s","ainvpknlmstpsnonwrfldnon_medic1","ainvpknlmstpsnonwrfldnon_medic0","ainvpknlmstpsnonwrfldnon_medic3","ainvpknlmstpsnonwrfldnon_medic2","ainvpknlmstpsnonwrfldnon_medicend"];
if (_unit getvariable "BIS_lifestate" == "UNCONSCIOUS") then {
	if (local _unit) then {
		if (lifestate _unit == "ALIVE" or !(captive _unit) or tolower animationState _unit in _aliveAnimationState) then {
			moveOut _unit;
			_unit playactionnow "agonyStart";
			_unit setUnconscious true;
			_unit setcaptive true;
		};		
	};		
};
