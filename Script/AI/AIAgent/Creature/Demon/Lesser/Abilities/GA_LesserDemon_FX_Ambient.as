class UGA_LesserDemon_FX_Ambient : UGA_Creature_FX_Sound
{

    default AbilityTags.AddTag(GameplayTag::Ability_Creature_FX_LesserDemon_Ambient_Loop);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX_LesserDemon_Ambient_Loop);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX_LesserDemon_Ambient_Loop);

    default m_FxTag = GameplayTag::FX_Creature_LesserDemon_Ambient_Loop;
}
