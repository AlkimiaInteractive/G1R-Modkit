class UGA_CastSpell_Transform_Wolf : UGA_CastSpell_Transform_Base
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Transform_Wolf::StaticClass();
    default m_CastTransformEffect = UGE_CastTransform_Wolf::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_Wolf::StaticClass();
}