/** 
 * Mixins for AI commands that were defined in C++.  These are listed here to
 * provide the same interface as script based AI commands.
 * 
 * The idea is, that these can be used like this from an AI-state:
 * 
 *     AI.DoSomeTask();
 * 
 * If you need to do actions while some command is running, try the start/stop variants:
 * 
 *     AI.StartFollowing(Other);
 *     AI.WaitForSomething();
 *     AI.StopFollowing(Other);
 */

/**
 * Checks if the given task was executed successfully. 
 * 
 * Use this like so:
 * 
 *     if (!AI.GotoWaypoint(...).WasSuccessful())
 *     { 
 *         DoSomething(); 
 *     }
 * 
 * 
 * This is the same as writing:
 * 
 *     if (AI.GotoWaypoint(...).Result != EGenericTaskResult::Success)
 *     {
 *         DoSomething()
 *     }
 */
mixin bool WasSuccessful(const FAbilityTaskExecutor& Task)
{
    return Task.Result == EGenericTaskResult::Success;
}

/** Lets the character go to the given waypoint. Pauses the function until the waypoint is reached. */
mixin FAbilityTaskExecutor GotoWaypoint(UGameplayAbility_AI AI, FName WaypointName, float TimeLimitSeconds = -1.0f)
{
    if (AI.Character != nullptr && AI.Character.IsPlayerControlled())
    {
        FInteractionSpotHandle InteractionSpot = FInteractionSpotHandle(WaypointName);

        if (!InteractionSpot.IsValid())
            return FAbilityTaskExecutor();

        return FAbilityTaskExecutor(UAbilityTask_MoveRotateToLocation::MoveRotateToLocation(AI, NAME_None, InteractionSpot.Transform, false));
    }

    return FAbilityTaskExecutor(TaskGotoWaypoint(AI, WaypointName), TimeLimitSeconds);
}

/** Lets the character go to the given position. Pauses the function until the position is reached. */
mixin FAbilityTaskExecutor GotoPosition(UGameplayAbility_AI AI, FVector TargetPosition, float ReachDistance = -1.0f, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(UAbilityTask_GotoPosition::TaskGotoPosition(AI, TargetPosition, ReachDistance), TimeLimitSeconds);
}

mixin bool CanGotoPosition(const UGameplayAbility_AI AI, FVector TargetPosition, float ReachDistance = -1.0f)
{
    return UAbilityTask_GotoPosition::CanGotoPosition(AI.Character, TargetPosition, ReachDistance);
}

mixin bool IsAlreadyAtGoal(const UGameplayAbility_AI AI, FVector TargetPosition, float ReachDistance = -1.0f)
{
    return UAbilityTask_NavigationRequest::IsAlreadyAtGoal(AI.CharacterState, TargetPosition, ReachDistance);
}

/** Lets the character go to the given other character. Pauses the function until the position is reached. */
mixin FAbilityTaskExecutor GotoCharacter(UGameplayAbility_AI AI, AGothicCharacter Other, float ReachDistance = -1.0f)
{
    // TODO: Implement via TaskGotoActor
    return FAbilityTaskExecutor(UAbilityTask_GotoPosition::TaskGotoPosition(AI, Other.GetFeetLocation(), ReachDistance));
}

mixin bool CanGotoCharacter(const UGameplayAbility_AI AI, AGothicCharacter Other, float ReachDistance = -1.0f)
{
    return UAbilityTask_GotoPosition::CanGotoPosition(AI.Character, Other.FeetLocation, ReachDistance);
}

/** Lets the character go to the given other character. Pauses the function until the position is reached. */
mixin FAbilityTaskExecutor GotoCharacter(UGameplayAbility_AI AI, AGothicCharacterState Other, float ReachDistance = -1.0f)
{
    if (Other.Character != nullptr)
    {
        return AI.GotoCharacter(Other.Character, ReachDistance < 0 ? Other.Character.SimpleCollisionRadius * 1.5f : ReachDistance);
    }

    // TODO: Implement via TaskGotoActor
    return FAbilityTaskExecutor(UAbilityTask_GotoPosition::TaskGotoPosition(AI, Other.GetCharacterLocation(), ReachDistance));
}

mixin bool CanGotoCharacter(const UGameplayAbility_AI AI, AGothicCharacterState Other, float ReachDistance = -1.0f)
{
    return UAbilityTask_GotoPosition::CanGotoPosition(AI.Character, Other.GetCharacterLocation(), ReachDistance);
}

// TODO this should use UAbilityTask_GotoInteractionSpot
/** Lets the character go to the given Freepoint. Pauses the function until the freepoint is reached. */
mixin FAbilityTaskExecutor GotoFreepoint(UGameplayAbility_AI AI, FInteractionSpotHandle InteractionSpot, float TimeLimitSeconds = -1.0f, float ReachDistance = -1.0f)
{
    if(ReachDistance == -1.0f)
    {
        return FAbilityTaskExecutor(UAbilityTask_GotoPosition::TaskGotoPosition(AI, InteractionSpot.Location,  InteractionSpot.AreaRadius), TimeLimitSeconds);
    }

    // return FAbilityTaskExecutor(UAbilityTask_GotoGameplayPoint::TaskGotoGameplayPoint(AI, FreepointID), TimeLimitSeconds);
    return FAbilityTaskExecutor(UAbilityTask_GotoPosition::TaskGotoPosition(AI, InteractionSpot.Location, ReachDistance), TimeLimitSeconds);
}

// TODO this should use UAbilityTask_GotoInteractionSpot
mixin bool CanGotoFreepoint(const UGameplayAbility_AI AI, FInteractionSpotHandle InteractionSpot, float ReachDistance = -1.0f)
{
    return UAbilityTask_GotoPosition::CanGotoPosition(AI.Character, InteractionSpot.Location, ReachDistance);
}

/** Lets the character go to the location it currently wants to be at. (e.g. DailyRoutine waypoint) */
mixin FAbilityTaskExecutor GotoPreferredLocation(UGameplayAbility_AI AI)
{
    return FAbilityTaskExecutor(UAbilityTask_GotoPreferredLocation::TaskGotoPreferredLocation(AI));
}

mixin bool CanGotoPreferredLocation(UGameplayAbility_AI AI)
{
    return UAbilityTask_GotoPreferredLocation::CanGotoPreferredLocation(AI.Character);
}

/** 
 * Lets the character go to the given location, while waiting for the given other actor to follow. Pauses the function until the waypoint is reached.
 * The character will wait when the guided actor is further away than WaitingDistance, and then continue walking once the guided actor is closer than CloseDistance again.
 */
mixin FAbilityTaskExecutor GuideActorToLocation(UGameplayAbility_AI AI, FVector Location, AGothicCharacterState CharacterStateToGuide, float GoalReachedDistance = 100.f, float CloseDistance = 300.f, float WaitingDistance = 1000.f, float AbandonDistance = 2000.f, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskGuideToLocation(AI, Location, CharacterStateToGuide, GoalReachedDistance, CloseDistance, WaitingDistance, AbandonDistance), TimeLimitSeconds);
}

/** Lets the character go into the given direction. Pauses the function until the target is reached. */
mixin FAbilityTaskExecutor GoIntoDirection(UGameplayAbility_AI AI, FVector Direction, float Distance, float ReachDistance = -1.0f, float TimeLimitSeconds = -1.0f, float MinimumMoveDistance = 0.0f)
{
    FVector EndPosition;

    if (!AI.IsMoveDistanceLargerThan(Direction, Distance, MinimumMoveDistance, EndPosition))
        return FAbilityTaskExecutor();

    return FAbilityTaskExecutor(UAbilityTask_GotoPosition::TaskGotoPosition(AI, EndPosition, ReachDistance, AI.Character.CanStrafe()), TimeLimitSeconds);
}

mixin bool CanMoveIntoDirection(const UGameplayAbility_AI AI, FVector Direction, float Distance, float ReachDistance = -1.0f, float MinimumMoveDistance = 0.0f)
{
    FVector EndPosition;

    if (!AI.IsMoveDistanceLargerThan(Direction, Distance, MinimumMoveDistance, EndPosition))
        return false;

    return AI.CanGotoPosition(EndPosition, ReachDistance);
}

mixin bool IsMoveDistanceLargerThan(const UGameplayAbility_AI AI, FVector Direction, float Distance, float MinimumMoveDistance = 0.0f, FVector& EndPosition = FVector())
{
    FVector NormalizedDirection = Direction;
    NormalizedDirection.Normalize();

    FVector StartLocation = AI.GetLastKnownNavLocationOrFeetLocation();

    // using GetDistanceUntilMoveObstucted or CanMoveInDirection: they wrap NavigationRaycast there and handle an edge case that leads to false results
    float DistanceToBlock = UNavigationSystemV1::GetDistanceUntilMoveObstructed(AI.Character, StartLocation, NormalizedDirection, Distance);
    EndPosition = StartLocation + NormalizedDirection * DistanceToBlock;

    return EndPosition.Distance(StartLocation) > MinimumMoveDistance;
}

/** 
* Lets the character go to the given position in a straight line. This will moves the character directly without the use of pathfollowing.
 * Will not interrupt an ongoing pathfollowing request. Does not require NavMesh. Be super careful with this! 
 */
mixin FAbilityTaskExecutor GoBackOntoNavMesh(UGameplayAbility_AI AI, float TimeLimitSeconds = -1.0f)
{
    FVector LastNavLocationOrFeetLocation = AI.AIController.TryGetValidNavLocation();
   
    float AgentRadius = AI.AIController.GetSimpleCollisionRadius();

    return FAbilityTaskExecutor(TaskDirectMoveTowardsLocation(AI, LastNavLocationOrFeetLocation, AgentRadius), TimeLimitSeconds);
}

/** Am I located on NavMesh or close enough to it, to move with a navigation request? */
mixin bool CanGoBackOntoNavMesh(const UGameplayAbility_AI AI)
{
    return !AI.AIController.IsFullyOutSideNavMesh();
}

/** Last valid feet location where character did stand on NavMesh or the contorllers feet location */
mixin FVector GetLastKnownNavLocationOrFeetLocation(const UGameplayAbility_AI AI)
{
    if (AI.AIController == nullptr)
        return AI.CharacterState.ApproximateFeetLocation;

    return AI.AIController.TryGetValidNavLocation();
}

/** Lets the character turn to face the given position. Pauses the function until the action is completed. */
mixin FAbilityTaskExecutor TurnToPosition(UGameplayAbility_AI AI, FVector Position)
{
    return FAbilityTaskExecutor(TaskTurnToPosition(AI, Position));
}

/** Lets the character go the given distance to its left. Pauses the function until the target is reached. */
mixin FAbilityTaskExecutor GoLeft(UGameplayAbility_AI AI, float Distance, float ReachDistance = -1.0f, float TimeLimitSeconds = -1.0f)
{
    return AI.GoIntoDirection(-AI.AvatarActorFromActorInfo.ActorRightVector, Distance, ReachDistance, TimeLimitSeconds);
}

/** Lets the character go the given distance to its right. Pauses the function until the target is reached. */
mixin FAbilityTaskExecutor GoRight(UGameplayAbility_AI AI, float Distance, float ReachDistance = -1.0f, float TimeLimitSeconds = -1.0f)
{
    return AI.GoIntoDirection(AI.AvatarActorFromActorInfo.ActorRightVector, Distance, ReachDistance, TimeLimitSeconds);
}

/** Lets the character go the given distance in its forward facing direction. Pauses the function until the target is reached. */
mixin FAbilityTaskExecutor GoForward(UGameplayAbility_AI AI, float Distance, float ReachDistance = -1.0f, float TimeLimitSeconds = -1.0f)
{
    return AI.GoIntoDirection(AI.AvatarActorFromActorInfo.ActorForwardVector, Distance, ReachDistance, TimeLimitSeconds);
}

/** Lets the character go the given distance in its backwards facing direction. Pauses the function until the target is reached. */
mixin FAbilityTaskExecutor GoBack(UGameplayAbility_AI AI, float Distance, float ReachDistance = -1.0f, float TimeLimitSeconds = -1.0f)
{
    return AI.GoIntoDirection(-AI.AvatarActorFromActorInfo.ActorForwardVector, Distance, ReachDistance, TimeLimitSeconds);
}


/** Lets the character try to find and use a freepoint with the given actions. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepoint(UGameplayAbility_CharacterAI AI, FGameplayTagContainer PossibleActions, float FreepointSearchRadius = 500.0f, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskFindAndInteractWithSpotRandomAction(AI, AI.CharacterState.CharacterLocation, FreepointSearchRadius, PossibleActions, TimeLimitSeconds));
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepoint(UGameplayAbility_CharacterAI AI, FGameplayTag ActionToDo, float FreepointSearchRadius = 500.0f, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskFindAndInteractWithSpot(AI, AI.CharacterState.CharacterLocation, FreepointSearchRadius, ActionToDo, TimeLimitSeconds));
}

/** Lets the character try to find and pick up an item of the given class. */
mixin FAbilityTaskExecutor FindAndPickUpItem(UGameplayAbility_AI AI, TSubclassOf<UItemDefinition> ItemDefinition, const FVector& AtLocation, float AllowedRadius = 250.0f)
{
    return FAbilityTaskExecutor(TaskFindAndPickUpItem(AI, ItemDefinition, AtLocation, AllowedRadius));
}

/** Lets the character try to find and pick up an carryable item of the given class that was dropped. */
mixin FAbilityTaskExecutor FindAndPickUpDroppedItem(UGameplayAbility_AI AI, TSubclassOf<UItemDefinition> ItemDefinition, const FVector& AtLocation, float AllowedRadius = 250.0f)
{
    return FAbilityTaskExecutor(TaskFindAndPickUpDroppedItem(AI, ItemDefinition, AtLocation, AllowedRadius));
}

/** Lets the character try pick up a specific item. */
mixin FAbilityTaskExecutor PickUpSpecificItem(UGameplayAbility_AI AI, AItemVisualWorld Item)
{
    return FAbilityTaskExecutor(TaskPickUpSpecificItem(AI, Item));
}

/** Lets the character try eat a specific item. */
mixin FAbilityTaskExecutor EatSpecificItem(UGameplayAbility_AI AI, AItemVisualWorld Item)
{
    return FAbilityTaskExecutor(TaskEatSpecificItem(AI, Item));
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepointAt(UGameplayAbility_CharacterAI AI, FGameplayTag ActionToDo, FName Waypoint, float FreepointSearchRadius = 500.0f, float TimeLimitSeconds = -1.0f)
{
    if (Waypoint.IsNone())
    {
        return FAbilityTaskExecutor(TaskFindAndInteractWithSpot(AI, AI.CharacterState.CharacterLocation, FreepointSearchRadius, ActionToDo, TimeLimitSeconds));
    }
    else
    {
        return FAbilityTaskExecutor(TaskInteractWithSpot(AI, FInteractionSpotHandle(Waypoint), ActionToDo, TimeLimitSeconds));
    }
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepointAt(UGameplayAbility_CharacterAI AI, FGameplayTag ActionToDo, FVector Location, float FreepointSearchRadius = 500.0f, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskFindAndInteractWithSpot(AI, Location, FreepointSearchRadius, ActionToDo, TimeLimitSeconds));
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepointAt(UGameplayAbility_CharacterAI AI, FGameplayTagContainer PossibleActions, FName Waypoint, float FreepointSearchRadius = 500.0f, float TimeLimitSeconds = -1.0f)
{   
    if (Waypoint.IsNone())
    {
        return AI.TryUseFreepointAt(PossibleActions, AI.CharacterState.CharacterLocation, FreepointSearchRadius, TimeLimitSeconds);
    }

    auto ExplicitSpot = InteractionSpots.FindSpotByName(Waypoint);
    
    if (!ExplicitSpot.IsValid())
        return FAbilityTaskExecutor();

    return FAbilityTaskExecutor(TaskInteractWithSpotRandomAction(AI, ExplicitSpot, PossibleActions, TimeLimitSeconds));
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepointAt(UGameplayAbility_CharacterAI AI, FGameplayTagContainer PossibleActions, FVector Location, float FreepointSearchRadius = 500.0f, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskFindAndInteractWithSpotRandomAction(AI, Location, FreepointSearchRadius, PossibleActions, TimeLimitSeconds));
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepoint(UGameplayAbility_CharacterAI AI, FGameplayTag Action, FInteractionSpotHandle Spot, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskInteractWithSpot(AI, Spot, Action, TimeLimitSeconds));
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepoint(UGameplayAbility_CharacterAI AI, FGameplayTagContainer PossibleActions, FInteractionSpotHandle Spot, float TimeLimitSeconds = -1.0f)
{
    FGameplayTag ActionToDo;

    for (auto& Action : PossibleActions.GameplayTags)
    {
        if (!Spot.IsActionPossibleHere(Action))
            continue;

        if (Spot.CanBeClaimedBy(AI.CharacterState, Action))
        {
            ActionToDo = Action;
            break;
        }
    }

    if (!ActionToDo.IsValid())
        return FAbilityTaskExecutor();

    return FAbilityTaskExecutor(TaskInteractWithSpot(AI, Spot, ActionToDo, TimeLimitSeconds));
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepointAtPreferredLocation(UGameplayAbility_CharacterAI AI, FGameplayTag Action, float RadiusMultiplier = 1.0f, float TimeLimitSeconds = -1.0f)
{
    auto PreferredLocation = UPreferredLocationComponent::Get(AI.PersistentSelf);

    return AI.TryUseFreepointAt(Action, PreferredLocation.CenterPoint, PreferredLocation.RadiusFromCenter * RadiusMultiplier, TimeLimitSeconds);
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryUseFreepointAtPreferredLocation(UGameplayAbility_CharacterAI AI, FGameplayTagContainer PossibleActions, float RadiusMultiplier = 1.0f, float TimeLimitSeconds = -1.0f)
{
    auto PreferredLocation = UPreferredLocationComponent::Get(AI.PersistentSelf);

    return AI.TryUseFreepointAt(PossibleActions, PreferredLocation.CenterPoint, PreferredLocation.RadiusFromCenter * RadiusMultiplier, TimeLimitSeconds);
}

/** Lets the character try to do an interaction without any freepoint. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor TryInteractionWithoutSpot(UGameplayAbility_AI AI, FGameplayTag Action, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskInteractHereWithoutSpot(AI, Action, TimeLimitSeconds));
}


/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin FAbilityTaskExecutor InteractWith(UGameplayAbility_AI AI, AInteractiveObjectActor Object, FGameplayTag Action, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskInteractWithActor(AI, Object, Action, TimeLimitSeconds));
}

/** Lets the character try to find and use a freepoint with the given action. Pauses the function until the freepoint has been left. */
mixin void StartInteractingWith(UGameplayAbility_AI AI, AInteractiveObjectActor Object)
{
    // auto Task = TaskFreepointActionExplicitFP(AI, Object.PossibleActions, Object.GameplayPointID);
    // Task.ReadyForActivation();
}

mixin void StopInteractingWith(UGameplayAbility_CharacterAI AI, AInteractiveObjectActor Object)
{
    for (auto Task : AI.GetActiveTasksOfClass(UAbilityTask_InteractWith::StaticClass()))
    {
        auto InteractTask = Cast<UAbilityTask_InteractWith>(Task);

        if (!InteractTask.InteractionSpot.IsSet())
            continue;

        if (InteractTask.InteractionSpot.ActorToInteractWith != Object)
            continue;

        InteractTask.ExternalCancel();
    }
}

/** Lets the Character go into blocking stance. Pauses the function until the stance switch is done. */
mixin FAbilityTaskExecutor EnterBlockingStance(UGameplayAbility_AI AI) 
{ 
    return FAbilityTaskExecutor(TaskEnterBlockingStance(AI)); 
}

/** Lets the Character exit out of blocking stance. Pauses the function until the stance switch is done. */
mixin FAbilityTaskExecutor LeaveBlockingStance(UGameplayAbility_AI AI) 
{ 
    return FAbilityTaskExecutor(TaskLeaveBlockingStance(AI)); 
}

/** Lets the Character perform a parry and a riposte, can only be used while in BlockingStance! */
mixin FAbilityTaskExecutor ParryAndRiposte(UGameplayAbility_AI AI, AGothicCharacter Enemy) 
{ 
    return FAbilityTaskExecutor(TaskParryAndRiposte(AI, Enemy, GameplayTag::Combat_Attack_Top)); 
}

// --- Spells

/** Lets the Character launch a spell. Pauses the function until the action has finished. */
mixin FAbilityTaskExecutor LaunchSpell(UGameplayAbility_AI AI, TSubclassOf<USpellConfigurationContainer> SpellConfigurationContainer, TSubclassOf<UItemDefinition> RuneItem, AActor Target = nullptr) 
{ 
    return FAbilityTaskExecutor(TaskLaunchSpell(AI, SpellConfigurationContainer, RuneItem,Target), 2.f); 
}

// --- Attacks

/** Lets the Character cast the currently drawn Spell. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor CastSpell(UGameplayAbility_AI AI, int numLaunches = 1)    { return FAbilityTaskExecutor(TaskCastSpell(AI, numLaunches)); }

/** Lets the Character do a swordswing to the left. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackLeft(UGameplayAbility_AI AI)       { return FAbilityTaskExecutor(TaskAttackLeft(AI)); }

/** Lets the Character do a forward swordswing. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackTop(UGameplayAbility_AI AI)    { return FAbilityTaskExecutor(TaskAttackTop(AI)); }

/** Lets the Character do a swordswing to the right. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackRight(UGameplayAbility_AI AI)      { return FAbilityTaskExecutor(TaskAttackRight(AI)); }

/** Lets the Character do a swordswing from bottom to top. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackBottom(UGameplayAbility_AI AI) { return FAbilityTaskExecutor(TaskAttackBottom(AI)); }

/** Lets the Characters jump backwards. */
mixin FAbilityTaskExecutor AttackMoveBack(UGameplayAbility_CharacterAI AI) 
{ 
    return FAbilityTaskExecutor(TaskAttack(AI, GameplayTag::Combat_Attack_MoveBack)); 
}

/** Lets the Character execute the attack assigned to the Extra 01 tag */
mixin FAbilityTaskExecutor AttackExtra01(UGameplayAbility_CharacterAI AI)
{
    return FAbilityTaskExecutor(TaskAttack(AI, GameplayTag::Combat_Attack_Extra01));
}

/** Lets the Character execute the attack assigned to the Extra 02 tag */
mixin FAbilityTaskExecutor AttackExtra02(UGameplayAbility_CharacterAI AI)
{
    return FAbilityTaskExecutor(TaskAttack(AI, GameplayTag::Combat_Attack_Extra02));
}

/** Lets the Character execute the attack assigned to the Extra 03 tag */
mixin FAbilityTaskExecutor AttackExtra03(UGameplayAbility_CharacterAI AI)
{
    return FAbilityTaskExecutor(TaskAttack(AI, GameplayTag::Combat_Attack_Extra03));
}

/** Lets the Character execute the attack assigned to the Extra 04 tag */
mixin FAbilityTaskExecutor AttackExtra04(UGameplayAbility_CharacterAI AI)
{
    return FAbilityTaskExecutor(TaskAttack(AI, GameplayTag::Combat_Attack_Extra04));
}

/** Lets the Character execute the attack assigned to the Extra 05 tag */
mixin FAbilityTaskExecutor AttackExtra05(UGameplayAbility_CharacterAI AI)
{
    return FAbilityTaskExecutor(TaskAttack(AI, GameplayTag::Combat_Attack_Extra05));
}

/** Lets the Character execute the attack assigned to the Extra 06 tag */
mixin FAbilityTaskExecutor AttackExtra06(UGameplayAbility_CharacterAI AI)
{
    return FAbilityTaskExecutor(TaskAttack(AI, GameplayTag::Combat_Attack_Extra06));
}

mixin FAbilityTaskExecutor AttackCombo(UGameplayAbility_CharacterAI AI, TArray<FGameplayTag> ComboChain, bool bEndComboOnMiss = false)
{
    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss));
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboTopLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboTopRightLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboTopBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboTopLeftRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboLeftRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboLeftTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboRightLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboComboTopLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());    

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboComboTopRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboLeftRightLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboLeftRightBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboRightLeftBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboRightLeftTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboRightLeftRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboRightBottomBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboTopBottomTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboTopBottomLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomTopBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomTopRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomRightLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomLeftRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomLeftTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboBottomBottomBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboLeftRightLeftTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboBottomLeftRightLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboBottomRightLeftTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomTopLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboRightTopLeftRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboRightBottomLeftRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboLeftBottomRightLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboTopLeftTopBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomTopLeftRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboBottomLeftTopBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboLeftRightLeftTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackSComboRightLeftRightBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboLeftTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboRightTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboRightLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboLeftRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboRightRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboLeftLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboLeftBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboRightBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboLeftRightLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboRightLeftRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboLeftRightTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboRightLeftTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboLeftRightBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboRightLeftBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboTopRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboTopLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboTopRightLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboBottomTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboBottomTopBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboBottomTopLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboBottomLeftTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboTopBottom(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboTopBottomTop(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionTop());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}


/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboBottomLeft(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/** Lets the Character do a combo. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor AttackCComboBottomRight(UGameplayAbility_AI AI) 
{ 
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionBottom());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());

    return FAbilityTaskExecutor(TaskAttackCombo(AI, ComboChain, bEndComboOnMiss = true)); 
}

/**
 * Starts a new dynamic combo chain. To be used like this:
 * 
 *     AI.StartAttackComboChainFront();
 *     
 *     AI.DoChainedAttackLeft();
 *     AI.DoChainedAttackRight();
 *     
 *     if (HasNoticedHit())
 *     {
 *         AI.DoChainedAttackFront();
 *     }
 * 
 *     AI.EndAttackComboChain();
 */
mixin void StartAttackComboChain(UGameplayAbility_CharacterAI AI, FGameplayTag FirstDirection)
{
    TArray<FGameplayTag> ComboChain;
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    ComboChain.Add(UAbilityTask_Attack::DirectionLeft());
    ComboChain.Add(UAbilityTask_Attack::DirectionRight());
    AI.CurrentState.WaitForTask(TaskAttackCombo(AI, ComboChain));

    auto Task = TaskAttack(AI, FirstDirection);
    Task.ReadyForActivation();

    while (!AI.Self.IsInAttackComboWindow() && Task.IsActive())
    {
        AI.CurrentState.WaitOneTick();
    }
}


mixin UAbilityTask_Attack GetCurrentAttackTask(UGameplayAbility_CharacterAI AI)
{
    auto AttackTasks = AI.GetActiveTasksOfClass(UAbilityTask_Attack::StaticClass());

    if (AttackTasks.Num() == 0 || !AttackTasks[0].IsActive())
        return nullptr;

    return Cast<UAbilityTask_Attack>(AttackTasks[0]);
}

// --- Taunts

/** Plays a taunt and waits until it's done. TauntTag must be Combat.Taunt.* */
mixin FAbilityTaskExecutor TauntMatchingAllAndOne(UGameplayAbility_AI AI, FGameplayTagContainer matchAllTags, FGameplayTagContainer matchOneTag, FGameplayTagContainer blockedTags) {
    return FAbilityTaskExecutor(TaskTauntMatchingAllAndOne(AI, matchAllTags, matchOneTag, blockedTags)); 
}

/** Plays a taunt and waits until it's done. TauntTag must be Combat.Taunt.* */
mixin FAbilityTaskExecutor TauntMatchingAll(UGameplayAbility_AI AI, FGameplayTagContainer matchAllTags, FGameplayTagContainer blockedTags) {
    return FAbilityTaskExecutor(TaskTauntMatchingAll(AI, matchAllTags, blockedTags)); 
}

/** Plays a taunt and waits until it's done. TauntTag must be Combat.Taunt.* */
mixin FAbilityTaskExecutor TauntMatchingAny(UGameplayAbility_AI AI, FGameplayTagContainer matchAnyTag, FGameplayTagContainer blockedTags) { 
    return FAbilityTaskExecutor(TaskTauntMatchingAny(AI, matchAnyTag, blockedTags)); 
}

mixin FAbilityTaskExecutor Taunt(UGameplayAbility_AI AI, FGameplayTag TauntTag) { return FAbilityTaskExecutor(TaskTaunt(AI, TauntTag));}

/** Plays a random aggressive taunt and waits until it's done. */
mixin FAbilityTaskExecutor AggressiveTaunt(UGameplayAbility_AI AI) { return AI.Taunt(GameplayTag::Combat_Taunt_Aggressive); }

/** Plays a random short taunt and waits until it's done. */
mixin FAbilityTaskExecutor ShortTaunt(UGameplayAbility_AI AI) { return AI.Taunt(GameplayTag::Combat_Taunt_Short); }

/** Plays a random long taunt and waits until it's done. */
mixin FAbilityTaskExecutor ObserverTaunt(UGameplayAbility_AI AI) { return AI.Taunt(GameplayTag::Combat_Taunt_Observer); }

/** Plays a random warning close taunt and waits until it's done. */
mixin FAbilityTaskExecutor WarningCloseTaunt(UGameplayAbility_AI AI) { return AI.Taunt(GameplayTag::Combat_Taunt_Warning_Close); }

/** Plays a random warning far taunt and waits until it's done. */
mixin FAbilityTaskExecutor WarningFarTaunt(UGameplayAbility_AI AI) { return AI.Taunt(GameplayTag::Combat_Taunt_Warning_Far); }

// --- Dodges

/** Lets the Character do a dodge left, right, back, front: whatever is closer to the given input. Length is not relevant. Pauses the function until the dodge has finished. */
mixin FAbilityTaskExecutor DodgeIntoDirection(UGameplayAbility_AI AI, FVector Direction) { return FAbilityTaskExecutor(TaskDodge(AI, Direction)); }

/** Lets the Character do a dodge away from the given location (opposite direction). Pauses the function until the dodge has finished. */
mixin FAbilityTaskExecutor DodgeAwayFrom(UGameplayAbility_AI AI, FVector LocationToDodgeAwayFrom) { return FAbilityTaskExecutor(TaskDodgeAwayFrom(AI, LocationToDodgeAwayFrom)); }

/** Lets the Character do a dodge away from the given actor (opposite direction). Pauses the function until the dodge has finished. */
mixin FAbilityTaskExecutor DodgeAwayFrom(UGameplayAbility_AI AI, AActor ActorToDodgeAwayFrom) { return FAbilityTaskExecutor(TaskDodgeAwayFrom(AI, ActorToDodgeAwayFrom.ActorLocation)); }

/** Lets the Character do a dodge to the left. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor DodgeLeft(UGameplayAbility_AI AI)    { return FAbilityTaskExecutor(TaskDodgeLeft(AI)); }

/** Lets the Character do a forward dodge. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor DodgeForward(UGameplayAbility_AI AI) { return FAbilityTaskExecutor(TaskDodgeFront(AI)); }

/** Lets the Character do a dodge to the right. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor DodgeRight(UGameplayAbility_AI AI)   { return FAbilityTaskExecutor(TaskDodgeRight(AI)); }

/** Lets the Character do a backwards dodge. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor DodgeBack(UGameplayAbility_AI AI)   { return FAbilityTaskExecutor(TaskDodgeBack(AI)); }

/** Lets the Character do a dodge to the left relative to the target if there is one. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor DodgeLeftRelativeToTarget(UGameplayAbility_CharacterAI_Gothic AI)    
{
    if (AI.TargetEnemy == nullptr)
        return AI.DodgeLeft();

    auto Direction = (AI.TargetEnemy.ActorLocation - AI.Self.ActorLocation).GetSafeNormal2D().CrossProduct(FVector::UpVector);
    return AI.DodgeIntoDirection(-Direction);
}

/** Lets the Character do a dodge to the right relative to the target if there is one. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor DodgeRightRelativeToTarget(UGameplayAbility_CharacterAI_Gothic AI)    
{
    if (AI.TargetEnemy == nullptr)
        return AI.DodgeRight();

    auto Direction = (AI.TargetEnemy.ActorLocation - AI.Self.ActorLocation).GetSafeNormal2D().CrossProduct(FVector::UpVector);
    return AI.DodgeIntoDirection(Direction);
}

/** Lets the Character do a dodge forward relative to the target if there is one. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor DodgeTowardsTarget(UGameplayAbility_CharacterAI_Gothic AI)    
{
    if (AI.TargetEnemy == nullptr)
        return AI.DodgeForward();

    auto Direction = (AI.TargetEnemy.ActorLocation - AI.Self.ActorLocation).GetSafeNormal2D();
    return AI.DodgeIntoDirection(Direction);
}

/** Lets the Character do a dodge back relative to the target if there is one. Pauses the function until the attack has finished. */
mixin FAbilityTaskExecutor DodgeAwayFromTarget(UGameplayAbility_CharacterAI_Gothic AI)    
{
    if (AI.TargetEnemy == nullptr)
        return AI.DodgeBack();

    auto Direction = (AI.Self.ActorLocation - AI.TargetEnemy.ActorLocation).GetSafeNormal2D();
    return AI.DodgeIntoDirection(Direction);
}

// --- Roll

/** Lets the Character do a roll into the given world space direction. Pauses the function until the roll has finished. */
mixin FAbilityTaskExecutor RollIntoDirection(UGameplayAbility_AI AI, FVector Direction) { return FAbilityTaskExecutor(TaskRoll(AI, Direction)); }

/** Lets the Character do a side roll to get away from an incomming attack. Pauses the function until the roll has finished. */
mixin FAbilityTaskExecutor RollToEvade(UGameplayAbility_AI AI, FVector DirectionOfIncommingAttack, bool bFlipSide = false) { return FAbilityTaskExecutor(TaskRollToEvade(AI, DirectionOfIncommingAttack, bFlipSide)); }

/** Lets the Character do a roll away from the given location (opposite direction). Pauses the function until the roll has finished. */
mixin FAbilityTaskExecutor RollAwayFrom(UGameplayAbility_AI AI, FVector LocationToRollAwayFrom) { return FAbilityTaskExecutor(TaskRollAwayFrom(AI, LocationToRollAwayFrom)); }

/** Lets the Character do a roll away from the given actor (opposite direction). Pauses the function until the roll has finished. */
mixin FAbilityTaskExecutor RollAwayFrom(UGameplayAbility_AI AI, AActor ActorToRollAwayFrom) { return FAbilityTaskExecutor(TaskRollAwayFrom(AI, ActorToRollAwayFrom.ActorLocation)); }

/** Lets the Character do a roll to the left. Pauses the function until the roll has finished. */
mixin FAbilityTaskExecutor RollLeft(UGameplayAbility_AI AI)    { return FAbilityTaskExecutor(TaskRollLeft(AI)); }

/** Lets the Character do a forward roll. Pauses the function until the roll has finished. */
mixin FAbilityTaskExecutor RollForward(UGameplayAbility_AI AI) { return FAbilityTaskExecutor(TaskRollFront(AI)); }

/** Lets the Character do a roll to the right. Pauses the function until the roll has finished. */
mixin FAbilityTaskExecutor RollRight(UGameplayAbility_AI AI)   { return FAbilityTaskExecutor(TaskRollRight(AI)); }

/** Lets the Character do a backwards roll. Pauses the function until the roll has finished. */
mixin FAbilityTaskExecutor RollBack(UGameplayAbility_AI AI)   { return FAbilityTaskExecutor(TaskRollBack(AI)); }

// ---

/** Lets the Character draw their melee weapon. Pauses the function until the weapon is fully drawn. */
mixin FAbilityTaskExecutor DrawMeleeWeapon(UGameplayAbility_AI AI)  { return FAbilityTaskExecutor(TaskDrawMeleeWeapon(AI)); }

/** Lets the Character draw their ranged weapon. Pauses the function until the weapon is fully drawn. */
mixin FAbilityTaskExecutor DrawRangedWeapon(UGameplayAbility_AI AI) { return FAbilityTaskExecutor(TaskDrawRangedWeapon(AI)); }

/** Lets the Character draw a magic spell of the given type. Pauses the function until the spell is fully drawn. */
mixin FAbilityTaskExecutor DrawMagicSpell(UGameplayAbility_AI AI, TSubclassOf<USpellContainer> SpellType) { return FAbilityTaskExecutor(TaskDrawMagic(AI, SpellType)); }

/** Lets the Character draw a magic spell of the given type. Pauses the function until the spell is fully drawn. */
mixin FAbilityTaskExecutor DrawMagicSpell(UGameplayAbility_AI AI, FGameplayTag SpellItemType) 
{
    USpellContainer FoundSpell = AI.CharacterState.Inventory.FindSpellOfType(SpellItemType);

    if (FoundSpell == nullptr)
        return FAbilityTaskExecutor();

    return FAbilityTaskExecutor(TaskDrawMagic(AI, FoundSpell.Class)); 
}

mixin FAbilityTaskExecutor DrawTorch(UGameplayAbility_AI AI) { return FAbilityTaskExecutor(TaskDrawTorch(AI)); }

/** Lets the Character draw their ranged weapon. Pauses the function until the weapon is fully drawn. */
mixin FAbilityTaskExecutor DrawWeaponFromQuickSlot(UGameplayAbility_AI AI) { return FAbilityTaskExecutor(TaskDrawWeapon(AI, EInventoryTypes::QuickItems)); }

/** Lets the Character put away any weapon it had drawn. Pauses the function until the weapon has been put away. */
mixin FAbilityTaskExecutor UndrawWeapon(UGameplayAbility_AI AI)     {
    if (AI.CharacterState.Character.IsSwimming() || AI.CharacterState.Character.IsDiving() || AI.CharacterState.Character.IsClimbingLadderOrWall())
        return FAbilityTaskExecutor();

    return FAbilityTaskExecutor(TaskUndrawWeapon(AI)); 
}


/** Lets the Character draw a weapon determined by the item scoring system. Pauses the function until the weapon is fully drawn. */
mixin FAbilityTaskExecutor DrawCombatWeapon(UGameplayAbility_AI AI)  { 
    
    UGameplayAbility_CharacterAI_Gothic GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);

    if (GothicAI == nullptr)
        return FAbilityTaskExecutor();

    // FGameplayTagContainer RequiredTags;
    // RequiredTags.AddTag(GameplayTag::Item_Weapon);
    FItemActionHandler ItemAction = GothicAI.SelectBestItemActionFromInventory(GameplayTag::Item_Weapon);

    return GothicAI.DrawItem(ItemAction.ItemDefinition);
}

// --- Targets

// --- Conversation

/** Lets the character say the given voiceline. Will play audio and a gesture if available. */
mixin FAbilityTaskExecutor Say(UGameplayAbility_AI AI, 
                               FText Text, 
                               FGameplayTag Expression = GameplayTag::Expression_Neutral, 
                               AGothicCharacter TargetCharacter = nullptr, 
                               bool bUnskippable = false,
                               FName ForceCameraPreset = NAME_None,
                               FName ForceSubtitleLanguage = NAME_None,
                               FGameplayTag Posture = FGameplayTag::Empty
                               )   
{
    AI.WaitUntilNoLongerSpeaking();

    auto Task = TaskSpeak(AI, Text, Expression);

    Task.TargetCharacter = TargetCharacter;
    Task.ForceCameraPresetWithName = ForceCameraPreset;
    Task.bUnskippable = bUnskippable;
    Task.ForcedSubtitleLanguage = ForceSubtitleLanguage;
    Task.Posture = Posture;

    return FAbilityTaskExecutor(Task); 
}

mixin FAbilityTaskExecutor Say(UGameplayAbility_AI AI, 
                               FGameplayTag SoundTag, 
                               EPerceptionNoiseLoudness Loudness = EPerceptionNoiseLoudness::Moderate, 
                               AGothicCharacter TargetCharacter = nullptr, 
                               bool bUnskippable = false,
                               FGameplayTag Posture = FGameplayTag::Empty)   
{ 
    if (!UAbilityTask_Speak::CanSayGenericVoiceline(AI, SoundTag))
        return FAbilityTaskExecutor();

    AI.WaitUntilNoLongerSpeaking();
    
    return FAbilityTaskExecutor(TaskSpeakGenericVoiceline(
        AI, 
        SoundTag, 
        Loudness, 
        TargetCharacter = TargetCharacter, 
        bUnskippable = bUnskippable
        /** TODO Posture = Posture */
    )); 
}

mixin FAbilityTaskExecutor AlignAtInteractionSpot(UGameplayAbility_AI AI, FInteractionSpotHandle SpotHandle)
{
    auto Task = UAbilityTask_MoveIntoPositionForInteraction::TaskMoveIntoPositionForInteraction(AI, SpotHandle.Location, SpotHandle.Transform.Rotator());

    Task.bTryPutOntoFloor = true;

    return FAbilityTaskExecutor(Task);
}

mixin FAbilityTaskExecutor AlignAtInteractionSpot(UGameplayAbility_AI AI, FName SpotName)
{
    return AI.AlignAtInteractionSpot(FInteractionSpotHandle(SpotName));
}

/** Plays a LevelSequence that was placed into the current world. The owning AI waits until the sequence is over. */
mixin FAbilityTaskExecutor PlayLevelSequence(UGameplayAbility_AI AI, FName SequenceName)
{
    return FAbilityTaskExecutor(TaskPlayLevelSequenceByName(AI, SequenceName));
}

mixin FAbilityTaskExecutor PlayCinematic(UGameplayAbility_AI AI, FName SequenceName)
{
    return AI.PlayLevelSequence(SequenceName);
}

/** Lets the character give an item to the other character. */
mixin FAbilityTaskExecutor GiveItemTo(UGameplayAbility_AI AI, AGothicCharacterState Other, TSubclassOf<UItemDefinition> Item, int Num = 1)   
{   
    return FAbilityTaskExecutor(TaskGiveItem(AI, Other, Item, Num));
}

mixin FAbilityTaskExecutor GiveItemToLook(UGameplayAbility_AI AI, AGothicCharacterState Other, TSubclassOf<UItemDefinition> Item, int Num = 1)   
{   
    return FAbilityTaskExecutor(TaskGiveItemToLook(AI, Other, Item, Num));
}

/** Lets the character give an item to the other character. */
mixin FAbilityTaskExecutor GiveAllOfItemTo(UGameplayAbility_AI AI, AGothicCharacterState Other, TSubclassOf<UItemDefinition> Item)   
{   
    return FAbilityTaskExecutor(TaskGiveItem(AI, Other, Item, AI.CharacterState.Inventory.CountItemsOfClass(Item)));
}

/** Lets the character take out an item (from inventory into their hands) */
mixin FAbilityTaskExecutor TakeOutItem(UGameplayAbility_AI AI, TSubclassOf<UItemDefinition> Item)
{
    return FAbilityTaskExecutor(TaskTakeOutItem(AI, Item));
}

/** Lets the character put away any item that is in their hands. */
mixin FAbilityTaskExecutor PutAwayItem(UGameplayAbility_AI AI)
{
    return FAbilityTaskExecutor(TaskPutAwayItem(AI));
}

mixin FAbilityTaskExecutor TurnToCharacter(UGameplayAbility_AI AI, AGothicCharacter Other, float SkipTurnIfAngleIsSmallerThan = -1.0f)
{
    return AI.TurnToActor(Other, SkipTurnIfAngleIsSmallerThan);
}

mixin FAbilityTaskExecutor TurnToWaypoint(UGameplayAbility_AI AI, FName WaypointName)
{
    return AI.TurnToPosition(FInteractionSpotHandle(WaypointName).Location);
}

mixin FAbilityTaskExecutor TurnToCharacter(UGameplayAbility_AI AI, AGothicCharacterState Other, float SkipTurnIfAngleIsSmallerThan = -1.0f)
{
    return AI.TurnToActor(Other, SkipTurnIfAngleIsSmallerThan);
}

mixin FAbilityTaskExecutor TurnAwayFrom(UGameplayAbility_AI AI, AGothicCharacterState Other)
{
    const FVector SelfPosition = AI.Character.ActorLocation;
    const FVector Direction = (SelfPosition - Other.ActorLocation).GetSafeNormal();

    return FAbilityTaskExecutor(TaskTurnToDirection(AI, Direction));
}

mixin FAbilityTaskExecutor TurnToActor(UGameplayAbility_AI AI, AActor Other, float SkipTurnIfAngleIsSmallerThan = -1.0f)
{
    return FAbilityTaskExecutor(TaskTurnToActor(AI, Other, MinAngleDifferenceToSkipAnyTurn = SkipTurnIfAngleIsSmallerThan));
}

/** Lets the character use an item of the specific type. Fails if the item wasn't there. You can check the Inventory first! */
mixin FAbilityTaskExecutor UseItem(UGameplayAbility_AI AI, TSubclassOf<UItemDefinition> Item)
{
    return FAbilityTaskExecutor(TaskConsumeItem(AI, Item)); 
}

mixin FAbilityTaskExecutor StartTradingWith(UGameplayAbility_AI AI, AGothicCharacterState Other)
{
    return FAbilityTaskExecutor(TaskTradeWith(AI, Other)); 
}

mixin FAbilityTaskExecutor StartCustomizingArmorWith(UGameplayAbility_AI AI, AGothicCharacterState Other)
{
    return FAbilityTaskExecutor(TaskCustomizeArmorWith(AI, Other)); 
}

mixin FAbilityTaskExecutor EquipBestArmor(UGameplayAbility_AI AI)
{
    Warning("Using stub EquipBestArmor()");

    // TODO: Make proper task for this
    return FAbilityTaskExecutor(); 
}

mixin FAbilityTaskExecutor EquipBestWeapon(UGameplayAbility_AI AI)
{
    Warning("Using stub EquipBestWeapon()");

    // TODO: Make proper task for this
    return FAbilityTaskExecutor(); 
}

/** Changes the daily routine of the given AI character. */
mixin bool ExchangeDailyRoutine(UGameplayAbility_AI AI, TSubclassOf<UAIState_DailyRoutine> NewRoutine)
{
    auto NPCState = Cast<AGothicNPCState>(AI.CharacterState);

    if (NPCState == nullptr)
        return false;

    NPCState.ExchangeDailyRoutineToClass(NewRoutine);

    return true;
}

/** Changes the daily routine of the given AI character. */
mixin bool ExchangeDailyRoutineClass(UGameplayAbility_AI AI, TSubclassOf<UAIState_DailyRoutine> NewRoutine)
{
    return AI.ExchangeDailyRoutine(NewRoutine);
}

/** Starts a training fight against the current target. */
mixin void StartTrainingFightWithFists(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Fists_NoPostAction;
    Perception.Origin.Character = AI.Character;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);

    // Use when PerceptionEvent is needed
    // AI.Character.Perception.BroadcastAreaEvent(
    //     GameplayTag::AIEvent_StartTrainingFight_Fists,
    //     2000.0f,
    //     SensedCharacter = AI.Character,
    //     TargetCharacter = Target,
    //     AffectedCharacter = Target,
    //     InstigatorCharacter = Target
    // );
}

/** Starts a training fight against the current target, loots character when defeated if possible. */
mixin void StartTrainingFightWithFistsAndLootAfter(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Fists_LootAfter;
    Perception.Origin.Character = AI.Character;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);

    // Use when PerceptionEvent is needed
    // AI.Character.Perception.BroadcastAreaEvent(
    //     GameplayTag::AIEvent_StartTrainingFight_Fists,
    //     2000.0f,
    //     SensedCharacter = AI.Character,
    //     TargetCharacter = Target,
    //     AffectedCharacter = Target,
    //     InstigatorCharacter = Target
    // );
}

/** Makes current character an enemy. */
mixin void MakeEnemy(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_MakeEnemy;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Forces full sight awareness of the character. */
mixin void ForceSightPerception(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (!IsValid(TargetCharacterState))
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (!IsValid(TargetCharacter))
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_ForceSightPerception;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(!IsValid(CharacterAI))
        return;

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Forces full sight awareness of list of characters. */
mixin void ForceSightPerception(UGameplayAbility_AI AI, TArray<AGothicCharacterState> TargetCharacterStates)
{
    for (auto TargetCharacterState : TargetCharacterStates)
    {
        if (TargetCharacterState == AI.CharacterState)
            continue;

        AI.ForceSightPerception(TargetCharacterState);
    }
}

/** Forces full hearing awareness of the character. */
mixin void ForceHearingPerception(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (!IsValid(TargetCharacterState))
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (!IsValid(TargetCharacter))
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_ForceHearingPerception;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(!IsValid(CharacterAI))
        return;

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Forces full hearing awareness of list of characters. */
mixin void ForceHearingPerception(UGameplayAbility_AI AI, TArray<AGothicCharacterState> TargetCharacterStates)
{    
    for (auto TargetCharacterState : TargetCharacterStates)
    {
        if (TargetCharacterState == AI.CharacterState)
            continue;

        AI.ForceHearingPerception(TargetCharacterState);
    }
}

/** Starts following the current target. */
mixin void StartFollowing(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartFollowing;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
        return;

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts attacking the current target, loot the character when defeated if possible. */
mixin void StartFistFightImmediately(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_LootAfter_RegularDuration;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts attacking the current target. */
mixin void StartFistFightImmediatelyNoLooting(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_NoPostActions_RegularDuration;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts attacking the current target, to death. */
mixin void StartAttackingImmediately(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath_RegularDuration;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts attacking the current target, to death. */
mixin void StartPettyFightWeaponToDeath(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_ToDeath_RegularDuration;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts attacking the current target, loot the character when defeated if possible without executing. */
mixin void StartAttackingImmediatelyLootOnly(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_LootAfter_RegularDuration;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts attacking the current target, loot the character when defeated if possible without executing. */
mixin void StartRealFightWithWeaponLootOnly(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_LootAfter_RegularDuration;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts attacking the current target, no looting nor executing. */
mixin void StartAttackingImmediatelySpareLifeNoLooting(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_NoPostActions_RegularDuration;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts a training fight against the current target. */
mixin void StartTrainingFight(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Weapon_NoPostAction;
    Perception.Origin.Character = AI.Character;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts a training fight against the current target, loots character when defeated if possible. */
mixin void StartTrainingFightAndLootAfter(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Weapon_LootAfter;
    Perception.Origin.Character = AI.Character;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

/** Starts a training fight against the current target, executes character when defeated if possible. */
mixin void StartTrainingFightToDeath(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState)
{
    if (TargetCharacterState == nullptr)
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    if (TargetCharacter == nullptr)
        return;

    FRememberedPerception Perception;

    Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Weapon_ToDeath;
    Perception.Origin.Character = AI.Character;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;

    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(Perception.EventTag, Perception);
}

mixin void StartFightCustomWithFists(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState, FGameplayTag FightType, FGameplayTag FightGoal, FGameplayTag FightDuration)
{
    AI.StartFightCustom(TargetCharacterState, true, FightType, FightGoal, FightDuration);
}

mixin void StartFightCustomWithWeapon(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState, FGameplayTag FightType, FGameplayTag FightGoal, FGameplayTag FightDuration)
{
    AI.StartFightCustom(TargetCharacterState, false, FightType, FightGoal, FightDuration);
}

/** Starts attacking the current target. */
mixin void StartFightCustom(UGameplayAbility_AI AI, AGothicCharacterState TargetCharacterState, bool bUseFists, FGameplayTag FightType, FGameplayTag FightGoal, FGameplayTag FightDuration)
{
    if (!IsValid(TargetCharacterState))
        return;

    AGothicCharacter TargetCharacter = TargetCharacterState.Character; 
    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if (!IsValid(TargetCharacter) || !IsValid(CharacterAI))
        return;

    FRememberedPerception Perception;
    Perception.Origin.Character = TargetCharacter;
    Perception.Instigator.Character = TargetCharacter;
    Perception.Target.Character = TargetCharacter;
    Perception.Affected.Character = TargetCharacter;
    
    bool bIsPettyFight = FightType.MatchesTagExact(GameplayTag::AIConflict_FightType_Petty);
    bool bIsTrainingFight = FightType.MatchesTagExact(GameplayTag::AIConflict_FightType_Training);
    bool bIsRealFight = FightType.MatchesTagExact(GameplayTag::AIConflict_FightType_Real);

    bool bIsGoalDefeat = FightGoal.MatchesTagExact(GameplayTag::AIConflict_FightGoal_Defeat);
    bool bIsGoalLoot = FightGoal.MatchesTagExact(GameplayTag::AIConflict_FightGoal_Loot);
    bool bIsGoalKill = FightGoal.MatchesTagExact(GameplayTag::AIConflict_FightGoal_Kill);

    bool bIsDurationMinimal = FightDuration.MatchesTagExact(GameplayTag::AIConflict_Duration_Minimal);
    bool bIsDurationRegular = FightDuration.MatchesTagExact(GameplayTag::AIConflict_Duration_Regular);
    bool bIsDurationUntilDefeated = FightDuration.MatchesTagExact(GameplayTag::AIConflict_Duration_UntilDefeated);
    bool bIsDurationPermanent = FightDuration.MatchesTagExact(GameplayTag::AIConflict_Duration_Permanent);

    ////////////////////////////////////////// REAL
        //////////////// REAL FISTS
            /// REAL | FISTS | NO ACTIONS
    if (bUseFists && bIsRealFight && bIsGoalDefeat)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_NoPostActions_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_NoPostActions_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_NoPostActions_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_NoPostActions_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        return;
    }

            /// REAL | FISTS | LOOT
    if (bUseFists && bIsRealFight && bIsGoalLoot)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_LootAfter_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_LootAfter_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_LootAfter_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_LootAfter_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        return;
    }

            /// REAL | FISTS | TO DEATH
    if (bUseFists && bIsRealFight && bIsGoalKill)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_ToDeath_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_ToDeath_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_ToDeath_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Fists_ToDeath_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }
        
        return;
    }
        //////////////// REAL WEAPON
            /// REAL | WEAPON | NO ACTIONS
    if (!bUseFists && bIsRealFight && bIsGoalDefeat)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_NoPostActions_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_NoPostActions_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_NoPostActions_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_NoPostActions_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        return;
    }

            /// REAL | WEAPON | LOOT
    if (!bUseFists && bIsRealFight && bIsGoalLoot)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_LootAfter_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_LootAfter_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_LootAfter_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_LootAfter_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }
        
        return;
    }

            /// REAL | WEAPON | TO DEATH
    if (!bUseFists && bIsRealFight && bIsGoalKill)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        return;
    }

    ////////////////////////////////////////// PETTY
        //////////////// PETTY FISTS
            /// PETTY | FISTS | NO ACTIONS
    if (bUseFists && bIsPettyFight && bIsGoalDefeat)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_NoPostActions_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_NoPostActions_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_NoPostActions_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_NoPostActions_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        return;
    }

            /// PETTY | FISTS | LOOT
    if (bUseFists && bIsPettyFight && bIsGoalLoot)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_LootAfter_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_LootAfter_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_LootAfter_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_LootAfter_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        return;
    }

            /// PETTY | FISTS | TO DEATH
    if (bUseFists && bIsPettyFight && bIsGoalKill)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_ToDeath_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_ToDeath_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_ToDeath_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Fists_ToDeath_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }
        
        return;
    }
        //////////////// PETTY WEAPON
            /// PETTY | WEAPON | NO ACTIONS
    if (!bUseFists && bIsPettyFight && bIsGoalDefeat)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_NoPostActions_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_NoPostActions_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_NoPostActions_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_NoPostActions_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        return;
    }

            /// PETTY | WEAPON | LOOT
    if (!bUseFists && bIsPettyFight && bIsGoalLoot)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_LootAfter_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_LootAfter_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_LootAfter_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_LootAfter_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }
        
        return;
    }

            /// PETTY | WEAPON | TO DEATH
    if (!bUseFists && bIsPettyFight && bIsGoalKill)
    {
        if (bIsDurationUntilDefeated)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_ToDeath_UntilDefeated;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationPermanent)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_ToDeath_Permanent;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationMinimal)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_ToDeath_MinimalDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        if (bIsDurationRegular)
        {
            Perception.EventTag = GameplayTag::AIEvent_StartPettyFight_Weapon_ToDeath_RegularDuration;
            CharacterAI.AssessEvent(Perception.EventTag, Perception);
            return;
        }

        return;
    }

    ////////////////////////////////////////// TRAINING
        //////////////// TRAINING FISTS
            /// TRAINING | FISTS | NO ACTIONS
    if (bUseFists && bIsTrainingFight && bIsGoalDefeat)
    {
        Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Fists_NoPostAction;
        CharacterAI.AssessEvent(Perception.EventTag, Perception);
        return;
    }

            /// TRAINING | FISTS | LOOT
    if (bUseFists && bIsTrainingFight && bIsGoalLoot)
    {
        Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Fists_LootAfter;
        CharacterAI.AssessEvent(Perception.EventTag, Perception);
        return;
    }

            /// TRAINING | FISTS | TO DEATH
    if (bUseFists && bIsTrainingFight && bIsGoalKill)
    {
        Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Fists_ToDeath;
        CharacterAI.AssessEvent(Perception.EventTag, Perception);
        return;
    }
        //////////////// TRAINING WEAPON
            /// TRAINING | WEAPON | NO ACTIONS
    if (!bUseFists && bIsTrainingFight && bIsGoalDefeat)
    {
        Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Fists_NoPostAction;
        CharacterAI.AssessEvent(Perception.EventTag, Perception);
        return;
    }

            /// TRAINING | WEAPON | LOOT
    if (!bUseFists && bIsTrainingFight && bIsGoalLoot)
    {
        Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Fists_LootAfter;
        CharacterAI.AssessEvent(Perception.EventTag, Perception);
        return;
    }

            /// TRAINING | WEAPON | TP DEATH
    if (!bUseFists && bIsTrainingFight && bIsGoalKill)
    {
        Perception.EventTag = GameplayTag::AIEvent_StartTrainingFight_Fists_ToDeath;
        CharacterAI.AssessEvent(Perception.EventTag, Perception);
        return;
    }
}

/** Stop current training fight if ongoing */
mixin void StopTrainingFight(UGameplayAbility_AI AI)
{
    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(GameplayTag::AIEvent_StopTrainingFight, FRememberedPerception());
}

/** Stop current combat if ongoing */
mixin void StopRealFight(UGameplayAbility_AI AI)
{
    UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(AI);
    if(CharacterAI == nullptr)
    {
        return;
    }

    CharacterAI.AssessEvent(GameplayTag::AIEvent_StopRealFight, FRememberedPerception());
}

/** Becomes enemy to all characters of the given type for the given duration */
mixin void StartHunting(UGameplayAbility_AI AI, FGameplayTag TargetCharacterSpecies, AGothicCharacterState InitialTargetCharacterState)
{
    if (InitialTargetCharacterState == nullptr)
        return;

    AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_StartHunt(TargetCharacterSpecies));

    AI.StartAttackingImmediately(InitialTargetCharacterState);
}

/** Start sitting on the given spot. */
mixin FAbilityTaskExecutor SitDownOn(UGameplayAbility_AI AI, FInteractionSpotHandle Spot)
{
    auto Task = TaskInteractWithSpot(AI, Spot, GameplayTag::Action_Interact_Sit, -1.0f);

    Task.bEndWhenEnteredState = true;

    return FAbilityTaskExecutor(Task);
}

/** Sitting on a nearby sitting spot in the preferred location for the given amont of time. */
mixin FAbilityTaskExecutor Sit(UGameplayAbility_AI AI, float Duration, float FallbackSearchRadius = 1000.0f)
{
    auto PreferredLocation = UPreferredLocationComponent::Get(AI.CharacterState);

    UAbilityTask_InteractWith Task;
    if (PreferredLocation != nullptr && PreferredLocation.HasPreferredLocation())
    {
        Task = TaskFindAndInteractWithSpot(AI, PreferredLocation.CenterPoint, PreferredLocation.RadiusFromCenter, GameplayTag::Action_Interact_Sit, Duration);
    }
    else
    {
        Task = TaskFindAndInteractWithSpot(AI, AI.CharacterState.CharacterLocation, FallbackSearchRadius, GameplayTag::Action_Interact_Sit, Duration);
    }

    return FAbilityTaskExecutor(Task);
}

/** Start sitting on a nearby sitting spot in the preferred location. */
mixin FAbilityTaskExecutor SitDown(UGameplayAbility_AI AI, float FallbackSearchRadius = 1000.0f)
{
    auto PreferredLocation = UPreferredLocationComponent::Get(AI.CharacterState);

    UAbilityTask_InteractWith Task;
    if (PreferredLocation != nullptr && PreferredLocation.HasPreferredLocation())
    {
        Task = TaskFindAndInteractWithSpot(AI, PreferredLocation.CenterPoint, PreferredLocation.RadiusFromCenter, GameplayTag::Action_Interact_Sit, -1.0f);
    }
    else
    {
        Task = TaskFindAndInteractWithSpot(AI, AI.Character.ActorLocation, FallbackSearchRadius, GameplayTag::Action_Interact_Sit, -1.0f);
    }

    Task.bEndWhenEnteredState = true;

    return FAbilityTaskExecutor(Task);
}

/** If sitting, stand up. */
mixin FAbilityTaskExecutor StandUp(UGameplayAbility_AI AI)
{
    return FAbilityTaskExecutor(TaskEndInteraction(AI));
}

// --- Following

/** Follows the given actor. Blocks until the character is within the given distance (never ends if  Distance == -1.0f). */
mixin FAbilityTaskExecutor Follow(UGameplayAbility_AI AI, AActor FollowTarget, float ReachDistance = -1.0f, bool bCopyWalkSpeed = false, float SprintWhenFurtherAwayThan = -1.0f, bool bShouldMoveOutOfTheWay = false)
{
    auto Task = UAbilityTask_Follow::TaskFollow(AI, FollowTarget, ReachDistance, false, bShouldMoveOutOfTheWay);
    
    Task.bMatchTargetWalkSpeed = bCopyWalkSpeed;
    Task.SprintWhenFurtherAwayThan = SprintWhenFurtherAwayThan;
    
    return FAbilityTaskExecutor(Task);
}

mixin FAbilityTaskExecutor FollowWithWorldOffset(UGameplayAbility_AI AI, AActor FollowTarget, FVector WorldOffsetLocation, float ReachDistance = -1.0f, bool bCopyWalkSpeed = false, float SprintWhenFurtherAwayThan = -1.0f, bool bShouldMoveOutOfTheWay = false)
{
     auto Task = UAbilityTask_Follow::TaskFollowWithWorldOffset(AI, FollowTarget, WorldOffsetLocation, ReachDistance, false, bShouldMoveOutOfTheWay);
    
    Task.bMatchTargetWalkSpeed = bCopyWalkSpeed;
    Task.SprintWhenFurtherAwayThan = SprintWhenFurtherAwayThan;
    
    return FAbilityTaskExecutor(Task);
}

mixin bool CanFollow(UGameplayAbility_AI AI, AActor FollowTarget, float ReachDistance = -1.0f)
{
    return UAbilityTask_Follow::CanFollow(AI.Character, FollowTarget, ReachDistance);
}

/** Starts following the given actor. Returns immediately and runs in the background until you call StopFollowingActor(). */
mixin void StartFollowingActor(UGameplayAbility_CharacterAI AI, AActor FollowTarget, float ReachDistance = -1.0f, bool bCopyWalkSpeed = false, float SprintWhenFurtherAwayThan = -1.0f, bool bShouldMoveOutOfTheWay = false)
{
    AI.StopFollowingActor(FollowTarget);

    auto Task = UAbilityTask_Follow::TaskFollow(AI, FollowTarget, ReachDistance, false, bShouldMoveOutOfTheWay);
    Task.bMatchTargetWalkSpeed = bCopyWalkSpeed;
    Task.SprintWhenFurtherAwayThan = SprintWhenFurtherAwayThan;
    // Task.MoveRequest.SetAcceptanceRadius(100.0f);
    Task.ReadyForActivation();
}

/** Stops all tasks that make the character follow the given target. (if there are any)*/
mixin void StopFollowingActor(UGameplayAbility_CharacterAI AI, AActor FollowTarget = nullptr)
{
    for (auto Task : AI.GetActiveTasksOfClass(UAbilityTask_Follow::StaticClass()))
    {
        auto FollowTask = Cast<UAbilityTask_Follow>(Task);

        if (FollowTarget == nullptr || FollowTask.IsFollowing(FollowTarget))
        {
            FollowTask.ExternalCancel();
        }
    }
}

/** Returns true if the character is currently following the given target. */
mixin bool IsFollowingActor(UGameplayAbility_CharacterAI AI, AActor FollowTarget)
{
    for (auto Task : AI.GetActiveTasksOfClass(UAbilityTask_Follow::StaticClass()))
    {
        auto FollowTask = Cast<UAbilityTask_Follow>(Task);

        if (FollowTask.IsFollowing(FollowTarget))
        {
            return true;
        }
    }

    return false;
}

mixin bool IsPathfollowingPaused(const UGameplayAbility_CharacterAI AI)
{
    return AI.AIController.IsPathfollowingPaused();
}

/** Starts going to the given waypoint. Returns immediately and runs in the background until you call StopGoingToWaypoint(). */
mixin void StartGoingToWaypoint(UGameplayAbility_CharacterAI AI, FName Waypoint)
{
    AI.StopGoingToWaypoint();

    auto Task = UAbilityTask_GotoWaypoint::TaskGotoWaypoint(AI, Waypoint);
    Task.ReadyForActivation();
}

/** Stops all tasks that make the character go to the given Waypoint. (if there are any) */
mixin void StopGoingToWaypoint(UGameplayAbility_CharacterAI AI, FName Waypoint = NAME_None)
{
    for (auto Task : AI.GetActiveTasksOfClass(UAbilityTask_GotoWaypoint::StaticClass()))
    {
        auto GotoTask = Cast<UAbilityTask_GotoWaypoint>(Task);

        if (Waypoint.IsNone() || GotoTask.TargetWaypoint == Waypoint)
        {
            GotoTask.ExternalCancel();
        }
    }
}

/** Looks for a freepoint at the speicified location and returns its ID via OutFreepointID. */
mixin bool FindFreepointAtWaypointInRadius(UGameplayAbility_AI AI, FName Waypoint, float Radius, FGameplayTag Action, FInteractionSpotHandle& OutSpot)
{
    FInteractionSpotHandle SpotHandle(Waypoint);

    if (!SpotHandle.IsValid())
        return false;

    TArray<FInteractionSpotHandle> Spots = InteractionSpots::FindSpotsUsableByPawnInRadius(AI.CharacterState, Action, SpotHandle.Location, Radius);

    if (Spots.Num() == 0)
        return false;

    OutSpot = Spots[0];
    return true;
}

/** Returns true if there is any freepoint with the given action at the given location. */
mixin bool DoesFreepointExistAt(UGameplayAbility_AI AI, FVector Location, float Radius, FGameplayTag Action)
{
    TArray<FInteractionSpotHandle> Spots = InteractionSpots::FindSpotsInRadius(Location, Radius);

    for (auto& Spot : Spots)
    {
        if (Spot.IsActionPossibleHere(Action))
        {
            return true;
        }
    }

    return false;
}

/** Returns true if there is any freepoint with the given action at the given location. */
mixin bool DoesFreepointExistAt(UGameplayAbility_AI AI, FName Waypoint, float Radius, FGameplayTag Action)
{
    FInteractionSpotHandle SpotHandle(Waypoint);

    if (!SpotHandle.IsValid())
        return false;

    return AI.DoesFreepointExistAt(SpotHandle.Location, Radius, Action);
}

/** Returns true if there is a freepoint with the given action that is also currently available at the given location. */
mixin bool IsFreepointAvailableAt(UGameplayAbility_AI AI, FVector Location, float Radius, FGameplayTag Action)
{
    return InteractionSpots::CanFindSpotsUsableByPawnInRadius(AI.CharacterState, Action, Location, Radius);
}

/** Returns true if there is a freepoint with the given action (that is also currently available) at the given location. */
mixin bool IsFreepointAvailableAt(UGameplayAbility_AI AI, FName Waypoint, float Radius, FGameplayTag Action)
{
    FInteractionSpotHandle SpotHandle(Waypoint);

    if (!SpotHandle.IsValid())
        return false;

    return InteractionSpots::CanFindSpotsUsableByPawnInRadius(AI.CharacterState, Action, SpotHandle.Location, Radius);
}

/** Returns true if there is a freepoint with the given actions that is also currently available at the given location. */
mixin bool IsFreepointAvailableAt(UGameplayAbility_AI AI, FVector Location, float Radius, FGameplayTagContainer PossibleActions)
{
    return InteractionSpots::CanFindSpotsUsableByPawnInRadius_TryMultipleActions(AI.CharacterState, PossibleActions, Location, Radius);
}

/** Returns true if there is a freepoint with the given actions (that is also currently available) at the given location. */
mixin bool IsFreepointAvailableAt(UGameplayAbility_AI AI, FName Waypoint, float Radius, FGameplayTagContainer PossibleActions)
{
    FInteractionSpotHandle SpotHandle(Waypoint);

    if (!SpotHandle.IsValid())
        return false;

    return InteractionSpots::CanFindSpotsUsableByPawnInRadius_TryMultipleActions(AI.CharacterState, PossibleActions, SpotHandle.Location, Radius);
}

/** Returns true if the given character is close to the given waypoint */
mixin bool IsNearWaypoint(AGothicCharacter Character, FName Waypoint, float Radius)
{
    FInteractionSpotHandle SpotHandle(Waypoint);

    if (!SpotHandle.IsValid())
        return false;
    
    return Character.ActorLocation.Distance(SpotHandle.Location) < Radius;
}

/** Returns true if the given character is close to the given location */
mixin bool IsNearLocation(AGothicCharacter Character, FVector Location, float Radius)
{
    return Character.ActorLocation.Distance(Location) < Radius;
}

/** Returns true if the character needs some time until it can do actions again (e.g. when stunned or doing another action) */
mixin bool IsBlocked(const UGameplayAbility_CharacterAI AI)
{
    return AI.Self.IsBlocked();
}

/** Returns true if the character is able to move right now. False if movement is locked by something (e.g. when stunned or doing another movement action) */
mixin bool CanMove(const UGameplayAbility_CharacterAI AI)
{
    return AI.Self.CanMove();
}

/** Returns true if the character has a place where they want to be right now. (e.g. as part of their daily routine) */
mixin bool HasPreferredLocation(const UGameplayAbility_CharacterAI AI)
{    
    auto PreferredLocation = UPreferredLocationComponent::Get(AI.PersistentSelf);

    if (PreferredLocation == nullptr)
        return false;

    return PreferredLocation.HasPreferredLocation();
}

/** Waits until the Character is no longer blocked from doing actions (e.g. stunned when stunned or doing another action). */
mixin FAbilityTaskExecutor WaitUntilNoLongerBlocked(UGameplayAbility_AI AI, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskWaitUntilNoLongerBlocked(AI), TimeLimitSeconds);
}

/** Waits until the Character is able to take movement commands again (e.g. stunned when stunned or doing another action). */
mixin FAbilityTaskExecutor WaitUntilCanMove(UGameplayAbility_AI AI, float TimeLimitSeconds = -1.0f)
{
    return FAbilityTaskExecutor(TaskWaitUntilCanMove(AI), TimeLimitSeconds);
}

/** Waits until the Character is no longer speaking (does nothing if the character is not speaking in the first place). */
mixin FAbilityTaskExecutor WaitUntilNoLongerSpeaking(UGameplayAbility_AI AI, float TimeLimitSeconds = -1.0f)
{
    if (!AI.CharacterState.HasGameplayTag(GameplayTag::State_Speak))
        return FAbilityTaskExecutor();

    return FAbilityTaskExecutor(TaskWaitForTagToBeRemoved(AI, GameplayTag::State_Speak), TimeLimitSeconds);
}

/** Access to the personal belongings of the character. */
mixin UPersonalBelongingsComponent GetPersonalBelongings(UGameplayAbility_CharacterAI AI) { return UPersonalBelongingsComponent::Get(AI.PersistentSelf); }

/** Returns the AI-Ability of the given character - if it has one. */
mixin UGameplayAbility_CharacterAI_Gothic GetGothicAI(AGothicCharacter Character)
{
    return Cast<UGameplayAbility_CharacterAI_Gothic>(Character.CharacterState.AI);
}

/** Cancels all current tasks of the  */
mixin void StopTalking(UGameplayAbility_CharacterAI AI)
{
    FGameplayEventData Payload;
    GothicGAS::SendGameplayEvent(AI.CharacterState, GameplayTag::End_Action_Speak, Payload);
}

/** Cancels all current tasks of the given class */
mixin void CancelTasksOfClass(UGameplayAbility_CharacterAI AI, TSubclassOf<UGothicCharacterAITask> TaskClass)
{
    for (auto Task : AI.ActiveAITasks)
    {
        if (!Task.IsA(TaskClass))
            continue;

        Task.ExternalCancel();
    }
}

/** Acts the given conversation topic with the given other character. */
mixin FAbilityTaskExecutor DoAmbientConversationWith(UGameplayAbility_AI AI, AGothicCharacterState OtherCharacter, TSubclassOf<UConversationTopic> TopicToAct)
{
    return FAbilityTaskExecutor(TaskAmbientConversation(AI, OtherCharacter, TopicToAct));
}

/** Do nothing for the given amount of time. If possible, use the Coroutine's WaitSeconds for more efficiency. */
mixin FAbilityTaskExecutor WaitSeconds(UGameplayAbility_AI AI, float SecondsToWait)
{
    return FAbilityTaskExecutor(TaskWaitSeconds(AI, SecondsToWait));
}

mixin float GetMeleeAttackRange(UWeaponMeleeItemAnimConfig MeleeItemConfig, FGameplayTag AttackDirectionTag)
{
    TSubclassOf<UComboAttackConfig> AttackConfigClass;

    if(!MeleeItemConfig.m_Attacks.Find(AttackDirectionTag, AttackConfigClass))
        return 0.f;

    UAttackMeleeConfig AttackMeleeConfig = Cast<UAttackMeleeConfig>(AttackConfigClass.Get().GetDefaultObject());
    if(AttackMeleeConfig == nullptr)
        return 0.f;

    return AttackMeleeConfig.GetAttackDistanceFromMontage();
}

/** Let's the character end any potentially ongoing interaction. */
mixin FAbilityTaskExecutor EndAnyOngoingInteraction(UGameplayAbility_AI AI)
{
    return FAbilityTaskExecutor(TaskEndInteraction(AI));
}

/** Let's the character end any potentially ongoing interaction. */
mixin FAbilityTaskExecutor EndAnyOngoingInteractionAndTurnTo(UGameplayAbility_AI AI, AGothicCharacter OtherCharacter)
{
    TArray<UAbilityTaskGeneric> Tasks;

    Tasks.Add(TaskEndInteraction(AI));
    Tasks.Add(TaskTurnToActor(AI, OtherCharacter));

    return FAbilityTaskExecutor(TaskWaitForLastTaskToEnd(AI, Tasks));
}


/** Let's the character end any potentially ongoing interaction, let another character approach */
mixin FAbilityTaskExecutor EndAnyOngoingInteractionAndLetOtherApproach(UGameplayAbility_AI AI, AGothicCharacterState OtherCharacter, float ReachDistance = 200.0f)
{
    TArray<UAbilityTaskGeneric> TasksSelf;
    TasksSelf.Add(TaskEndInteraction(AI));
    TasksSelf.Add(TaskTurnToActor(AI, OtherCharacter.Character));
    
    FVector DirectionSelfToOther = (OtherCharacter.Character.FeetLocation - AI.Character.FeetLocation).GetSafeNormal2D();

    float DistanceToOther = AI.Character.GetDistanceTo(OtherCharacter.Character);


    FVector EndPosition;
    if (!AI.IsMoveDistanceLargerThan(DirectionSelfToOther, ReachDistance, EndPosition = EndPosition))
    {
        EndPosition = OtherCharacter.Character.FeetLocation;
    }

    TArray<UAbilityTaskGeneric> TasksOther;
    
    TasksOther.Add(TaskTurnToActor(OtherCharacter.AI, AI.Character, 30.0f));

    TasksOther.Add(UAbilityTask_MoveRotateToLocation::MoveRotateToLocation(
        OtherCharacter.AI, 
        NAME_None, 
        FTransform((-DirectionSelfToOther).Rotation(), EndPosition), 
        bSetRotation = DistanceToOther < ReachDistance
    ));
    TasksOther.Add(TaskTurnToActor(OtherCharacter.AI, AI.Character));

    TArray<UAbilityTaskGeneric> TasksInParallel;
    TasksInParallel.Add(TaskSequence(AI, TasksSelf));
    TasksInParallel.Add(TaskSequence(OtherCharacter.AI, TasksOther));


    return FAbilityTaskExecutor(TaskWaitForLastTaskToEnd(AI, TasksInParallel));
}


/** Let's the character end any potentially ongoing interaction. (Quickly with a faster exit animations) */
mixin FAbilityTaskExecutor EndAnyOngoingInteractionQuick(UGameplayAbility_AI AI)
{
    return FAbilityTaskExecutor(TaskEndInteractionQuick(AI));
}

/** Let's the character end any potentially ongoing interaction. (Instant, without any exit animations) */
mixin FAbilityTaskExecutor EndAnyOngoingInteractionInstant(UGameplayAbility_AI AI)
{
    return FAbilityTaskExecutor(TaskEndInteractionInstant(AI));
}

/** Let's the character end any potentially ongoing interaction. (Just a request, does not wait until that's done) */
mixin void RequestEndAnyOngoingInteractionNonBlocking(UGameplayAbility_AI AI)
{
    FGameplayEventData Payload;
    GothicGAS::SendGameplayEvent(AI.CharacterState, GameplayTag::End_Action_Interact, Payload);
}

/** Lets the character begin doing an interaction. Must be explicitly ended. */
mixin FAbilityTaskExecutor BeginInteractionWithoutSpot(UGameplayAbility_AI AI, FGameplayTag ActionTag)
{
    auto Task = TaskInteractHereWithoutSpot(AI, ActionTag, -1.0f);

    Task.bEndWhenEnteredState = true;

    return FAbilityTaskExecutor(Task);
}


/** Lets the character begin doing an interaction. Must be explicitly ended. */
mixin FAbilityTaskExecutor UseFakeScroll(UGameplayAbility_AI AI, float DurationSeconds = 3.0f)
{
    return FAbilityTaskExecutor(TaskInteractHereWithoutSpot(AI, GameplayTag::Action_Conversation_ReadScroll, DurationSeconds));
}

/** Lets the start aiming (if not already aiming) and draw the bow string until it's at least at the given tension ratio. */
mixin FAbilityTaskExecutor ArcheryPrepareAimedShot(UGameplayAbility_AI AI, float StringTensionRatio = 0.9f)
{
    return FAbilityTaskExecutor(TaskArcheryPrepareAimedShot(AI, StringTensionRatio));
}

/** 
 * Let's the character shoot an arrow from the currently equipped ranged weapon. Weapon must be in the characters hands already. 
 * If the shot was prepared via ArcheryPrepareAimedShot(...), this will do an aimed shot. Otherwise, it will do a quickshot.
 */
mixin FAbilityTaskExecutor ArcheryShootArrow(UGameplayAbility_AI AI)
{
    return FAbilityTaskExecutor(TaskArcheryShoot(AI));
}

/** Lets the character start aiming. */
mixin FAbilityTaskExecutor EnterAimingStance(UGameplayAbility_AI AI)
{
    return FAbilityTaskExecutor(TaskEnterAimingStance(AI));
}

/** If the character is currently aiming, stop doing that. Can be used to cancel a prepared aimed archery shot.*/
mixin FAbilityTaskExecutor LeaveAimingStance(UGameplayAbility_AI AI)
{
    return FAbilityTaskExecutor(TaskLeaveAimingStance(AI));
}

/** 
 * Returns a list of interactionspots that belong to nearby executable characters. All of them are checked for being usable and claimable already.
 * The returned list is sorted by distance, closest first.
 */
UFUNCTION(BlueprintCallable)
mixin TArray<AGothicCharacter> FindAllNearbyExecutableCharacters(UGameplayAbility_AI AI, float WithinDistance)
{
    auto Spots = InteractionSpots::FindSpotsUsableByPawnInRadius(
        AI.CharacterState, 
        GameplayTag::Action_Execution, 
        AI.CharacterState.CharacterLocation, 
        WithinDistance
    );

    InteractionSpots::SortSpotArrayByDistance(Spots, AI.CharacterState.CharacterLocation);

    TArray<AGothicCharacter> ExecutableCharacters;

    for (auto& Spot : Spots)
    {
        AGothicCharacter Character = Cast<AGothicCharacter>(Spot.ActorToInteractWith);

        if (Character == nullptr)
            continue;

        if (Character.HasGameplayTag(GameplayTag::State_UnKillable))
            continue;

        ExecutableCharacters.Add(Character);
    }

    return ExecutableCharacters;
}

/** 
 * Returns a list of interactionspots that belong to nearby lootable characters. All of them are checked for being usable and claimable already.
 * The returned list is sorted by distance, closest first.
 */
UFUNCTION(BlueprintCallable)
mixin TArray<AGothicCharacter> FindAllNearbyLootableCharacters(UGameplayAbility_AI AI, float WithinDistance)
{
    auto Spots = InteractionSpots::FindSpotsUsableByPawnInRadius(
        AI.CharacterState, 
        GameplayTag::Action_Loot, 
        AI.CharacterState.CharacterLocation, 
        WithinDistance
    );

    InteractionSpots::SortSpotArrayByDistance(Spots, AI.CharacterState.CharacterLocation);

    TArray<AGothicCharacter> LootableCharacters;

    for (auto& Spot : Spots)
    {
        AGothicCharacter Character = Cast<AGothicCharacter>(Spot.ActorToInteractWith);

        if (Character == nullptr)
            continue;

        LootableCharacters.Add(Character);
    }

    return LootableCharacters;
}

/** Task constructor function for Execution interaction. */
UFUNCTION(BlueprintCallable)
UAbilityTask_InteractWith TaskExecuteDefeatedCharacter(UGameplayAbility OnwingAbility, AGothicCharacter CharacterToExecute)
{
    auto Task = TaskInteractWithActor(OnwingAbility, CharacterToExecute, GameplayTag::Action_Execution, -1.0f);

    Task.StateTag = GameplayTag::State_Executing;

    return Task;
}

/** Executes (kills) the given other character. The other character must be laying defeated for this to work. (See FindAllNearbyExecutableCharacters) */
mixin FAbilityTaskExecutor ExecuteDefeatedCharacter(UGameplayAbility_AI AI, AGothicCharacter CharacterToExecute)
{
    return FAbilityTaskExecutor(TaskExecuteDefeatedCharacter(AI, CharacterToExecute));
}

/** Task constructor function for loot interaction. */
UFUNCTION(BlueprintCallable)
UAbilityTask_InteractWith TaskLootDefeatedCharacter(UGameplayAbility OwningAbility, AGothicCharacter CharacterToLoot)
{
    auto Task = TaskInteractWithActor(OwningAbility, CharacterToLoot, GameplayTag::Action_Loot, -1.0f);

    Task.StateTag = GameplayTag::State_Interact_Body_Loot;
    return Task;
}

/** Plunders the given other character. The other character must be laying defeated for this to work. (See FindAllNearbyExecutableCharacters) */
mixin FAbilityTaskExecutor LootDefeatedCharacter(UGameplayAbility_AI AI, AGothicCharacter CharacterToLoot)
{
    return FAbilityTaskExecutor(TaskLootDefeatedCharacter(AI, CharacterToLoot));
}

/** Task constructor function for Smash Meatbug interaction. */
UFUNCTION(BlueprintCallable)
UAbilityTask_InteractWith TaskSmashMeatbug(UGameplayAbility OnwingAbility, AGothicCharacter MeatbugToSmash)
{
    auto Task = TaskInteractWithActor(OnwingAbility, MeatbugToSmash, GameplayTag::Action_Smash_MeatBug, -1.0f);

    Task.StateTag = GameplayTag::State_Executing;

    return Task;
}

/** Smashes (kills) the given other meatbug character. The other character must be a meatbug for this to work.*/
mixin FAbilityTaskExecutor SmashMeatbug(UGameplayAbility_AI AI, AGothicCharacter MeatbugToSmash)
{
    return FAbilityTaskExecutor(TaskSmashMeatbug(AI, MeatbugToSmash));
}

mixin AGothicCharacter GetClosestExecutableCharacterInRadiusWithRelationship(UGameplayAbility_AI AI, float Radius, ERelationship Relationship, ERelationshipHostility Hostility)
{
    TSet<ERelationship> Relationships = TSet<ERelationship>();
    Relationships.Add(Relationship);
    TSet<ERelationshipHostility> Hostilities = TSet<ERelationshipHostility>();
    Hostilities.Add(Hostility);
    return AI.GetClosestExecutableCharacterInRadiusWithRelationship(Radius, Relationships, Hostilities);
}

mixin AGothicCharacter GetClosestExecutableCharacterInRadiusWithRelationship(UGameplayAbility_AI AI, float Radius, TSet<ERelationship> Relationships, TSet<ERelationshipHostility> Hostilities)
{
    TArray<AGothicCharacter> ExecutableCharacters = AI.FindAllNearbyExecutableCharacters(Radius);

    for (AGothicCharacter Character : ExecutableCharacters)
    {
        auto Hostility = AI.CharacterState.GetHostilityTowards(Character.CharacterState);
        if (!Hostilities.Contains(Hostility))
            continue;

        auto Relationship = AI.CharacterState.GetRelationshipTowards(Character.CharacterState);
        if (!Relationships.Contains(Relationship))
            continue;

        return Character;
    }

    return nullptr;
}

mixin AGothicCharacter GetClosestLootableCharacterInRadiusWithRelationship(UGameplayAbility_AI AI, TArray<AGothicCharacterState> ExcludeCharacters, float Radius, TSet<ERelationship> Relationships, TSet<ERelationshipHostility> Hostilities)
{
    TArray<AGothicCharacter> LootableCharacters = AI.FindAllNearbyLootableCharacters(Radius);

    for (AGothicCharacter Character : LootableCharacters)
    {
        if (ExcludeCharacters.Contains(Character.CharacterState))
            continue;

        if (!Hostilities.Contains(AI.CharacterState.GetHostilityTowards(Character.CharacterState)))
            continue;

        if (!Relationships.Contains(AI.CharacterState.GetRelationshipTowards(Character.CharacterState)))
            continue;

        return Character;
    }

    return nullptr;
}

mixin void UpdateCrimeSeverityTowardsPlayer(UGameplayAbility_CharacterAI_Gothic AI)
{
    const AGothicCharacter PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
    if (!IsValid(PlayerCharacter))
        return;

    const AGothicCharacterState PlayerCharacterState = PlayerCharacter.CharacterState;
    if (!IsValid(PlayerCharacterState))
        return;

    AI.UpdateCrimeSeverityTowardsPlayer(PlayerCharacterState);
}

mixin void UpdateCrimeSeverityTowardsPlayer(UGameplayAbility_CharacterAI_Gothic AI, const AGothicCharacterState PlayerState)
{
    if (!IsValid(PlayerState))
        return;

    UCrimeProcessingSubsystem CrimeSubsystem = AI.CrimeProcessingSubsystem;
    if (!IsValid(CrimeSubsystem))
        return;
    
    FCrimeSeverityResult SeverityResult = CrimeSubsystem.EvaluateCrimesInMemoryForCharacter(AI.CharacterState, PlayerState);
    AI.CrimeSeverityTowardsPlayer = CrimeSubsystem.GetCrimeSeverityLevelFromValue(SeverityResult.NormalizedSeverity);

    if (!AI.CharacterState.HasGameplayTag(GameplayTag::CampRole_Guard))
        return;

    auto FineAndCrimeCount = AI.GetFineToPayForTheftCrimesByCriminal(PlayerState);
    int FineValue = FineAndCrimeCount.X;

    AI.bCanForgivePlayerWithFine = FineValue > 0;
    AI.CurrentFineValueForPlayer = FineValue;
    AI.CurrentFineCrimeCountForPlayer = FineAndCrimeCount.Y;
}

mixin ERelationship GetPlayerRelationshipForGlossary(UGameplayAbility_CharacterAI_Gothic AI, const AGothicPlayerState PlayerState)
{
    if (!IsValid(PlayerState))
        return ERelationship::Neutral;

    // Create a scope with the player as world context since this will be called from outside a valid world context
    FAngelscriptGameThreadScopeWorldContext Scope(PlayerState);

    ERelationship Relationship = ERelationship::Unknown;
    AI.UpdateCrimeSeverityTowardsPlayer(PlayerState);
    switch (AI.CrimeSeverityTowardsPlayer)
    {
        case ECrimeSeverityLevel::None:
        case ECrimeSeverityLevel::ECrimeSeverityLevel_MAX:
        case ECrimeSeverityLevel::Minimal:
        case ECrimeSeverityLevel::Low:
            Relationship = ERelationship::Neutral;
            break;
        case ECrimeSeverityLevel::Medium:
            Relationship = ERelationship::Angry;
            break;
        case ECrimeSeverityLevel::High:
            Relationship = ERelationship::Hostile;
            break;
        case ECrimeSeverityLevel::Critical:
            Relationship = ERelationship::Enemy;
            break;        
    }

    ERelationship RelationshipTowardsPlayer = AI.CharacterState.GetRelationshipTowards(PlayerState);
    if (RelationshipTowardsPlayer == ERelationship::Enemy || Relationship == ERelationship::Enemy)
        return ERelationship::Enemy;

    if (RelationshipTowardsPlayer == ERelationship::Hostile || Relationship == ERelationship::Hostile)
        return ERelationship::Hostile;

    if (RelationshipTowardsPlayer == ERelationship::Angry || Relationship == ERelationship::Angry)
        return ERelationship::Angry;

    return RelationshipTowardsPlayer;  
}

mixin FIntVector2 GetFineToPayForTheftCrimesByCriminal(UGameplayAbility_AI AI, const AGothicCharacterState Criminal)
{
    UGameplayAbility_CharacterAI_Gothic CharacterAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
    if(!IsValid(CharacterAI))
        return FIntVector2(-1, 0);
    
    auto CrimeSubsystem = CharacterAI.CrimeProcessingSubsystem;
    if (!IsValid(CrimeSubsystem))
        return FIntVector2(-1, 0);

    return CrimeSubsystem.GetFineToPayForTheftCrimesByCriminal(AI.CharacterState, Criminal);
}

mixin void TakeOreForCrimeFinesFromCharacter(UGameplayAbility_AI AI, AGothicCharacterState Other)
{
    UGameplayAbility_CharacterAI_Gothic CharacterAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
    if(!IsValid(CharacterAI))
        return;

    if (!Other.IsPlayerCharacter())
        return;

    if (!CharacterAI.bCanForgivePlayerWithFine)
        return;

    if (Other.Inventory.GetOreCount() < CharacterAI.CurrentFineValueForPlayer)
        return;

    int FineAmount = CharacterAI.CurrentFineValueForPlayer;
    int CrimeCount = CharacterAI.CurrentFineCrimeCountForPlayer;

    Other.Inventory.RemoveOre(FineAmount);
    AI.CharacterState.Inventory.AddItemOfClass(UItMi_Orenugget, FineAmount);

    AGothicPlayerState PlayerState = Cast<AGothicPlayerState>(Other);
    if (!IsValid(PlayerState))
        return;

    UTelemetryHelper::OnCrimeFinePaid(PlayerState, AI.CharacterState.CharacterGlobalId.ToString(), FineAmount, CrimeCount);
}

mixin void ForgiveAllTheftRelatedCrimesByCriminal(UGameplayAbility_AI AI, AGothicCharacterState Criminal)
{
    UGameplayAbility_CharacterAI_Gothic CharacterAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
    if(!IsValid(CharacterAI))
        return;

    auto CrimeSubsystem = CharacterAI.CrimeProcessingSubsystem;
    if (!IsValid(CrimeSubsystem))
        return;

    CrimeSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, Criminal, GameplayTag::Crime_Theft);
    CrimeSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, Criminal, GameplayTag::Crime_Pickpocket);
}