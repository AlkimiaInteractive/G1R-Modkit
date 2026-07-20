UCLASS()
class UAIAgentConfig_Human_OCR_GRD_GateGuard03_214 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_GateGuard03_214::StaticClass();

}



UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard03_214_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(0, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_10",500);
    default Schedule(3, 10, UAIState_Sleep(), n"FP_OC_GUARDPASSAGE_10",500);
    default Schedule(6, 30, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_10",500);
    default Schedule(7, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_10",500);
    default Schedule(23, 30, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_10",500);
}

UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard03_214_Fmtaken : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(6, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_10");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard03_214_Fmtaken2 : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);
    
    default Schedule(6, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_10");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}