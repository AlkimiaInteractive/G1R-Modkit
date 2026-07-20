UCLASS()
class UAIAgentConfig_Human_SC_NOV_BaalNetbek_1371 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_BaalNetbek_1371::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_BaalNetbek_1371_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_WeedHarvesters_Huts_Storage);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_BAALNETBEK");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_BAALNETBEK");

    default Schedule(0, 1, UAIState_Sleep_Seated(), n"IO_SC_BENCH_9", WaypointRadius = 500);
    default Schedule(6, 31, UAIState_SC_NOV_BaalNetbek_1371(), n"FP_SC_STANDAROUND_03", 3000.0f);
}

UCLASS()
class UAIState_SC_NOV_BaalNetbek_1371: UAIState_UseFreepoint 
{
    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void DoTask()
    {
        while (!bShouldExitState)
        {
            int Random = Math::RandRange(0,100);
            
            if(Random >= 75)
            {
                AI.StandAround(30);
            }
            else if(Random >= 50)
            {
                AI.SmokeWeed(50);
            }
            else if(Random >= 25)
            {
                AI.Eat(50);
            }
            else
            {
                AI.Drink(50);
            }
        }
    }
}