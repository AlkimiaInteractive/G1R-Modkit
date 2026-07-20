class UGA_Spell_IceBolt : UGA_Spell_SpawnRepeatingProjectile
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_Icebolt.BP_Icebolt_C'";
   
    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
         const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
         character.GetFXComponent().StopFXInstancesWithTag(GameplayTag::FX_Magic_Spell_IceBolt_HoldLoop, false);   
    }
}