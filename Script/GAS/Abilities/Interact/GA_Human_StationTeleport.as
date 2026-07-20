class UGA_Human_StationTeleport : UGameplayAbilityStationTeleport
{
    default m_SpawnTeleportPath = n"Blueprint'/Game/Maps/Magic/BP_TeleportLocation.BP_TeleportLocation_C'";
    default m_MaxTraceDistanceToFindGround = 1000.0f;
    default m_TeleportAppearingClass = n"Blueprint'/Game/GameplayCues/GC_TeleportAppearingActor.GC_TeleportAppearingActor_C'";

    UFUNCTION(BlueprintOverride)
    FName GetMontageNameTeleport_Scriptable(FName& originalName)
    {
        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        const UDataModule_Container target_dataModule_container = DataModule::GetContainerDataModule(character);
        if(target_dataModule_container.HasItemOnAnyInventory(UItAr_Rune_UrizielWaveOfDeath::StaticClass()))
        {
            auto newNameString = f"{originalName}_magic";
            FName newName(newNameString);
            return newName;
        }
        return originalName;
    }
}

