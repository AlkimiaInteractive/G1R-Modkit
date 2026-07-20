class UGA_CastSpell_Transform_Swampshark : UGA_CastSpell_Transform_Base
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Transform_Swampshark::StaticClass();
    default m_CastTransformEffect = UGE_CastTransform_Swampshark::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Swampshark::StaticClass();
}