class UGA_CastSpell_Heal : UGA_CastSpell_Targetable
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_Heal::StaticClass();
    default m_TriggerBeginOnSpellTag = GameplayTag::Ability_Action_Spell_Throw_Heal;

    default m_SpellConfigClass = UHealSpellConfig::StaticClass();
    default m_WeaponContainer = UItAr_Rune_Heal_Base::StaticClass();

    default m_CollisionChannel = ECollisionChannel::ECC_Visibility; //Channel for target (Character) detection. Used for get the target

    default m_ExecutionValidator = UCastSpellExecutionValidatorHeal::StaticClass();

    UFUNCTION(BlueprintOverride)
    void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
    {
        auto abComp = GetAbilitySystemComponentFromActorInfo();
        abComp.AddLooseGameplayTag(GameplayTag::State_CanTargetYourself);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        Super::OnEndCastSpellServer_Scriptable(WasCancelled);
        
        auto abComp = GetAbilitySystemComponentFromActorInfo();
        abComp.RemoveLooseGameplayTag(GameplayTag::State_CanTargetYourself);
    }

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        auto sourceActor = GameplayAbilityActorInfo.AvatarActor;
        auto target = GetTarget();
        if(target == nullptr)
            target = sourceActor;
        return IsTargetValid_Script(sourceActor, target);
    }

    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {
        //Print("CanLaunchSpellAbilityServer_Scriptable", 10.f, FLinearColor::Blue);
        auto sourceActor = GetAvatarActorFromActorInfo();
        auto target = GetTarget();
        if(target == nullptr)
            target = sourceActor;
        return IsTargetValid_Script(sourceActor, target);
    }

    // UFUNCTION(BlueprintOverride)
    // bool IsTargetValid_Script(AActor SourceActor, AActor TargetActor) const
    // {
    //     UHealSpellExecutionValidatorData data = Cast<UHealSpellExecutionValidatorData>(CreateSpellValidatorExecutionData());
    //     return DoExecutionValidation(data, SourceActor, TargetActor);
    // }
  
    // bool DoExecutionValidation(USpellExecutionValidatorDataTargetable data, AActor SourceActor, AActor TargetActor) const override
    // {
    //     InitializeValidatorData(data, SourceActor, TargetActor);
    //     return ExecuteValidator(data);
    // }

    // void InitializeValidatorData(USpellExecutionValidatorDataTargetable Data, AActor SourceActor, AActor TargetActor) const
    // {
    //     Data.SourceActor = SourceActor;
    //     Data.TargetActor = TargetActor;
    // }

    // UFUNCTION(BlueprintOverride)
    // bool IsTargetValid_Script(AActor SourceActor, AActor TargetActor) const
    // {
    //     if(TargetActor == nullptr)
    //         return false;

    //     if(TargetActor != SourceActor)
    //     {
    //         //if(!IsVisibleTarget(targetActor))
    //         if(!MagicScript::IsTargetReachable(SourceActor, TargetActor, ECollisionChannel::ECC_Visibility))
    //             return false;
    //     }

    //     const auto gothicCharacter = Cast<AGothicCharacter>(TargetActor);
    //     if(gothicCharacter.IsDead() || gothicCharacter.IsDefeated())
    //         return false;   

    //     return gothicCharacter.GetHealthAttribute() < gothicCharacter.GetMaxHealthAttribute();
    // }

        //Check there is a straight line between the target and the caster
    // bool IsTargetReachable(const AActor TargetActor)
    // {
    //     if(TargetActor == nullptr)
    //         return false; 

    //     TArray<AActor> targets;      
    //     TArray<AActor> actors_ignore;

    //     FVector start = TargetActor.GetActorLocation();
    //     FVector end = GetAvatarActorFromActorInfo().GetActorLocation();

    //     actors_ignore.Add(TargetActor);

    //     ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);
        
    //     FHitResult hit_result;
    //     bool hit = System::LineTraceSingle(
    //         start,
    //         end,
    //         trace_type, 
    //         false,
    //         actors_ignore,
    //         EDrawDebugTrace::Persistent,
    //         hit_result,
    //         true,
    //         FLinearColor::Purple);

    //     if(hit)
    //     {
    //         if(hit_result.Actor == GetAvatarActorFromActorInfo())
    //         {
    //             return true;
    //         }            
    //     }
    //     return false;
    // }
}