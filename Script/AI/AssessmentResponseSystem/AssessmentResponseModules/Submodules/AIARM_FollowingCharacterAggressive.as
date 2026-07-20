class UAIARM_FollowingCharacterAggressive : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Follow_Aggressive);

    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::Species_Human);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::Species_Orc);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Dead);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable);

    default SubModules.Add(UAIARM_ProactiveCreatureAggression);
}