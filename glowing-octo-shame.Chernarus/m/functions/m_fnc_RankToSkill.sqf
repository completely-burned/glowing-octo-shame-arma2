{
	// _x setUnitAbility ((rankid _x) / 6 * 0.8 + 0.2); 			// 0.Private = 0.2, 6.Colonel = 1, 3.Lieutenant = 0.6
	_x setUnitAbility ((rankid _x) / 6 * 0.4 + 0.4 + 0.2); 	// 0.Private = 0.6, 6.Colonel = 1, 3.Lieutenant = 0.8

	// _x setSkill ((rankid _x) / 6 * 0.5 + 0.5); 					// 0.Private = 0.5, 6.Colonel = 1, 3.Lieutenant = 0.75
} foreach _this;
