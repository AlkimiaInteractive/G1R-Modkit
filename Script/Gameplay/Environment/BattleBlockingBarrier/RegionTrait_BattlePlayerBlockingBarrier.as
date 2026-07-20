delegate void FCharacterEnteringRegionDelegate(AGothicCharacterState CharacterState);
delegate void FCharacterLeavingRegionDelegate(AGothicCharacterState CharacterState);
UCLASS(meta=(DisplayName="Battle Player Blocking Barrier Trait"))
class URegionTrait_BattlePlayerBlockingBarrier : URegionTrait
{
    FCharacterEnteringRegionDelegate OnCharacterEnteringRegionDelegate;
    FCharacterLeavingRegionDelegate OnCharacterLeavingRegionDelegate;

    UPROPERTY()
    bool m_ShouldHandleCharacter = false;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(CharacterState.IsPlayerControlled() && CharacterState.IsPlayerCharacter())
            OnCharacterEnteringRegionDelegate.ExecuteIfBound(CharacterState);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if(CharacterState.IsPlayerControlled() && CharacterState.IsPlayerCharacter())
            OnCharacterLeavingRegionDelegate.ExecuteIfBound(CharacterState);
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldHandleCharacter(const AGothicCharacterState CharacterState) const
    {
        return m_ShouldHandleCharacter;
    }
}
