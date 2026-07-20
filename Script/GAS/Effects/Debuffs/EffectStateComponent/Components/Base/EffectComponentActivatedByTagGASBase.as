UCLASS()
class UEffectComponentActivatedByTagGASBase : UEffectComponentActivatedByTagGAS
{
    FGameplayTag m_PerceptionStartTag = FGameplayTag();
    FGameplayTag m_PerceptionEndTag = FGameplayTag();

    FGameplayTag m_PerceptionTagWhenLoad = FGameplayTag();
    
    void ReportPerceptionEvent(FGameplayTag PerceptionTag, AActor Instigator, AGothicCharacter Target)
    {
        if (Target == nullptr || !Instigator.IsA(AGothicCharacter))
            return;

        Target.Perception.ReportPerceptionEvent(
            PerceptionTag,
            Target.ActorLocation,
            SensedCharacter = Target,
            TargetActor = Target,
            InstigatorActor = Instigator,
            AffectedActor = Target
        );

        //  UPerceptionSystem PS = UPerceptionSystem::Get();
        // PS.BroadcastPerceptionEvent(
        //     PerceptionTag,
        //     Target.GetActorLocation(),
        //     Instigator,
        //     Target,
        //     Instigator,
        //     Target
        // );
    }

    void MemorizeDebuff(FGameplayEffectContextHandle EffectContext)
    {
        auto InstigatorCharacter = Cast<AGothicCharacter>(EffectContext.Instigator);

        if (!IsValid(InstigatorCharacter))
            return;

        auto TargetCharacter = Cast<AGothicCharacter>(m_Target);

        if (!IsValid(TargetCharacter))
            return;

        auto GTS = UGameTimeSubsystem::Get();

        if(!IsValid(GTS))
            return;

        FMemorizedEvent DebuffEvent;
        DebuffEvent.InstigatorGlobalId = InstigatorCharacter.CharacterGlobalId;
        DebuffEvent.AffectedCharacterGlobalId = TargetCharacter.CharacterGlobalId;

        DebuffEvent.EventTags.AddTag(GameplayTag::Memory_Character_Debuffed);
        DebuffEvent.EventTags.AddTag(m_DebuffEffectTag);
        
        DebuffEvent.Time = GTS.CurrentGameTime;
        DebuffEvent.Position = TargetCharacter.GetActorLocation();


        InstigatorCharacter.CharacterState.LongTermMemory.MemorizeEvent(DebuffEvent);
    }

    UFUNCTION(BlueprintOverride)
    void OnGameplayEffectApplied_Scriptable(FActiveGameplayEffectHandle ActiveGameplayEffectHandle,
                                            FGameplayEffectContextHandle GetContext)
    {
        auto perceptionTag = m_PerceptionStartTag;

        if(m_IsLoadedFromFile)
            perceptionTag = m_PerceptionTagWhenLoad;

        if (!perceptionTag.IsValid())
            return;
        
        ReportPerceptionEvent(perceptionTag, GetContext.Instigator, Cast<AGothicCharacter>(m_Target));
        MemorizeDebuff(GetContext);
    }

    UFUNCTION(BlueprintOverride)
    void OnGameplayEffectRemoved_Scriptable(FActiveGameplayEffectHandle ActiveGameplayEffectHandle,
                                            FGameplayEffectContextHandle GameplayEffectContextHandle)
    {
        if(!m_PerceptionEndTag.IsValid())
            return;
        ReportPerceptionEvent(m_PerceptionEndTag, GameplayEffectContextHandle.Instigator, Cast<AGothicCharacter>(m_Target));
    }
}
