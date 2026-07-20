class UGA_CastSpell_Transform_Shadowbeast : UGA_CastSpell_Transform_Base
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Transform_Shadowbeast::StaticClass();
    default m_CastTransformEffect = UGE_CastTransform_Shadowbeast::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_ShadowBeast::StaticClass();
}


