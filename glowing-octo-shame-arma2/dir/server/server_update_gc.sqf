private ["_count_m_GC_queue"];
_count_m_GC_queue = ( count m_GC_queue );
for "_i" from 0 to (_count_m_GC_queue - 1) do {
	sleep 0.01;
	private ["_entry", "_time"];
	_entry = (m_GC_queue select _i);
	_time = (_entry select 1);
	if (_time <= time) then {
		private ["_object"];
		_object = (_entry select 0);
		if !(isNull _object)then{
			switch (typeName _object) do {
				case ("OBJECT"):
				{
					if !([_object, 750 - (_count_m_GC_queue * 10)] call gosa_fnc_CheckPlayersDistance)then{
						deleteVehicle _object;
						m_GC_queue set [_i, -1];
					};
				};
				case ("GROUP"):
				{
					if (({alive _x} count (units _object)) == 0) then {
						deleteGroup _object;
						m_GC_queue set [_i, -1];
					};
				};
				default {m_GC_queue set [_i, -1]};
			};
		};
	};
};
m_GC_queue = (m_GC_queue - [-1]);
