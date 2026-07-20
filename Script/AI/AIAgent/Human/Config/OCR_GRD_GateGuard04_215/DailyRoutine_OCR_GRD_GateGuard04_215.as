UCLASS()
class UAIAgentConfig_Human_OCR_GRD_GateGuard04_215 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_GateGuard04_215::StaticClass();

}



UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard04_215_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(0, 0, UAIState_Sleep(), n"FP_OC_GUARDPASSAGE_08",500);
    default Schedule(3, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_08",500);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_08",500);
    default Schedule(6, 3, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_08",500);
    default Schedule(23, 30, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_08",500);
}

UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard04_215_Fmtaken : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(6, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_08");
    default Schedule(21, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_08");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OCR_GRD_GateGuard04_215_Fmtaken2 : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC);
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);
    
    default Schedule(6, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_08");
    default Schedule(21, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_08");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}