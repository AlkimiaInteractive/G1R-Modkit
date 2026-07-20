class UActionKeywords_Melee_TwoHanded_Orc : UActionKeywords_Melee_TwoHanded
{
    default m_ActionTag = GameplayTag::Ability_Combat_Attack;

	default m_Keywords.AddTag(GameplayTag::Item_Size_Orc);
}