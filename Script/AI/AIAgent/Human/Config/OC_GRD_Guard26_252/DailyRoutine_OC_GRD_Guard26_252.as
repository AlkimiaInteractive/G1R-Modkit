UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard26_252 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard26_252::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard26_252_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD252");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD252");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard26_252_Start : UDailyRoutine_OC_GRD_Guard26_252_Ownership
{
    default Schedule(6, 30, UAIState_Eat(), n"IO_OC_CHAIR_50",1000);
    default Schedule(7, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_58",300);
    default Schedule(12, 00, UAIState_Eat(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(14, 45, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_58",300);
    default Schedule(22, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_190",500);
    default ScheduleIfRaining(14, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_91",500);
    default ScheduleIfRaining(14, 45, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_190",500);
    default ScheduleIfRaining(22, 30, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_91",500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard26_252_WaitYard : UDailyRoutine_OC_GRD_Guard26_252_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_STAND_YARD_7", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 

UCLASS()
class UDailyRoutine_OC_GRD_Guard26_252_Fmtaken : UDailyRoutine_OC_GRD_Guard26_252_Ownership
{
    default Schedule(20, 0, UAIState_GuardWatch(), n"FP_FM_GUARD_12");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard26_252_Fmtaken2 : UDailyRoutine_OC_GRD_Guard26_252_Ownership
{
    default Schedule(20, 0, UAIState_GuardWatch(), n"FP_FM_GUARD_12");
}

