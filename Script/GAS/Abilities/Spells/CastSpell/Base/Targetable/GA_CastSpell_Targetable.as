UCLASS(Abstract)
class UGA_CastSpell_Targetable : UGA_CastSpell_Default
{
    //@DE - Base class for targetable and Heal spell (it can be targetable or not.)

    //@DE - This spell requires a direct reference to the Telekinesis USpellConfig because need to check the target on the OnCanActivateAbility function.
    // In that funcion we CANT use the context due the ability is not instantiated yet and that generates a crash with IMGUI for example.
    //The best solution is have a reference to the config.
    UPROPERTY()
    TSubclassOf<USpellConfig> m_SpellConfigClass;
    UPROPERTY()
    USpellTraceConfigBase m_SpellConfig;
    UPROPERTY()
    ECollisionChannel m_CollisionChannel = ECollisionChannel::ECC_Visibility; //Channel for target detection. Used for get the target
    UPROPERTY()
    ECollisionChannel m_ReachableCollisionChannel = ECollisionChannel::ECC_Visibility; //Channel to check target visual. Used to check if there are obstacles between caster and target
    UPROPERTY()
    TSubclassOf<URuneSpellContainer> m_WeaponContainer;
    UPROPERTY()
    TSubclassOf<AActor> m_FilterConfigClass;

    TSubclassOf<AActor> GetFilterConfigClass() const
    {
        if(m_FilterConfigClass == nullptr)
            return GetFilterClassFromConfig_Scriptable();
        return m_FilterConfigClass;
    }

    UFUNCTION(BlueprintOverride)
    TSubclassOf<AActor> GetFilterClassFromConfig_Scriptable() const
    {
        auto weaponConfig = Cast<URuneSpellContainer>(m_WeaponContainer.Get().GetDefaultObject());
        if(weaponConfig == nullptr)
            return nullptr;

        auto targetConfig = Cast<UTargetConfigBase>(weaponConfig.GetTargetConfigClass().Get().GetDefaultObject());
        if(targetConfig == nullptr)
            return nullptr;

        return targetConfig.GetTargetFilterClass();
    }

    FCollisionResponseContainer GetCollisionResponses_Scriptable() const
    {
        FCollisionResponseContainer responses;
        responses.SetAllChannels(ECollisionResponse::ECR_Ignore);
        responses.SetResponse(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Block);
        
        return responses;
    }

    USpellTraceConfigBase GetConfig() const
    {
        if(m_SpellConfig == nullptr)
            return Cast<USpellTraceConfigBase>(m_SpellConfigClass.Get().GetDefaultObject());
        return m_SpellConfig;
    }

    UFUNCTION(BlueprintOverride)
    float GetTraceRangeFromConfig_Scriptable() const
    {
        return GetConfig().m_AreaRange;
    }

    UFUNCTION(BlueprintOverride)
    float GetTraceRadiusFromConfig_Scriptable() const
    {
        return GetConfig().m_TraceRadius;
    }

    UFUNCTION(BlueprintOverride)
    bool IsTargetValid_Script(AActor SourceActor, AActor TargetActor) const
    {
        USpellExecutionValidatorDataTargetable data = Cast<USpellExecutionValidatorDataTargetable>(CreateSpellValidatorExecutionData());
        return DoExecutionValidation(data, SourceActor, TargetActor);
    }
  
    bool DoExecutionValidation(USpellExecutionValidatorDataTargetable data, AActor SourceActor, AActor TargetActor) const
    {
        InitializeValidatorData(data, SourceActor, TargetActor);
        return ExecuteValidator(data);
    }

    void InitializeValidatorData(USpellExecutionValidatorDataDefault Data, AActor SourceActor, AActor TargetActor) const
    {
        USpellExecutionValidatorDataTargetable data = Cast<USpellExecutionValidatorDataTargetable>(Data);
        data.SourceActor = SourceActor;
        data.TargetActor = TargetActor;
        data.FilterClass = GetFilterConfigClass().Get();
        data.ReachableCollisionChannel = m_ReachableCollisionChannel;
    }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        if(!WasCancelled)
            return;
        if(!WasTargetObtainedByTargetDatamodule())
            DeactivateTarget();
    }

}