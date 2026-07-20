class  UGA_Spell_BreathOfDeath : UGA_Spell_Wind
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BreathOfDeath/BP_BreathOfDeathActor.BP_BreathOfDeathActor_C'";

    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_WeaponData = UBreathOfDeathDefinition::StaticClass();
   
    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        ABreathOfDeathSpell projectile = Cast<ABreathOfDeathSpell>(ActorSpawned);
        projectile.m_CollisionComp.m_WeaponData = m_WeaponData;
        projectile.InitializeConfiguration();
        NotifySpellCategory();
    }
}


