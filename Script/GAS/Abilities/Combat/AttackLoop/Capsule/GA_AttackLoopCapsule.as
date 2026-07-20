class UGA_AttackCapsuleLoop : UGA_AttackLoop
{
    UPROPERTY()
    UHitCapsuleCollisionComponent m_HitComp;
    UPROPERTY()
    UAttackCapsuleLoopConfig m_CapsuleConfigAttack;

    default m_TickEnabled = true;
    default m_bCanEverTick = true;

    UPROPERTY()
    bool m_ResizeCollisionCompleted = false;

    UFUNCTION(BlueprintOverride)
    void InitializeCollisionComponent(UPrimitiveComponent CollisionComp, const UAttackLoopConfig configAttack)
    {
        m_ResizeCollisionCompleted = false;
        m_HitComp = Cast<UHitCapsuleCollisionComponent>(CollisionComp);
        m_CapsuleConfigAttack = Cast<UAttackCapsuleLoopConfig>(configAttack);
        
        if(m_HitComp != nullptr && m_CapsuleConfigAttack != nullptr)
		{
            m_HitComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
            SetCapsuleLocalDisplacement(m_HitComp, 0);
            //hitComp.SetCapsuleHalfHeight(capsuleLoopConfigAttack.GetCapsuleHalfHeight());
            m_HitComp.SetCapsuleHalfHeight(0);
            //Print("INITIALIZED ON LOOP??????", 5.f, FLinearColor::Red);
            
			m_HitComp.SetCapsuleRadius(m_CapsuleConfigAttack.GetCapsuleRadius());
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
        if(m_HitComp == nullptr || m_CapsuleConfigAttack == nullptr)
            return;
        auto currentLength = m_HitComp.GetScaledCapsuleHalfHeight();
        auto finalLength = m_CapsuleConfigAttack.GetCapsuleHalfHeight();
        //auto a = Math::Abs(finalLength - currentLength);
        if(!Math::IsNearlyEqual(currentLength, finalLength, 50.f))
        {
            // auto cur = currentLength;
            // auto spe = m_CapsuleConfigAttack.GetCapsuleLengthSpeed();
            // auto del = DeltaTime;
            // auto mul = m_CapsuleConfigAttack.GetCapsuleLengthSpeed() * DeltaTime;
            // FString text = "Current: ";
            // text.Append(FString::ApplyFormat(cur, FString()));
            // text.Append(" - speed: ");
            // text.Append(FString::ApplyFormat(spe, FString()));
            // text.Append(" - delta: ");
            // text.Append(FString::ApplyFormat(del, FString()));
            // text.Append(" - speed * delta: ");
            // text.Append(FString::ApplyFormat(mul, FString()));
            // text.Append(" - new length: ");


            float newLength  = currentLength + m_CapsuleConfigAttack.GetCapsuleLengthSpeed() * DeltaTime;
            //text.Append(FString::ApplyFormat(newLength, FString()));
         
            // if(currentLength > finalLength)
            //     newLength = finalLength; 
            // if(newLength < currentLength)
            // {
                
            //     Print("WTF");
            // }
            // text.Append(" - FINAL: ");
            // text.Append(FString::ApplyFormat(newLength, FString()));
             //  Print(text);
                
            //float newLength = Math::Min(currentLength + m_CapsuleConfigAttack.GetCapsuleLengthSpeed() * DeltaTime, finalLength);
            //Print(FString::ApplyFormat(newLength, FString()));
            m_HitComp.SetCapsuleHalfHeight(newLength);
            SetCapsuleLocalDisplacement(m_HitComp, newLength);
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

    void SetCapsuleLocalDisplacement(UHitCapsuleCollisionComponent HitComp, float CapsuleHalfHeight)
    {
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldUpdateTaskUseComponentRotation_Scriptable()
    {
        return true;
    }
}