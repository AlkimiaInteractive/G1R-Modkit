
class UGA_CastSpell_Teleport_MiltenSleeper : UGA_CastSpell_Teleport_Creature
{
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
	
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::State_Hit);

    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_MiltenSleeper_Teleport::StaticClass();

    UClass GetTeleportSpotFilterClass() override
    {
        auto currentCharacter =  Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        return Cast<UCharacterDefinition_Human_OC_KDF_Milten_Sleeper>(currentCharacter.GetCharacterDefinition()).m_TeleportSpotFilterClass;
    }   

    UCreatureTeleportComponent GetTeleportComponent() override
    {
        return Cast<UCreatureTeleportComponent>(UCreatureTeleportComponent::GetOrCreate(GetAvatarActorFromActorInfo()));
    } 
}