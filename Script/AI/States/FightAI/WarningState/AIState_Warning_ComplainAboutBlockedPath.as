class UAIState_Warning_ComplainAboutBlockedPath : UAIState_Warning_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_BlockedPath);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_BlockedPath;

    TArray<FGameplayTag> WarningShoutVoicelines_Starter;
    default WarningShoutVoicelines_Starter.Add(GameplayTag::Sound_Voice_Reaction_Blocking_MakeWay);

    TArray<FGameplayTag> WarningShoutVoicelines_Later;
    default WarningShoutVoicelines_Later.Add(GameplayTag::Sound_Voice_Reaction_Blocking_OutOfMyWay);
    default WarningShoutVoicelines_Later.Add(GameplayTag::Sound_Voice_Reaction_Blocking_InsistOutOfMyWay);

    default SetWarningVoicelines(WarningShoutVoicelines_Starter, WarningShoutVoicelines_Later);

    default NumWarningsBeforeCombat = 4;
    default MinimumDistance = 100.0f;
    default TooCloseDistance = 0.0f;
    default ThreatApproachedTooMuchDistance = MAX_flt;
    default bUseWeapon = false;

    /** Initial time before starting to warn. */
    UPROPERTY()
    float SecondsBeforeWarnings = 1.0f;

    /** How many seconds to wait between each warning. */
    UPROPERTY()
    float SecondsBetweenWarnings = 3.0f;

    /** Personal space is computed by multiplying the collision radius with this number. */
    UPROPERTY()
    float PersonalSpaceRadiusMultiplier = 5.0f;

    /** Set to the character standing in the way while the state is running. */
    UPROPERTY()
    protected AGothicCharacter BlockingCharacter;

    bool WasPathfollowingAtBlockEmit() const
    {
        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (!IsValid(GothicAI))
            return true;
        return GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).bWasPathfollowingAtBlockEmit;
    }

    FGameplayTag GetVoiceTagToWarn() override
    {
        if (WasPathfollowingAtBlockEmit())
            return Super::GetVoiceTagToWarn();
        return FGameplayTag::Empty;
    }

    void WarnOther() override
    {
        if (!WasPathfollowingAtBlockEmit())
        {
            AI.Say(GameplayTag::Sound_Voice_Reaction_Interjection_Angry, EPerceptionNoiseLoudness::Moderate, CharacterOfInterest);
            AI.OutOfTheWayHere();
        }

        Super::WarnOther();
    }

    float GetActivePersonalSpaceRadius() const
    {
        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (IsValid(GothicAI))
        {
            float Stored = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).ActiveBlockingPathPersonalSpaceRadiusCm;
            if (Stored > 0.0f)
                return Stored;
        }
        return Self.GetSimpleCollisionRadius() * PersonalSpaceRadiusMultiplier;
    }

    bool IsBlockerInInitialFacingCone() const
    {
        if (!IsValid(BlockingCharacter))
            return false;

        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (IsValid(GothicAI))
        {
            FVector InitDir = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).InitialBlockingFacingDirection;
            if (!InitDir.IsNearlyZero())
            {
                FVector ToBlocker = (BlockingCharacter.GetActorLocation() - Self.GetActorLocation()).GetSafeNormal2D();
                return ToBlocker.DotProduct(InitDir.GetSafeNormal2D()) > 0.5f;
            }
        }
        return Self.IsFacingOtherCharacter(BlockingCharacter);
    }

    bool IsCharacterStillBlockingPath() const
    {
        if (!IsValid(BlockingCharacter))
            return false;

        if (Self.GetDistanceTo(BlockingCharacter) > GetActivePersonalSpaceRadius())
            return false;

        return IsBlockerInInitialFacingCone();
    }

    void SelectWarningCharacterOfInterest() override
    {
        if (!IsCharacterStillBlockingPath())
        {
            CharacterOfInterest = nullptr;
        }

        if (CharacterOfInterest == nullptr)
            return;

        AI.TargetCharacterOfInterest(FocusPriority, this);        
    }

    void BeginWarning() override
    {
        BlockingCharacter = CharacterOfInterest;

        if (CharacterOfInterest != nullptr && !CharacterOfInterest.IsPlayerControlled())
        {
            bHasWarningLimit = false;
        }

        Super::BeginWarning();
        
    }

    FString GetDisplayName() const override
    {
        return "Out of my way - Human Warning";
    }
}