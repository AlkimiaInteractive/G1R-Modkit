UCLASS(meta=(DisplayName="Gorn Sleeper Electrified Cell Trait"))
class URegionTrait_GornSleeperElectrifiedCell : URegionTrait
{
    FCharacterEnteringRegionDelegate OnCharacterEnteringRegionDelegate;
    FCharacterLeavingRegionDelegate OnCharacterLeavingRegionDelegate;

    UPROPERTY()
    TArray<AGothicCharacterState> m_CharactersInRegionTrait;

    UPROPERTY()
    bool m_ShouldHandleCharacter = false;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(CharacterState.IsPlayerControlled() && CharacterState.IsPlayerCharacter())
        {
            OnCharacterEnteringRegionDelegate.ExecuteIfBound(CharacterState);
            m_CharactersInRegionTrait.Add(CharacterState);
        }
        else if(CharacterState.HasGameplayTag(GameplayTag::State_Summoned))
        {
            OnCharacterEnteringRegionDelegate.ExecuteIfBound(CharacterState);
            m_CharactersInRegionTrait.Add(CharacterState);
        }
            
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if(m_CharactersInRegionTrait.Contains(CharacterState))
        {
            OnCharacterLeavingRegionDelegate.ExecuteIfBound(CharacterState);
            m_CharactersInRegionTrait.Remove(CharacterState);
        }
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldHandleCharacter(const AGothicCharacterState CharacterState) const
    {
        return m_ShouldHandleCharacter;
    }
}
