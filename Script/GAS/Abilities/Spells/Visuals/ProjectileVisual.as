
UCLASS(Blueprintable)
class ASpellBallVisual_AS : ASpellProjectileVisual
{
    UPROPERTY(BlueprintReadWrite, Replicated)
    private int m_SpellLevel = 0;
    UPROPERTY(BlueprintReadWrite, Replicated)
    bool m_HasCollided = false;

    UPROPERTY()
    FGameplayTag m_OnApplyEnvironmentDebuff = GameplayTag::Event_Debuff_Environment;
    UPROPERTY()
    FGameplayTag m_ProjectileDebuffTag = FGameplayTag();
    
    void SetSpellLevel(int level) { m_SpellLevel = level; }


    UFUNCTION(BlueprintOverride)
    void OnProjectileBeginPlay()
    {
        auto weaponDefinition = GetWeaponDefinition();
        if(weaponDefinition == nullptr)
        {
            return;
        }

        const USpellProjectileDefinition def = Cast<USpellProjectileDefinition>(weaponDefinition.Get().GetDefaultObject());
        if(def != nullptr)
        {
            SetLifeSpan(def.m_LifeTime);
            SetCollisionSphereRadius(def);
        }   
    }

    void SetCollisionSphereRadius(const USpellProjectileDefinition def)
    {
        if(def != nullptr)
        {
            m_CollisionComp.SetSphereRadius(def.m_Radius);
        } 
    }

    UFUNCTION(BlueprintOverride)
    void OnHitServer_Scriptable(UPrimitiveComponent HitComp, AActor OtherActor, UPrimitiveComponent OtherComp, FVector NormalImpulse, const FHitResult& Hit)
    {
        if(GetOwner() == OtherActor)
        {
            return;
        }
        //Print(FString("OnHitServer_Scriptable"), 15.f, FLinearColor::Green);
        //Log("[AProjectileVisual_AS::OnHitServer_Scriptable hit] on " + OtherActor.Name + " on component "+ Hit.GetComponent().Name);
        
        NotifyInteractActor(OtherActor);

        ApplyDamageTo(OtherActor, Hit);
        
        DoExplosion(OtherActor, Hit);
    }

    UFUNCTION(BlueprintOverride)
    void OnOverlapBeginServer(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        if(GetOwner() == OtherActor)
        {
            return;
        }

        //Log("[AProjectileVisual_AS::OnOverlapBeginServer hit] on " + OtherActor.Name + " on component "+ SweepResult.GetComponent().Name);
        //Print(FString("OnOverlapBeginServer: Actor - ").Append(OtherActor.GetName()).Append(" - Comp: ").Append(OtherComp.GetName()), 1.f, FLinearColor::Green);

        NotifyInteractActor(OtherActor);
    }

    void NotifyInteractActor(AActor OtherActor)
    {
        auto interactiveActor = Cast<AInteractiveGasObjectActor>(OtherActor);
        if(interactiveActor != nullptr)
        {
            auto interactiveActorAbilitySystemComponent = interactiveActor.GetAbilitySystemComponent();
            if(interactiveActorAbilitySystemComponent != nullptr)
            {
                GothicGAS::ApplyDebuffGameplayEffects(interactiveActorAbilitySystemComponent, GetDebuffGameplayEffectsToApplyWhenOverlap());
                //Print(FString(OverlappedComp.GetName()));
                NotifyEnvironmentDebuffToInteractableGasObjectActor(interactiveActorAbilitySystemComponent);
                interactiveActor.OnImpact();
            }
        }
        else
        {
            auto environmentSpellComp = UEnvironmentInteractableSpellComponent::Get(OtherActor);
            if(environmentSpellComp != nullptr)
            {
                NotifyEnvironmentDebuffToInteractableGasObjectActor(environmentSpellComp.m_AbComp);
            }
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnOverlapEndsServer(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                             UPrimitiveComponent OtherComp, int OtherBodyIndex)
    {
        if(GetOwner() == OtherActor)
        {
            return;
        }

        //Log("[AProjectileVisual_AS::OnOverlapEndsServer hit] on " + OtherActor.Name + " on component "+ OverlappedComponent.Name);
    }

    UFUNCTION(BlueprintOverride)
    void OnProjectileEndPlay()
    {
        if(!m_HasCollided)
        {
            SpawnExplosion();
            OnProjectileCollide(FHitResult());
        }
    }

    UFUNCTION(BlueprintCallable)
    void DoExplosion(AActor OtherActor, const FHitResult& Hit)
    {
        //By default when overlapping will explode
        Explode(OtherActor, Hit);

        ActorTickEnabled = false;
	    
        m_HasCollided = true;
        
        OnProjectileCollide(Hit);

        m_CollisionComp.SetState(EHitColliderState::None);
    }

    void ApplyDamageTo(AActor OtherActor, const FHitResult& HitResult)
    {
        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(GetOwner());
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);

        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(OtherActor);
        if(targetCharacter == nullptr)
            return;

        if(sourceAbComp != nullptr && targetAbComp != nullptr)
        {
		    //@DE - Wait until design decides if can damage allies and summoned creatures.
            // //@DE - Avoid damage allies or players.
            //AGothicCharacter target = Cast<AGothicCharacter>(targetAbComp.GetAvatar());
            //AGothicCharacter source = Cast<AGothicCharacter>(sourceAbComp.GetAvatar());
            //auto AIController = Cast<AGothicAIController>(target.Controller);

            //if(AIController == nullptr)
            //    return;
            //if(target.IsFriendlyTowards(source))
            //    return;

            auto char = Cast<AGothicCharacter>(OtherActor);
            if(char != nullptr && char.GetHealthAttribute() > 0)
            {
                IncrementHitCounter();
            }

            FGameplayEffectContext_HitResponse hit_data;
            hit_data.Impact = GameplayTag::Combat_HitType_Standard;
            hit_data.WeaponUsed = m_CollisionComp.m_WeaponData;
            hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
                        OtherActor.GetActorForwardVector(), 
                        OtherActor.GetActorRightVector(), -GetOwner().GetActorForwardVector());
            //The instigator should be the Caster
             GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), this, targetAbComp, hit_data, HitResult);
        }
    }

    void Explode(AActor OtherActor, const FHitResult& HitResult)
    {
        auto explosionVisual = SpawnExplosion();
        if(explosionVisual != nullptr)
        {
            explosionVisual.SetOwner(GetOwner());
            auto damageExplosion = Cast<ASphereProjectileDamageExplosionVisual>(explosionVisual);
            //@DE - Avoid damage explosion do damage twice to the current target.
            if(damageExplosion != nullptr)
            {
                damageExplosion.m_WeaponDefClass = GetWeaponDefinition();
                damageExplosion.SetRadius(m_CollisionComp.GetUnscaledSphereRadius());
                if(OtherActor != nullptr && OtherActor.IsA(AGothicCharacter::StaticClass()))
                    damageExplosion.m_TargetsMap.Add(OtherActor, FActiveGameplayEffectHandle());
            }
            //Log("[AProjectileVisual_AS::Explode} spell level " + m_SpellLevel);
            explosionVisual.Multicast_OnExplode(HitResult, m_SpellLevel);
        }
    }

    UFUNCTION(BlueprintCallable)
    AExplosionVisual SpawnExplosion()
    {
        auto def = GetWeaponDefinition();
        if(def != nullptr)
        {
            const USpellProjectileDefinition ball_def = Cast<USpellProjectileDefinition>(def.Get().GetDefaultObject());
            UClass asset = Cast<UClass>(ball_def.m_ExplosionPath.ToSoftObjectPath().TryLoad());
        
            if(asset != nullptr)
            {
                //System::DrawDebugSphere(GetActorLocation(), 10.f, 32, FLinearColor::Red, 20.f, 10.f);
                AActor actor_default = Cast<AActor>(asset.GetDefaultObject());
                return Cast<AExplosionVisual>(SpawnObject(actor_default.Class, GetActorLocation(), GetActorRotation()));
            }
        }
        return nullptr;
    }
    
    void IgnoreActors(UPrimitiveComponent CollisionComp, AActor ActorToIgnore) const
    {
        CollisionComp.IgnoreActorWhenMoving(ActorToIgnore, true);

        TArray<AActor> OutActorsToIgnore;
        ActorToIgnore.GetAttachedActors(OutActorsToIgnore, true, true);
        
        for(AActor actor : OutActorsToIgnore)
        {
            CollisionComp.IgnoreActorWhenMoving(actor, true);
        }
    }

    TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap() const
    {
        return TArray<TSubclassOf<UGameplayEffect>>();
    }
    //@DE - They need know each application of the interactable debuff effect. I send the event due the GE is not applied if it already applied
    void NotifyEnvironmentDebuffToInteractableGasObjectActor(UAbilitySystemComponent InteractiveActorAbilitySystemComponent)
    {
        InteractiveActorAbilitySystemComponent.SendGameplayEvent(m_OnApplyEnvironmentDebuff, GetPayloadEnvironmentDebuff());
    }

    FGameplayEventData GetPayloadEnvironmentDebuff()
    {
        FGameplayEventData payload = FGameplayEventData();
        payload.EventTag = m_ProjectileDebuffTag;
        payload.Instigator = this;
        return payload;
    }

    void DrawStartEndDetactionPlanes(FVector startDetectionVector, FVector endDectectionVector, bool drawStart = false)
    {
        FVector normalVector = endDectectionVector - startDetectionVector;
        normalVector.Normalize();
        FPlane startPlane = FPlane(startDetectionVector, normalVector);
        FPlane endPlane = FPlane(endDectectionVector, normalVector);
        if(drawStart)
        {
              //System::DrawDebugPlane(startPlane, endDectectionVector, 100.f, FLinearColor::Blue, 0.f);
        }
        //System::DrawDebugPlane(endPlane, endDectectionVector, 300.f, FLinearColor::Green, 0.f);
    }

    UFUNCTION(BlueprintCallable)
    int GetSpellLevel()
    {
        return m_SpellLevel;
    }
};