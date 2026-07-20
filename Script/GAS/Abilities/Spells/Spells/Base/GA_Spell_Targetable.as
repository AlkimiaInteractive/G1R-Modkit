class UGA_Spell_Targetable : UGameplayAbilitySpellTargetable
{
    default m_GE_Mana = UGE_ManaBurn::StaticClass();

    // UFUNCTION(BlueprintOverride)
    // FGameplayTag GetTriggerBeginOnSpellTag_Scriptable()
    // {
    //     return m_TriggerBeginOnSpellTag;
    // }

    UGA_Spell_Targetable()
    {
        BindTriggerBeginOnTag(GetTriggerBeginOnTag());
    }

    FGameplayTag GetTriggerBeginOnTag()
    {
        return FGameplayTag();
    }

    UFUNCTION()
    FActiveGameplayEffectHandle ApplyEffectToTarget(AActor TargetActor, AActor SourceActor, AActor InstigatorActor, bool SetSourceDirection = true)
    {
        UGothicAbilitySystemComponent abSource = GothicGAS::GetAbilitySystemComponent(SourceActor);
        UGothicAbilitySystemComponent abTarget = GothicGAS::GetAbilitySystemComponent(TargetActor);
        FActiveGameplayEffectHandle handle;

        if(abSource != nullptr && abTarget != nullptr)
        {
            FHitResult hit;
            FGameplayEffectContext_HitResponse hit_data;
            hit_data.Impact = GetDamageType();
            TSubclassOf<UWeaponDefinition> WeaponData = GetWeaponDefinitionClass(TargetActor);//Target == avatar ? m_WeaponDataForOwner : m_WeaponDataForTargets;
            hit_data.WeaponUsed = WeaponData;
            if(SetSourceDirection)
                hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(TargetActor.GetActorForwardVector(), TargetActor.GetActorRightVector(), -SourceActor.GetActorForwardVector());

            handle = GothicGAS::ApplyDamageTo(abSource, InstigatorActor, InstigatorActor, abTarget, hit_data, hit);
        }
        return handle;
    }

    UFUNCTION()
    void RemoveEffectFromTarget(AActor TargetToRemove, AActor SourceActor)
    {
        UGothicAbilitySystemComponent abSource = GothicGAS::GetAbilitySystemComponent(SourceActor);
        UGothicAbilitySystemComponent abTarget = GothicGAS::GetAbilitySystemComponent(TargetToRemove);

        if(abSource != nullptr && abTarget != nullptr)
        {
            AActor avatar = GetActorInfo().GetAvatarActor();
            TSubclassOf<UWeaponDefinition> WeaponData =  GetWeaponDefinitionClass(TargetToRemove);//NewTarget == avatar ? m_WeaponDataForOwner : m_WeaponDataForTargets;
            UWeaponDefinition def = Cast<UWeaponDefinition>(WeaponData.Get().GetDefaultObject());
            abTarget.RemoveActiveGameplayEffectBySourceEffect(def.GetHitEffect().Class, abSource);	
        }
    }

    UFUNCTION()
    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionClass(AActor TargetToRemove)
    {
        return nullptr;
    }

    UFUNCTION(BlueprintOverride)
    void PlayLaunchSpell_Scriptable()
    {
        PlayLaunchSpellMontage(NAME_None, false);
    }

    UFUNCTION(BlueprintOverride)
    void OnUpdateSpell_Scriptable(float DeltaTime)
    {        
        if(ShouldEndSpell_Scriptable())
            DoEndSpellAction();
    }

    UFUNCTION(BlueprintCallable, BlueprintOverride)
    bool ShouldEndSpell_Scriptable()
    {
        if(m_Target == nullptr)
        {
            //Print("ShouldEndSpell_Scriptable - target == nullptr", 10.f, FLinearColor::Red);            
            return true;
        }
        if(IsTargetDead())
        {
            //Print("ShouldEndSpell_Scriptable - IsDead()", 10.f, FLinearColor::Yellow);
            return true;
        }
        if (IsTargetDefeated())
        {
            //Print("ShouldEndSpell_Scriptable - IsDefeated()", 10.f, FLinearColor::Purple);
            return true;
        }
        if(!IsTargetVisibleOnServer())
        {
            //Print("ShouldEndSpell_Scriptable - OnVisualInterruption", 10.f, FLinearColor::Gray);
            return true;
        }
        if (IsTargetInvulnerable())
        {
            //Print("ShouldEndSpell_Scriptable - IsTargetInvulnerable()", 10.f, FLinearColor::Teal);
            return true;
        }
        return false;
    }

    bool IsTargetInvulnerable()
    {        
        if(m_Target == nullptr)
            return true;
        const AGothicCharacter gothicTarget = Cast<AGothicCharacter>(m_Target);
        if(gothicTarget == nullptr)
            return true;
        return gothicTarget.GetGothicAbilitySystemComponent().HasTagExact(GameplayTag::State_Invulnerable);
    }

    UFUNCTION(BlueprintOverride)
    void OnNewTarget_Scriptable(AActor NewTarget)
    {
        m_Target = NewTarget;
    }

    // UFUNCTION(BlueprintOverride)
    // void OnEndSpellServer_Scriptable()
    // {
    //     //DeactivateAimCameraFromTarget();
    //     //RemoveSpellStateTag();
    // }

    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable()
    {
        return false;
    }


    UFUNCTION(BlueprintOverride)
    void OnReleaseTarget_Scriptable(AActor entity, AActor target)
    {
        DoEndSpellAction();
    }

    void DeactivateAimCameraFromTarget()
    {
        DeactivateTarget();
    }

    FGameplayTag GetDamageType()
    {
        return GameplayTag::Combat_HitType_Dot;
    }
}