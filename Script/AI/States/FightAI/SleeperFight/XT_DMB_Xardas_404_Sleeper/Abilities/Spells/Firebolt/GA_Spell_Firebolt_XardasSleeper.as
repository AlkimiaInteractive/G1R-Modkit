class UGA_Spell_Firebolt_XardasSleeper : UGA_Spell_FireBolt
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_Xardas_Sleeper_Firebolt.BP_Xardas_Sleeper_Firebolt_C'";

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor actorSpawned)
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