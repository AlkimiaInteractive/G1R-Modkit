class UGA_Spell_Wind : UGameplayAbilitySpellBasic
{
    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        return owner.GetActorLocation();
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        const FRotator controllerRot = m_MoveComp.Get().GetControllerRotation();
        return FRotator(0.f, controllerRot.Yaw, controllerRot.Roll);   
    }

}

