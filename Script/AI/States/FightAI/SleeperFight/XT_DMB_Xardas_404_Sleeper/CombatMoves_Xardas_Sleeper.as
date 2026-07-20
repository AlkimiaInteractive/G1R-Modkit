UCLASS()
class UCM_Spell_Xardas_FireBolt : UCM_CastSpellMultiple
{
    default MinAmount = 2;
    default MaxAmount = 4;

    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_XardasSleeper_DoingTeleportTo);
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_XardasSleeper_DoingTeleportTo);
}

UCLASS(Abstract)
class UCM_Spell_Xardas_Teleport : UAITask_CombatMove
{
    default bCanBeInterruptedByReaction = false;
    default bIsBlockedByBlockStateTag = false;

    default BlockIfCharacterHasAnyOf.AddTag(GameplayTag::State_XardasSleeper_DoingTeleportTo);

    FGameplayTag RequiredTag;
    FGameplayTag EventTag;
    FGameplayTag BlockingTag;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        
        FGameplayEventData Payload;
        Combat.ResetSelectedAttack();

        if (!IsValid(Combat) || !IsValid(Combat.AbilitySystemComponent))
        {
            EndTaskAsFailure();
            return;
        }

        Combat.AbilitySystemComponent.SendGameplayEvent(EventTag, Payload);
        WaitOneTick();

        while (Combat.CharacterState.HasGameplayTag(BlockingTag))
        {
            WaitOneTick();
        }

        EndTaskAsSuccess();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (RequiredTag.IsValid() && !Combat.CharacterState.HasGameplayTag(RequiredTag))
        {
            Reason = "Missing required tag.";
            return false;
        }

        return Super::IsMoveAllowed(Reason);
    }
}

UCLASS()
class UCM_Spell_Xardas_TeleportStunned : UCM_Spell_Xardas_Teleport
{
    default RequiredTag = GameplayTag::State_XardasSleeper_CanTeleportTo_CentralSpot;    
    default EventTag = GameplayTag::Event_XardasSleeper_DoTeleportTo_CenterSpot;
    default BlockingTag = GameplayTag::State_XardasSleeper_DoingTeleportTo_CentralSpot;    
}

UCLASS()
class UCM_Spell_Xardas_Teleport_ToMinionSpot_Initial : UCM_Spell_Xardas_Teleport
{
    default RequiredTag = GameplayTag::State_XardasSleeper_CanTeleportTo_MinionSpot;    
    default EventTag = GameplayTag::Event_XardasSleeper_DoTeleportTo_MinionSpot;
    default BlockingTag = GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpot; 
}

UCLASS()
class UCM_Spell_Xardas_Teleport_ToMinionSpot_Visibility : UCM_Spell_Xardas_Teleport
{
    default EventTag = GameplayTag::Event_XardasSleeper_DoTeleportTo_VisibilityMinionSpot;
    default BlockingTag = GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpotVisibility; 

    // bool IsMoveAllowed(FString&out Reason) const override
    // {
    //     if (!Combat.CharacterState.HasGameplayTag(GameplayTag::State_XardasSleeper_OnMinionSpot))
    //     {
    //         Reason = "Missing state tag.";
    //         return false;
    //     }

    //     return Super::IsMoveAllowed(Reason);
    // }
}