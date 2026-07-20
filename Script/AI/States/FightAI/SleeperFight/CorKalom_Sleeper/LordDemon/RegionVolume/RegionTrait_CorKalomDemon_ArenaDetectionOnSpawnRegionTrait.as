UCLASS(meta=(DisplayName="Cor Kalom Demon Arena Detection On Spawn Region Trait"))
class URegionTrait_CorKalomDemon_ArenaDetectionOnSpawnRegionTrait : URegionTrait
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
            CharacterState.AbilitySystemComponent.AddTag(GameplayTag::State_CorKalomDemon_InArena);
            m_CharactersInRegionTrait.Add(CharacterState);
        }  
        else
        {
            TArray<ACorKalomDemonCollider> outActors;
            GetAllActorsOfClass(ACorKalomDemonCollider::StaticClass(), outActors);
            if(!outActors.IsEmpty())
            {
                IgnoreCharacter(outActors[0].m_ColliderMesh, CharacterState.Character, true);
            } 
        }         
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if(m_CharactersInRegionTrait.Contains(CharacterState))
        {
            CharacterState.AbilitySystemComponent.RemoveTag(GameplayTag::State_CorKalomDemon_InArena);
            m_CharactersInRegionTrait.Remove(CharacterState);
        }
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldHandleCharacter(const AGothicCharacterState CharacterState) const
    {
        return m_ShouldHandleCharacter;
    }

    void IgnoreCharacter(UStaticMeshComponent BlockingMesh, AGothicCharacter Character, bool ShouldIgnore)
    {
        BlockingMesh.IgnoreActorWhenMoving(Character, ShouldIgnore);
        Character.CapsuleComponent.IgnoreComponentWhenMoving(BlockingMesh, ShouldIgnore);
        BlockingMesh.IgnoreComponentWhenMoving(Character.CapsuleComponent, ShouldIgnore);
    }
}
