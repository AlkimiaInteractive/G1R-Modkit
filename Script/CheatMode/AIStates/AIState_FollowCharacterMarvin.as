
/**
 * Follows the given character until they die. Steps out of the way, when GoalCharacter is blocked by the follower
 */
UCLASS()
class UAIState_FollowCharacterMarvin : UAIState_FollowCharacter 
{
    default OwnedGameplayTags.AddLeafTag(GameplayTag::AIState_Follow_MarvinMode);

    UAIState_FollowCharacterMarvin(AGothicCharacterState InCharacterToFollow, float InFollowDistance = 750.0f, float InSprintWhenFurtherAwayThan = -1.0f)
    {
        CharacterToFollow = InCharacterToFollow;
        FollowDistance = InFollowDistance;
        SprintWhenFurtherAwayThan = InSprintWhenFurtherAwayThan;
    }
}