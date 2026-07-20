UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary02_703 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary02_703::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary02_703_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_30);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_MERCENARY703");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_MERCENARY703");

    default Schedule(7, 45, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_16");
    default Schedule(8, 45, UAIState_Drink(), n"FP_NC_STANDAROUND_02",300);
    default Schedule(12, 45, UAIState_NC_SLD_Mercenary02_703_PeeAndSitGround(n"FP_NC_SIT_04"), n"FP_NC_PEE_01",400);
    default Schedule(15, 45, UAIState_Drink(), n"IO_NC_CHAIR_17",400);
    default Schedule(18, 45, UAIState_Drink(), n"FP_NC_STANDAROUND_05",300);
    default Schedule(23, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UAIState_NC_SLD_Mercenary02_703_PeeAndSitGround : UGothicCharacterSimulateableAIState 
{
    UAIState_NC_SLD_Mercenary02_703_PeeAndSitGround(FName InSitPosition)
    {
        SitPosition = InSitPosition;
    }

    UPROPERTY()
    FName SitPosition;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_Pee,TimeLimitSeconds=60.0f);

        while(!bShouldExitState)
        {
            AI.TryUseFreepointAt(GameplayTag::Action_Interact_Sit_Ground,SitPosition,TimeLimitSeconds=60.0f);
            WaitSeconds(1.0f);
        }
    }
}