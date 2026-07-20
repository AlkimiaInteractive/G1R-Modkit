UCLASS()
class UGA_Spell_IceBlock_IceGolem : UGA_Spell_IceBlock
{

    default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Ice/BP_IceWaveActor_IceGolem.BP_IceWaveActor_IceGolem_C'";

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        // auto spawnPosition = GetSpawnPositionServer_Scriptable(owner, actorToSpawnClass);

        // auto character = Cast<AAIAgentCharacter>(GetAvatarActorFromActorInfo());
        // auto target = character.TargetedActor;
        // if(target == nullptr)
        // {
        //     auto avatarRotation = GetAvatarActorFromActorInfo().GetActorRotation();
        //     return FRotator(0.f, avatarRotation.Yaw, avatarRotation.Roll);
        // }
        // FRotator rotation = MagicScript::FindLookAtRotation(spawnPosition, target.GetActorLocation());
        // return FRotator(0.f, rotation.Yaw, rotation.Roll);
        return owner.GetActorRotation();
    }
}