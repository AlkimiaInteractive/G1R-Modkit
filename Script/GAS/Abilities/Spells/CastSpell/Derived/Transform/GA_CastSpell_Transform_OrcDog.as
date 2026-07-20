class UGA_CastSpell_Transform_OrcDog : UGA_CastSpell_Transform_Base
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Transform_OrcDog::StaticClass();
    default m_CastTransformEffect = UGE_CastTransform_OrcDog::StaticClass();
    default m_SpawnDefinition = USpawnCharacterCanTransformIntoDefinition_OrcDog::StaticClass();
}


