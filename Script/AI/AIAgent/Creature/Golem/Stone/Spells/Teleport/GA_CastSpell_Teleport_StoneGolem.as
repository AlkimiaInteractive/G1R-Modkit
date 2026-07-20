class UGA_CastSpell_Teleport_StoneGolem : UGA_CastSpell_Teleport_Creature
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_GolemWeapon_Teleport_StoneGolem::StaticClass();

    UClass GetTeleportSpotFilterClass() override
    {
        auto currentCharacter =  Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        return Cast<UCharacterDefinition_Creature_Golem_Stone>(currentCharacter.GetCharacterDefinition()).m_TeleportSpotFilterClass;
    }
    
}