class UGA_Spell_Teleport_Creature : UGameplayAbilitySpellBasic
{
    //default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Stone/BP_StoneWaveActor_StoneGolem.BP_StoneWaveActor_StoneGolem_C'";


    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        //Super::OnActorSpawnedServer_Scriptable(ActorSpawned);
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        auto currentCharacter =  Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
       
        auto teleportComponent = Cast<UCreatureTeleportComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(UCreatureTeleportComponent::StaticClass()));
        if(teleportComponent == nullptr)
        {
            return;
        }

        teleportComponent.DoTeleportToSpotVisual();
    }

    UFUNCTION(BlueprintOverride)
    void DoSpellBehaviour_Scriptable()
    {
        PlayLaunchSpellMontage(NAME_None, false);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        //@DE - Deactivate tick optimizer for teleport.
        UBFGTickOptimizerSystem::SetTickOptimizationRuntime_Enabled(GetAvatarActorFromActorInfo(), true);
    }

    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable()
    {
        return false;
    }
   
}





