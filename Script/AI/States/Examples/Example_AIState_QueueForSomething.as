/**
 * In this state, the NPC will try to use the given Actor. If multiple NPCs want
 * to use the given Actor at the same time, a queue is formed.
 * 
 * Once an NPC reaches the front of the queue, an action can be performed. In this example,
 * each NPC will draw their weapon, do a few swordswings and put their weapon away. After
 * that is done, they will leave the queue to make room for the next person.
 */
UCLASS()
class UAIState_Human_QueueForSomething : UGothicCharacterAIState
{
    UAIState_Human_QueueForSomething(AInteractiveObjectActor InQueueTarget)
    {
        QueueTarget = InQueueTarget;
    }

    /** Target that we're queing for. */
    UPROPERTY()
    AInteractiveObjectActor QueueTarget;
    
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {        
        WaitSeconds(2);

        AI.WaitInQueue(QueueTarget);
        {
            AI.DrawMeleeWeapon();

            AI.AttackLeft();
            AI.AttackRight();
            
            AI.UndrawWeapon();
        }
        AI.LeaveQueue();

        // Make room for the next person
        AI.GoRight(1000.0f);
    }

    UFUNCTION(BlueprintOverride)
    void OnExternalCancel()
    {
        // When cancelled from outside, make sure to always give up the spot in
        // the queue for the next person.
        AI.LeaveQueue();
    }
}
