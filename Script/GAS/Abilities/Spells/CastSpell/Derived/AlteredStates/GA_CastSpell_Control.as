class UGA_CastSpell_Control : UGA_CastSpell_Targetable_Character
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_Control::StaticClass();
    default m_SpellConfigClass = UControlSpellConfig::StaticClass();
    default m_WeaponContainer = UItAr_Rune_Control_Base::StaticClass();

    default m_ExecutionValidator = UCastSpellExecutionValidatorControl::StaticClass();
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Control/BP_ControlRay.BP_ControlRay_C'";
    UPROPERTY()
    AControlRayVisual m_RayActor;
    UPROPERTY()
    AGothicCharacter m_TargetCharacter;

    void InitializeValidatorData(USpellExecutionValidatorDataDefault Data, AActor SourceActor,
                                 AActor TargetActor) const override
    {
        Super::InitializeValidatorData(Data, SourceActor, TargetActor);
        UControlSpellExecutionValidatorData data = Cast<UControlSpellExecutionValidatorData>(Data);
        data.TraceRange = GetTraceRangeFromConfig_Scriptable();
    }

    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {
        return IsTargetValid_Script(GetAvatarActorFromActorInfo(),GetTarget());
    }

    UFUNCTION(BlueprintOverride)
    void OnTargetValidated_Scriptable(AActor Actor)
    {
        Super::OnTargetValidated_Scriptable(Actor);

        auto controllerActor = GetAvatarActorFromActorInfo();
        m_RayActor = SpawnRay(Actor, controllerActor);
        
        m_TargetCharacter = Cast<AGothicCharacter>(Actor);
        auto abilitySystemComponent = m_TargetCharacter.AbilitySystemComponent;
       
        //Send UGE_TargetControlledInterruptTasks to interrupt npc tasks before headache animation. Is not necessary to interrupt actions because
        //AI does before for control.
        //abilitySystemComponent.ApplyGameplayEffectToSelf(UGE_TargetControlledInterruptTasks::StaticClass(), 0, abilitySystemComponent.MakeEffectContext());

        abilitySystemComponent.AddLooseGameplayTag(GameplayTag::Debuff_Controlled);

        m_TargetCharacter.Perception.ReportPerceptionEvent(
            GameplayTag::Perception_Spell_Control_Start,
            m_TargetCharacter.ActorLocation,
            SensedCharacter = m_TargetCharacter,
            TargetActor = m_TargetCharacter,
            InstigatorActor = controllerActor,
            AffectedActor = m_TargetCharacter);

    }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        Super::OnEndCastSpellServer_Scriptable(WasCancelled);
        
        if(WasCancelled && IsValid(m_TargetCharacter))
        {
            auto abilitySystemComponent = m_TargetCharacter.AbilitySystemComponent;
            abilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::Debuff_Controlled);
            Print("Cancelled");
            auto controllerActor = GetAvatarActorFromActorInfo();
            m_TargetCharacter.Perception.ReportPerceptionEvent(
            GameplayTag::Perception_Spell_Control_End,
            m_TargetCharacter.ActorLocation,
            SensedCharacter = m_TargetCharacter,
            TargetActor = m_TargetCharacter,
            InstigatorActor = controllerActor,
            AffectedActor = m_TargetCharacter);
        }

        if(IsValid(m_RayActor))
            m_RayActor.DestroyActor();
    }

    AControlRayVisual SpawnRay(AActor TargetActor, AActor SourceActor)
    {
        auto sourceSkeletalMesh = Cast<USkeletalMeshComponent>(SourceActor.GetComponentByClass(USkeletalMeshComponent::StaticClass()));
	    auto sourceHeadLocation = sourceSkeletalMesh.GetSocketLocation(FName("headSocket"));

        auto targetSkeletalMesh = Cast<USkeletalMeshComponent>(TargetActor.GetComponentByClass(USkeletalMeshComponent::StaticClass()));
	    auto targetHeadLocation = targetSkeletalMesh.GetSocketLocation(FName("headSocket"));
 
        FRotator rotation = MagicScript::FindLookAtRotation(sourceHeadLocation, targetHeadLocation);

        AControlRayVisual ray = Cast<AControlRayVisual>(MagicScript::SpawnActorDeferred(m_SpawnActorPath.Get(), FTransform(rotation, sourceHeadLocation)));

        if(ray != nullptr)
        {    
            ray.Initialize(TargetActor, SourceActor, GetCastSectionDuration(FName("In")) + GetLevelCastingTime());
            MagicScript::FinishSpawning(ray, FTransform());
        }
        return ray;
    }
}

class UGA_CastSpell_Scroll_Control : UGA_CastSpell_Control
{
     default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Control::StaticClass();
}