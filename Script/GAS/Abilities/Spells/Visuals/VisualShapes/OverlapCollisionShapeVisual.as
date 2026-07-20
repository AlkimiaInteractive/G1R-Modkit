UCLASS()
class AOverlapCollisionShapeVisual : ACollisionShapeVisual
{
    UPROPERTY()
    FVector m_SelectedSpawnPos;

    default bReplicates = true;
    default ReplicateMovement = false; 

    UPROPERTY(NotVisible)
    int m_StackCountToRemove = -1;


    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        Super::Initialize();

        if(GetWeaponDefinitionSubclass() != nullptr)
        {
            if(!SetUpCollisionShape())
            {
                DestroyActor();
                return;
            }     
        }
        else
        {
            DestroyActor();
        }

    }


    //Override this function if your overlap shape needs more functionality (Example A_FireGolem_EnvironmentAttack_PlayerArenaDetector)
    void DoOnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor,
                        UPrimitiveComponent OtherComp, int32 OtherBodyIndex) override
    {
        Super::DoOnEndOverlap(OverlappedComp, OtherActor, OtherComp, OtherBodyIndex);
        if(RemoveEffectToTarget(OtherActor))
        {
            //Print("Removed");
            if(m_TargetsMap.Contains(OtherActor))
                m_TargetsMap.Remove(OtherActor);
        }
    }

    bool RemoveEffectToTarget(AActor OtherActor)
    {
        if(!m_TargetsMap.Contains(OtherActor))
            return false;

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        return RemoveGameplayEffectToTarget(targetAbComp, m_TargetsMap[OtherActor]);
    }


    UFUNCTION()
    bool RemoveGameplayEffectToTarget(UGothicAbilitySystemComponent TargetAbComp, FActiveGameplayEffectHandle Handle)
    {
        if(TargetAbComp != nullptr && m_TargetsMap.Contains(TargetAbComp.GetAvatar()))
        {
            return TargetAbComp.RemoveActiveGameplayEffect(Handle, m_StackCountToRemove);
        }
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        Super::EndPlay(EndPlayReason);
        
        GetCollisionComponent().OnComponentBeginOverlap.Unbind(this, n"OnBeginOverlap");
        GetCollisionComponent().OnComponentEndOverlap.Unbind(this, n"OnEndOverlap");
        for(auto target : m_TargetsMap)
        {
            UGothicAbilitySystemComponent targetGothicAbComp = Cast<UGothicAbilitySystemComponent>(GothicGAS::GetAbilitySystemComponent(target.Key));
            if(targetGothicAbComp != nullptr)
            {
                RemoveGameplayEffectToTarget(targetGothicAbComp, target.Value);
            }
              
        }

        m_TargetsMap.Empty();
    }
};
