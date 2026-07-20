#ifdef WITH_STORY_G1R
class URelationshipModifier_ConvoyGuildsRelationshipChange_OldCamp : UStaticRelationshipModifier
{
    default Weight = 5.0f;
    default ForGuild.AddTag(GameplayTag::Guild_Human_Convoy_OldCamp);
    default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_NewCamp, ERelationship::Enemy);
    default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_NewCamp, ERelationshipHostility::AttackOnSight);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld CurrentWorld) const
    {
        if (G1R::UStoryG1R::Get().Convoy_RaidStart >= 1)
            return true;

        return false;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_ConvoyGuildsRelationshipChange_NewCamp : UStaticRelationshipModifier
{
    default Weight = 5.0f;
    default ForGuild.AddTag(GameplayTag::Guild_Human_Convoy_NewCamp);
    default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationship::Enemy);
    default HostilityTowardsGuild.Add(GameplayTag::Guild_Human_Convoy_OldCamp, ERelationshipHostility::AttackOnSight);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld CurrentWorld) const
    {
        if (G1R::UStoryG1R::Get().Convoy_RaidStart >= 1)
            return true;
        
        return false;
    }
}
#endif