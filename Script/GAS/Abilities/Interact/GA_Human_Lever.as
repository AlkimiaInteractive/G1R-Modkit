class UGA_Human_Lever : UGameplayAbilityLever
{

    UFUNCTION(BlueprintOverride)
    FName GetMontageName_Scriptable()
    {
        bool isUsable = m_EventTag == GameplayTag::Action_Lever_DestroyFinalBarrier;
        if(isUsable)
        {
            const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
            const UDataModule_Container target_dataModule_container = DataModule::GetContainerDataModule(character);
            if(target_dataModule_container.HasItemOnAnyInventory(UItAr_Rune_UrizielWaveOfDeath::StaticClass()))
            {
                return n"Magic";
            }
        }
        return n"";
    }
}

