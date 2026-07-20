UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger02_502 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger02_502::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger02_502_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_4);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER502");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER502");


    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_04");
    //default Schedule(8, 0, UAIState_CarryWoodFromWall(n"FP_OC_TakeWoodFromWall_1", n"FP_OC_LeaveWoodFromWall_1"), NAME_None); ADD SOMETHING INTERESTING HERE
    default Schedule(17, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_04");
    default Schedule(20, 30, UAIState_Campfire(), n"FP_OC_CAMPFIRE_04");
    default Schedule(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(17, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger02_502_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_01", 200 );

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger02_502_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Intense(), n"FP_OC_INEXTREMO_01", 200 );
}