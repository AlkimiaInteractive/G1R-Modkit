class UGA_AttackConeLoop : UGA_AttackLoop
{
    UPROPERTY()
    UHitConeCollisionComponent m_HitComp;
    UPROPERTY()
    UAttackConeLoopConfig m_ConeConfigAttack;
    
    default m_TickEnabled = true;
    default m_bCanEverTick = true;

    UPROPERTY()
    bool m_ResizeCollisionCompleted = false;

    UFUNCTION(BlueprintOverride)
    void InitializeCollisionComponent(UPrimitiveComponent CollisionComp, const UAttackLoopConfig configAttack)
    {
        m_ResizeCollisionCompleted = false;
        m_HitComp = Cast<UHitConeCollisionComponent>(CollisionComp);
        m_ConeConfigAttack = Cast<UAttackConeLoopConfig>(configAttack);
        
        if(m_HitComp != nullptr && m_ConeConfigAttack != nullptr)
		{
            m_HitComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
            //m_HitComp.SetConeLength(m_ConeConfigAttack.GetConeLength());
            m_HitComp.SetConeLength(0);
			m_HitComp.SetHalfAngle(m_ConeConfigAttack.GetConeAngle());
			m_HitComp.SetSphereRadius(m_ConeConfigAttack.GetConeSphereRadius());
            m_HitComp.SetHiddenInGame(true);
		}
    }


    TArray<AActor> GetOverlappingActors() override
    {
        TArray<AActor> overlappingActors;
        m_HitComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        return overlappingActors;
    }


    UFUNCTION()
    void UpdateCollisionComponentSize(float DeltaTime)
    {
        if(m_HitComp == nullptr || m_ConeConfigAttack == nullptr)
            return;
        auto currentLength = m_HitComp.GetConeLength();
        auto finalLength = m_ConeConfigAttack.GetConeLength();
        if(currentLength <= finalLength)
        {
            float newLength = Math::Min(currentLength + m_ConeConfigAttack.GetConeLengthSpeed() * DeltaTime, finalLength);
            m_HitComp.SetConeLength(newLength);
        }
        else
        {
            m_ResizeCollisionCompleted = true;
        }
    }

        UFUNCTION(BlueprintOverride)
    void OnUpdateAbility_Scriptable(float DeltaTime)
    {
        if(!m_ResizeCollisionCompleted)
            UpdateCollisionComponentSize(DeltaTime);
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldUpdateTaskUseComponentRotation_Scriptable()
    {
        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool IsTargetValid_Scriptable(AActor TargetActor)
    {
        if(TargetActor == nullptr)
            return false;
        
        FCollisionResponseContainer responses;
        responses.SetAllChannels(ECollisionResponse::ECR_Ignore);
        responses.SetResponse(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Block);

        bool result = MagicScript::IsTargetReachable(
            GetAvatarActorFromActorInfo(), 
            TargetActor, 
            ECollisionChannel::ECC_Visibility,
            responses);

        if(!result)
            PrintError("GA_AttackLoopCone - IsTargetValid_Scriptable - Target not reachable");
        return result;
    }
}