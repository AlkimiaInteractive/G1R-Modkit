

/**
 * Follows the character that spawned us.
 */
UCLASS()
class UAIState_FollowOwner : UAIState_FollowCharacter
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        CharacterToFollow = Cast<AGothicNPCState>(CharacterState).GetSummonedBy();
        ThrowIf(CharacterToFollow == nullptr, "AIStateFollow_Owner was used on an AI that is not actually owned by another character!");
    }
}

class UAIState_DailyRoutine_FollowOwner : UAIState_DailyRoutine
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(0, 0, UAIState_FollowOwner(), NAME_None);
}