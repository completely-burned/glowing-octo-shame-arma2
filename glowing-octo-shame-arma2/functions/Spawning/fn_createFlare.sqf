/*
 * TODO: Звук запуска ракеты.
*/

private ["_windX","_windZ","_velocity","_arr","_str"];

_arr = _this select 0;
_str = _this select 1;

_windX = wind select 0;
_windZ = wind select 1;
#ifdef __ARMA3__
	if (_windX isEqualTo 0) then {_windX = random [-0.5, 0.1, 0.5];};
#else
	// FIXME: a2oa увеличивает высоту в 2 раза.
	_arr set [2, (_arr select 2)/2];
#endif
_velocity = [_windX, _windZ, 30];

/*
private _sound = "SN_Flare_Fired_4";
private _soundSourceClass = "SoundFlareLoop_F";
private _minDist = _options getOrDefault [QUOTE(PARAM_NAME(mindist)), 300];
*/

// Spawn the flare projectile
_obj = createVehicle [_str, _arr, [], 0, "FLY"];
	//_projectile setPos _pos;
	_obj setVelocity _velocity;
	diag_log format["Log: [fn_createFlare] Flare created %1", [_arr, _str, _obj]];

/*
// Play the flare sound lighting up
[[_projectile,_sound,"say3D"],"bis_fnc_sayMessage"] call bis_fnc_mp;
// Create sound source of burning sound and attach to projectile
private _soundSource = createSoundSource [_soundSourceClass, _pos, [], 0];
_soundSource attachTo [_projectile, [0, 0, 0]];
// Trigger is used as a data structure as we cannot store variables in projectiles and sound sources
private _trigger = createTrigger ["EmptyDetector", _pos];
_trigger attachTo [_projectile, [0, 0, 0]];
_trigger setVariable [QUOTE(PARAM_NAME(soundSource)), _soundSource];
_trigger setVariable [QUOTE(PARAM_NAME(projectile)), _projectile];
*/

_obj;
