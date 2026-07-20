class UAIARM_Creature_Golem_Stone_Bridge : UAIARM_General_Base
{
    default SubModules.Add(UAIARM_ParalyzedEffects);
    default SubModules.Add(UAIARM_FearEffects);

    default SubModules.Add(UAIARM_Creature_Golem_Bridge_ActiveResponse);
}

class UAIARM_Creature_Golem_Bridge_ActiveResponse : UAIARM_MainActiveResponse_Base
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Dormant);

    default SubModules.Add(UAIARM_Creature_TestSimple);
    default SubModules.Add(UAIARM_Creature_Main);
    default SubModules.Add(UAIARM_ToFollowCharacter);
}
