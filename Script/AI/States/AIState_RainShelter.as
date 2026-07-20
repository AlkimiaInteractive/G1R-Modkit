class UAIState_RainShelter : UAIState_RandomInteractions
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
        bool shouldRRun = false;


        if(Math::RandRange(0.0f,1.0f) < 0.70f)
        {
            shouldReactToRain = true;
        }

        if(Math::RandRange(0.0f,1.0f) < 0.90f)
        {
            shouldRRun = true;
         }

        while(!bShouldExitState)
        {
           
            if(shouldReactToRain && Self != nullptr && Self.IsInRain(2))
            {
                if(shouldRRun)
                {
                    SetWalkSpeed(EWalkSpeed::Running);
                }
                
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

class UAIState_RainShelterNoMouth : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LeanWall, 0.60f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit, 0.30f, 35.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CheckRain, 0.15f,1.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayStone, 0.10f,30.0f));


    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        bool shouldReactToRain = false;
        bool shouldRRun = false;


        if(Math::RandRange(0.0f,1.0f) < 0.70f)
        {
            shouldReactToRain = true;
        }

        if(Math::RandRange(0.0f,1.0f) < 0.90f)
        {
            shouldRRun = true;
         }

        while(!bShouldExitState)
        {
           
            if(shouldReactToRain && Self != nullptr && Self.IsInRain(2))
            {
                if(shouldRRun)
                {
                    SetWalkSpeed(EWalkSpeed::Running);
                }
                
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