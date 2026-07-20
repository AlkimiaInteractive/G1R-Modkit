UCLASS()
class UWeaponDefinitionFocusStonePuzzle : UWeaponDefinition
{
    UPROPERTY()
    float m_TimeToApplyDamage = 1.f;
}
UCLASS()
class UElectrifiedAreaDefinition : UWeaponDefinitionFocusStonePuzzle
{
	default m_Name = "ElectrifiedArea";

	default m_HitEffect = UGE_ElectrifiedArea_FocusStonePuzzle_Impact_Damage::StaticClass();
    //@DE - This value is the percentage calculator for the damage
    //Ex: A value of 33.33 will do 33.33% of damage based on the max health
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 34.f);
    default SetItemType(GameplayTag::Item_Weapon_Environment);

	default m_SuperArmorDamageBase = 0.0f;

	UPROPERTY()
	float m_ZoneRadius = 1000.f;

    default m_TimeToApplyDamage = 9.f;

    UPROPERTY()
    float m_ConeLenght = 600.f;
}


UCLASS()
class AElectrifiedArea : ASpellVisual
{
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

	UPROPERTY(DefaultComponent, EditAnywhere, Attach =m_RootComp)
	UHitConeCollisionComponent m_CollisionComp;
    default m_CollisionComp.m_WeaponData = UElectrifiedAreaDefinition::StaticClass();
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_GE_ElectrifiedRemoval = UGE_Damage_Electrified_Infinite_Area_Removal::StaticClass();

    
    UPROPERTY()
    TMap<AActor, FActiveGameplayEffectHandle> m_Targets;
    UPROPERTY()
    private FTimerHandle TaskTimer;
   
    UPROPERTY()
    UElectrifiedAreaDefinition m_def;

    default bNeverApplyTickOptimizations = true;

    UPROPERTY()
    TMap<AGothicCharacterState, UDelegateHandleContainer> m_OnTargetDieMeBeforeHandle;
    UPROPERTY()
    TMap<AGothicCharacterState, UDelegateHandleContainer> m_OnTargetDefeatMeBeforeHandle;

    UFUNCTION(BlueprintCallable)
    void SetActivateDamage(bool mustActivate)
    {
        if(m_CollisionComp.m_WeaponData == nullptr)
        {
            return;
        }
        m_def = Cast<UElectrifiedAreaDefinition>(m_CollisionComp.m_WeaponData.Get().GetDefaultObject());
        if(m_def == nullptr)
        {
            return;
        }
        if(mustActivate)
        {
            m_CollisionComp.SetState(EHitColliderState::Damage);
            ActivateOverlapTimer();
        }
        else
        {
            m_CollisionComp.SetState(EHitColliderState::None);
            if(System::IsTimerActiveHandle(TaskTimer))
                System::ClearAndInvalidateTimerHandle(TaskTimer);
            
            auto targetsCopy = m_Targets;
            for(auto target : targetsCopy)
            {
                RemoveDamage(target.Key);
            }
            m_Targets.Empty();
        }
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(this);
        sourceAbComp.AddLooseGameplayTag(GameplayTag::Filter_Damage_FocusStoneMachine);
        SetCustomCollisionResponse();
        if(m_CollisionComp.m_WeaponData != nullptr)
        {
            m_def = Cast<UElectrifiedAreaDefinition>(m_CollisionComp.m_WeaponData.Get().GetDefaultObject());
            if(m_def != nullptr)
            {
                m_CollisionComp.SetState(EHitColliderState::None);
                m_CollisionComp.SetHiddenInGame(true);
                m_CollisionComp.ConeLength = m_def.m_ConeLenght;
            }
        }
    }

    

    void SetCustomCollisionResponse()
    {
        m_CollisionComp.m_CustomCollisionResponse.Add(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
    }

    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {

        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(this);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);

        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(OtherActor);
        if(targetCharacter == nullptr)
            return;
        
        if(targetAbComp == nullptr || m_Targets.Contains(OtherActor))
        {
            return;
        }

        if(targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) || targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return;
        }

        DoDamage(sourceAbComp, targetAbComp, SweepResult);
    }

    void DoDamage(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, FHitResult SweepResult)
    {
        FActiveGameplayEffectHandle handle = ApplyGameplayEffectToTarget(sourceAbComp, targetAbComp, SweepResult);
        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
        {
            m_Targets.Add(targetAbComp.GetAvatar(), handle);
            auto dieHandle = MagicScript::AttachToEventTag(targetAbComp.GetAvatar(), GameplayTag::Event_Die_Me_Before, this, n"OnTargetDeath");
            auto defeatHandle = MagicScript::AttachToEventTag(targetAbComp.GetAvatar(), GameplayTag::Event_Defeated_Me, this, n"OnTargetDefeat");
            m_OnTargetDieMeBeforeHandle.Add(Cast<AGothicCharacter>(targetAbComp.GetAvatar()).GetCharacterState(), dieHandle);
            m_OnTargetDefeatMeBeforeHandle.Add(Cast<AGothicCharacter>(targetAbComp.GetAvatar()).GetCharacterState(), defeatHandle);
        }
            
    }

    UFUNCTION()
    void OnTargetDeath(FGameplayEventData GameplayEventData)
    {
        RemoveDamage(GameplayEventData.Target);
    }

    UFUNCTION()
    void OnTargetDefeat(FGameplayEventData GameplayEventData)
    {
        RemoveDamage(GameplayEventData.Target);
    }

    void RemoveDamage(const AActor OtherActor)
    {        
        if(!m_Targets.Contains(OtherActor))
            return;
        
        auto gothicCharacter = Cast<AGothicCharacter>(OtherActor);
        UGothicAbilitySystemComponent targetAbComp = Cast<UGothicAbilitySystemComponent>(gothicCharacter.GetAbilitySystemComponent());
        if(RemoveGameplayEffectToTarget(targetAbComp, m_Targets[OtherActor]))
        {
            m_Targets.Remove(targetAbComp.GetAvatar());
            auto targetCharacterState = Cast<AGothicCharacter>(targetAbComp.GetAvatar()).GetCharacterState();
            if(m_OnTargetDieMeBeforeHandle.Contains(targetCharacterState))
            {
                MagicScript::DetachFromEvent(targetAbComp.GetAvatar(), m_OnTargetDieMeBeforeHandle[targetCharacterState]);
                m_OnTargetDieMeBeforeHandle.Remove(targetCharacterState);
            }
            if(m_OnTargetDefeatMeBeforeHandle.Contains(targetCharacterState))
            {
                MagicScript::DetachFromEvent(targetAbComp.GetAvatar(), m_OnTargetDefeatMeBeforeHandle[targetCharacterState]);
                m_OnTargetDefeatMeBeforeHandle.Remove(targetCharacterState);
            }
        }
            
    }

    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        if(OtherActor == nullptr)
            return;
        if(CheckIsOverlappingActor(OtherActor))
            return;
        //Log("AElectrifiedZone::OnEndOverlap " + OtherActor.Name);
        RemoveDamage(OtherActor);
    }

    bool CheckIsOverlappingActor(AActor OtherActor)
    {
        if(m_CollisionComp.GetState() != EHitColliderState::Damage)
            return false;
        TArray<AActor> overlappingActors;
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto actor : overlappingActors)
        {
            if(actor == OtherActor)
                return true;
        }
        return false;
    }

    UFUNCTION()
    FActiveGameplayEffectHandle ApplyGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, const FHitResult&in SweepResult)
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || m_CollisionComp.m_WeaponData == nullptr || m_Targets.Contains(targetAbComp.GetAvatar()))
        {
            return FActiveGameplayEffectHandle();
        }

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Dot;
        hit_data.WeaponUsed = m_CollisionComp.m_WeaponData;
        return GothicGAS::ApplyDamageTo(sourceAbComp, Gameplay::GetPlayerCharacter(0), this, targetAbComp, hit_data, SweepResult);
    }

    UFUNCTION()
    bool RemoveGameplayEffectToTarget(UGothicAbilitySystemComponent TargetAbComp, FActiveGameplayEffectHandle Handle)
    {
        if(TargetAbComp != nullptr && m_Targets.Contains(TargetAbComp.GetAvatar()))
        {
            if(MagicScript::IsValidGameplayEffectHandle(Handle))
                return TargetAbComp.RemoveActiveGameplayEffect(Handle);
            else
            {
                UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(this);
                auto handle = sourceAbComp.ApplyGameplayEffectToTarget(m_GE_ElectrifiedRemoval, TargetAbComp, 1, sourceAbComp.MakeEffectContext());
                return MagicScript::WasSuccessfullyApplied(handle);
            }
        }
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        m_CollisionComp.SetState(EHitColliderState::None);

        m_CollisionComp.OnComponentBeginOverlap.Unbind(this, n"OnBeginOverlap");
        for(auto target : m_Targets)
        {
            UGothicAbilitySystemComponent targetGothicAbComp = Cast<UGothicAbilitySystemComponent>(GothicGAS::GetAbilitySystemComponent(target.Key));
            if(targetGothicAbComp != nullptr)
               RemoveGameplayEffectToTarget(targetGothicAbComp, target.Value);
        }

        m_Targets.Empty();

        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }


    void ActivateOverlapTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OverlapCheck"), .5f, true);
    }

    UFUNCTION()
    void OverlapCheck()
    {
        TArray<AActor> overlappingActors;
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicPlayerCharacter::StaticClass());
        for(auto overlapActor : overlappingActors)
        {
            if(!m_Targets.Contains(overlapActor))
            {
                OnBeginOverlap(nullptr, overlapActor, nullptr, 0, false, FHitResult());
            }
        }
    }
}
