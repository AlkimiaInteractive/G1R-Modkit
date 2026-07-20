class UGA_Spell_FireBall_MiltenSleeper : UGA_Spell_Fireball
{
    default m_GE_Channeling = UGE_NoManaBurn::StaticClass();
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    
    default m_SpawnCollisionHandlingOverride = ESpawnActorCollisionHandlingMethod::AlwaysSpawn;

    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable() 
    {
        return true;
    }

    float GetLevelChannelingCostSg() override
    {
        return 0.f;
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor actorSpawned)
    {
        UMiltenSleeper_ProjectileComponent::Create(actorSpawned);
        IgnoreCollisions(actorSpawned);
        auto spellConfig = GetLevelSpellConfigData();
        if(spellConfig.m_WeaponConfigOverride != nullptr)
            Cast<ASpellBallVisual_AS>(actorSpawned).m_CollisionComp.m_WeaponData = spellConfig.m_WeaponConfigOverride;
        Super::OnActorSpawnedServer_Scriptable(actorSpawned);
    }

    void IgnoreCollisions(AActor actorSpawned)
    {
        auto invulnerableVisualComp = UInvulnerableVisualComponent::Get(GetAvatarActorFromActorInfo());
        if(invulnerableVisualComp == nullptr)
            return;
        auto invulnerableVisual = invulnerableVisualComp.m_InvulnerableVisual;
        if(invulnerableVisual == nullptr)
            return;

        invulnerableVisual.m_CapsuleCollisionComponent_BlockPlayerMovement.IgnoreActorWhenMoving(actorSpawned, true);
        Cast<ASpellProjectileVisual>(actorSpawned).m_CollisionComp.IgnoreActorWhenMoving(invulnerableVisual, true);
    }

}