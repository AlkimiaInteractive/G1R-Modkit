class UGA_Spell_StoneWave_StoneGolem : UGA_Spell_FistOfWind
{
    default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Stone/BP_StoneWaveActor_StoneGolem.BP_StoneWaveActor_StoneGolem_C'";

    default m_SpawnCollisionHandlingOverride = ESpawnActorCollisionHandlingMethod::AlwaysSpawn;

    UPROPERTY()
    FName m_SpawnSocketName = n"foot_rSocket";

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        Super::OnActorSpawnedServer_Scriptable(ActorSpawned);
        
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    { 
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto charMesh = gothicChar.Mesh;
        auto socketLocation = charMesh.GetSocketLocation(m_SpawnSocketName);
        return socketLocation;
    }
   
}


