UCLASS(meta=(DisplayName="Base Class For Gameplay Effect Region Trait"))
class URegionTrait_GameplayEffectBase : UGameplayEffectRegionTrait
{
    UPROPERTY()
    TMap<AActor, FActiveGameplayEffectHandle> m_TargetsMap;

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_TraitGameplayEffect;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicAbilitySystemComponent sourceAbComp = AbilitySystem;
        UGothicAbilitySystemComponent targetAbComp = CharacterState.AbilitySystemComponent;
        auto character = CharacterState.Character;

        if(!CanApplyEffect(sourceAbComp, targetAbComp, character))
        {
            return;
        }
        

        DoHandleCharacterEnteringRegion(sourceAbComp, targetAbComp);
    }

    bool CanApplyEffect(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, AGothicCharacter character)
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || character == nullptr || m_TargetsMap.Contains(character))
        {
            return false;
        }
        return true;
    }

    //Override this function if your overlap shape needs more functionality
    void DoHandleCharacterEnteringRegion( UGothicAbilitySystemComponent SourceAbComp,  UGothicAbilitySystemComponent TargetAbComp)
    {

        FActiveGameplayEffectHandle handle = ApplyGameplayEffectToTarget(SourceAbComp, TargetAbComp);
        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
            OnEffectAppliedSuccessfully(TargetAbComp.GetAvatar(), handle);
    }
    
    //Override this function if your overlap shape doesnt need do damage.
    //Default behaviour its do damage
    UFUNCTION()
    FActiveGameplayEffectHandle ApplyGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp)
    {
        FGameplayEffectContextHandle context = sourceAbComp.MakeEffectContext();

        //For perception, we use AGothicCharacterState as Instigator
        context.AddInstigator(sourceAbComp.GetAvatar(), sourceAbComp.GetAvatar());
        FGameplayEffectSpecHandle specStackHandle = sourceAbComp.MakeOutgoingSpec(m_TraitGameplayEffect, 1.0f, context);
        return sourceAbComp.ApplyGameplayEffectSpecToTarget(specStackHandle, targetAbComp);       
    }


    void OnEffectAppliedSuccessfully(AActor TargetActor, FActiveGameplayEffectHandle handle)
    {
        m_TargetsMap.Add(TargetActor, handle);
        ApplyTargetVisuals(TargetActor);
    }


    //@DE - Event to notify the actor blueprint about a new target. Used for visuals on bp.
    UFUNCTION(BlueprintEvent, NetMulticast)
    void ApplyTargetVisuals(AActor TargetActor)
    {

    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        auto character = CharacterState.Character;
        if(RemoveEffectToTarget(character))
        {
            //Print("Removed");
            if(m_TargetsMap.Contains(character))
                m_TargetsMap.Remove(character);
        }
    }

    bool RemoveEffectToTarget(AActor OtherActor)
    {
        if(!m_TargetsMap.Contains(OtherActor))
            return false;

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        return RemoveGameplayEffectToTarget(targetAbComp, m_TargetsMap[OtherActor]);
    }


    UFUNCTION()
    bool RemoveGameplayEffectToTarget(UGothicAbilitySystemComponent TargetAbComp, FActiveGameplayEffectHandle Handle)
    {
        if(TargetAbComp != nullptr && m_TargetsMap.Contains(TargetAbComp.GetAvatar()))
        {
            return TargetAbComp.RemoveActiveGameplayEffect(Handle);
        }
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void HandleHandleOwnerEndPlay()
    {   
        for(auto target : m_TargetsMap)
        {
            UGothicAbilitySystemComponent targetGothicAbComp = Cast<UGothicAbilitySystemComponent>(GothicGAS::GetAbilitySystemComponent(target.Key));
            if(targetGothicAbComp != nullptr)
            {
                RemoveGameplayEffectToTarget(targetGothicAbComp, target.Value);
            }
              
        }

        m_TargetsMap.Empty();
     }


}