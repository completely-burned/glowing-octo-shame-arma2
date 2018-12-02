if (_this call m_fnc_isUAV) then {
	private["_nearEntities"];
	_nearEntities = (position _this nearEntities 5000);
	{
		if (( side _x getFriend side _this) >= 0.6 ) then {
			private["_grp"];
			_grp = _x;
			{
				if (_this knowsAbout _x > 0) then {
		    	_grp reveal _x;
				};
			} forEach _nearEntities;
		};
	} forEach allGroups;
};
