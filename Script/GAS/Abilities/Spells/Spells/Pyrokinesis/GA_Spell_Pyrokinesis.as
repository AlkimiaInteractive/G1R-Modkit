
class UGA_Spell_Pyrokinesis : UGA_Spell_Targetable
{
    //default m_TriggerBeginOnSpellTag = GameplayTag::Ability_Action_Spell_Throw_Pyrokinesis;

    UPROPERTY()
    FGameplayTag m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Pyrokinesis_Start;
    
    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_WeaponDefinition = UPyrokinesisProjectileDefinition::StaticClass();

    default m_SpellStateTag = FGameplayTag(GameplayTag::State_LaunchingSpell_Pyrokinesis);

    default ActivationOwnedTags.AddTag(GameplayTag::State_LaunchingSpell_Pyrokinesis);

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Pyrokinesis/BP_Pyrokinesis.BP_Pyrokinesis_C'";

    // UGA_Spell_Pyrokinesis()
    // {
    //     BindTriggerBeginOnTag(GameplayTag::Ability_Action_Spell_Throw_Pyrokinesis);
    // }

    FGameplayTag GetTriggerBeginOnTag() override
    {
        return GameplayTag::Ability_Action_Spell_Throw_Pyrokinesis;
    }

    FGameplayTag GetDamageType() override
    {
        return GameplayTag::Combat_HitType_Additive;
    }

    UFUNCTION(BlueprintOverride)
    void OnNewTarget_Scriptable(AActor NewTarget)
    {
        Super::OnNewTarget_Scriptable(NewTarget);
        SpawnVisuals();
        AActor instigator = GetAvatarActorFromActorInfo();
        FActiveGameplayEffectHandle handle = ApplyEffectToTarget(NewTarget, instigator, instigator, true);
        //@DE - Moved to their component.
        // if(MagicScript::IsValidGameplayEffectHandle(handle))
        // {
        //     ReportPerceptionEvent(m_PerceptionStartTag, instigator, Cast<AGothicCharacter>(NewTarget));
        // }
    }

    void SpawnVisuals()
    {
        AActor sourceActor = GetAvatarActorFromActorInfo();
        m_SpawnedActors.Add(SpawnRay(m_Target, sourceActor, Cast<ACharacter>(sourceActor).Mesh, n"weapon_l", true));
        m_SpawnedActors.Add(SpawnRay(m_Target, sourceActor, Cast<ACharacter>(sourceActor).Mesh, n"weapon_r"));
        SpawnRayFXSoundEvent();
    }

    void SpawnRayFXSoundEvent()
    {
        AActor sourceActor = GetAvatarActorFromActorInfo();
        
        AGothicCharacter SourceCharacter = Cast<AGothicCharacter>(sourceActor);
        SourceCharacter.FXComponent.PlayEffect(GameplayTag::FX_Magic_Ray_Pyrokinesis, nullptr);
    }

   UFUNCTION(BlueprintOverride)
   void OnEndSpellServer_Scriptable()
   {
        //Super::OnEndSpellServer_Scriptable();
            
        RemoveEffectFromTarget(m_Target, GetAvatarActorFromActorInfo());

        for(auto spawnedActor : m_SpawnedActors)
        {
            if(IsValid(spawnedActor))
                spawnedActor.DestroyActor();
        }
    }

    UFUNCTION()
    ALightningRayVisual SpawnRay(AActor TargetActor, AActor SourceActor, UMeshComponent SourceMesh, FName Bone = n"", bool ShouldSpawnHitEffect = false)
    {
        FVector pos = SourceActor.GetActorLocation();
        if(Bone != n"")
        {
            ACharacter character = Cast<ACharacter>(SourceActor);
            pos = character.Mesh.GetSocketTransform(Bone, ERelativeTransformSpace::RTS_World).Location; 
        }
            
        FRotator rotation = MagicScript::FindLookAtRotation(pos, TargetActor.GetActorLocation());


        ALightningRayVisual ray = Cast<ALightningRayVisual>(SpawnActor(m_SpawnActorPath.Get(), pos, rotation));
        ray.AttachToActor(SourceActor);
        ray.Initialize(TargetActor, SourceActor, SourceMesh, Bone, ShouldSpawnHitEffect);
        
        ray.OnDestroyed.AddUFunction(this, n"OnRayDestroyed");
        return ray;
    }

    UFUNCTION()
    private void OnRayDestroyed(AActor DestroyedActor)
    {
        AActor sourceActor = GetAvatarActorFromActorInfo();
        AGothicCharacter SourceCharacter = Cast<AGothicCharacter>(sourceActor);

        SourceCharacter.FXComponent.StopFXInstancesWithTag(GameplayTag::FX_Magic_Ray_Pyrokinesis);
    }

    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionClass(AActor TargetToRemove) override
    {
        return m_WeaponDefinition;
    }

    void ReportPerceptionEvent(FGameplayTag PerceptionTag, AActor InstigatorActor, AGothicCharacter TargetActor)
    {
        if (TargetActor == nullptr)
            return;

        TargetActor.Perception.ReportPerceptionEvent(
            PerceptionTag,
            TargetActor.ActorLocation,
            SensedCharacter = TargetActor,
            TargetActor = TargetActor,
            InstigatorActor = InstigatorActor,
            AffectedActor = TargetActor
        );
    }
}