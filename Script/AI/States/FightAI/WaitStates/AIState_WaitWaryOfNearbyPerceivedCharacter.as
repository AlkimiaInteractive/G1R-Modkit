class UAIState_Wait_WaryOfNearbyPerceivedCharacter : UAIState_PerceptionResponse
{
    default AssessmentModuleClass = UAIARM_State_Wait;
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Wait_WaryOfPerceivedNearbyCharacter);
    default AIStateTag = GameplayTag::AIState_Wait_WaryOfPerceivedNearbyCharacter;
    default SwitchAIStateMode = ESwitchAIStateMode::Interrupt;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::None;

    /** Personal space is computed by multiplying the collision radius with this number. */
    UPROPERTY()
    float PersonalSpaceRadiusMultiplier = 5.0f;

    UPROPERTY()
    float CharacterLeaveDistance = 350.0f;

    bool IsCharacterStillNearby() const
    {
        for (auto OtherCharacter : AI.GetSensedLivingCharacters())
        {
            if (!OtherCharacter.IsPlayerControlled())
                continue;

            if (Self.GetDistanceTo(OtherCharacter) < Self.GetSimpleCollisionRadius() + CharacterLeaveDistance)
                return true;
        }

        return false;
    }

    void SelectCharacterOfInterest()
    {
        if (!IsCharacterStillNearby())
        {
            CharacterOfInterest = nullptr;
        }

        if (!IsValid(CharacterOfInterest))
            return;

        AI.TargetCharacterOfInterest(FocusPriority, this);      
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask(); 
        
        EnableStrafeMovementAndTurnToTargetMode();

        bool bHasCommented = false;
        bool bPerceivedCharacterWasWalking = CharacterOfInterest.IsWalkSpeedWalking();
        while(!bShouldExitState)
        {
            // Comment on why npc turns around
            SelectCharacterOfInterest();

            if (IsValid(CharacterOfInterest) && !bHasCommented && AI.Character.Perception.CanSee(CharacterOfInterest))
            {
                // Character is sneaking, call it out
                if (CharacterOfInterest.bIsCrouched)
                {
                    AI.Say(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_Heard, TargetCharacter = CharacterOfInterest);
                    AI.WaitUntilNoLongerSpeaking();
                    AI.WaitSeconds(2.0f);
                    bHasCommented = true;
                    continue;
                }

                // Character is walking slowly behind npc, if they're lower rank, call it out
                if (bPerceivedCharacterWasWalking && AI.CharacterState.Relationship.IsOfHigherRankTowards(CharacterOfInterest.CharacterState))
                {
                    AI.Say(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_Heard, TargetCharacter = CharacterOfInterest);
                    AI.WaitUntilNoLongerSpeaking();
                    AI.WaitSeconds(2.0f);
                    bHasCommented = true;
                    continue;
                }

                // Character is a friend of same rank
                if (AI.CharacterState.Relationship.IsFriendlyTowards(CharacterOfInterest.CharacterState) && 
                    !AI.CharacterState.Relationship.IsOfHigherRankTowards(CharacterOfInterest.CharacterState) &&
                    !CharacterOfInterest.CharacterState.Relationship.IsOfHigherRankTowards(AI.CharacterState))
                {
                    AI.WaitUntilNoLongerSpeaking();
                    AI.WaitSeconds(2.0f);
                    AI.Say(GameplayTag::Sound_Voice_Address_Greeting_Friendly, TargetCharacter = CharacterOfInterest);
                    bHasCommented = true;
                    continue;
                }

                // no comment
                AI.WaitSeconds(3.0f);
                bHasCommented = true;
                continue;
            }


            if (CharacterOfInterest == nullptr)
            {
                AI.WaitSeconds(1.0f);

                AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
                WaitOneTick();
                continue;
            }

            WaitOneTick();
        }

    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        DisableStrafeMovementAndTurnToTargetMode();
    }

    FString GetDisplayName() const override
    {
        return "Wait wary of nearby character";
    }
}