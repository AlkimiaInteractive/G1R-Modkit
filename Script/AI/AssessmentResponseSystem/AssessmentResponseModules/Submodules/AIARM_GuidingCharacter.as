/**
 * AIARM Module for characters currently guiding another character.
 * 
 * IMPORTANT: This module ONLY affects behavior toward CREATURES.
 * Human interactions are explicitly blocked - normal guild/crime rules apply.
 */
class UAIARM_GuidingCharacter : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Guide);

    // Block if already in combat or fleeing
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    // Ignore humans and let normal guild/crime rules handle them
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::Species_Human);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::Species_Orc);

    // Ignore dead or defeated creatures
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Dead);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    // Never treat rideable scavenger as a threat while guiding
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable);

    default SubModules.Add(UAIARM_ProactiveCreatureAggression);
}