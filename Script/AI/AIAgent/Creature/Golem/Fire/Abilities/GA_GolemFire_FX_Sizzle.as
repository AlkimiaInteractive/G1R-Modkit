class UGA_GolemFire_FX_Sizzle : UGA_Creature_FX_Sound
{

    default AbilityTags.AddTag(GameplayTag::Ability_Creature_Golem_Fire_Sizzle);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_Golem_Fire_Sizzle);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_Golem_Fire_Sizzle);

    default m_FxTag = GameplayTag::FX_Creature_Golem_Fire_Sizzle;
}