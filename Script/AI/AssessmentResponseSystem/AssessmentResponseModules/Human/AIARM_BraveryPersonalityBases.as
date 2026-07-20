UCLASS(Abstract)
class UAIARM_StandardBravery : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Character_Personality_Brave);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Character_Personality_Coward);
}

UCLASS(Abstract)
class UAIARM_CowardPersonality : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Character_Personality_Coward);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Character_Personality_Brave);
}

UCLASS(Abstract)
class UAIARM_BraveRoleOrPersonality : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Boss);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Character_Personality_Brave);

    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Character_Personality_Coward);
}

UCLASS(Abstract)
class UAIARM_GuardOrLeaderRole : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default RequireAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
}

UCLASS(Abstract)
class UAIARM_NoGuardNorLeaderRole : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::CampRole_Leadership);
}