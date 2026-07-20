UCLASS()
class UAIAgentConfig_Human_OCR_GRD_GateGuard05_216 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_GateGuard05_216::StaticClass();

}



UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard05_216_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(0, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_12",300);
    default Schedule(3, 10, UAIState_Sleep(), n"FP_OC_GUARDPASSAGE_12",300);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_12",300);
    default Schedule(6, 3, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_12",300);
    default Schedule(23, 30, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_12",300);
}

UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard05_216_Fmtaken : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(6, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_12");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard05_216_Fmtaken2 : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);
    
    default Schedule(6, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_12");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}