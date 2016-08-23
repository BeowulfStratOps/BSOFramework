/////bmf-v1_03////
////// ====	Taskmaster
execVM "mission\briefing.sqf";
  
// ACRE
execVM "bso\acre.sqf";


////// ==== Safety
// Enable ACE weapon Safety and Earplugs in.
#include "BSO\safe\safety.sqf";
// Safe Start
// Import all modules.
fc_safestart_init = compile preprocessFileLineNumbers "BSO\safe\safestart_init.sqf";
// Run all modules.
[] spawn fc_safestart_init;
// Safe Zone
execVM "bso\safe\safe_zone.sqf";

//Safe Start Hint
Hint_BSOStart = true; publicVariable "Hint_BSOStart";
// Adds Admin action to start mission
_mainAction = ["bso_start_mission", "Start Mission", "", {execVM "bso\safe\safestart_adminAction.sqf"}, {fc_safestart && serverCommandAvailable "#kick"}] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions","bso_admin_admin"], _mainAction] call ace_interact_menu_fnc_addActionToClass;


_mainAction = ["bso_end_mission", "Mission End Conditions", "", {}, {serverCommandAvailable "#kick"}] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions","bso_admin_admin"], _mainAction] call ace_interact_menu_fnc_addActionToClass;

_sub1 = ["bso_end_mission_1", "Mission Success", "", {[-2,{["end1",true,4] call BIS_fnc_endMission;},[]] call CBA_fnc_globalExecute;}, {serverCommandAvailable "#kick"}] call ace_interact_menu_fnc_createAction;
_sub2 = ["bso_end_mission_2", "Mission Failed", "", {[-2,{["loser",false,4] call BIS_fnc_endMission;},[]] call CBA_fnc_globalExecute;}, {serverCommandAvailable "#kick"}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions","bso_admin_admin","bso_end_mission"], _sub1] call ace_interact_menu_fnc_addActionToClass;
[typeOf player, 1, ["ACE_SelfActions","bso_admin_admin","bso_end_mission"], _sub2] call ace_interact_menu_fnc_addActionToClass;


/////// ==== Save Disable
enableSaving [false,false];

////// === Mission Log
diag_log format ["###### %1 ######", missionName];
diag_log [diag_frameno, diag_ticktime, time, "Executing init.sqf"];


while {Hint_BSOStart} do
	{
		["BSOSafeStart",["SafeStart is active and weapons are disabled"]] call BIS_fnc_showNotification;
		sleep 30;
	}; 