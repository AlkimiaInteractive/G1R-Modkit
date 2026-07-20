class UGA_Spell_SpawnRepeatingProjectile : UGameplayAbilitySpellRepeatable
{
    default m_GE_Mana = UGE_Mana_AimingLaunchingSpell::StaticClass();

    bool m_FirstExecution = true;
    FString m_TransitionBase = "Launch";

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner, TSubclassOf<UObject> actorToSpawnClass) const
    {
        const auto spellConfig = GetSpellConfigurationContainer().GetSpellConfig();
        return MagicScript::GetCharacterBoneTransformGivenABoneName(owner, spellConfig.GetSpawnLocationSocketName()).GetLocation();
    }
    
    UFUNCTION(BlueprintOverride)
    void OnPlayLaunchSpellServer_Scriptable()
    {
        NotifySpellCategory();
        CheckNumLaunches();
        if(!HasInfiniteLaunches() && !HasMoreLaunches())
        {
            DoEndSpellAction();
            return;
        }

        if(m_FirstExecution)
        {
            m_FirstExecution = false;
            PlayLaunchSpellMontage_Scriptable(NAME_None, false);
        }
        else
        {
            //We are assuming all sections in the montage are of type 'LaunchN'
            int randomSection = Math::RandRange(1,GetNumSectionsLaunchSpellMontage());
            FString section = m_TransitionBase + randomSection;
            PlayLaunchSpellMontage_Scriptable(FName(section), false);
        }
    }
}