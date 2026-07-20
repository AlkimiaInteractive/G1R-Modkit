UCLASS()
class UDailyRoutine_OM_STT_Ian_301_Kapitel2 : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_StandAround(), n"OM_CAVE3_19");
    default Schedule(18, 0, UAIState_StandAround(), n"OM_CAVE3_19");
}

UCLASS()
class UDailyRoutine_STT_336_Schatten_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_SitAround(), n"FM_162");
    default Schedule(13, 0, UAIState_SitAround(), n"FM_162");
}


UCLASS()
class UDailyRoutine_STT_337_Schatten_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_RoastScavenger(), n"FM_157");
    default Schedule(13, 0, UAIState_RoastScavenger(), n"FM_157");
}


UCLASS()
class UDailyRoutine_Stt_338_Schatten_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_SitAround(), n"FM_162");
    default Schedule(13, 0, UAIState_SitAround(), n"FM_162");
}

UCLASS()
class UAIState_DailyRoutine_Human_Shadow : UAIState_DailyRoutine_Human
{
    default ScheduleIfRaining(2, 30, UAIState_RainShelter_Shadow(), Location::Anywhere,3000);
}

class UAIState_RainShelter_Shadow : UAIState_RainShelter
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed, 0.20f, 25.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.60f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LeanWall, 0.60f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit, 0.30f, 35.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.10f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.10f, 24.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CheckRain, 0.15f,1.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayStone, 0.10f,30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayKnife, 0.10f,30.0f));

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
            if(shouldReactToRain && Self != nullptr && Self.IsInRain(3))
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