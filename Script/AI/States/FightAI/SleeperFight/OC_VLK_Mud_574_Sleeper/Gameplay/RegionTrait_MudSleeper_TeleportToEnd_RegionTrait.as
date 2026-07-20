UCLASS(meta=(DisplayName="MudSleeper TeleportToEnd RegionTrait"))
class URegionTrait_MudSleeper_TeleportToEnd_RegionTrait : URegionTrait
{
    TSet<AGothicCharacterState> m_CurrentCharacters;

    UPROPERTY()
    FName m_MudSleeperUniqueName = n"ST_VLK_MUD_SLEEPER";

    UPROPERTY()
    bool m_ShouldHandleCharacter = true;
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        m_CurrentCharacters.Add(CharacterState);
        if(CharacterState.IsPlayerControlled() && CharacterState.IsPlayerCharacter())
            OnPlayerEnterRegion(CharacterState);
        else
        {
            if(CharacterState.GetCharacterUniqueName() == m_MudSleeperUniqueName)
            {
                ClearTeleportToEndAbility(CharacterState);
                m_ShouldHandleCharacter = false;
            }
        }
    }

    void ClearTeleportToEndAbility(AGothicCharacterState CharacterState)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(CharacterState.AbilitySystemComponent);
        //@DE - Doing teleport. so return
        if(abComp.HasTagExact(GameplayTag::Ability_Action_Teleport_Scripted))
            return;
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_Mud_Sleeper_Teleport_ToEnd::StaticClass(), outSpec);
        abComp.ClearAbility(outSpec.Handle);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        m_CurrentCharacters.Remove(CharacterState);
    }

    void OnPlayerEnterRegion(AGothicCharacterState CharacterState)
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);

        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"CheckMudIsOnRegion"), 5.f, false);        
        
    }

    UFUNCTION()
    void CheckMudIsOnRegion()
    {
        auto mudSleeperNpcState = FCharacterUniqueName(m_MudSleeperUniqueName).NPCState;
        if(!IsMudSleeperIsInRegion(mudSleeperNpcState))
            ForceMudSleeperTeleportToEnd(mudSleeperNpcState);
    }

    void ForceMudSleeperTeleportToEnd(AGothicCharacterState MudSleeperCharacterState)
    {
        auto abComp = MudSleeperCharacterState.AbilitySystemComponent;
        abComp.SendGameplayEvent(GameplayTag::Event_Teleport_Scripted_MudSleeper_ToEnd, FGameplayEventData());
    }

    bool IsMudSleeperIsInRegion(AGothicCharacterState MudSleeperCharacterState)
    {
        if(MudSleeperCharacterState == nullptr)
            return false;        
        return m_CurrentCharacters.Contains(MudSleeperCharacterState);
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldHandleCharacter(const AGothicCharacterState CharacterState) const
    {
        return m_ShouldHandleCharacter;
    }
}
