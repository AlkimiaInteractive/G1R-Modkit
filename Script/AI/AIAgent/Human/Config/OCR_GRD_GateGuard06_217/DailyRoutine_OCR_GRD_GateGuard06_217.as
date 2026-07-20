UCLASS()
class UAIAgentConfig_Human_OCR_GRD_GateGuard06_217 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_GateGuard06_217::StaticClass();

}



UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard06_217_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(0, 0, UAIState_Sleep(), n"FP_OC_GUARDPASSAGE_13",300);
    default Schedule(2, 45, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_13",300);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_13",300);
    default Schedule(6, 3, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_13",300);
    default Schedule(23, 30, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_13",300);
}

UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard06_217_Fmtaken : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(6, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_13");
    default Schedule(14, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_13");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard06_217_Fmtaken2 : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);
    
    default Schedule(6, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_13");
    default Schedule(14, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_13");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}