UCLASS()
class UAIAgentConfig_Human_OCR_GRD_Bloodwyn_233 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_Bloodwyn_233::StaticClass();

}

UCLASS()
class UDailyRoutine_OCR_GRD_Bloodwyn_233_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_BLOODWYN");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_BLOODWYN");
}

UCLASS()
class UDailyRoutine_OCR_GRD_Bloodwyn_233_Start : UDailyRoutine_OCR_GRD_Bloodwyn_233_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC_Bloodwyn);

    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Bloodwyn(), n"BreadcrumbActor_OC_Bloodwyn_1");
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(21, 0, UAIState_SitAround(), n"FP_OC_STANDAROUND_70");
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_114",500);
    default ScheduleIfRaining(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(21, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(23, 47, UAIState_Sleep(), Location::Bed);
}

UCLASS()
class UDailyRoutine_OCR_GRD_Bloodwyn_233_Fmtaken : UDailyRoutine_OCR_GRD_Bloodwyn_233_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC_Bloodwyn);

    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_29");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OCR_GRD_Bloodwyn_233_Fmtaken2 : UDailyRoutine_OCR_GRD_Bloodwyn_233_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC_Bloodwyn);
    
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_29");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}