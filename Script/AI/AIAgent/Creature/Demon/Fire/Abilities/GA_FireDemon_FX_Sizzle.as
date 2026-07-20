class UGA_FireDemon_FX_Sizzle : UGA_Creature_FX_Sound
{

    default AbilityTags.AddTag(GameplayTag::Ability_Creature_FireDemon_Sizzle);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FireDemon_Sizzle);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FireDemon_Sizzle);

    default m_FxTag = GameplayTag::FX_Creature_FireDemon_Sizzle;
}
