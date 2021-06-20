private["_key"];
_key = _this select 1;

if(_key in actionKeys "LaunchCM")then{
		vehicle player fire "SmokeLauncher";
};
