class URelationshipModifier_NC_Convoy_TowardsOldCamp : UActivePersonalRelationshipModifier_RelationshipToGuild
{
    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;
    default TargetGuild = GameplayTag::Guild_Human_OldCamp;
}

class URelationshipModifier_OC_Convoy_TowardsNewCamp : UActivePersonalRelationshipModifier_RelationshipToGuild
{
    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;
    default TargetGuild = GameplayTag::Guild_Human_NewCamp;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!Super::IsApplicableFor(Me, Other))
            return false;

        if (Other.CharacterUniqueName == "OC_SLD_Kharim_729")
            return false;

        if (Other.CharacterUniqueName == "NC_ORG_Drax_819")
            return false;

        if (Other.CharacterUniqueName == "NC_ORG_Ratford_818")
            return false;
        
        return true;
    }
}

class URelationshipModifier_NC_Convoy_TowardsHero : UActivePersonalRelationshipModifier_RelationshipToCharacterByUniqueName
{
    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;
    default CharacterUniqueName = n"Hero";
}
