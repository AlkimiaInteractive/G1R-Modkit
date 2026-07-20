UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger38_565 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger38_565::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger38_565_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_34);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER565");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER565");

    default Schedule(5, 0, UAIState_Digger38_565_WakeUp(), NAME_None);
    default Schedule(8, 9, UAIState_LightFire(), n"FP_OC_CAMPFIRE_29");
    default Schedule(10, 9, UAIState_RepairBuilding(), n"FP_OC_STANDAROUND_46",1200);
    default Schedule(12, 40, UAIState_Eat(), n"FP_OC_CAMPFIRE_29");
    default Schedule(14, 10, UAIState_LightFire(), n"FP_OC_CAMPFIRE_29");
    default Schedule(16, 10, UAIState_RepairBuilding(), n"FP_OC_STANDAROUND_46",1200);
    default Schedule(18, 9, UAIState_LightFire(), n"FP_OC_CAMPFIRE_29");
    default Schedule(20, 40, UAIState_Eat(), n"FP_OC_CAMPFIRE_29");
    default Schedule(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(5, 0, UAIState_RainShelter_Digger(), Location::Home,750);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UAIState_Digger38_565_WakeUp : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.Pee(n"FP_OC_PEE_08");

        while(!bShouldExitState)
        {
            AI.Eat(n"IO_OC_CHAIR_83",200);

            WaitSeconds(10.0f); // TODO: Proper fallback
        }
    }
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger38_565_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_18", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger38_565_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Intense(), n"FP_OC_INEXTREMO_18", 200);
}