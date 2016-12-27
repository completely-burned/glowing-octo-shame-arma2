private["_startTime"];
_startTime = missionNamespace getVariable "StartTime";
if (_startTime != -1) then
{
	//Random starting time.
	if (_startTime == 100) then
	{
		m_SkipTime = Random 24;
	}
	else
	{
		m_SkipTime = (_startTime - daytime);
	};
};

publicVariable "m_SkipTime";

SkipTime m_SkipTime;
