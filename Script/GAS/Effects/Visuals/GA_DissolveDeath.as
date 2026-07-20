UCLASS()
class UGA_Death_Dissolve : UGA_Death
{
    default m_DeathGE = UGE_Death_Dissolve::StaticClass();
}

class UGE_Death_Dissolve : UGE_Death
{	
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
    default RemoveOtherTags();	
}