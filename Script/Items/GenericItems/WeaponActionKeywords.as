class UActionKeywords_Melee : UActionKeywords
{
    default m_ActionTag = GameplayTag::Ability_Combat_Attack;

    default m_Keywords.AddTag(GameplayTag::Item_Range_Melee);
}

class UActionKeywords_Melee_OneHanded : UActionKeywords
{
    default m_ActionTag = GameplayTag::Ability_Combat_Attack;

	default m_Keywords.AddTag(GameplayTag::Item_Grip_OneHand);
    default m_Keywords.AddTag(GameplayTag::Item_Range_Melee);
}

class UActionKeywords_Melee_TwoHanded : UActionKeywords
{
    default m_ActionTag = GameplayTag::Ability_Combat_Attack;

	default m_Keywords.AddTag(GameplayTag::Item_Grip_TwoHand);
    default m_Keywords.AddTag(GameplayTag::Item_Range_Melee);
}

class UActionKeywords_Archery : UActionKeywords
{
    default m_ActionTag = GameplayTag::Ability_Combat_Archery;

    default m_Keywords.AddTag(GameplayTag::Item_Range_Long);
    default m_Keywords.AddTag(GameplayTag::Item_Range_Long);
}