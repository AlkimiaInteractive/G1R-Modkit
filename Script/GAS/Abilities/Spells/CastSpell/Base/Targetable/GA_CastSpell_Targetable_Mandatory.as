
class UGA_CastSpell_Targetable_Mandatory : UGA_CastSpell_Targetable
{
    default m_ExecutionValidator = UCastSpellExecutionValidatorTargeableBase::StaticClass();

    UFUNCTION(BlueprintOverride)
    void OnActivateAbilityBeforeAssetPreload_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                                        FGameplayEventData TriggerEventData)
    {
        m_FilterConfigClass = GetFilterClassFromConfig_Scriptable();
        m_SpellConfig = Cast<USpellTraceConfigBase>(m_SpellConfigClass.Get().GetDefaultObject());
    }

    AActor GetTargetFromTargetDataModule(UAbilitySystemComponent AbComp) const
    {
        if(AbComp == nullptr)
            return nullptr;
        auto isActive = MagicScript::IsActivaAbilityByClass(AbComp, UGameplayAbilityTargetCombat::StaticClass());
        if(isActive)
        {
            auto target = GetTarget();
            if(target != nullptr)
                return target;
        }
        return nullptr;
    }

    AActor GetTargetFromCustomAcquisition(AActor SourceActor, float TraceRange, float TraceRadius, TSubclassOf<AActor> FilterConfigClass) const
    {
        auto targets = GetCustomTarget_Scriptable(SourceActor, TraceRange, TraceRadius, FilterConfigClass);
        if(targets.Num() == 0)
            return nullptr;
        return targets[0];
    }

    UFUNCTION(BlueprintOverride)
    AActor GetFocusedTarget_Scriptable(AActor AvatarActor) const
    {
        if(AvatarActor == nullptr)
            return nullptr;
        //If we have targeted with the target ability, we return the selected one insted, We use the custom target acquisition
        AActor targetActor;
        targetActor = GetTargetFromTargetDataModule(Cast<AGothicCharacter>(AvatarActor).GetAbilitySystemComponent());
        if(targetActor == nullptr)
        {
            return GetTargetFromCustomAcquisition(AvatarActor, GetTraceRangeFromConfig_Scriptable(), GetTraceRadiusFromConfig_Scriptable(), GetFilterConfigClass());
        }

        return targetActor;
    }
    

    UFUNCTION(BlueprintOverride)
    TArray<AActor> GetCustomTarget_Scriptable(AActor SourceActor, float TraceRange, float TraceRadius,
                                              TSubclassOf<AActor> FilterClass) const
    {
        TArray<AActor> targets;
        TArray<AActor> actors_ignore;
        actors_ignore.Add(SourceActor);
        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(m_CollisionChannel);
        
        FCollisionResponseContainer responses = GetCollisionResponses_Scriptable();
        FHitResult hit_result;
        bool hit = MagicScript::GetSingleActorTargetFromCameraBySphere(
            Cast<AGothicCharacter>(SourceActor),
            TraceRange,
            TraceRadius,
            trace_type,
            false,
            responses,
            actors_ignore,
            EDrawDebugTrace::None,
            hit_result,
            true, FLinearColor::Green, FLinearColor::Red, 5.f);

        if(hit)
        {
            if(IsValid(hit_result.Actor) && hit_result.Actor.IsA(FilterClass))
            {
                targets.Add(hit_result.Actor);
            }
        }

        return targets;
    }


    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {
        //Print("CanLaunchSpellAbilityServer_Scriptable", 10.f, FLinearColor::Blue);
        auto sourceActor = GetAvatarActorFromActorInfo();
        return IsTargetValid_Script(sourceActor, GetFocusedTarget_Scriptable(sourceActor));
    }

    UFUNCTION(BlueprintOverride)
    void OnTargetValidated_Scriptable(AActor Actor)
    {
        //if(Actor == nullptr)
        //    Print("OnTargetValidated_Scriptable - Actor == nullptr", 10.f, FLinearColor::Red);
        //m_Target = Actor;
    }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        Super::OnEndCastSpellServer_Scriptable(WasCancelled);

        if(IsOwnerActorAuthoritative())
        {
            if(!HasCreatedSpellAbilityServer())
            {
                //DoTargetDeactivation();
            }
        }
    }

    // UFUNCTION(Client)
    // void ClientDoTargetDeactivation()
    // {
    //     if(!IsOwnerActorAuthoritative())
    //     {
    //         DoTargetDeactivation();
    //     }
    // }

    // void DoTargetDeactivation()
    // {
    //     DeactivateTarget();
    //     ClientDoTargetDeactivation();
    // }


    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        auto sourceActor = GameplayAbilityActorInfo.AvatarActor;
        return IsTargetValid_Script(sourceActor, GetFocusedTarget_Scriptable(sourceActor));
    }

}