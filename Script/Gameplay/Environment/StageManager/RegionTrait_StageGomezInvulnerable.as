UCLASS(meta=(DisplayName="Stage Gomez Invulnerable Region Trait"))
class URegionTrait_StageGomezInvulnerable : URegionTrait_GameplayEffectBase
{
    default m_TraitGameplayEffect = UGE_State_Invulnerable_StageBarrier::StaticClass();

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey_Concert_Completed = n"InExtremo_Concert_Completed";

   bool CanApplyEffect(UGothicAbilitySystemComponent sourceAbComp,
                       UGothicAbilitySystemComponent targetAbComp, AGothicCharacter character) override
   {
        if(!Super::CanApplyEffect(sourceAbComp, targetAbComp, character))
            return false;
        if(!character.GetCharacterUniqueName().IsEqual(n"OC_EBR_Gomez_100"))
            return false;
        if(IsConcertCompleted())
            return false;
        return true;
   }

   bool IsConcertCompleted()
   {
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey_Concert_Completed, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                return true;
            } 
        }
        return false;
   }
}


class UGE_State_Invulnerable_StageBarrier : UGE_State_Invulnerable
{
	
}