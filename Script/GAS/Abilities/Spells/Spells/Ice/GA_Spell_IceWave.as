UCLASS()
class UGA_Spell_IceWave : UGameplayAbilitySpellBasic
{

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/IceWave/BP_IceWave.BP_IceWave_C'";

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

   
    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        if(ActorSpawned != nullptr)
        {
            ActorSpawned.SetActorLocation(AvatarActorFromActorInfo.GetActorLocation());     
            NotifySpellCategory();
        }
    }

   
}
