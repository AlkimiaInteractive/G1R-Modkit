
class UGA_Defeated : UGameplayAbilityDefeated
{
    default m_StandUpEffect = UGE_StandUp::StaticClass();
    default m_DefeatedGE = UGE_Defeated::StaticClass();
    default m_DefeatedStateTagGE = UGE_State_Defeated::StaticClass();
    default m_TimeToStandUp = 8.0f;

    UFUNCTION(BlueprintOverride)
    void ActivateAbilityFromEvent(FGameplayEventData EventData)
    {
        RememberDefeat(EventData);
    }

    void RememberDefeat(FGameplayEventData EventData)
    {
        auto Character = Cast<AGothicCharacter>(AvatarActorFromActorInfo);

        if (Character == nullptr)
            return;

        auto CharacterState = Character.CharacterState;

        if (CharacterState == nullptr)
            return;
        
        if (EventData.Instigator != nullptr)
        {
            if(EventData.Instigator.IsA(AGothicCharacterState::StaticClass()))
                CharacterState.LongTermMemory.UpdateLastMemoryAgainstMeMatchingAll(GameplayTag::Memory_Combat_WasDefeated, Cast<AGothicCharacterState>(EventData.Instigator));
            else
                CharacterState.LongTermMemory.UpdateLastMemoryAgainstMeMatchingAll(GameplayTag::Memory_Combat_WasDefeated, Cast<AGothicCharacter>(EventData.Instigator).CharacterState);
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbilityServer_Scriptable()
    {
       m_DefeatedGEHandle = ApplyGameplayEffectToOwner(m_DefeatedGE);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbilityServer_Scriptable()
    {
        RemoveGameplayEffectFromOwnerWithHandle(m_DefeatedGEHandle);
    }
}

class UGA_Defeated_NPC : UGA_Defeated
{
     default m_TimeToStandUp = 35.0f;
}

class UGA_Defeated_NPC_Reduced : UGA_Defeated
{
     default m_TimeToStandUp = 5.0f;
}

class UGA_Defeated_NPC_Infinity : UGA_Defeated
{
     default m_TimeToStandUp = -1.0f;
}