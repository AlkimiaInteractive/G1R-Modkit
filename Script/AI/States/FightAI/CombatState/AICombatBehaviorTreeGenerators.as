/** Move between waypoints A and B */
UCLASS()
class UCBT_Tree_TestWaypointsAandB : UCBT_Tree
{
    default BaseSortLayer = -1.0f;

    default DoMove(UCM_Test_GoToWaypointAorBToggle());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Behavior_CombatMove : UCBT_Tree
{
    UCBT_Behavior_CombatMove(UAITask_CombatMove CombatMove)
    {
        PrioritySelector()
            .DoMove(CombatMove);
    
        MakeBehavior();
    }

    default BaseSortLayer = 0.0f;
}

/** React to attack successfully blocked and riposte allowed. */
UCLASS()
class UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth : UCBT_Tree
{
    default BaseSortLayer = 0.001f;

    UCBT_Tree_RiposteWhenAttackSuccessfullyBlockedAndTargetAtHighHealth(float InProbability)
    {
        Probability = InProbability;
    }

    UPROPERTY()
    float Probability = 1.0f;

    default DoMove()
                .SetProbability(Probability)
                .AddRequirement(UCS_TargetHealthHigherThan(50.0f))
                .AsDoMove().SetMove(UCM_Riposte());
    
    default MakeBehavior();
}

/** Exit Block stance */
UCLASS()
class UCBT_Tree_ExitBlockStanceWhenEnemyFarOrBlockedLongEnough : UCBT_Tree
{
    default BaseSortLayer = 0.01f;

    default DoMove()
            .AddRequirement(UCS_InBlockStance())
            .AddRequirement(UCS_Or(
                UCS_EnemyInsideDistanceRange(450.0f, MAX_flt),
                UCS_BlockedForLongEnough()))
            .AsDoMove().SetMove(UCM_ExitBlockStance());
    
    default MakeBehavior();
}

/** Exit Block stance */
UCLASS()
class UCBT_Tree_ExitBlockStance : UCBT_Tree
{
    default BaseSortLayer = 0.01f;
    default DoMove()
            .AddRequirement(UCS_InBlockStance())
            .AsDoMove().SetMove(UCM_ExitBlockStance());
    
    default MakeBehavior();
}

/** Enter Block stance Indefintetly*/
UCLASS()
class UCBT_Tree_EnterBlockStance : UCBT_Tree
{
    default BaseSortLayer = 0.05f;
    default DoMove()
            .AddRequirement(UCS_Not(UCS_InBlockStance()))
            .AsDoMove().SetMove(UCM_EnterBlockStance());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamageInSeconds : UCBT_Tree
{
    default BaseSortLayer = 0.04f;

    UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamageInSeconds(float32 InDamageThreshhold, float32 InTimeFrameSeconds)
    {
        DamageThreshhold = InDamageThreshhold;
        TimeFrame = InTimeFrameSeconds;
    }

    float32 DamageThreshhold = 10.0f;
    float32 TimeFrame = 5.0f;

    default Sequence()
        .AddRequirement(UCS_IsDamageReceivedInLastSecondsHigherThan(DamageThreshhold, TimeFrame))
        
        .AsSequence()
        .DoOperation(UCO_SetPreferredDistance(500.0f)).ExitToFlowControlNode()
        .DoOperation(UCO_UseProactiveBlockingTime()).ExitToFlowControlNode()
        .DoMove(UCM_EnterBlockStance());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamagePercentInSeconds : UCBT_Tree
{
    default BaseSortLayer = 0.04f;

    UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamagePercentInSeconds(float32 InDamageThreshholdPercentage, float32 InTimeFrameSeconds)
    {
        DamageThreshholdPercentage = InDamageThreshholdPercentage;
        TimeFrame = InTimeFrameSeconds;
    }

    float32 DamageThreshholdPercentage = 10.0f;
    float32 TimeFrame = 5.0f;

    default Sequence()
        .AddRequirement(UCS_IsDamageReceivedInLastSecondsHigherThanPercent(DamageThreshholdPercentage, TimeFrame))
        
        .AsSequence()
        .DoOperation(UCO_SetPreferredDistance(500.0f)).ExitToFlowControlNode()
        .DoOperation(UCO_UseProactiveBlockingTime()).ExitToFlowControlNode()
        .DoMove(UCM_EnterBlockStance());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_DodgeAwayWhenReceivedDamageInSecondsAndEnemyClose : UCBT_Tree
{
    default BaseSortLayer = 0.04f;

    UCBT_Tree_DodgeAwayWhenReceivedDamageInSecondsAndEnemyClose(float32 InDamageRatio, float32 InTimeFrameSeconds)
    {
        DamageRatio = InDamageRatio;
        TimeFrame = InTimeFrameSeconds;
    }

    UPROPERTY()
    float32 DamageRatio = 15.0f;

    UPROPERTY()
    float32 TimeFrame = 10.0f;

    default RandomSelector()
            .AddRequirement(UCS_EnemyClose())
            .AddRequirement(UCS_IsDamageReceivedInLastSecondsHigherThanPercent(DamageRatio, TimeFrame))
            
            .AsRandomSelector()
            .DoMove(UCM_DodgeAwayFromEnemy()).ExitToFlowControlNode()
            .DoMove(UCM_DodgeLeftRelativeToTarget()).ExitToFlowControlNode()
            .DoMove(UCM_DodgeRightRelativeToTarget());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_DodgeAwayIfEnemyCloseAfterSuperarmorBreak : UCBT_Tree
{
    default BaseSortLayer = 0.04f;

    default RandomSelector()
            .AddRequirement(UCS_EnemyClose())
            .AddRequirement(UCS_JustRecoveredFromSuperarmorBreak())
            
            .AsRandomSelector().DoMove(UCM_DodgeAwayFromEnemy());
    
    default MakeBehavior();
}

/** Dodge away, attack or Move to close distance if enemy too close */
UCLASS()
class UCBT_Tree_SelectAttackWhenTooClose : UCBT_Tree_SelectAttack
{
    UCBT_Tree_SelectAttackWhenTooClose(EAttackDirectionRequirement _DirectionRequirement)
    {
        DirectionRequirement = _DirectionRequirement;
    }

    UPROPERTY()
    EAttackDirectionRequirement DirectionRequirement = EAttackDirectionRequirement::Any;

    default BaseSortLayer = 2.9f;

    default RandomAttackSelector = UCBT_RandomAttackSelectorSplitTree();

    default SetNode(RandomAttackSelector)
        .AddRequirement(UCS_EnemyTooClose())
        .AddRequirement(UCS_IsFacingDirectionRequirement(DirectionRequirement));

    default MakeBehavior();
}

/** Dodge away, attack or Move to close distance if enemy too close */
UCLASS()
class UCBT_Tree_SelectAttackWhenClose : UCBT_Tree_SelectAttack
{
    UCBT_Tree_SelectAttackWhenClose(EAttackDirectionRequirement _DirectionRequirement)
    {
        DirectionRequirement = _DirectionRequirement;
    }

    UPROPERTY()
    EAttackDirectionRequirement DirectionRequirement = EAttackDirectionRequirement::Any;

    default BaseSortLayer = 2.9f;

    default RandomAttackSelector = UCBT_RandomAttackSelectorSplitTree();

    default SetNode(RandomAttackSelector)
        .AddRequirement(UCS_EnemyClose())
        .AddRequirement(UCS_IsFacingDirectionRequirement(DirectionRequirement));

    default MakeBehavior();
}

/** Chance to dodge away after making an attack when enemy close. */
UCLASS()
class UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose : UCBT_Tree
{
    default BaseSortLayer = 2.0f;

    UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(float32 InDodgeProbability)
    {
        DodgeProbability = InDodgeProbability;
    }

    UPROPERTY()
    float32 DodgeProbability = 1.0f;

    default DoMove(UCM_DodgeAwayFromEnemy())
                .IgnoreCombatMoveCooldown()
                .SetProbability(DodgeProbability)
                .AddRequirement(UCS_EnemyCloserThan(400.0f))
                .AddRequirement(UCS_LastMoveWasAttack())
                .AddRequirement(UCS_Not(UCS_Moving()));

    default MakeBehavior();
}

/** Chance to turn to enemy and do aggressive taunt after making a charge attack if enemy at lunge distance. */
UCLASS()
class UCBT_Tree_ChanceToAggressiveTauntAfterChargeWhenLunge : UCBT_Tree
{
    default BaseSortLayer = 2.0f;

    UCBT_Tree_ChanceToAggressiveTauntAfterChargeWhenLunge(float32 InTauntProbability)
    {
        TauntProbability = Math::Clamp(InTauntProbability, 0.0f, 1.0f);
    }

    UPROPERTY()
    float32 TauntProbability = 1.0f;

    default PrioritySelector() // Taunt block sequence
                .AddRequirement(UCS_EnemyClose())
                .AddRequirement(UCS_LastMoveWasChargeAttack())
                .SetProbability(TauntProbability)
                .AsPrioritySelector()
                .Sequence()
                    .AddRequirement(UCS_Not(UCS_FacingEnemy()))
                    .AsSequence().Succeeder()
                        .RandomSelector()
                            .SetProbability(0.66f).AsRandomSelector()
                            .DoMove(UCM_DodgeLeftRelativeToTarget()).ExitToFlowControlNode()
                            .DoMove(UCM_DodgeRightRelativeToTarget()).ExitToFlowControlNode()
                            .CloseFlowControlNode()
                    .RetryAmount(20)
                        .AddRequirement(UCS_Not(UCS_FacingEnemy()))
                        .AsDecorator().Failer()
                            .DoMove(UCM_Wait()).ExitToFlowControlNode()
                    .CloseFlowControlNode()
                .DoMove(UCM_Taunt());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_DodgeAwayFromAttackVectors : UCBT_Tree
{
    default BaseSortLayer = 2.5f;

    default DoMove(UCM_DodgeAwayFromAttackVector());
    
    default MakeBehavior();
}

/** Do Move back if last move was attack and too close */
UCLASS()
class UCBT_Tree_MoveBackAfterAttackWhenClose : UCBT_Tree
{
    default BaseSortLayer = 2.5f;

    default DoMove(UCM_MoveBack())
                .AddRequirement(UCS_Not((UCS_AttackSelected())))
                .AddRequirement(UCS_NotMoving())
                .AddRequirement(UCS_EnemyTooClose())
                .AddRequirement(UCS_FacingEnemy());
    
    default MakeBehavior();
}

/** When out of range, consume potion to restore health. */
UCLASS()
class UCBT_Tree_ConsumeItemIfNoEnemyClose : UCBT_Tree
{
    default BaseSortLayer = 4.1f;

    default DoMove()
            .AddRequirement(UCS_Not(UCS_EnemyClose()))
            .AsDoMove().SetMove(UCM_UseSelectedConsumableItem());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_SelectAttackWhenNoPathToTheTarget : UCBT_Tree_SelectAttack
{
    default BaseSortLayer = 4.5f;

    default RandomAttackSelector = UCBT_RandomAttackSelectorSplitTree();

    default SetNode(RandomAttackSelector)
            .AddRequirement(UCS_EnemyClose())
            .AddRequirement(UCS_CharacterOfInterestIsUnreachable());
    
    default MakeBehavior();
}

/** Stop Doing special attack if not inside distance range or not facing enemy */
UCLASS()
class UCBT_Tree_CancelAttackIfNotInDistanceRangeOrNotFacingEnemy : UCBT_Tree
{
    UCBT_Tree_CancelAttackIfNotInDistanceRangeOrNotFacingEnemy(FGameplayTag AttackTag)
    {
        _AttackTag = AttackTag;
    }

    FGameplayTag _AttackTag;
    default BaseSortLayer = 0.5f;

    default DoOperation(UCO_CancelCurrentCombatAction())
                .AddRequirement(UCS_CurrentActionIsAttack())
                .AddRequirement(UCS_Or(UCS_Not(UCS_TagIsValid(_AttackTag)), UCS_CurrentAttackActionIsType(_AttackTag)))
                .AddRequirement(UCS_Not(UCS_CurrentActionDistanceAndFacingRequirementsFulfilled()));
    
    default MakeBehavior();
}

/** Turn around by waiting if enemy close and not facing enemy. */
/** Turn around by waiting if enemy close and not facing enemy. */
UCLASS()
class UCBT_Tree_TurnAroundIfCloseAndNotFacingEnemy : UCBT_Tree
{
    default BaseSortLayer = 3.0f;
    default SetNode(UCBT_Tree_TurnAroundIfNotFacingEnemy())
                .AddRequirement(UCS_EnemyClose());

    default MakeBehavior();
}

/** Turn around by waiting if enemy close and not facing enemy. */
UCLASS()
class UCBT_Tree_TurnAroundIfNotCloseAndNotFacingEnemy : UCBT_Tree
{
    default BaseSortLayer = 3.0f;
    default SetNode(UCBT_Tree_TurnAroundIfNotFacingEnemy())
                .AddRequirement(UCS_Not(UCS_EnemyClose()));
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_ShortTauntAfterDodgeWhenCloseOrLungeDistance : UCBT_Tree
{
    default BaseSortLayer = 2.0f;

    default DoMove()
                .SetProbability(0.66f)
                .AddRequirement(UCS_Or(
                    UCS_EnemyClose(),
                    UCS_EnemyAtLungeDistance()))
                .AddRequirement(UCS_LastMoveWasDodge())
                .AsDoMove().SetMove(UCM_Taunt());
    
    default MakeBehavior();
}

/** Close current dynamic combo attack chain when necessary */
UCLASS()
class UCBT_Tree_CloseDynamicComboAttackChain : UCBT_Tree
{
    default BaseSortLayer = 2.1f;

    default Failer()
            .PrioritySelector() /** Should close or probability check suceeds */
                .DoOperation(UCO_CloseCurrentComboChain())
                    .SetProbability(UNodeProbabilityCalculation_CloseCurrentDynamicCombo())
                    .ExitToFlowControlNode()
                .DoOperation(UCO_CloseCurrentComboChain())
                    .AddRequirement(UCS_ShouldCloseCurrentDynamicCombo());
    
    default MakeBehavior();
}

/** Charge towards the enemy if at lunge distance and facing enemy */
UCLASS()
class UCBT_Tree_SelectAttackWhenFarAway : UCBT_Tree_SelectAttack
{
    default BaseSortLayer = 2.7f;

    default RandomAttackSelector = UCBT_RandomAttackSelectorSplitTree();
    default SetNode(RandomAttackSelector)
            .AddRequirement(UCS_EnemyInsideDistanceRange(800.0f, 3000.0f));
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_DodgeAwayFromEnemyWhenClose : UCBT_Tree
{
    default BaseSortLayer = 5.0f;
    default DoMove()
                .IgnoreCombatMoveCooldown()
                .AddRequirement(UCS_EnemyClose())
                .AsDoMove().SetMove(UCM_DodgeAwayFromEnemy());

    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan : UCBT_Tree
{
    UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(float Distance, float32 Layer)
    {
        BaseSortLayer = Layer;
        DoMove(UCM_DodgeAwayFromEnemy())
            .IgnoreCombatMoveCooldown()
            .AddRequirement(UCS_EnemyCloserThan(Distance));
        
        MakeBehavior();
    }
}

UCLASS()
class UCBT_Tree_TurnToEnemyIfCloseAndNotFacing : UCBT_Tree
{
    default BaseSortLayer = 5.0f;
    default DoMove()
                .IgnoreCombatMoveCooldown()
                .AddRequirement(UCS_EnemyClose())
                .AddRequirement(UCS_NotFacingEnemy())
                .AsDoMove().SetMove(UCM_DodgeAwayFromEnemy());

    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_Taunts : UCBT_Tree
{
    default PrioritySelector()
                .DoMove(UCM_Taunt())
                .AddTreeCooldown("Taunt", UNodeCooldownCalculation_TauntGeneralCooldownFromType(GameplayTag::Combat_Taunt), 
                        bInCooldownOnSuccess = true, bInCooldownOnFail = false, bInCooldownOnCancel = true,
                        bBlockTickingDuringActiveActions = true);

    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_Taunts_Voiced : UCBT_Tree
{
    default PrioritySelector()
                .DoMove(UCM_Taunt_Voiced())
                .AddTreeCooldown("Taunt", UNodeCooldownCalculation_TauntGeneralCooldownFromType(GameplayTag::Combat_Taunt), 
                        bInCooldownOnSuccess = true, bInCooldownOnFail = false, bInCooldownOnCancel = true,
                        bBlockTickingDuringActiveActions = true);

    default MakeBehavior();
}

/** Chance to do a short taunt after an attack when enemy close. */
UCLASS()
class UCBT_Tree_ChanceToShortTauntAfterAttackWhenClose : UCBT_Tree
{
    default BaseSortLayer = 6.1f;

    UCBT_Tree_ChanceToShortTauntAfterAttackWhenClose(float32 InTauntProbability)
    {
        TauntProbability = InTauntProbability;
    }

    UPROPERTY()
    float32 TauntProbability = 1.0f;

    default DoMove(UCM_Taunt())
                .IgnoreCombatMoveCooldown()
                .SetProbability(TauntProbability)
                .AddRequirement(UCS_EnemyClose())
                .AddRequirement(UCS_LastMoveWasAttack())
                .AddRequirement(UCS_Not(UCS_Moving()));

    default MakeBehavior();
}

/** Do long taunt when out of range and enemy facing me, chance to wait instead of taunting. */
UCLASS()
class UCBT_Tree_AggressiveTauntWhenJustGotHit : UCBT_Tree
{
    default BaseSortLayer = 6.1f;
    default DoMove()
                .AddRequirement(UCS_LastHitWasLessThanNSecondsAgo(2.0f))
                .AsDoMove().SetMove(UCM_Taunt());

    default MakeBehavior();
}

/** Do aggressive taunt when enemy at lunge distance, chance to skip taunt. */
UCLASS()
class UCBT_Tree_ChanceToAggressiveTauntWhenLunge : UCBT_Tree
{
    UCBT_Tree_ChanceToAggressiveTauntWhenLunge(float32 Probability)
    {
        ChanceToTaunt = Probability;
    }

    float32 ChanceToTaunt = 0.5f;

    default BaseSortLayer = 6.05f;
    default DoMove(UCM_Taunt())
                .SetProbability(ChanceToTaunt)
                .AddRequirement(UCS_EnemyAtLungeDistance());

    default MakeBehavior();
}

/** Do aggressive taunt when enemy at lunge distance, chance to skip taunt. */
UCLASS()
class UCBT_Tree_ChanceToAggressiveTauntWhenAtRange : UCBT_Tree
{
    UCBT_Tree_ChanceToAggressiveTauntWhenAtRange(float32 Probability, float MinRange, float MaxRange)
    {
        ChanceToTaunt = Probability;
        MinimumRange = MinRange;
        MaximumRange = MaxRange;
    }

    float32 ChanceToTaunt = 1.0f;
    float MinimumRange = 0.0f;
    float MaximumRange = MAX_flt;

    default BaseSortLayer = 6.05f;
    default DoMove(UCM_Taunt())
                .SetProbability(ChanceToTaunt)    
                .AddRequirement(UCS_EnemyInsideDistanceRange(MinimumRange, MaximumRange));

    default MakeBehavior();
}

/** Do aggressive taunt when enemy at lunge distance, chance to skip taunt. */
UCLASS()
class UCBT_Tree_AggressiveTauntWhenLunge : UCBT_Tree
{
    default BaseSortLayer = 6.05f;
    
    default DoMove()
                .AddRequirement(UCS_EnemyAtLungeDistance())
                .AsDoMove().SetMove(UCM_Taunt());
    
    default MakeBehavior();
}

/** Do aggressive taunt when enemy is further than the distance given */
UCLASS()
class UCBT_Tree_AggressiveTauntWhenFartherThan : UCBT_Tree
{
    UCBT_Tree_AggressiveTauntWhenFartherThan(float InDistance)
    {
        Distance = InDistance;
    }

    UPROPERTY()
    float Distance = 200.0f;

    default BaseSortLayer = 6.1f;

    default DoMove()
                .AddRequirement(UCS_EnemyInsideDistanceRange(Distance, MAX_flt))
                .AsDoMove().SetMove(UCM_Taunt());
    
    default MakeBehavior();
}

/** Move to attack range if attack available then attack. Behavior will fail and not apply cooldown if it can't attack due to not being in range. */
UCLASS()
class UCBT_Tree_SelectAttackBase : UCBT_Tree
{
    UCBT_RandomAttackSelectorSplitTree RandomAttackSelector;

    UCBT_Tree_SelectAttackBase AddAttack(const FAttackInfo& Attack, float32 Weight = -1.0f, EAttackDirectionRequirement DirectionRequirementOverride = EAttackDirectionRequirement::None)
    {
        if (RandomAttackSelector == nullptr)
        {
            CreateSelector();
        }
        if (!IsBehavior)
        {
            if (NodeName != "")
            {
                MakeBehaviorInternal("AttackSelector - " + NodeName);
            }
            else
            {
                MakeBehavior();
            }
        }

        if (RandomAttackSelector == nullptr)
            return this;

        RandomAttackSelector.AddAttack(Attack, SortLayer, Weight, DirectionRequirementOverride);

        return this;
    }

    UCBT_Tree_SelectAttackBase SetOrderLayer(float32 Value)
    {
        BaseSortLayer = Value;
        return this;
    }

    void CreateSelector()
    {
        RandomAttackSelector = UCBT_RandomAttackSelectorSplitTree();
        Node =  Sequence()
                    .DoOperation(UCO_RequestAttackToken()).ExitToFlowControlNode()
                    .PrioritySelector()
                        .DoNode(RandomAttackSelector)
                            .AddRequirement(UCS_Not(UCS_AttackSelectedByThisSelector(RandomAttackSelector)))
                            .ExitToFlowControlNode()
                        .DoNode(UCBT_Succeeder())
                            .AddRequirement(UCS_AttackSelectedByThisSelector(RandomAttackSelector))
                            .ExitToFlowControlNode()
                        .ExitToFlowControlNode()
                    .DoNode(UCBT_ExecuteSelectedAttack())
                        .AddRequirement(UCS_AttackSelectedByThisSelector(RandomAttackSelector))
                        .ExitToFlowControlNode();

        Node.ParentNode = this;
        Node.bActivateCooldownsFromTick = false;
    }
}

mixin UCBT_Tree_SelectAttackBase AttackTree(UCBT_FlowControlNode Parent, float32 SortLayer = -1.0f, FString Name = "")
{
    auto Tree = UCBT_Tree_SelectAttackBase();
    Tree.NodeName = Name;
    if (SortLayer >= 0.0f)
    {
        Tree.BaseSortLayer = SortLayer;
    }

    Parent.DoNode(Tree);
    return Tree;
}

mixin UCBT_Tree_SelectAttackBase AttackTree(UCBT_Decorator Parent, float32 SortLayer = -1.0f, FString Name = "")
{
    auto Tree = UCBT_Tree_SelectAttackBase();
    Tree.NodeName = Name;
    if (SortLayer >= 0.0f)
    {
        Tree.BaseSortLayer = SortLayer;
    }

    Parent.NextNode(Tree);
    return Tree;
}

mixin UCBT_Tree_SelectAttackBase AttackTree(UCBT_Tree Parent, float32 SortLayer = -1.0f, FString Name = "")
{
    auto Tree = UCBT_Tree_SelectAttackBase();
    Tree.NodeName = Name;
    if (SortLayer >= 0.0f)
    {
        Tree.BaseSortLayer = SortLayer;
    }

    Parent.Node = Tree;
    return Tree;
}

mixin UCBT_Tree_SelectAttackBase AsAttackTree(UCBT_Node Tree)
{
    return Cast<UCBT_Tree_SelectAttackBase>(Tree);
}

/** Move to attack range if attack available then attack. Behavior will fail and not apply cooldown if it can't attack due to not being in range. */
UCLASS()
class UCBT_Tree_SelectAttack : UCBT_Tree_SelectAttackBase
{
    default BaseSortLayer = 2.9f;
}

/** Open with a specific attack */
UCLASS()
class UCBT_Tree_OpenWithAttack : UCBT_Tree_SelectAttack
{
    default BaseSortLayer = 0.1f;
}

UCLASS()
class UCBT_Tree_StopDoingMeleeFriendlyFire : UCBT_Tree
{
    default BaseSortLayer = 0.1f;
    default DoMove()
                .AddRequirement(UCS_DoingAnAttack())
                .AddRequirement(UCS_AnyNonTargetCharacterBetweenAgentAndTarget())
                .AsDoMove().SetMove(UCM_Wait());

    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_CalculatePreferredOffsetAndFollowTarget : UCBT_Tree
{
    default BaseSortLayer = 5.5f;

    default Sequence()
                .DoOperation(UCO_CalculatePreferredPosition()).ExitToFlowControlNode()
                .DoMove(UCM_FollowCharacterOfInterestWithPositioningOffset());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_CalculatePreferredOffsetAndFollowIfTooFarFromTarget : UCBT_Tree
{
    default BaseSortLayer = 5.5f;

    default Sequence()
                .AddRequirement(UCS_TooFarFromPreferredDistanceOrAlreadyMoving())
                .AsSequence()
                .DoOperation(UCO_CalculatePreferredPosition()).ExitToFlowControlNode()
                .DoMove(UCM_FollowCharacterOfInterestWithPositioningOffset());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_CalculatePreferredPositionAndMoveToIt : UCBT_Tree
{
    default BaseSortLayer = 5.5f;

    default Sequence()
                .DoOperation(UCO_CalculatePreferredPosition()).ExitToFlowControlNode()
                .DoMove(UCM_MoveTowardsPreferredPosition());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_CalculatePreferredPositionAndMoveToItIfTooFarFromTarget : UCBT_Tree
{
    default BaseSortLayer = 5.5f;

    default Sequence()
                .AddRequirement(UCS_TooFarFromPreferredDistanceOrAlreadyMoving())
                .AsSequence()
                    .DoOperation(UCO_CalculatePreferredPosition()).ExitToFlowControlNode()
                    .DoMove(UCM_MoveTowardsPreferredPosition());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_MoveToDoSelectedAttack_Strafer : UCBT_Tree
{  
    default BaseSortLayer = 5.4f;
     
    default Sequence()
                .AddRequirement(UCS_AttackSelected())
                .AddRequirement(UCS_Not(UCS_InBlockStance()))
                .AsSequence()
                .PrioritySelector()
                    .DoNode(UCBT_Subtree_MoveCloserToSelectedAttackDistance())
                        .ExitToFlowControlNode()                        
                    .DoNode(UCBT_Subtree_MoveAwayToSelectedAttackDistance())
                        .ExitToFlowControlNode()
                    .DoNode(UCBT_Subtree_StrafeAroundEnemyWhileSelectedAttackWouldHitCollision());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_MoveToDoSelectedAttack_NonStrafer : UCBT_Tree
{
    default BaseSortLayer = 5.4f;
    
    default Sequence()
                .AddRequirement(UCS_AttackSelected())
                .AddRequirement(UCS_Not(UCS_InBlockStance()))
                .AsSequence()
                    .PrioritySelector()
                        .DoNode(UCBT_Subtree_MoveCloserToSelectedAttackDistance())
                            .ExitToFlowControlNode()                        
                        .DoNode(UCBT_Subtree_FeignRetreatRepositionForSelectedAttack())
                            .AddRequirement(UCS_TargetCloserThanSelectedAttackMinRange());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat : UCBT_Tree
{
    default BaseSortLayer = 5.4f;
    
    default Sequence()
                .AddRequirement(UCS_AttackSelected())
                .AddRequirement(UCS_Not(UCS_InBlockStance()))
                .AsSequence()
                    .PrioritySelector()
                        .DoNode(UCBT_Subtree_MoveCloserToSelectedAttackDistance());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_MoveToDoSelectedAttack_Strafer_Flyer : UCBT_Tree
{ 
    default BaseSortLayer = 5.4f;
      
    default Sequence()
                .AddRequirement(UCS_AttackSelected())
                .AddRequirement(UCS_Not(UCS_InBlockStance()))
                .AsSequence()
                    .PrioritySelector()
                        .DoNode(UCBT_Subtree_MoveCloserToSelectedAttackDistance())
                            .ExitToFlowControlNode()                        
                        .DoNode(UCBT_Subtree_MoveAwayToSelectedAttackDistance())
                            .ExitToFlowControlNode()
                        .DoNode(UCBT_Subtree_AdjustHeightForSelectedAttack())
                            .ExitToFlowControlNode()
                        .DoNode(UCBT_Subtree_StrafeAroundEnemyWhileSelectedAttackWouldHitCollision());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Subtree_MoveCloserToSelectedAttackDistance : UCBT_Tree
{
    default PrioritySelector()
                .AddRequirement(UCS_TargetFartherThanSelectedAttackMaxRange())
                .AsPrioritySelector()
                    .DoMove(UCM_DodgeForwardRelativeToTarget())
                        .AddRequirement(UCS_CanDodgeToMoveTowardsTarget())
                        .AddRequirement(UCS_TargetWithinDodgeForwardRangeOfSelectedAttack())
                        .AddRequirement(UCS_Not(UCS_Moving()))
                        .ExitToFlowControlNode()
                    .DoMove(UCM_MoveTowardsTargetToSelectedAttackRange())
                        .ExitToFlowControlNode()
                    .DoNode(UCBT_Succeeder());
}

UCLASS()
class UCBT_Subtree_MoveAwayToSelectedAttackDistance : UCBT_Tree
{
    default PrioritySelector()
                .AddRequirement(UCS_TargetCloserThanSelectedAttackMinRange())
                .AsPrioritySelector()
                    .DoMove(UCM_DodgeBackRelativeToTarget())
                        .AddRequirement(UCS_CanDodgeToMoveAwayFromTarget())
                        .AddRequirement(UCS_TargetWithinDodgeBackwardsRangeOfSelectedAttack())
                        .AddRequirement(UCS_Not(UCS_Moving()))
                        .ExitToFlowControlNode()
                    .DoMove(UCM_MoveAwayFromTargetToSelectedAttackRange());
}

UCLASS()
class UCBT_Subtree_StrafeAroundEnemyWhileSelectedAttackWouldHitCollision : UCBT_Tree
{
    default PrioritySelector()
                .AddRequirement(UCS_Or(
                                    UCS_SelectedAttackWouldHitCollision(),
                                    UCS_Not(UCS_CanGetToSelectedAttackReachInAStraightLine())))
                .AsPrioritySelector()
                    .DoMove(UCM_StrafeAroundCharacterOfInterest(300.0f, 1600.0f)); // Move until can do selected attack
}

UCLASS()
class UCBT_Subtree_FeignRetreatRepositionForSelectedAttack : UCBT_Tree
{
    default PrioritySelector()
                .DoMove(UCM_MoveFeignRetreat())
                    .AddRequirement(UCS_Or(
                                    UCS_SelectedAttackWouldHitCollision(),
                                    UCS_Not(UCS_CanGetToSelectedAttackReachInAStraightLine())))
                    .ExitToFlowControlNode()
                .DoMove(UCM_MoveFeignRetreat())
                    .AddRequirement(UCS_TargetCloserThanSelectedAttackMinRange());
}

UCLASS()
class UCBT_Subtree_AdjustHeightForSelectedAttack : UCBT_Tree
{
    default PrioritySelector()
                .AddRequirement(UCS_TargetOutsideRequiredRelativeHeightRange())
                .AsPrioritySelector()
                    .DoMove(UCM_AdjustToSelectedAttackRelativeHeightRequirement());
}

UCLASS()
class UCBT_Tree_Positioning_Strafer : UCBT_Tree
{
    default BaseSortLayer = 5.5f;

    default PrioritySelector()
                // .DoMove(UCM_MoveToPreferredLocation())
                //     .AddRequirement(UCS_SelfOutsidePreferredLocation())
                //     .AddRequirement(UCS_Not(UCS_CharacterOfInterestCloserToPreferredLocation()))
                //     .ExitToFlowControlNode()
                // .DoMove(UCM_MoveTowardsPositioningMovementDirection())
                //     .AddRequirement(UCS_OtherCharactersInsideExpandedSafeZone())
                //     .ExitToFlowControlNode()
                .DoMove(UCM_RelativePositioning());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_DodgeToUnStuck : UCBT_Tree
{
    default BaseSortLayer = 0.01f;

    default PrioritySelector()
                .DoMove(UCM_DodgeToUnStuck())
                    .AddRequirement(UCS_IsStuckInOtherCharacter());
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_SpreadOut_Strafer : UCBT_Tree
{
    default BaseSortLayer = 0.01f;

    default PrioritySelector()
                .DoMove(UCM_SpreadOut_Strafer())
                .AddTreeCooldown("SpreadOut_Strafer", 3.f);

    default MakeBehavior();
}

/** Calculate a circling navmesh path around the target and follow it.
*/
UCLASS()
class UCBT_Tree_MoveCircleAroundEnemy : UCBT_Tree
{
    default BaseSortLayer = 5.45f;
    int MaxPositions = 5;
    float PathStepArcLength = 300.0f;

    default PrioritySelector()
                .DoMove(UCM_MoveCircleAroundTarget(MaxPositions, PathStepArcLength));

    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_StrafeAroundEnemy : UCBT_Tree
{
    default BaseSortLayer = 5.45f;

    default DoMove(UCM_StrafeAroundCharacterOfInterest(200.0f, 800.0f));
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_FeignRetreat : UCBT_Tree
{
    default BaseSortLayer = 1.0f;

    default DoMove(UCM_MoveFeignRetreat());
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_MoveTowardsEnemyToPreferredDistance : UCBT_Tree
{
    default DoMove(UCM_MoveTowardsEnemyToPreferredDistance())
                .AddRequirement(UCS_TargetFartherThanPreferredDistance(100.0f));
    
    default MakeBehavior();
}

// UCLASS()
// class UCBT_Tree_MoveCircleAroundEnemy() : UCBT_Tree
// {
//     default BaseSortLayer = 5.7f;
//     default DoMove(UCM_MoveCircleAroundTarget());

//     default MakeBehavior();
// }

UCLASS()
class UCBT_Tree_Wait : UCBT_Tree
{
    UCBT_Tree_Wait(float InWaitTime)
    {
        WaitTime = InWaitTime;
    }

    UPROPERTY()
    float WaitTime = 0.3f;

    default BaseSortLayer = 0.0f;
    default DoMove(UCM_Wait(WaitTime));
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_WaitAfterNoticingDamageOnSelf : UCBT_Tree
{
    UCBT_Tree_WaitAfterNoticingDamageOnSelf(float InWaitTime)
    {
        WaitTime = InWaitTime;
    }

    UPROPERTY()
    float WaitTime = 0.2f;

    default BaseSortLayer = 0.0f;
    default DoMove()
                .AddRequirement(UCS_HasNoticedDamageOnSelf())
                .AsDoMove().SetMove(UCM_Wait(WaitTime));

    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_MoveToDistance : UCBT_Tree
{
    UPROPERTY()
    float _UntilDistance = 200.0f;

    UCBT_Tree_MoveToDistance(float InUntilDistance)
    {
        _UntilDistance = InUntilDistance;
    }

    default PrioritySelector()
                .DoNode(UCBT_Tree_MoveAwayFromTargetUntilDistance(_UntilDistance))
                    .AddRequirement(UCS_EnemyInsideDistanceRange(0.0f, _UntilDistance))
                    .ExitToFlowControlNode()
                .DoNode(UCBT_Tree_MoveTowardsTargetUntilDistance(_UntilDistance))
                    .AddRequirement(UCS_EnemyInsideDistanceRange(_UntilDistance, MAX_flt));
}

UCLASS()
class UCBT_Tree_MoveToDistanceIfFarther : UCBT_Tree
{
    UPROPERTY()
    float _UntilDistance = 200.0f;

    UPROPERTY()
    float _DistanceThreshold = 100.0f;

    UCBT_Tree_MoveToDistanceIfFarther(float InUntilDistance, float InDistanceThreshold)
    {
        _UntilDistance = InUntilDistance;
        _DistanceThreshold = InDistanceThreshold;
    }

    default SetNode(UCBT_Tree_MoveTowardsTargetUntilDistance(_UntilDistance))
            .AddRequirement(UCS_EnemyInsideDistanceRange(_UntilDistance + _DistanceThreshold, MAX_flt));
}

UCLASS()
class UCBT_Tree_MoveToPreferredDistanceIfFarther : UCBT_Tree
{
    UPROPERTY()
    float _DistanceThreshold = 100.0f;

    UCBT_Tree_MoveToPreferredDistanceIfFarther(float InDistanceThreshold)
    {
        _DistanceThreshold = InDistanceThreshold;
    }

    default PrioritySelector()
                .DoMove()
                    .AddRequirement(UCS_TargetFartherThanPreferredDistance(_DistanceThreshold))
                    .AsDoMove().SetMove(UCM_MoveTowardsEnemyToPreferredDistance());
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_MoveToPreferredDistanceIfCloser : UCBT_Tree
{
    UPROPERTY()
    float _DistanceThreshold = 100.0f;

    UCBT_Tree_MoveToPreferredDistanceIfCloser(float InDistanceThreshold)
    {
        _DistanceThreshold = InDistanceThreshold;
    }



    default DoMove()
                .AddRequirement(UCS_TargetCloserThanPreferredDistance(_DistanceThreshold))
                .AsDoMove().SetMove(UCM_MoveAwayToPreferredDistance());
}

UCLASS()
class UCBT_Tree_StayAway : UCBT_Tree
{
    UPROPERTY()
    float _UntilDistance = 200.0f;

    UPROPERTY()
    float _DistanceThreshold = 50.0f;

    UCBT_Tree_StayAway(float InUntilDistance, float InDistanceThreshold)
    {
        _UntilDistance = InUntilDistance;
        _DistanceThreshold = InDistanceThreshold;
    }

    default SetNode(UCBT_Tree_MoveAwayFromTargetUntilDistance(_UntilDistance))
            .AddRequirement(UCS_EnemyInsideDistanceRange(0.0f, Math::Max(30.0f, _UntilDistance - _DistanceThreshold)));
}

UCLASS()
class UCBT_Tree_MoveAwayFromTargetUntilDistance : UCBT_Tree
{
    UPROPERTY()
    float UntilDistance = 200.0f;

    UCBT_Tree_MoveAwayFromTargetUntilDistance(float InUntilDistance)
    {
        UntilDistance = InUntilDistance;
    }

    default Node = UCBT_DoMove(UCM_MoveAwayFromEnemy(UntilDistance));
}

UCLASS()
class UCBT_Tree_MoveTowardsTargetUntilDistance : UCBT_Tree
{
    UPROPERTY()
    float UntilDistance = 200.0f;

    UCBT_Tree_MoveTowardsTargetUntilDistance(float InUntilDistance)
    {
        UntilDistance = InUntilDistance;
    }

    default Node = UCBT_DoMove(UCM_MoveUntilCloseToEnemy(UntilDistance));
}

UCLASS()
class UCBT_Tree_TurnAroundIfNotFacingEnemy : UCBT_Tree
{
    default DoMove()
            .AddRequirement(UCS_NotFacingEnemy())
            .AsDoMove().SetMove(UCM_Wait());
}

UCLASS()
class UCBT_Tree_MoveAwayIfNotFacingEnemy : UCBT_Tree
{
    UPROPERTY()
    float TargetDistance = 200.0f;

    UCBT_Tree_MoveAwayIfNotFacingEnemy(float InTargetDistance)
    {
        TargetDistance = InTargetDistance;
    }

    default SetNode(UCBT_Tree_MoveToDistance(TargetDistance))
            .AddRequirement(UCS_NotFacingEnemy());
}

UCLASS()
class UCBT_Tree_TurnAroundIfEnemyIsOnMyBack : UCBT_Tree
{
    default DoMove()
                .AddRequirement(UCS_Not(UCS_Moving()))
                .AddRequirement(UCS_EnemyIsOnMyBack())
                .AsDoMove().SetMove(UCM_Wait());
}

UCLASS()
class UCBT_Tree_ReactToIncomingRangedAttack : UCBT_Tree
{
    default BaseSortLayer = 0.01f;

    UPROPERTY()
    float DodgeProbability = 0.8f;

    UCBT_Tree_ReactToIncomingRangedAttack(float InDodgeProbability)
    {
        DodgeProbability = InDodgeProbability;
    }

    default PrioritySelector()
                .AddRequirement(UCS_IncomingProjectile())
                .AsPrioritySelector()
                .RandomSelector()
                    .SetProbability(DodgeProbability)
                    .AsRandomSelector()
                    .DoMove(UCM_DodgeLeft()).ExitToFlowControlNode()
                    .DoMove(UCM_DodgeRight()).ExitToFlowControlNode()
                    .CloseFlowControlNode()
                .DoMove(UCM_Wait(0.34f));
    
    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_ReactToIncomingMeleeAttack : UCBT_Tree
{
    default BaseSortLayer = 0.01f;

    default DoMove()
                .AddRequirement(UCS_Not(UCS_InBlockStance()))
                .AsDoMove().SetMove(UCM_ReactToIncomingAttack());
    
    default MakeBehavior();
}