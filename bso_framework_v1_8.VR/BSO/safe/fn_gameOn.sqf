/////bmf-v1_8////
Trigger_BSOStart = true; publicVariable "Trigger_BSOStart";
[] remoteExec ["bso_fnc_unsetSafety"];
[1] remoteExec ["setTimeMultiplier", 2];
