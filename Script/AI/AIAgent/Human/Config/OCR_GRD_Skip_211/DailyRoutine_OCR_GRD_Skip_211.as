UCLASS()
class UAIAgentConfig_Human_OCR_GRD_Skip_211 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_Skip_211::StaticClass();

}

UCLASS()
class UDailyRoutine_OCR_GRD_Skip_211_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SKIP");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SKIP");
}

UCLASS()
class UDailyRoutine_OCR_GRD_Skip_211_Start : UDailyRoutine_OCR_GRD_Skip_211_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_05");
    default Schedule(8, 0, UAIState_Stand(), n"FP_OC_STANDAROUND_10",300);
    default Schedule(12, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_05");
    default Schedule(13, 0, UAIState_Stand(), n"FP_OC_STANDAROUND_10",300);
    default Schedule(23, 0, UAIState_StandAround(), n"FP_OC_CAMPFIRE_34",1000);

    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_91",1000);
    default ScheduleIfRaining(8, 0, UAIState_Stand(), n"FP_OC_STANDAROUND_10",300);
    default ScheduleIfRaining(12, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_91",1000);
    default ScheduleIfRaining(13, 0, UAIState_Stand(), n"FP_OC_STANDAROUND_10",300);
    default ScheduleIfRaining(23, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_91",1000);
}

UCLASS()
class UDailyRoutine_OCR_GRD_Skip_211_Ot : UDailyRoutine_OCR_GRD_Skip_211_Ownership
{
    default Schedule(7, 0, UAIState_Stay(), n"FP_OC_STANDAROUND_10");
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Outcast_All);
}

UCLASS()
class UDailyRoutine_OCR_GRD_Skip_211_WaitYard : UDailyRoutine_OCR_GRD_Skip_211_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_STAND_YARD_12", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 