
/** 
 * Lets multiple characters queue up for the given actor. The state ends when the character is at the front of the queue.
 * You can then do the action that the characters are queing for. After that action is done, call LeaveQueue() to make room for the next Character.
 * 
 * Use TimeLimitSeconds to define the maximum time the character is allowed to wait inside the queue. (Passing -1 means infinite). In that case,
 * check the returned TaskResult to see whether the Task was successful or cancelled (e.g. on timeout).
 */
mixin FAbilityTaskExecutor WaitInQueue(UGameplayAbility_CharacterAI AI, AInteractiveObjectActor QueueForActor, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(UAIState_WaitInQueue(QueueForActor), TimeLimitSeconds);
}

/** 
 * Leave all queues that the character was part of after calling WaitInQueue(). This frees up the spot for the next character in line.
 * It is safe to call this even if the character is not part of any queue.
 */
mixin void LeaveQueue(UGameplayAbility_CharacterAI AI)
{
    AI.LeaveGroupsWithClass(UAIGroup_QueuingForActor::StaticClass());
}



/** ---------- Implementation ---------- */

/**
 * Group that is shared between all the characters that are waiting in this queue.
 */
UCLASS()
class UAIGroup_QueuingForActor : UGothicAIGroup
{
    AInteractiveObjectActor QueueTarget;
    float DistanceBetweenCharacters = 200.0f;

    /** 
     * Returns the characters position in the queue,
     * equal to how many other characters are standing infront of us.
     * A value of 0 means that the character is in the front of the queue.
     */
    int QueueSpotOf(AGothicCharacter Character)
    {
        return JoinedCharacters.FindIndex(Character);
    }

    FVector FindQueueStandingPositionForCharacter(AGothicCharacter Character)
    {
        return FindQueueStandingPositionForSpot(QueueSpotOf(Character));
    }

    FVector FindQueueStandingPositionForSpot(int spot)
    {
        return QueueTarget.ActorLocation + QueueTarget.ActorForwardVector * (spot + 1) * DistanceBetweenCharacters;
    }

    UFUNCTION(BlueprintOverride)
    TArray<AActor> GetGroupTargets() const
    {
        TArray<AActor> Targets;
        Targets.Add(QueueTarget);
        
        return Targets;
    }
}

/**
 * Lets the Character queue infront of an actor. If nobody else wants to use that actor, no queue will be made. When other Characters
 * come in, wanting to use the same actor, a queue is formed and they wait until they are at the front of the queue.
 * 
 * @see WaitInQueue
 * @see LeaveQueue
 */
UCLASS()
class UAIState_WaitInQueue : UGothicCharacterAIState
{
    const float QUEUE_DETECTION_RADIUS = 1000.0f;

    UAIState_WaitInQueue(AInteractiveObjectActor Destination)
    {
        QueueDestination = Destination;
    }

    UPROPERTY()
    AInteractiveObjectActor QueueDestination;

    UPROPERTY()
    UAIGroup_QueuingForActor QueueGroup;

    UPROPERTY()
    int LastQueueSpot = -1;

    /** How long it takes for this character to react to the queue moving */
    UPROPERTY()
    float ReactionTimeSeconds = 1.0f;

    /** Maximum random amount added to ReactionTimeSeconds */
    UPROPERTY()
    float ReactionTimeVariance = 1.0f;

    protected UAIGroup_QueuingForActor CreateAndJoinGroup_QueuingForActor(AInteractiveObjectActor QueueTarget)
    {
        auto Group = Cast<UAIGroup_QueuingForActor>(AI.CreateAndJoinGroup(UAIGroup_QueuingForActor::StaticClass()));

        Group.QueueTarget = QueueTarget;

        return Group;
    }

    protected UAIGroup_QueuingForActor FindLongestQueue()
    {
        auto Groups = AI.FindGroupInCharactersAtLocation(UAIGroup_QueuingForActor::StaticClass(), Self.ActorLocation, QUEUE_DETECTION_RADIUS * 2.0f);

        UAIGroup_QueuingForActor LongestQueue = QueueGroup;

        for (auto Group : Groups)
        {
            UAIGroup_QueuingForActor Queue = Cast<UAIGroup_QueuingForActor>(Group);

            if (Queue.QueueTarget != QueueDestination)
                continue;

            if (LongestQueue == nullptr || Queue.JoinedCharacters.Num() > LongestQueue.JoinedCharacters.Num())
            {
                LongestQueue = Queue;
            }
        }

        return LongestQueue;
    }

    protected void JoinQueue()
    {
        // Maybe we can see the queue already
        UAIGroup_QueuingForActor ExistingQueue = FindLongestQueue();

        // We're too far from the queue to join, go towards it!
        if (QueueGroup == nullptr && ExistingQueue == nullptr && Self.GetDistanceTo(QueueDestination) > QUEUE_DETECTION_RADIUS * 1.1f)
        {
            AI.GotoPosition(QueueDestination.ActorLocation, QUEUE_DETECTION_RADIUS);
            
            // We may have found an even longer queue than ours, join that one instead
            ExistingQueue = FindLongestQueue();
        }
        
        if (QueueGroup == nullptr && ExistingQueue == nullptr)
        {
            // There is no queue yet, start one!
            QueueGroup = CreateAndJoinGroup_QueuingForActor(QueueDestination);
        }
        else if (ExistingQueue != QueueGroup)
        {
            // While going towards the spot, we found that there is a queue already!
            AI.LeaveGroupsWithClass(UAIGroup_QueuingForActor::StaticClass());
            AI.JoinGroup(ExistingQueue);

            QueueGroup = ExistingQueue;
        }
        else
        {
            // Stay in the same queue
        }
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if (QueueDestination == nullptr)
        {
            EndTaskAsFailure();
            return;
        }
 
        while(true)
        {
            // We may have just noticed a new queue that is longer than the one we found
            // That's why we're checking every on loop
            JoinQueue();

            if (LastQueueSpot != QueueGroup.QueueSpotOf(Self))
            {
                if (LastQueueSpot != -1)
                {
                    WaitSeconds(0.1f * LastQueueSpot);
                }

                LastQueueSpot = QueueGroup.QueueSpotOf(Self);

                AI.GotoPosition(QueueGroup.FindQueueStandingPositionForSpot(LastQueueSpot));
            }
            else
            {
                WaitSeconds(Math::RandRange(ReactionTimeSeconds, ReactionTimeSeconds + ReactionTimeVariance));
            }

            if (LastQueueSpot == 0)
            {
                // Keep the spot until someone calls LeaveQueue from outside
                break;
            }
        }
        
        EndTaskAsSuccess();
    }
}