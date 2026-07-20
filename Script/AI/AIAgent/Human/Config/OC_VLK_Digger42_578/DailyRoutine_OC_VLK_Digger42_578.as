UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger42_578 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger42_578::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger42_578_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_49);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER578");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER578");

    default Schedule(6, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_50");
    default Schedule(12, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_CAULDRON_04");
    default Schedule(17, 30, UAIState_Campfire(), n"FP_OC_CAMPFIRE_13");
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_13");
    default Schedule(21, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_13");
    default Schedule(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger42_578_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(6, 30, UAIState_Stand(), n"FP_OC_INEXTREMO_Fire_01", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger42_578_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(6, 30, UAIState_Firespit(), n"FP_OC_INEXTREMO_Fire_01", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger42_578_AfterConcert : UDailyRoutine_Digger
{
    default Schedule(6, 30, UAIState_Sweep(), n"FP_OC_INEXTREMO_Fire_01", 200);
}