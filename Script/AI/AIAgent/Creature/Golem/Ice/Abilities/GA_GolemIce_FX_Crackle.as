class UGA_GolemIce_FX_Crackle : UGA_Creature_FX_Sound
{

    default AbilityTags.AddTag(GameplayTag::Ability_Creature_Golem_Ice_Crackle);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_Golem_Ice_Crackle);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_Golem_Ice_Crackle);

    default m_FxTag = GameplayTag::FX_Creature_Golem_Ice_Crackle;
}