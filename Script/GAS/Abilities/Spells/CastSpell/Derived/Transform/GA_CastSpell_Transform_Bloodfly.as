class UGA_CastSpell_Transform_Bloodfly : UGA_CastSpell_Transform_Base
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Transform_Bloodfly::StaticClass();
    default m_CastTransformEffect = UGE_CastTransform_Bloodfly::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Bloodfly::StaticClass();
}
