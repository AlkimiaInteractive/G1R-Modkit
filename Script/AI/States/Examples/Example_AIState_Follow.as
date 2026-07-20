/**
 * This state lets the NPC follow the given other character until they die.
 * 
 * Note: As this state requires the Actor of the character to be passed as parameter, it cannot be used within
 *       a daily routine schedule directly. However, it can be used from e.g. perception handlers!
 */
UCLASS()
class UAIState_Example_Follow : UGothicCharacterAIState
{
    UAIState_Example_Follow(AGothicCharacter InFollowCharacter)
    {
        FollowCharacter = InFollowCharacter;
    }

    UPROPERTY()
    AGothicCharacter FollowCharacter;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {   
        check(FollowCharacter != nullptr);

        AI.StartFollowingActor(FollowCharacter, ReachDistance = 750.0f);
        {
            while(!FollowCharacter.IsDead() && !FollowCharacter.IsDefeated())
            {
                WaitOneTick();
            }
        }
        AI.StopFollowingActor(FollowCharacter);
    }
}