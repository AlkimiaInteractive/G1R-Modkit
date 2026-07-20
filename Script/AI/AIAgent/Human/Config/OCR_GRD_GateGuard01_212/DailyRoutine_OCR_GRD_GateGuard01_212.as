UCLASS()
class UAIAgentConfig_Human_OCR_GRD_GateGuard01_212 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_GateGuard01_212::StaticClass();

}



UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard01_212_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 30, UAIState_EnsureInnerCastleGateIsOpened(n"Interactive_Winch458439"), n"Interactive_Winch458439");
}

UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard01_212_Omfull : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Guard(), n"OCC_GATE_RIGHT_GUARD");
    default Schedule(21, 0, UAIState_StandAround(), n"OCC_MERCS_RIGHT_ROOM_FRONT");
    default Schedule(22, 0, UAIState_SitAround(), n"OCC_GATE_CAMPFIRE_1");
    default Schedule(24, 0, UAIState_Sleep(), n"OCC_MERCS_UPPER_LEFT_ROOM_FRONT");
}

UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard01_212_Fmtaken : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    
    default Schedule(0, 3, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_18",300);
    default Schedule(2, 30, UAIState_Sleep(), n"FP_OC_GUARDPASSAGE_18",300);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_18",300);
    default Schedule(6, 3, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_18",300);
    default Schedule(23, 30, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_18",300);
}