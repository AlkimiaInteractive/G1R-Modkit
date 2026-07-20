UCLASS(meta=(DisplayName="Cor Kalom Demon Arena Falling Through Lava Pit Region Trait"))
class URegionTrait_CorKalomDemon_ArenaFallingThroughLavaPitRegionTrait : URegionTrait
{
    default m_ShouldHandleCharacter = true;

    UPROPERTY()
    TArray<AGothicCharacterState> m_CharactersInRegionTrait;

    UPROPERTY()
    bool m_ShouldHandleCharacter = false;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(CharacterState.GetCharacterDefinition().IsA(UCharacterDefinition_Creature_CorKalomDemon_Sleeper))
        {
            m_CharactersInRegionTrait.Add(CharacterState);
            auto demonComp = UMadCorKalomDemonFightComponent::Get(CharacterState.Character);
            if(demonComp != nullptr)
            {
                //@DE - Something interrupted the anim
                demonComp.OnDeadLock();
            }
        }            
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if(m_CharactersInRegionTrait.Contains(CharacterState))
        {
            m_CharactersInRegionTrait.Remove(CharacterState);
        }
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldHandleCharacter(const AGothicCharacterState CharacterState) const
    {
        return m_ShouldHandleCharacter; 
    }
}
