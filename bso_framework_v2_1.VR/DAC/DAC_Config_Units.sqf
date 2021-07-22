//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
// FIA 
  case 0:
  {
    _Unit_Pool_S = ["O_BSO_FIA_INS","O_BSO_FIA_INS3","O_BSO_FIA_GL","O_BSO_FIA_AUTO","O_BSO_FIA_MG","O_BSO_FIA_AUTO","O_BSO_FIA_LAT","O_BSO_FIA_INS3","O_BSO_FIA_INS2","O_BSO_FIA_INS3","O_BSO_FIA_INS","O_BSO_FIA_INS2","O_BSO_FIA_INS3","O_BSO_FIA_MECH","O_BSO_FIA_EXP","O_BSO_FIA_DMR"];
    _Unit_Pool_V = ["O_BSO_FIA_OFFROAD","O_BSO_FIA_TRUCK","O_BSO_FIA_transport"];
    _Unit_Pool_T = ["O_BSO_FIA_OFFROAD_AT","O_BSO_FIA_OFFROAD_ARMED"];
    _Unit_Pool_A = ["O_BSO_FIA_uh1_gunship"];
  };
//-------------------------------------------------------------------------------------------------
// FIA (with Gorgan APC and vans)
  case 1:
  {
    _Unit_Pool_S = ["O_BSO_FIA_INS","O_BSO_FIA_INS","O_BSO_FIA_GL","O_BSO_FIA_AUTO","O_BSO_FIA_MG","O_BSO_FIA_AUTO","O_BSO_FIA_LAT","O_BSO_FIA_INS","O_BSO_FIA_INS2","O_BSO_FIA_INS3","O_BSO_FIA_INS","O_BSO_FIA_INS2","O_BSO_FIA_INS3","O_BSO_FIA_MECH","O_BSO_FIA_EXP","O_BSO_FIA_DMR"];
    _Unit_Pool_V = ["O_BSO_FIA_transport"];
    _Unit_Pool_T = ["O_BSO_FIA_gorgan"];
    _Unit_Pool_A = ["O_BSO_FIA_uh1_gunship"];
  };
//-------------------------------------------------------------------------------------------------
// AAF (BSO)
  case 2:
  {
    _Unit_Pool_S = ["I_crew_F","I_helipilot_F","I_officer_F","I_Soldier_LAT_F","I_Soldier_MG_F","I_Soldier_M_F","I_Soldier_GL_F","I_Soldier_exp_F","I_engineer_F","I_medic_F","I_Soldier_AR_F","I_Soldier_A_F"];
    _Unit_Pool_V = ["I_Truck_02_covered_F","I_Truck_02_transport_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_MRAP_03_F"];
    _Unit_Pool_T = ["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F"];
    _Unit_Pool_A = ["I_Heli_light_03_F"];
  };
//-------------------------------------------------------------------------------------------------
// Civilians (A3)
  case 3:
  {
    _Unit_Pool_S = ["C_man_1","C_man_1","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
    _Unit_Pool_V = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_T = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_A = [];
  };
//-------------------------------------------------------------------------------------------------
  Default
  {
    if(DAC_Basic_Value != 5) then
    {
      DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value",
      hintc "Error: DAC_Config_Units > No valid config number";
    };
    if(true) exitwith {};
  };
};

if(count _this == 2) then
{
  _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
}
else
{
  _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray