class UXardasSleeperSkeletonsSummonedComponent : USummonedCreatureComponent
{
    default bReplicates = true;

    UPROPERTY(Replicated)
    UXardas_Sleeper_Minion_BillboardComponent m_SpotSpawnBillboard;
    UPROPERTY(Replicated)
    AMinionSpot_XardasSleeper m_MinionSpot;
    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_SummonedEffect = UGE_Summoned::StaticClass();
    UPROPERTY()
    FGameplayTag m_SummonedTag = GameplayTag::Action_DoSummon;

    UPROPERTY(Replicated)
    ECollisionEnabled m_CapsuleOriginalCollision;
    UPROPERTY(Replicated)
    ECollisionEnabled m_MeshOriginalCollision;

    UPROPERTY()
    FTimerHandle m_RestoreCollisionTimerHandle;

    UPROPERTY()
    UDelegateHandleContainer m_OnSummonCompleted;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        //@DE - Deactivate tick optimizer for teleport.
        UBFGTickOptimizerSystem::SetTickOptimizationRuntime_Enabled(GetOwner(), false);
    }

    UFUNCTION()
    void OnSummonCompleted(FGameplayEventData GameplayEventData)
    {
        MagicScript::DetachFromEvent(GetOwner(), m_OnSummonCompleted);
        m_MinionSpot.ActivateMinion(GetOwner());
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
         MagicScript::DetachFromEvent(GetOwner(), m_OnSummonCompleted);
    }


    void Initialize(UXardas_Sleeper_Minion_BillboardComponent SpotSpawnBillboard, AMinionSpot_XardasSleeper MinionSpot)
    {
        m_OnSummonCompleted = MagicScript::AttachToEventTag(GetOwner(), GameplayTag::Event_XardasSleeper_Skeletons_ActivateVisuals, this, n"OnSummonCompleted");

        m_SpotSpawnBillboard = SpotSpawnBillboard;
        m_MinionSpot = MinionSpot;
        auto character = Cast<AGothicCharacter>(GetOwner());

        m_CapsuleOriginalCollision = character.CapsuleComponent.GetCollisionEnabled();
        m_MeshOriginalCollision = character.Mesh.GetCollisionEnabled();
        character.SetActorLocation(m_SpotSpawnBillboard.GetWorldLocation());

        character.CapsuleComponent.IgnoreActorWhenMoving(m_SpotSpawnBillboard.m_AttachedRuby, true);
        character.Mesh.IgnoreActorWhenMoving(m_SpotSpawnBillboard.m_AttachedRuby, true);

        m_SpotSpawnBillboard.m_AttachedRuby.m_RubyMesh.IgnoreActorWhenMoving(character, true);
        m_SpotSpawnBillboard.m_AttachedRuby.m_RubySkeletalMesh.IgnoreActorWhenMoving(character, true);

        //MinionSpot.m_ColumnStaticMesh.IgnoreActorWhenMoving(character, true);

        TArray<UPrimitiveComponent> outCollisions;
        character.CapsuleComponent.GetOverlappingComponents(outCollisions);
        for(auto collision : outCollisions)
        {
            character.CapsuleComponent.IgnoreComponentWhenMoving(collision, true);
            character.Mesh.IgnoreComponentWhenMoving(collision, true);
            collision.IgnoreActorWhenMoving(character, true);
        }
        
        //character.GetGothicAbilitySystemComponent().AddTag(GameplayTag::State_Scripting_Action);

        DeactivateCharacterMovementAndCollisions(character);

    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        //@DE- Sometime the skeletons fall. IDKW O.O
        if(m_SpotSpawnBillboard != nullptr)
            GetOwner().SetActorLocation(m_SpotSpawnBillboard.GetWorldLocation());
    }

    void DeactivateCharacterMovementAndCollisions(AGothicCharacter Character)
    {
        Character.GetGothicAbilitySystemComponent().AddTag(GameplayTag::State_Scripting_Action);
        UpdateCharacterMovement(Character, EMovementMode::MOVE_Custom);
        UpdateCharacterCollision(Character, ECollisionEnabled::NoCollision, ECollisionEnabled::NoCollision);
    }

    void RestoreCharacterMovementAndCollisions(AGothicCharacter Character, bool ClearIgnoredCollision = false)
    {
        Character.GetGothicAbilitySystemComponent().RemoveTag(GameplayTag::State_Scripting_Action);

        UpdateCharacterCollision(Character, m_CapsuleOriginalCollision, m_MeshOriginalCollision);
        UpdateCharacterMovement(Character, MagicScript::GetGroundMovementMode(Character));

        if(ClearIgnoredCollision)
        {
            Character.CapsuleComponent.ClearMoveIgnoreActors();
            Character.CapsuleComponent.ClearMoveIgnoreComponents();
            Character.Mesh.ClearMoveIgnoreActors();
            Character.Mesh.ClearMoveIgnoreComponents();
        }
    }

    void UpdateCharacterMovement(AGothicCharacter Character, EMovementMode MovementMode)
    {
        Character.GothicMovementComponent.SetMovementMode(MovementMode);
    }

    void UpdateCharacterGravity(AGothicCharacter Character, bool Value)
    {
        Character.Mesh.SetEnableGravity(Value);
        Character.CapsuleComponent.SetEnableGravity(Value);
    }

    void UpdateCharacterCollision(ACharacter Character, ECollisionEnabled CapsuleCollision, ECollisionEnabled MeshCollision)
    {
        Character.CapsuleComponent.SetCollisionEnabled(CapsuleCollision);
        Character.Mesh.SetCollisionEnabled(MeshCollision);
    }


    void DoSummon()
    {
        auto character = Cast<AGothicCharacter>(GetOwner());
        Cast<ASkeleton_XardasSleeper>(character).SetChained(false);

        auto abComp = character.AbilitySystemComponent;
        abComp.ApplyGameplayEffectToSelf(m_SummonedEffect, 0, abComp.MakeEffectContext());
        abComp.SendGameplayEvent(m_SummonedTag, FGameplayEventData());
        //Activate dead lock timer
    }

    UFUNCTION(NetMulticast)
    void OnActivateVisuals()
    {
        SetComponentTickEnabled(false);
        auto character = Cast<AGothicCharacter>(GetOwner());

        m_MinionSpot.OnActivateVisuals(m_SpotSpawnBillboard);

        auto forward = character.GetActorForwardVector();
        forward.Normalize();

        
        
    }

    void ActivateRestoreCharacterMovementAndCollisionTimer(float Seconds)
    {
        System::InvalidateTimerHandle(m_RestoreCollisionTimerHandle);
        //@DE - Restore the collisions a little bit later to avoid get stuck on the column
        m_RestoreCollisionTimerHandle = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"TimerRestoreCharacterMovementAndCollisions"), Seconds, false);
    }

    UFUNCTION()
    void TimerRestoreCharacterMovementAndCollisions()
    {
        System::InvalidateTimerHandle(m_RestoreCollisionTimerHandle);
        auto character = Cast<AGothicCharacter>(GetOwner());
        RestoreCharacterMovementAndCollisions(character);
    }
    
}