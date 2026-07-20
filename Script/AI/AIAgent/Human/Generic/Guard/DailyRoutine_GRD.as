UCLASS()
class UDailyRoutine_FM_GRD_Guard01_246_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_100");
    default Schedule(13, 0, UAIState_Guard(), n"FM_100");
}

UCLASS()
class UDailyRoutine_OM_GRD_Guard04_250_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_GuardWheelOpen(), n"OW_OM_ENTRANCE02_WHEEL_USE");
    default Schedule(22, 0, UAIState_GuardWheelOpen(), n"OW_OM_ENTRANCE02_WHEEL_USE");
}

UCLASS()
class UDailyRoutine_OM_GRD_Guard04_250_Fmtaken : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_GuardWheelClosed(), n"OW_OM_ENTRANCE02_WHEEL_USE");
    default Schedule(22, 0, UAIState_GuardWheelClosed(), n"OW_OM_ENTRANCE02_WHEEL_USE");
}

UCLASS()
class UDailyRoutine_OM_GRD_Guard13_278_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Guard(), n"OM_CAVE3_30");
    default Schedule(20, 0, UAIState_Guard(), n"OM_CAVE3_30");
}

UCLASS()
class UDailyRoutine_FM_GRD_Guard01_283_Fmtaken3 : UAIState_DailyRoutine_Human
{
    default Schedule(1, 0, UAIState_StayNeutral(), n"FMC_PATH27");
    default Schedule(13, 0, UAIState_StayNeutral(), n"FMC_PATH27");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard01_283_Fmtaken4 : UAIState_DailyRoutine_Human
{
    default Schedule(1, 0, UAIState_Stay(), n"FMC_PATH27");
    default Schedule(13, 0, UAIState_Stay(), n"FMC_PATH27");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard02_284_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_167");
    default Schedule(13, 0, UAIState_Guard(), n"FM_167");
}

UCLASS()
class UDailyRoutine_FM_GRD_Guard04_286_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_94");
    default Schedule(13, 0, UAIState_Guard(), n"FM_94");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard05_287_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_116");
    default Schedule(13, 0, UAIState_Guard(), n"FM_116");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard06_288_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_111");
    default Schedule(13, 0, UAIState_Guard(), n"FM_111");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard07_289_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_18");
    default Schedule(13, 0, UAIState_Guard(), n"FM_18");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard08_290_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_113");
    default Schedule(13, 0, UAIState_Guard(), n"FM_113");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard09_291_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_97");
    default Schedule(13, 0, UAIState_Guard(), n"FM_97");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard10_292_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_03");
    default Schedule(13, 0, UAIState_Guard(), n"FM_03");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard11_293_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_84");
    default Schedule(13, 0, UAIState_Guard(), n"FM_84");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard12_294_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_132");
    default Schedule(13, 0, UAIState_Guard(), n"FM_132");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard13_295_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_139");
    default Schedule(13, 0, UAIState_Guard(), n"FM_139");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard14_296_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_149");
    default Schedule(13, 0, UAIState_Guard(), n"FM_149");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard15_297_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_14");
    default Schedule(13, 0, UAIState_Guard(), n"FM_14");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard16_298_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_07");
    default Schedule(13, 0, UAIState_Guard(), n"FM_07");
}


UCLASS()
class UDailyRoutine_FM_GRD_Guard17_299_Fmstart : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FM_133");
    default Schedule(13, 0, UAIState_Guard(), n"FM_133");
}

UCLASS()
class UAIState_DailyRoutine_Human_Guard : UAIState_DailyRoutine_Human
{
    default ScheduleIfRaining(2, 30, UAIState_RainShelter_Guard(), Location::Anywhere,3000);
}

class UAIState_RainShelter_Guard : UAIState_RainShelter
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
                SetWalkSpeed(EWalkSpeed::Walking);
                
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