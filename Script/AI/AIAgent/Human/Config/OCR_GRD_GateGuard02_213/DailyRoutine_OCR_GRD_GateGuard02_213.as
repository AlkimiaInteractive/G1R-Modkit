UCLASS()
class UAIAgentConfig_Human_OCR_GRD_GateGuard02_213 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_GateGuard02_213::StaticClass();

}



UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard02_213_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);

    default Schedule(0, 0, UAIState_Sleep(), n"FP_OC_GUARDPASSAGE_19",300);
    default Schedule(2, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_19",300);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_19",300);
    default Schedule(6, 3, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_19",300);
    default Schedule(23, 30, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_19",300);
}

UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard02_213_Omfull : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Guard(), n"OCC_GATE_RIGHT_GUARD");
    default Schedule(21, 0, UAIState_StandAround(), n"OCC_MERCS_RIGHT_ROOM_FRONT");
    default Schedule(22, 0, UAIState_SitAround(), n"OCC_GATE_CAMPFIRE_1");
    default Schedule(24, 0, UAIState_Sleep(), n"OCC_MERCS_UPPER_LEFT_ROOM_FRONT");
}

UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard02_213_Fmtaken : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
}


UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard02_213_Orcassault : UAIState_DailyRoutine_Human
{

}