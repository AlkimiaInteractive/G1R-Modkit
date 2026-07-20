UCLASS()
class AFireDemonHellArmVisual : AGothicGASActor
{
    default bNeverApplyTickOptimizations = true;
    
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USkeletalMeshComponent m_SkeletalComp;

    UPROPERTY()
    AGothicCharacter m_Target;
    UPROPERTY()
    bool m_Activated;

    /*UPROPERTY()
    TSubclassOf<UMeleeWeaponBase_Creature> m_WeaponDefinition = UHellArmWeaponDefinition::StaticClass();*/

    UPROPERTY()
    TSubclassOf<UGameplayAblilitySpellDamageNotify> m_DamageAbility = UGA_HellArms_Damage::StaticClass();

    UFUNCTION(BlueprintCallable)
    void ExecuteAttack(AGothicCharacter Target)
    {
        m_Target = Target;
        FGameplayAbilitySpecHandle handle = AbilitySystem.GiveAbility(m_DamageAbility, 1, -1, nullptr);
        if( MagicScript::IsValidGameplaySpecHandle(handle))
            m_Activated = true;
        else
            m_Activated = false;
    }

    //Implementable On BP with delay node
    UFUNCTION(BlueprintCallable, BlueprintEvent)
    void ExecuteDelayedAttack(AGothicCharacter Target, float minTime, float maxTime)
    {
        
    }

    UFUNCTION(BlueprintCallable)
    void FaceToTarget()
    {
        if(m_Target == nullptr)
            return;
        FRotator rotation = MagicScript::FindLookAtRotation(GetActorLocation(), m_Target.GetActorLocation());
        FRotator currentRot = m_SkeletalComp.GetWorldRotation();
        m_SkeletalComp.SetWorldRotation(FRotator(currentRot.Pitch, rotation.Yaw, currentRot.Roll));
    }

    UFUNCTION(BlueprintCallable, BlueprintEvent)
    UHitBoxCollisionComponent GetCollisionComponent()
    {
        return nullptr;
    }

    UFUNCTION(BlueprintCallable, BlueprintEvent)
    UAnimMontage GetRandomMontage()
    {
        return nullptr;
    }

    UFUNCTION(BlueprintCallable, BlueprintEvent)
    void DoDestroyActor()
    {
        
    }

    UFUNCTION(BlueprintCallable)
    void EnableCollision()
    {
        auto collisionComp = GetCollisionComponent();
        if(collisionComp == nullptr)
            return;
        collisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        collisionComp.SetState(EHitColliderState::Damage);
    }

    UFUNCTION(BlueprintCallable)
    void DisableCollision()
    {
        //Print(FString(GetName()));
        auto collisionComp = GetCollisionComponent();
        if(collisionComp == nullptr)
            return;
        collisionComp.SetState(EHitColliderState::None);
    }

    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        OnTargetReceived(OtherActor, SweepResult);
    }

    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {

    }

    UFUNCTION()
    void OnTargetReceived(AActor OtherActor, const FHitResult SweepResult)
    {
        if(OtherActor == nullptr)
            return;
        OnNewTarget(OtherActor, SweepResult);
    }

    void OnNewTarget(AActor Target, const FHitResult SweepResult)
    {
        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(Target);
        if(targetCharacter == nullptr)
            return;

        if(targetCharacter == Owner)
            return;

        auto collisionComp = GetCollisionComponent();
        if(collisionComp == nullptr)
            return;

        UGothicAbilitySystemComponent sourceAbComp =GothicGAS::GetAbilitySystemComponent(this);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(Target);
        
        auto weaponData = collisionComp.m_WeaponData;

        if(sourceAbComp == nullptr || targetAbComp == nullptr ||  weaponData == nullptr)
        {
            return;
        }
        
        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Standard;
        hit_data.WeaponUsed = weaponData;
        hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(Target.GetActorForwardVector(), Target.GetActorRightVector(), -Owner.GetActorForwardVector());

        GothicGAS::ApplyDamageTo(sourceAbComp, GetOwner(), this, targetAbComp, hit_data, SweepResult);
        
        collisionComp.SetState(EHitColliderState::None);
    }

    void RestartAttackLoop()
    {
       
    }
}