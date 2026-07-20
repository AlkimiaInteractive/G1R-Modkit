class UGA_Spell_ChainLightning : UGA_Spell_Targetable//UGameplayAbilitySpellTargetable
{
    //default m_TriggerBeginOnSpellTag = GameplayTag::Ability_Action_Spell_Throw_ChainLightning;
      
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/ChainLightning/BP_ChainLightning.BP_ChainLightning_C'";

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TSubclassOf<ULightningRayDefinition_Base> m_WeaponDataForTargets = ULightningRayDefinition_WithParalysis::StaticClass();
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TSubclassOf<ULightningRayDefinition_Base> m_WeaponDataForOwner = ULightningRayDefinition_WithoutParalysis::StaticClass();

	UPROPERTY()
	TArray<ALightningRayVisual> m_Rays;

    UPROPERTY()
    TArray<ALightningRayVisual> m_ValidRaysTemp;
    
    UPROPERTY()
	float m_CurrentTimeFinding = 0.0f;

    UPROPERTY()
    ULightningRayDefinition_Base m_def;

    UPROPERTY()
    AActor m_avatar;

    UPROPERTY()
    TMap<AActor, FActiveGameplayEffectHandle> m_TargetsGEHandles;

    //UPROPERTY()
    //AActor m_TargetToRemove;

    default m_SpellStateTag = FGameplayTag(GameplayTag::State_LaunchingSpell_ChainLightning);

    UPROPERTY()
    FGameplayTag m_ReceivingSpell = FGameplayTag(GameplayTag::State_ReceivingSpell_ChainLightning);

    default ActivationOwnedTags.AddTag(GameplayTag::State_LaunchingSpell_ChainLightning);

    UPROPERTY()
    bool m_CanDoEndSpellAction = true;

    FGameplayTag GetTriggerBeginOnTag() override
    {
        return GameplayTag::Ability_Action_Spell_Throw_ChainLightning;
    }

    UFUNCTION()
    ULightningRayDefinition_Base GetWeaponDefinition(AActor TargetDefinition)
    {
        TSubclassOf<UWeaponDefinition> WeaponClass = GetWeaponDefinitionClass(TargetDefinition);
        if(WeaponClass != nullptr)
            return Cast<ULightningRayDefinition_Base>(WeaponClass.Get().GetDefaultObject());
        return nullptr;
        
    }

    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionClass(AActor TargetToRemove) override
    {
        if(TargetToRemove == GetAvatarActorFromActorInfo() && m_WeaponDataForOwner.IsValid())
        {
            return m_WeaponDataForOwner;
        }

        if(m_WeaponDataForTargets.IsValid())
        {
            return m_WeaponDataForTargets;
        }

        return nullptr;
    }


    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        m_def = GetWeaponDefinition(GetAvatarActorFromActorInfo());
        m_Rays.Empty();
        m_CurrentTimeFinding = 0.f;
        m_ValidRaysTemp.Empty();
        m_TargetsGEHandles.Empty();
        m_CanDoEndSpellAction = true;
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        //Super::OnEndSpellServer_Scriptable();
        // Remove the effect in all the targets
        for(AActor target : m_Targets)
        {
            if(target == nullptr) // Target is not valid anymore
            {
                return;
            }
            
            RemoveEffectFromTarget(target, GetAvatarActorFromActorInfo());
        }

        // Stop rays
        for(ALightningRayVisual& ray : m_Rays)
        {
            ray.DestroyActor();
        }

    }


    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void OnUpdateSpell_Scriptable(float DeltaTime)
    {
        m_avatar = GetActorInfo().GetAvatarActor();

        if(m_Targets.Num() == 0 || m_Targets[0] == m_avatar)
        {
            DoEndSpellAction();
            return;
        }
       
        DoUpdateSpell(DeltaTime);

        if(m_Targets.Num() == 0 || m_Targets[0] == m_avatar)
        {
            DoEndSpellAction();
            return;
        }

        // Check if there is still any valid ray
        if(m_ValidRaysTemp.Num() > 0)
        {
            m_Rays = m_ValidRaysTemp;
        }
        else
        {
            DoEndSpellAction();
        }
    }

    void DoUpdateSpell(float DeltaTime)
    {
        //@DE - This code section must be done without interruption.
        m_CanDoEndSpellAction = false;
        
        // if the link is not closed
        CheckTargets(DeltaTime);

        //Update rays
        m_ValidRaysTemp.Empty();
        CheckValidRays(m_ValidRaysTemp);
        
        CleanEmptyTargets();

        m_CanDoEndSpellAction = true;
    }

    UFUNCTION(BlueprintOverride)
    bool CanDoEndSpellAction_Scriptable()
    {
        return m_CanDoEndSpellAction;
    }

    void CheckTargets(float DeltaTime)
    {
        AActor last_target = m_Targets[m_Targets.Num() - 1];
        if(last_target != m_avatar)
        {
            //Find new targets each n time
            if(m_CurrentTimeFinding >= m_def.m_FindLinkEachSeconds)
            {
                m_CurrentTimeFinding = 0;

                // Close the link
                if(m_Targets.Num() == m_def.m_MaxLinks)
                {
                    OnNewTarget_Scriptable(m_avatar);
                }
                else
                {
                    // Find new targets around the last target
                    // TArray<AActor> new_targets;
                    // FindTargetsInArea_Server(
                    //     new_targets,
                    //     last_target.GetActorLocation(),
                    //     FVector::ZeroVector,
                    //     m_def.m_AreaToFindNewTargetsCm,
                    //     360,
                    //     GetAvatarActorFromActorInfo());

                    //float near_dist = 0;
                    AActor target = FindNextTarget(last_target);

                    // // Get the nearest
                    // for(AActor new_target : new_targets)
                    // {
                    //     if(m_Targets.Contains(new_target) || new_target == m_avatar)
                    //     {
                    //         continue;
                    //     }
                        
                    //     const float dist = new_target.GetActorLocation().Distance(last_target.GetActorLocation());
                    //     if(target == nullptr || dist < near_dist)
                    //     {
                    //         target = new_target;
                    //         near_dist = dist;
                    //     }
                    // }
                    

                    // if we have a target
                    if(target != nullptr)
                    {
                        OnNewTarget_Scriptable(target);
                    }
                    else
                    {
                        // there is no targets near to the last target
                        // we have to close the link
                        OnNewTarget_Scriptable(m_avatar);
                    }
                }
            }
            else
            {
                 m_CurrentTimeFinding += DeltaTime;
            }
        }
    }

    AActor FindNextTarget(AActor LastTarget)
    {
        // Find new targets around the last target
        TArray<AActor> new_targets;
        FindTargetsInArea_Server(
            new_targets,
            LastTarget.GetActorLocation(),
            FVector::ZeroVector,
            m_def.m_AreaToFindNewTargetsCm,
            360,
            GetAvatarActorFromActorInfo());

        float near_dist = 0;
        AActor target = nullptr;

        target = GetNearestTarget(GetEnemyTargets(new_targets), LastTarget);
        if(target != nullptr)
            return target;

        target = GetNearestTarget(GetHostileTargets(new_targets), LastTarget);
        if(target != nullptr)
            return target;

        target = GetNearestTarget(GetNeutralAndAngryTargets(new_targets), LastTarget);
        if(target != nullptr)
            return target;

        target = GetNearestTarget(GetFriendlyTargets(new_targets), LastTarget);
        if(target != nullptr)
            return target;

        return target;
    }

    AActor GetNearestTarget(TArray<AActor> NewTargets, AActor LastTarget)
    {
        float near_dist = 0;
        AActor target = nullptr;

        for(AActor new_target : NewTargets)
        {
            if(m_Targets.Contains(new_target) || new_target == m_avatar)
            {
                continue;
            }
            
            const float dist = new_target.GetActorLocation().Distance(LastTarget.GetActorLocation());
            if(target == nullptr || dist < near_dist)
            {
                target = new_target;
                near_dist = dist;
            }
        }

        return target;
    }

    bool IsNPC(AGothicCharacter Character)
    {
        return !Character.IsPlayerControlled() && !Character.IsPlayerCharacter();
    }

    //@DE - Friendly character + other players
    TArray<AActor> GetFriendlyTargets(TArray<AActor> Targets)
    {
        TArray<AActor> outTargets;
        auto OwnerCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        for(auto target : Targets)
        {
            AGothicCharacter character = Cast<AGothicCharacter>(target);
            if(!IsNPC(character))
                outTargets.Add(target);
            else
                if(character.IsFriendlyTowards(OwnerCharacter))
                    outTargets.Add(target);
        }
        return outTargets;
    }
    

    TArray<AActor> GetNeutralAndAngryTargets(TArray<AActor> Targets)
    {
        TArray<AActor> outTargets;
        outTargets = GetNeutralTargets(Targets);
        outTargets.Append(GetAngryTargets(Targets));
        return outTargets;
    }

    TArray<AActor> GetNeutralTargets(TArray<AActor> Targets)
    {
        TArray<AActor> outTargets;
        auto OwnerCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        for(auto target : Targets)
        {
            AGothicCharacter character = Cast<AGothicCharacter>(target);
            if(IsNPC(character) && character.IsNeutralTowards(OwnerCharacter))
                outTargets.Add(target);
        }
        return outTargets;
    }

    TArray<AActor> GetAngryTargets(TArray<AActor> Targets)
    {
        TArray<AActor> outTargets;
        auto OwnerCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        for(auto target : Targets)
        {
            AGothicCharacter character = Cast<AGothicCharacter>(target);
            if(IsNPC(character) && character.IsAngryTowards(OwnerCharacter))
                outTargets.Add(target);
        }
        return outTargets;
    }

    TArray<AActor> GetHostileTargets(TArray<AActor> Targets)
    {
        TArray<AActor> outTargets;
        auto OwnerCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        for(auto target : Targets)
        {
            AGothicCharacter character = Cast<AGothicCharacter>(target);
            if(IsNPC(character) && character.IsHostileTowards(OwnerCharacter))
                outTargets.Add(target);
        }
        return outTargets;
    }

    TArray<AActor> GetEnemyTargets(TArray<AActor> Targets)
    {
        TArray<AActor> outTargets;
        auto OwnerCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        for(auto target : Targets)
        {
            AGothicCharacter character = Cast<AGothicCharacter>(target);
            if(IsNPC(character) && character.IsEnemyTowards(OwnerCharacter))
                outTargets.Add(target);
        }
        return outTargets;
    }

    UFUNCTION(BlueprintOverride)
    bool IsTargetValid_Script(AActor SourceActor, AActor TargetActor) const
    {
        //Check that the player is not under the effect of other chain lightning 
        return !HasAnyChainLightningTag(TargetActor) && !HasInvalidTags(Cast<AGothicCharacter>(TargetActor));
    }

    bool HasInvalidTags(AGothicCharacter Actor) const
    {
        auto gothicChar = Cast<AGothicCharacter>(Actor);
        if(gothicChar == nullptr)
            return false;
        auto abComp = gothicChar.GetGothicAbilitySystemComponent();

        FGameplayTagContainer tags;
        tags.AddTag(GameplayTag::State_Knockback);
        tags.AddTag(GameplayTag::State_Dead);
        tags.AddTag(GameplayTag::State_Defeated);
        tags.AddTag(GameplayTag::State_Invulnerable);
        tags.AddTag(GameplayTag::State_Cant_Electrified);

        return abComp.HasAnyGameplayTags(tags);
    }

    bool HasAnyChainLightningTag(const AActor Actor) const
    {
        auto gothicChar = Cast<AGothicCharacter>(Actor);
        if(gothicChar == nullptr)
            return false;
        auto abComp = gothicChar.GetGothicAbilitySystemComponent();

        return abComp.HasGameplayTag(m_SpellStateTag) || abComp.HasGameplayTag(m_ReceivingSpell);
    }

    bool IsFriendly(AGothicCharacter TargetGothicCharacter) const
    {
        if(TargetGothicCharacter == nullptr)
            return true;

        auto playerChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(playerChar.IsPlayerControlled() || playerChar.IsPlayerCharacter()) // source is player
        {
            if(!TargetGothicCharacter.IsPlayerControlled() && !TargetGothicCharacter.IsPlayerCharacter()) //target is AI
            {
                //Due the player hasnt relations, we have to check the inverse relation, from the AI to the player
            
                return TargetGothicCharacter.IsFriendlyTowards(playerChar);
            }
            else
            {
                return true;
            }
            
        }
        else
        {
            return playerChar.IsFriendlyTowards(TargetGothicCharacter);
        }
    }

    //Used only for test while the AI is aiming other AIs
   bool IsPlayerChar_NOT_USE_ME(const AActor target)
    {
        auto playerController = Gameplay::GetPlayerController(0);
        auto playerChar = Gameplay::GetPlayerPawn(0);
        if(target == playerChar)
            return true;
        return false;
    }

    void CheckValidRays(TArray<ALightningRayVisual>& m_ValidRaysOut)
    {
        TArray<ALightningRayVisual> ValidRays;
        for(int i = 0; i < m_Rays.Num(); ++ i)
        {
            auto ray = m_Rays[i];
            AGothicCharacter raySourceActor = Cast<AGothicCharacter>(ray.m_Source);
            AGothicCharacter rayTargetActor = Cast<AGothicCharacter>(ray.m_Target);
            if(raySourceActor != nullptr)
            {
                if(IsTargetValid_Script(nullptr, raySourceActor) || (raySourceActor != m_avatar &&  !HasTargetChainLightningGE(raySourceActor)))
                {
                    RedirectRays(ray);
                    if(AimingHimself(ray))
                    {
                        //Managed onupdate funtion line 112.
                        // If we put here a PlayEndAbilityMontage(), we will get a crash with the line 112 
                        return;
                    }
                    if(raySourceActor == m_Target)
                    {
                        ActivateTarget(ray.m_Target);
                        RotateToTarget(ray.m_Target);
                        m_Target = ray.m_Target;
                    }                    
                    //RemoveEffectFromTarget(raySourceActor, GetAvatarActorFromActorInfo());
                    //m_Targets.Remove(raySourceActor);
                    ray.DestroyActor();
                }
                else
                {
                    ValidRays.Add(ray);
                }
            }
        }
        m_ValidRaysOut = ValidRays;
    }

    bool HasTargetChainLightningGE(AGothicCharacter GothicCharacter)
    {
        if(GothicCharacter == nullptr)
            return false;

        if(!m_TargetsGEHandles.Contains(GothicCharacter))
            return false;

        FActiveGameplayEffectHandle handle = m_TargetsGEHandles[GothicCharacter];
        auto abComp = GothicCharacter.GetGothicAbilitySystemComponent();
        return abComp.HasActiveGameplayEffectByHandle(handle);
    }

    bool AimingHimself(ALightningRayVisual ray)
    {
        auto casterActor = GetAvatarActorFromActorInfo();
        return ray.m_Target == casterActor && m_Targets.Num() <= 2;
    }


    void RedirectRays(ALightningRayVisual RayToRedirect)
    {
        AActor RayToRedirectSource = RayToRedirect.m_Source;

        for(auto ray : m_Rays)
        {
            if(ray.m_Target == RayToRedirectSource && ray.m_Source != RayToRedirect.m_Target)
            {
                ray.m_Target = RayToRedirect.m_Target;
            }
        }
    }

    void RotateToTarget(AActor NewTarget)
    {
        //return;
        auto casterActor = GetAvatarActorFromActorInfo();
        if(NewTarget == casterActor)
            return;

        FRotator rotation = MagicScript::FindLookAtRotation(casterActor.GetActorLocation(), NewTarget.GetActorLocation());
        auto casterRotation = casterActor.GetActorRotation();
        casterActor.SetActorRotation(FRotator(casterRotation.Pitch, rotation.Yaw, casterRotation.Roll));
    }

    UFUNCTION(BlueprintOverride)
    void OnNewTarget_Scriptable(AActor NewTarget)
    {
        
        //Print("OnNewTarget_Scriptable: " + Target.Name);
        AActor avatar = GetActorInfo().GetAvatarActor();
        AActor sourceActor = avatar;
        bool setSourceDirection = NewTarget != m_avatar;
       
        FActiveGameplayEffectHandle handle = ApplyEffectToTarget(NewTarget, sourceActor, avatar, setSourceDirection);
        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
        {   
            if(m_Targets.IsEmpty())
            {
                Super::OnNewTarget_Scriptable(NewTarget);
                sourceActor = avatar;
                //m_Target = Target;
                //abSource = GothicGAS::GetAbilitySystemComponent(avatar);

                SpawnSourceToTargetVisuals(NewTarget, sourceActor);
				//@ECanela: Deactivated because the rotation is already done by Spine + Montage
                //RotateToTarget(NewTarget);
            }
            else
            {
                sourceActor = m_Targets.Last();
                //abSource = GothicGAS::GetAbilitySystemComponent(sourceActor);
                m_Rays.Add(SpawnRay(NewTarget, sourceActor, Cast<ACharacter>(sourceActor).Mesh));
            }   
            if(!m_Targets.Contains(NewTarget))
                m_Targets.Add(NewTarget);         
            m_TargetsGEHandles.Add(NewTarget, handle);
        }
        // else
        // {
        //     if(m_Targets.Contains(NewTarget))
        //         m_Targets.Remove(NewTarget);
        // }
    }

    void SpawnSourceToTargetVisuals(AActor NewTarget, AActor SourceActor)
    {
        //m_Rays.Add(SpawnRay(Target, avatar, n"index_03_l"));
        //m_Rays.Add(SpawnRay(Target, avatar, n"middle_03_l"));
        m_Rays.Add(SpawnRay(NewTarget, SourceActor, Cast<ACharacter>(SourceActor).Mesh, n"weapon_l", true));
        // m_Rays.Add(SpawnRay(Target, avatar, n"index_03_r"));
        // m_Rays.Add(SpawnRay(Target, avatar, n"middle_03_r"));
        m_Rays.Add(SpawnRay(NewTarget, SourceActor, Cast<ACharacter>(SourceActor).Mesh, n"weapon_r"));
    }

    UFUNCTION()
    ALightningRayVisual SpawnRay(AActor NewTarget, AActor Source, UMeshComponent SourceMesh, FName Bone = n"", bool ShouldSpawnHitEffect = false)
    {
        //Print("ALightningRayVisual SpawnRay(AActor NewTarget, AActor Source, FName Bone = n)", 10.f);
        FVector pos = Source.GetActorLocation();
        if(Bone != n"")
        {
            //ACharacter character = Cast<ACharacter>(Source);
            //pos = character.Mesh.GetSocketTransform(Bone, ERelativeTransformSpace::RTS_World).Location; 
            pos = SourceMesh.GetSocketTransform(Bone, ERelativeTransformSpace::RTS_World).Location; 
        }
            
        FRotator rotation = MagicScript::FindLookAtRotation(pos, NewTarget.GetActorLocation());


        ALightningRayVisual ray = Cast<ALightningRayVisual>(SpawnActor(m_SpawnActorPath.Get(), pos, rotation));
        ray.AttachToActor(Source);
        ray.Initialize(NewTarget, Source, SourceMesh, Bone, ShouldSpawnHitEffect);
        SpawnRayFXSoundEvent();

        ray.OnDestroyed.AddUFunction(this, n"OnRayDestroyed");
        return ray;
    }

    UFUNCTION()
    private void OnRayDestroyed(AActor DestroyedActor)
    {
        AActor sourceActor = GetAvatarActorFromActorInfo();
        AGothicCharacter SourceCharacter = Cast<AGothicCharacter>(sourceActor);

        SourceCharacter.FXComponent.StopFXInstancesWithTag(GameplayTag::FX_Magic_Ray_Lightning);
    }

    void SpawnRayFXSoundEvent()
    {
        AActor sourceActor = GetAvatarActorFromActorInfo();
        
        AGothicCharacter SourceCharacter = Cast<AGothicCharacter>(sourceActor);
        SourceCharacter.FXComponent.PlayEffect(GameplayTag::FX_Magic_Ray_Lightning, nullptr);
    }

    UFUNCTION()
    void CleanEmptyTargets()
    {
        TArray<AActor> valid_targets;
        for(AActor target : m_Targets)
        {
            if(target != nullptr)
            {
                AGothicCharacter raySourceActor = Cast<AGothicCharacter>(target);
                if(!raySourceActor.IsDead() && !raySourceActor.IsDefeated() && HasTargetChainLightningGE(raySourceActor))
                {
                   valid_targets.Add(target);
                }
                else
                {
                    RemoveEffectFromTarget(raySourceActor, GetAvatarActorFromActorInfo());
                }
                
            }
        }

        m_Targets = valid_targets;
    }

    void RemoveEffectFromTarget(AActor TargetToRemove, AActor SourceActor) override
    {
        Super::RemoveEffectFromTarget(TargetToRemove, SourceActor);
        if(m_TargetsGEHandles.Contains(TargetToRemove))
            m_TargetsGEHandles.Remove(TargetToRemove);
    }

    UFUNCTION(BlueprintOverride, Meta=(NoSuperCall))
    void OnReleaseTarget_Scriptable(AActor entity, AActor target)
    {
            
    }
}
