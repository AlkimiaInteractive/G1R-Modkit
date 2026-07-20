UCLASS()
class UDailyRoutine_FM_VLK_Digger02_5002_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_PickOre(), n"FM_105");
    default Schedule(23, 0, UAIState_PickOre(), n"FM_105");
}

UCLASS()
class UDailyRoutine_FM_VLK_Digger03_5003_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_PickOre(), n"FM_103");
    default Schedule(23, 0, UAIState_PickOre(), n"FM_103");
}

UCLASS()
class UDailyRoutine_FM_VLK_Digger04_5004_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_PickOre(), n"FM_102");
    default Schedule(23, 0, UAIState_PickOre(), n"FM_102");
}

UCLASS()
class UDailyRoutine_FM_VLK_Digger05_5005_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_MineBellows(), n"FM_159");
    default Schedule(23, 0, UAIState_MineBellows(), n"FM_159");
}

UCLASS()
class UDailyRoutine_FM_VLK_Digger06_5006_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_PickOre(), n"FM_136");
    default Schedule(23, 0, UAIState_PickOre(), n"FM_136");
}

UCLASS()
class UDailyRoutine_FM_VLK_Digger07_5007_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_PickOre(), n"FM_88");
    default Schedule(23, 0, UAIState_PickOre(), n"FM_88");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger17_559_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_PickOre(), n"OM_CAVE3_01");
    default Schedule(21, 0, UAIState_PickOre(), n"OM_CAVE3_01");
}

UCLASS()
class UAIState_DailyRoutine_Human_Digger : UAIState_DailyRoutine_Human
{
    default ScheduleIfRaining(2, 30, UAIState_RainShelter_Digger(), Location::Anywhere,3000);
}

UCLASS()
class UDailyRoutine_Human_Digger_ExchangeZoneCarryBoxesHigh : UAIState_DailyRoutine_Human
{
        default Schedule(15, 0, UAIState_CarryBoxesMidHigh(n"FP_EZ_TakeBoxMidHigh",n"FP_EZ_LeaveBoxMidHigh"), NAME_None);

}

UCLASS()
class UDailyRoutine_Human_Digger_ExchangeZoneCarryBoxesFloor : UAIState_DailyRoutine_Human
{
        default Schedule(15, 0, UAIState_CarryBoxes(n"FP_EZ_TakeBox",n"FP_EZ_LeaveBox"), NAME_None);

}

UCLASS()
class UDailyRoutine_Human_Digger_ExchangeZoneCarryPlank : UAIState_DailyRoutine_Human
{
        default Schedule(15, 0, UAIState_CarryPlanksFromWall(n"FP_EZ_TakePlankFromWall",n"FP_EZ_LeavePlank"), NAME_None);
}

class UAIState_RainShelter_Digger : UAIState_RainShelter
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed, 0.20f, 25.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.60f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LeanWall, 0.60f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit, 0.30f, 35.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.10f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.10f, 24.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CheckRain, 0.15f,1.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayStone, 0.10f,30.0f));


    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        bool shouldReactToRain = false;

        if(Math::RandRange(0.0f,1.0f) < 0.75f)
        {
            shouldReactToRain = true;
        }

        while(!bShouldExitState)
        {
            if(shouldReactToRain && Self != nullptr && Self.IsInRain(2))
            {
                SetWalkSpeed(EWalkSpeed::Running);
                
                // Don't try to activate again if already CoveringHead
                if(!Self.HasGameplayTag(GameplayTag::State_CoveringHead))
                {
                    FGameplayEventData Payload;
                    GothicGAS::AddRainCoverHeadData(Payload, 2);
                    GothicGAS::SendGameplayEvent(CharacterState, GameplayTag::Action_CoverInRain, Payload);
                }
            }

            WaitSeconds(0.5);
        }
    }
}