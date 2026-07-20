class URelationshipModifier_SpeciesRelationshipTowardsPlayer_AngryToHostile : UPersonalRelationshipModifier
{
    default Weight = 5.0f;

    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Undead_Orc);

    default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);

    default RelationshipTowardsOther = ERelationship::Hostile;
}

class URelationshipModifier_SpeciesRelationshipTowardsPlayer_EnemyToHostile : UPersonalRelationshipModifier
{
    default Weight = 5.0f;

    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Undead_Orc);

    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::AIState_Conflict_Combat);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::AIState_Conflict_Fear);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::AIState_Conflict_Flee);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);

    default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);

    default RelationshipTowardsOther = ERelationship::Hostile;
}