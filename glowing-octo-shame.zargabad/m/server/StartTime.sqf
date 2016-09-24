private["_startTime"];
_startTime = missionNamespace getVariable "StartTime";
if (_startTime != -1) then
{
	//Random starting time.
	if (_startTime == 100) then
	{
		SkipTime Random 24;
	}
	else
	{
		SkipTime (_startTime - daytime);
	};
};
