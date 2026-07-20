class UGA_CastSpell_Teleport_SkeletonMage : UGA_CastSpell_Teleport_Creature
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_SkeletonMageWeapon_Teleport::StaticClass();

    UClass GetTeleportSpotFilterClass() override
    {
        auto currentCharacter =  Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        return Cast<UCharacterDefinition_Creature_Skeleton_Mage>(currentCharacter.GetCharacterDefinition()).m_TeleportSpotFilterClass;
    }    
}