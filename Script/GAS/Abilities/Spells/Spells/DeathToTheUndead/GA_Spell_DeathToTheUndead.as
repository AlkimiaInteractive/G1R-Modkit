
// class UGA_Spell_DeathToTheUndead : UGameplayAbilitySpell_Debuff
// {
//     default m_DebuffEffect = UGE_DeathToTheUndead::StaticClass();
// }


class UGA_Spell_DeathToTheUndead : UGameplayAbilitySpellBasic
{
    UPROPERTY()
    ADeathToTheUndeadVisual m_projectile;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/DeathToTheUndead/BP_DeathToTheUndeadActor.BP_DeathToTheUndeadActor_C'";
   
    UFUNCTION()
    FVector GetSpawnPosition(ACharacter OwnerCharacter)
    {
        return OwnerCharacter.GetActorLocation();
    }

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        //Super::OnActorSpawnedServer_Scriptable(ActorSpawned);
        const UDeathToTheUndeadSpellConfig conf = Cast<UDeathToTheUndeadSpellConfig>(GetSpellConfigurationContainer().GetSpellConfig());
        m_projectile = Cast<ADeathToTheUndeadVisual>(ActorSpawned);

        m_projectile.m_CollisionComp.SetState(EHitColliderState::Damage);
        
        //m_projectile.m_TargetRadius = GetSpellAreaRange();
        m_projectile.m_CollisionComp.SphereRadius = 0.f;

        m_projectile.SetActorLocation(GetSpawnPosition(Cast<ACharacter>(m_projectile.Owner)));
    }
}