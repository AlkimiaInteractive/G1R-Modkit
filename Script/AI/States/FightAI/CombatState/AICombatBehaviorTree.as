enum ECBT_ExecutionResult
{
    Success,
    Failure,
    Running,
    Skip,
    None
}

enum ECBT_NodeStatus
{
    Success,
    Failure,
    Running,
    Cancelled,
    None
}

UCLASS()
class UCombatBehaviorController : UObject
{
    UPROPERTY()
    UCBT_Root HighPriorityTree = UCBT_Root(ECombatActionPriority::High);

    UPROPERTY()
    UCBT_Root MediumPriorityTree = UCBT_Root(ECombatActionPriority::Medium);

    UPROPERTY()
    UCBT_Root LowPriorityTree = UCBT_Root(ECombatActionPriority::Low);

    UPROPERTY()
    UCBT_Root MovementTree = UCBT_Root(ECombatActionPriority::Movement);

    UPROPERTY()
    UCombatActionsHandler ActionsHandler = UCombatActionsHandler();

    void CancelAllCurrentActions()
    {
        if (!IsValid(ActionsHandler.ActiveActionTask) || ActionsHandler.ActiveActionTask.IsFinished())
            return;

        ActionsHandler.TryCancelActionNode();
    }

    void CancelCurrentMovement()
    {
        if (!IsValid(ActionsHandler.ActiveMovementTask) || ActionsHandler.ActiveMovementTask.IsFinished())
            return;

        ActionsHandler.TryCancelMovementNode();
    }

    void CancelAllCurrentActionsAndMovement()
    {
        CancelAllCurrentActions();
        CancelCurrentMovement();
    }

    void ResetBehaviorTrees()
    {
        HighPriorityTree.ResetNodeTree();
        MediumPriorityTree.ResetNodeTree();
        LowPriorityTree.ResetNodeTree();
        MovementTree.ResetNodeTree();
    }

    void CreateRootNodes()
    {
        HighPriorityTree = UCBT_Root(ECombatActionPriority::High);
        MediumPriorityTree = UCBT_Root(ECombatActionPriority::Medium);
        LowPriorityTree = UCBT_Root(ECombatActionPriority::Low);
        MovementTree = UCBT_Root(ECombatActionPriority::Movement);
    }
}

enum ECombatActionPriority
{
    None,
    Movement,
    Low,
    Medium,
    High
}

namespace FCombatActionPriority
{
    /** Returns the name of the combat action priority as string. */
    FString GetPriorityName(ECombatActionPriority Priority)
    {
        FString FullName = "" + Priority;

        int32 IndexColon = 0;
        int32 IndexSpace = 0;
        FullName.FindLastChar(':', IndexColon);
        FullName.FindChar(' ', IndexSpace);

        return FullName.Mid(IndexColon + 1, IndexSpace - IndexColon - 1);
    }
}

enum ECombatActionPerformAttemptResult
{
    MoveIsNull,
    AlreadyRunning,
    NewActionIsLowerPriority,
    CantMoveDuringCurrentAction,
    MoveNotAllowed,
    MoveOnCooldown,
    UnableToCancelCurrentAction,
    UnableToCancelCurrentMovement,
    IsBlocked,
    SuccessfullyStarted
}

UCLASS()
class UCombatMoveHandler
{
    UCombatMoveHandler(UCBT_DoMove RequestBy, UAITask_CombatMove Move, ECombatActionPriority WithPriority)
    {
        ParentNode = RequestBy;
        CombatMove = Move;
        Priority = WithPriority;
    }

    UPROPERTY()
    UCBT_DoMove ParentNode;

    UPROPERTY()
    UAITask_CombatMove CombatMove;

    UPROPERTY()
    ECombatActionPriority Priority;
}

UCLASS()
class UCombatActionsHandler
{
    UPROPERTY()
    UAITask_CombatMove ActiveActionTask;

    UPROPERTY()
    UCombatMoveHandler CurrentAction;

    UPROPERTY()
    UAITask_CombatMove ActiveMovementTask;

    UPROPERTY()
    UCombatMoveHandler CurrentMovement;

    UPROPERTY()
    TMap<UAITask_CombatMove, UCBT_DoMove> RunningTasksToNodes;

    UPROPERTY()
    TMap<UCBT_DoMove, UAITask_CombatMove> NodesToRunningTasks; 


    UPROPERTY()
    bool bTryEndCurrentActionWhenPossible = false;

    /** Attempts to start performing the combat move, it returns false if it was not possible.*/
    UFUNCTION()
    ECombatActionPerformAttemptResult TryPerformActionNow(UCBT_DoMove RequestBy, UAITask_CombatMove CombatMove, ECombatActionPriority WithPriority)
    {
        if (!IsValid(CombatMove))
            return ECombatActionPerformAttemptResult::MoveIsNull;

        UCombatMoveHandler NewAction = UCombatMoveHandler(RequestBy, CombatMove, WithPriority);

        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCombatActionsHandler::TryPerformActionNow"));
        if (IsValid(ActiveActionTask) && ActiveActionTask.IsActive() && ActiveActionTask.IsFinished())
        {
            ActiveActionTask = nullptr;
            CurrentAction = nullptr;
        }

        if (!IsValid(ActiveActionTask) && IsValid(CurrentAction))
        {
            CurrentAction = nullptr;
        }

        if (IsValid(CurrentAction) && CurrentAction.ParentNode == RequestBy)
            return ECombatActionPerformAttemptResult::AlreadyRunning;

        if (RequestBy.Combat.Self.IsBlocked())
            return ECombatActionPerformAttemptResult::IsBlocked;

        if (IsValid(CurrentAction) && CurrentAction.Priority > NewAction.Priority)
            return ECombatActionPerformAttemptResult::NewActionIsLowerPriority;

        FString Reason;
        if (!CombatMove.IsMoveAllowed(Reason))
            return ECombatActionPerformAttemptResult::MoveNotAllowed;

        if (RequestBy.Combat.IsMoveInCooldown(CombatMove) && !RequestBy.bIgnoreCooldown)
            return ECombatActionPerformAttemptResult::MoveOnCooldown;

        // Cancel current move if new move has higher or equal priority
        if (IsValid(CurrentAction))
        {
            if (CurrentAction.Priority <= NewAction.Priority)
            {
                TryCancelActionNode();
            }
            else
            {
                return ECombatActionPerformAttemptResult::UnableToCancelCurrentAction;
            }
        }

        // Cancel current movement if new move has medium or high priority
        if (IsValid(CurrentMovement) && NewAction.Priority >= ECombatActionPriority::Medium && NewAction.CombatMove.CancelMovementOnStart())
        {
            TryCancelMovementNode();
        }

        if (IsValid(RequestBy.Combat.CombatGroup))
        {
            RequestBy.Combat.CombatGroup.HandleMemberAboutToPerformMove(RequestBy.Combat.Self, CombatMove.MoveTypes);
        }

        auto NewTask = Cast<UAITask_CombatMove>(CombatMove.DuplicateTask(RequestBy.Combat.Ability, RequestBy));
        ActiveActionTask = NewTask;
        RunningTasksToNodes.Add(ActiveActionTask, RequestBy);
        NodesToRunningTasks.Add(RequestBy, ActiveActionTask);
        ActiveActionTask.ReadyForActivation();
        RequestBy.RootNodeMutable.CurrentMoveNode = RequestBy;
        CurrentAction = NewAction;

        if (NewTask.IsFinished())
        {
            if (NewTask.TaskResult == EGenericTaskResult::Success)
                return ECombatActionPerformAttemptResult::MoveNotAllowed;
            else if (NewTask.TaskResult == EGenericTaskResult::Cancelled)
                return ECombatActionPerformAttemptResult::MoveNotAllowed;
            else
                return ECombatActionPerformAttemptResult::MoveNotAllowed;
        }

        return ECombatActionPerformAttemptResult::SuccessfullyStarted;
    }

    UFUNCTION()
    ECombatActionPerformAttemptResult TryPerformMovementNow(UCBT_DoMove RequestBy, UAITask_CombatMove Movement, ECombatActionPriority WithPriority)
    {
        if (!IsValid(Movement))
            return ECombatActionPerformAttemptResult::MoveIsNull;

        UCombatMoveHandler NewMovement = UCombatMoveHandler(RequestBy, Movement, WithPriority);

        if (IsValid(ActiveMovementTask) && ActiveMovementTask.IsActive() && ActiveMovementTask.IsFinished())
        {
            ActiveMovementTask = nullptr;
            CurrentMovement = nullptr;
        }

        if (!IsValid(ActiveMovementTask) && IsValid(CurrentMovement))
        {
            CurrentMovement = nullptr;
        }

        if (IsValid(CurrentMovement) && CurrentMovement.ParentNode == RequestBy)
            return ECombatActionPerformAttemptResult::AlreadyRunning;

        if (RequestBy.Combat.Self.IsBlocked())
            return ECombatActionPerformAttemptResult::IsBlocked;

        if (IsValid(CurrentMovement) && CurrentMovement.Priority > NewMovement.Priority)
            return ECombatActionPerformAttemptResult::NewActionIsLowerPriority;

        if (!RequestBy.Combat.Self.CanMove())
            return ECombatActionPerformAttemptResult::CantMoveDuringCurrentAction;

        if (IsValid(ActiveActionTask) && ActiveActionTask.IsActive() && !ActiveActionTask.IsFinished() && !ActiveActionTask.CanWalkDuringCombatMove())
            return ECombatActionPerformAttemptResult::CantMoveDuringCurrentAction;

        FString Reason;
        if (!Movement.IsMoveAllowed(Reason))
            return ECombatActionPerformAttemptResult::MoveNotAllowed;

        if (RequestBy.Combat.IsMoveInCooldown(Movement) && !RequestBy.bIgnoreCooldown)
            return ECombatActionPerformAttemptResult::MoveOnCooldown;

        // Cancel current move if new move has higher or equal priority
        if (IsValid(CurrentMovement))
        {
            if (CurrentMovement.Priority <= NewMovement.Priority)
            {
                TryCancelMovementNode();
            }
            else
            {
                return ECombatActionPerformAttemptResult::UnableToCancelCurrentAction;
            }
        }

        if (IsValid(RequestBy.Combat.CombatGroup))
        {
            RequestBy.Combat.CombatGroup.HandleMemberAboutToPerformMove(RequestBy.Combat.Self, Movement.MoveTypes);
        }

        auto NewTask = Cast<UAITask_CombatMove>(Movement.DuplicateTask(RequestBy.Combat.Ability, RequestBy));
        NewTask.Priority = WithPriority;
        ActiveMovementTask = NewTask;
        RunningTasksToNodes.Add(ActiveMovementTask, RequestBy);
        NodesToRunningTasks.Add(RequestBy, ActiveMovementTask);
        ActiveMovementTask.ReadyForActivation();
        RequestBy.RootNodeMutable.CurrentMoveNode = RequestBy;
        CurrentMovement = NewMovement;

        if (NewTask.IsFinished())
        {
            if (NewTask.TaskResult == EGenericTaskResult::Success)
                return ECombatActionPerformAttemptResult::MoveNotAllowed;
            else if (NewTask.TaskResult == EGenericTaskResult::Cancelled)
                return ECombatActionPerformAttemptResult::MoveNotAllowed;
            else
                return ECombatActionPerformAttemptResult::MoveNotAllowed;
        }

        return ECombatActionPerformAttemptResult::SuccessfullyStarted;
    }
    
    UFUNCTION()
    void TryCancelMovementNode()
    {
        TryCancelNode(CurrentMovement, ActiveMovementTask);
    }
    
    UFUNCTION()
    void TryCancelActionNode()
    {
        TryCancelNode(CurrentAction, ActiveActionTask);
    }
    
    UFUNCTION()
    private void TryCancelNode(UCombatMoveHandler Handler, UAITask_CombatMove Task)
    {
        if (!IsValid(Task) || !IsValid(Handler))
            return;
        
        if (!IsValid(Handler.ParentNode) || !IsValid(Handler.ParentNode.RootNode.CurrentMoveNode))
            return;

        if (!Task.HasBeenActivated() || Task.IsFinished())
            return;

        Task.ExternalCancel();
    }

    UFUNCTION()
    void OnActionFinished(UAITask_CombatMove FinishedCombatMove)
    {
        if (ActiveActionTask == FinishedCombatMove)
        {
            ActiveActionTask = nullptr;
            CurrentAction = nullptr;
        }

        if (ActiveMovementTask == FinishedCombatMove)
        {
            ActiveMovementTask = nullptr;
            CurrentMovement = nullptr;
        }

        if (!RunningTasksToNodes.Contains(FinishedCombatMove))
            return;

        UCBT_DoMove Node = RunningTasksToNodes[FinishedCombatMove];
        RunningTasksToNodes.Remove(FinishedCombatMove);

        if (NodesToRunningTasks.Contains(Node))
        {
            NodesToRunningTasks.Remove(Node);
        }

        Node.OnCombatMoveFinished(FinishedCombatMove);
    }
}

UCLASS()
class UCBT_Root : UCBT_SortedPrioritySelector
{
    UCBT_Root(ECombatActionPriority WithPriority)
    {
        RootPriority = WithPriority;
    }

    UPROPERTY()
    UCBT_DoMove CurrentMoveNode;

    UPROPERTY()
    ECombatActionPriority RootPriority;

    ECombatActionPriority GetPriority() const override property
    {
        return RootPriority;
    }
}

UCLASS()
class UCBT_Tree : UCBT_Node
{
    UPROPERTY()
    UCBT_Node Node;

    UPROPERTY()
    FString NodeName = "";

    float32 GetSortLayer() const override property
    {
        if (BaseSortLayer < MAX_flt)
            return BaseSortLayer;

        return Node.BaseSortLayer;
    }

    ECBT_ExecutionResult ExecuteTick() override
    {
        _LastExecutionResult = Node.ExecuteTick();
        Node._LastExecutionResult = _LastExecutionResult;       
        return _LastExecutionResult; 
    }

#if WITH_IMGUI
    void DisplayImGui(FString TreeIDPrefix = "") override
    {
        Node.DisplayImGui(TreeIDPrefix);
    }

    protected void DisplayImGuiForTreeViewInfo() override
    {
        Node.DisplayImGuiForTreeViewInfo();
    }

    protected void DisplayImGuiSubTree() override
    {
        DisplayBehaviorImGui();
        Node.DisplayImGuiSubTree();
    }
#endif

    FString GetBehaviorName() const override property
    {
        if (!bIsBehavior)
            return "";

        FString Str = Name.ToString();
        Str.RemoveFromStart("CBT_Tree");
        Str.RemoveFromStart("_");
        
        FString FinalName;
        FString Right;
        Str.Split("_",FinalName, Right, SearchDir = ESearchDir::FromEnd);
        
        if (NodeName != "")
        {
            FinalName.Append(" - " + NodeName);
        }

        return FinalName;
    }

    /** Returns a clean short name for debugging */
    FString GetDisplayName() const override
    {
        return Node.GetDisplayName();
    }

    FString GetIDName() const override
    {
        return Node.GetIDName();
    }
#if WITH_IMGUI
    FString GetLastExecutionResultString() const override
    {
        return Node.GetLastExecutionResultString();
    }
#endif
    ECBT_ExecutionResult GetLastExecutionResult() const override property
    {
        return Node.LastExecutionResult;
    }

    ECBT_NodeStatus GetNodeStatus() const override property
    {
        return Node.NodeStatus;
    }

    protected UCBT_Node MakeBehaviorInternal() override
    {
        bIsBehavior = true;

        return this;
    }

    UCBT_Tree MakeBehavior()
    {
        MakeBehaviorInternal();
        return this;
    }

    bool TryCancelExecution() override
    {
        if (!IsValid(Node))
            return false;

        return Node.TryCancelExecution();
    }

    UCBT_Node AddRequirement(UFightAI_CombatSituation Situation) override
    {
        Node.AddRequirement(Situation);
        return this;
    }

    UCBT_Tree SetNode(UCBT_Node NewNode)
    {
        Node = NewNode;
        NewNode.ParentNode = this;

        return this;
    }

    UCBT_Node AddTreeCooldown(FString Id, float32 CooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false) override
    {
        Node.AddTreeCooldown(Id, CooldownSeconds, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel, bBlockTickingDuringActiveActions);
        return this;
    }

    UCBT_Node AddTreeCooldown(FString Id, float32 MinCooldownSeconds, float32 MaxCooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false) override
    {
        Node.AddTreeCooldown(Id, MinCooldownSeconds, MaxCooldownSeconds, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel, bBlockTickingDuringActiveActions);
        return this;
    }

    UCBT_Node AddTreeCooldown(FString Id, UNodeCooldownCalculation CooldownCalculation, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false) override
    {
        Node.AddTreeCooldown(Id, CooldownCalculation, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel, bBlockTickingDuringActiveActions);
        return this;
    }

    UCBT_Node AddTreeCooldownActivation(FString Id, float32 CooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false) override
    {
        Node.AddTreeCooldownActivation(Id, CooldownSeconds, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel, bBlockTickingDuringActiveActions);
        return this;
    }

    UCBT_Node AddTreeCooldownActivation(FString Id, float32 MinCooldownSeconds, float32 MaxCooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false) override
    {
        Node.AddTreeCooldownActivation(Id, MinCooldownSeconds, MaxCooldownSeconds, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel, bBlockTickingDuringActiveActions);
        return this;
    }

    UCBT_Node AddTreeCooldownActivation(FString Id, UNodeCooldownCalculation CooldownCalculation, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false) override
    {
        Node.AddTreeCooldownActivation(Id, CooldownCalculation, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel, bBlockTickingDuringActiveActions);
        return this;
    }

    void OnNodeSucceeded() override
    {
        Node.OnNodeSucceeded();        
    }

    void OnNodeFailed() override
    {
        Node.OnNodeFailed();        
    }

    void OnNodeCancelled(ECBT_ExecutionResult Result) override
    {
        Node.OnNodeCancelled(Result);        
    }

    void OnChildNodeSucceeded(UCBT_Node SucceededNode) override
    {
        Node.OnChildNodeSucceeded(SucceededNode);        
    }

    void OnChildNodeFailed(UCBT_Node FailedNode) override
    {
        Node.OnChildNodeFailed(FailedNode);        
    }

    void OnChildNodeCancelled(UCBT_Node CancelledNode) override
    {
        Node.OnChildNodeCancelled(CancelledNode);        
    }
}

mixin UCBT_Tree AsTree(UCBT_Node Node)
{
    return Cast<UCBT_Tree>(Node);
}

UCLASS()
class UCBT_Node : UObject
{
    UPROPERTY()
    private UCBT_Node _ParentNode;

    UPROPERTY()
    private ECombatActionPriority _Priority = ECombatActionPriority::Movement;

    UPROPERTY()
    private TSet<UFightAI_CombatSituation> _Requirements;

    UPROPERTY()
    private TArray<UBehaviorTreeCooldownProfile> _CooldownProfiles;

    UPROPERTY()
    private UBehaviorTreeCooldownProfile _ProbabilityCheckCooldownProfile;

    UPROPERTY()
    private UNodeProbabilityCalculation _ProbabilityCalculation;

    UPROPERTY()
    bool bActivateCooldownsFromTick = true; 

    ECombatActionPriority GetPriority() const property
    {
        if (!IsValid(ParentNode))
            return _Priority;

        return ParentNode.Priority;
    }

    TArray<UBehaviorTreeCooldownProfile> GetCooldownProfiles() const property
    {
        return _CooldownProfiles;
    }

    TArray<UBehaviorTreeCooldownProfile> GetClosestCooldownProfilesInHierarchy() const property
    {
        if (!_CooldownProfiles.IsEmpty())
            return _CooldownProfiles;

        if (!IsValid(ParentNode))
            return _CooldownProfiles;

        return ParentNode.ClosestCooldownProfilesInHierarchy;
    }

    UBehaviorTreeCooldownProfile GetProbabilityCheckCooldownProfile() const property
    {
        return _ProbabilityCheckCooldownProfile;
    }

    protected UCBT_Node MakeBehaviorInternal()
    {
        bIsBehavior = true;
        BehaviorName = "";

        return this;
    }

    protected UCBT_Node MakeBehaviorInternal(FString InBehaviorName)
    {
        bIsBehavior = true;
        BehaviorName = InBehaviorName;

        return this;
    }

    UCBT_Node GetParentNode() const property
    {
        if (!IsValid(_ParentNode))
            return nullptr;

        if (_ParentNode.IsA(UCBT_Tree::StaticClass()))
        {
            return _ParentNode.ParentNode;
        }

        return _ParentNode;
    }

    void SetParentNode(UCBT_Node Value) property
    {
        _ParentNode = Value;
    }

    bool IsIndirectChildOf(const UCBT_Node OtherNode)
    {
        UCBT_Node Parent = ParentNode;

        while (IsValid(Parent))
        {
            if (Parent == OtherNode)
                return true;

            Parent = Parent.ParentNode;
        }

        return false;
    }

    const UCBT_Root GetRootNode() const property
    {
        if (!IsValid(ParentNode))
        {
            if (this.IsA(UCBT_Root::StaticClass()))
                return Cast<UCBT_Root>(this);

            return nullptr;
        }

        if (ParentNode.IsA(UCBT_Root::StaticClass()))
        {
            return Cast<UCBT_Root>(ParentNode);
        }

        return ParentNode.GetRootNode();
    }

    UCBT_Root GetRootNodeMutable() property
    {
        if (!IsValid(ParentNode))
        {
            if (this.IsA(UCBT_Root::StaticClass()))
                return Cast<UCBT_Root>(this);

            return nullptr;
        }

        if (ParentNode.IsA(UCBT_Root::StaticClass()))
        {
            return Cast<UCBT_Root>(ParentNode);
        }

        return ParentNode.GetRootNodeMutable();
    }

    /** Combat class that contains this behavior tree node */
    UAIState_Combat_G1R GetCombat() const property
    {
        UObject Next = Outer;
        while (IsValid(Next) && !Next.IsA(UAIState_Combat_G1R::StaticClass()))
        {
            Next = Next.Outer;
        }

        return Cast<UAIState_Combat_G1R>(Next);
    }

    UPROPERTY()
    bool bIsBehavior = false;

    UPROPERTY()
    private FString BaseBehaviorName = "";

    UPROPERTY(EditDefaultsOnly)
    float32 BaseSortLayer = MAX_flt;
    

    /** Result of the last execution of this node */
    UPROPERTY()
    protected ECBT_ExecutionResult _LastExecutionResult = ECBT_ExecutionResult::None;

    ECBT_ExecutionResult GetLastExecutionResult() const property
    {
        return _LastExecutionResult;
    }

    /** Collapse the tree if the last result was failure */
    UPROPERTY(EditDefaultsOnly)
    bool bDebugHideIfLastResultFailure = false;

    /** Whether the tree is open or collapsed by default */
    UPROPERTY(EditDefaultsOnly)
    bool bDebugTreeOpenByDefault = false;

    /** Whether the current move has already been drawn */
    UPROPERTY()
    bool bCurrentMoveDrawn = false;

    UPROPERTY()
    protected bool bIsTreeNode = false;

    float32 GetSortLayer() const property
    {
        return BaseSortLayer;
    }

    int GetDepth() const property
    {
        int Result = 0;
        UCBT_Node HigherNode = _ParentNode;
        while (IsValid(HigherNode))
        {
            Result++;
            HigherNode = HigherNode._ParentNode;
        }

        return Result;
    }

//     UFUNCTION()
//     void LogHistory(FString PrefixText, FString MainText, int IndentationLevel = 0, FColor TextColor = FColor::White, bool bTextDisabled = false)
//     {
//         if (!IsValid(Combat))
//             return;

// #if WITH_IMGUI
//         Combat.LogHistory(PrefixText, MainText, IndentationLevel, TextColor, bTextDisabled);        
// #endif
//     }

//     UFUNCTION()
//     void LogHistoryWithoutPrefix(FString MainText, int IndentationLevel = 0, FColor TextColor = FColor::White, bool bTextDisabled = false)
//     {
//         if (!IsValid(Combat))
//             return;

// #if WITH_IMGUI
//         Combat.LogHistoryWithoutPrefix(MainText, IndentationLevel, TextColor, bTextDisabled);
// #endif
//     }

    ECBT_ExecutionResult ExecuteTick()
    {
        // LogHistory(GetDisplayName(), "ExecuteTick", Depth);
        if (!_Requirements.IsEmpty() && LastExecutionResult != ECBT_ExecutionResult::Running && !AreRequirementsFulfilled())
        {
            // LogHistory(GetDisplayName(), "Requirements not fulfilled", Depth + 1, bTextDisabled = true);
            _LastExecutionResult = ECBT_ExecutionResult::Failure;
            return LastExecutionResult;
        }

        if (!CooldownProfiles.IsEmpty())
        {
            ECBT_ExecutionResult ResultOnCooldown = ECBT_ExecutionResult::None;
            bool bOnCooldown = false;
            for (auto CooldownProfile : CooldownProfiles)
            {
                if (CooldownProfile.bIgnoreOnThisNode)
                    continue;

                if (Combat.GetBehaviorTreeNodeCooldownSecondsLeft(CooldownProfile) <= 0.0f)
                    continue;

                bOnCooldown = true;
                if (ResultOnCooldown == ECBT_ExecutionResult::None)
                {
                    ResultOnCooldown = CooldownProfile.ResultOnCooldown;
                }

                if (ResultOnCooldown == ECBT_ExecutionResult::Success && CooldownProfile.ResultOnCooldown == ECBT_ExecutionResult::Failure)
                {
                    ResultOnCooldown = CooldownProfile.ResultOnCooldown;
                }
            }

            if (bOnCooldown)
            {
                _LastExecutionResult = ResultOnCooldown;
                // LogHistory(GetDisplayName(), "On cooldown", Depth + 1, bTextDisabled = true);
                return ResultOnCooldown;
            }
        }

        if (IsValid(ProbabilityCheckCooldownProfile) && Combat.GetBehaviorTreeNodeCooldownSecondsLeft(ProbabilityCheckCooldownProfile) > 0.0f)
        {
            _LastExecutionResult = ProbabilityCheckCooldownProfile.ResultOnCooldown;
            // LogHistory(GetDisplayName(), "On Probability cooldown", Depth + 1, bTextDisabled = true);
            return ProbabilityCheckCooldownProfile.ResultOnCooldown;
        }

        if (IsValid(_ProbabilityCalculation))
        {
            float Probability = _ProbabilityCalculation.GetProbability();

            if (Probability == 0.0f || Math::RandRange(0.0f, 1.0f) > Probability)
            {
                Combat.SetBehaviorTreeNodeCooldown(ProbabilityCheckCooldownProfile);
                _LastExecutionResult = ECBT_ExecutionResult::Failure;

                // LogHistory(GetDisplayName(), "Probability check failed", Depth + 1, bTextDisabled = true);
                return ECBT_ExecutionResult::Failure;
            }
        }

        ECBT_ExecutionResult Result = PerformTick();

        // if (Result == ECBT_ExecutionResult::Success)
        // {
        //     LogHistory(GetDisplayName(), "Result - Success" + Result, Depth + 1, TextColor = FColor::Green);
        // }
        // else if (Result == ECBT_ExecutionResult::Running)
        // {
        //     LogHistory(GetDisplayName(), "Result - Running", Depth + 1, TextColor = FColor::Yellow);
        // }
        // else
        // {
        //     LogHistory(GetDisplayName(), "Result - Skip or failure", Depth + 1, bTextDisabled = true);
        // }

        if (bActivateCooldownsFromTick && Result != ECBT_ExecutionResult::Running && Result != ECBT_ExecutionResult::None)
        {
            ECBT_NodeStatus Status = ECBT_NodeStatus::None;
            if (Result == ECBT_ExecutionResult::Success)
            {
                Status = ECBT_NodeStatus::Success;
            }
            if (Result == ECBT_ExecutionResult::Failure)
            {
                Status = ECBT_NodeStatus::Failure;
            }
            
            // LogHistory(GetDisplayName(), "Activating cooldowns", Depth + 1, bTextDisabled = true);
            ActivateCooldowns(Status);
        }

        // LogHistory(GetDisplayName(), "ExecuteTick Returning - " + Result, Depth + 1, bTextDisabled = true);
        return Result;
    }

    private ECBT_ExecutionResult PerformTick()
    {
        // LogHistory(GetDisplayName(), "PerformTick", Depth + 1, bTextDisabled = true);
        auto Result = Tick();
        _LastExecutionResult = Result;

        // LogHistory(GetDisplayName(), "PerformTick Returning - " + LastExecutionResult, Depth + 1, bTextDisabled = true);
        return LastExecutionResult;
    }

    protected ECBT_ExecutionResult Tick()
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_Node::Tick"));
        check(false, "Node Execution ran from Node base class.");
        return ECBT_ExecutionResult::Failure;
    }

    void ActivateCooldowns(ECBT_NodeStatus Status)
    {
        if (!IsValid(Combat))
            return;

        if (Status == ECBT_NodeStatus::None || Status == ECBT_NodeStatus::Running)
            return;

        for (auto CooldownProfile : CooldownProfiles)
        {
            if (!IsValid(CooldownProfile))
                continue;

            if (Status == ECBT_NodeStatus::Failure && !CooldownProfile.bCooldownOnFail)
                continue;

            if (Status == ECBT_NodeStatus::Success && !CooldownProfile.bCooldownOnSuccess)
                continue;

            if (Status == ECBT_NodeStatus::Cancelled && !CooldownProfile.bCooldownOnCancel)
                continue;

            // LogHistory(GetDisplayName(), "Cooldown: " + CooldownProfile.Id, Depth + 2, bTextDisabled = true);
            Combat.SetBehaviorTreeNodeCooldown(CooldownProfile);
        }
    }

    FString GetBehaviorName() const property
    {
        if (GetIsBehavior() || !IsValid(_ParentNode))
            return BaseBehaviorName;
        
        return _ParentNode.BehaviorName;
    }

    void SetBehaviorName(FString Value) property
    {
        BaseBehaviorName = Value;
    }

    bool GetIsBehavior() const property
    {
        if (!IsValid(_ParentNode))
            return bIsBehavior;

        if (_ParentNode.IsBehavior)
            return false;

        return bIsBehavior;
    }

#if WITH_IMGUI
    void DisplayBehaviorImGui()
    {
        if (IsBehavior || (IsValid(_ParentNode) && _ParentNode.IsBehavior))
        {
            FString Text = GetBehaviorName();
            ImGui::Text("");
            ImGui::TextColored(FColor::Yellow, Text);
        }
    }

    void DisplayImGui(FString TreeIDPrefix = "") 
    {
        bCurrentMoveDrawn = false;
        bool bBranchCancelled = false;

        DisplayBehaviorImGui();

        FColor TreeNodeColorResult = FColor(255, 255, 255, 128);
        FColor TreeNodeColorName = FColor(255, 255, 255, 128);
        if (NodeStatus == ECBT_NodeStatus::Success)
        {
            TreeNodeColorResult = FColor::Green;
        }

        if (NodeStatus == ECBT_NodeStatus::Cancelled)
        {
            bBranchCancelled = true;
            TreeNodeColorResult = FColor::Red;
        }

        if (NodeStatus == ECBT_NodeStatus::Running && !bBranchCancelled)
        {
            TreeNodeColorResult = FColor::Yellow;
            TreeNodeColorName = FColor::White;
        }

        FString NodeStatusString = GetNodeStatusString();


        ImGui::TextColored(TreeNodeColorResult, NodeStatusString);
        ImGui::SetTooltipOnHover(f"Node Status: {NodeStatus}");
        ImGui::SameLine();
        
        ImGui::PushID(TreeIDPrefix + Name);
        bool bTreeOpen = false;
        if (bIsTreeNode)
        {
            bTreeOpen = ImGui::TreeNodeColored(GetDisplayName(), TreeNodeColorName, bDefaultOpen = bDebugTreeOpenByDefault);
        }

        DisplayImGuiForNode();
        DisplayProbability();
        DisplayCooldown();
        DisplayRequirements(TreeNodeColorName, bTreeOpen);
        DisplayCooldowns(TreeNodeColorName, bTreeOpen);

        if (bTreeOpen)
        {
            DisplayImGuiForTreeViewInfo();
            DisplayImGuiSubTree();
            ImGui::TreePop();
        }
        else
        {
            ImGui::PopID();
        }

        if (GetLastExecutionResult() == ECBT_ExecutionResult::Running && !bBranchCancelled)
        {
            RootNodeMutable.bCurrentMoveDrawn = true;
        }  
    }

    private void DisplayRequirements(FColor Color, bool bTreeOpen = false)
    {
        if (_Requirements.IsEmpty())
            return;

        if (!bTreeOpen)
        {
            ImGui::Indent();
        }

        for (auto Situation : _Requirements)
        {
            ImGui::TextColored(Color, " + ");
            ImGui::SameLine(); ImGui::TextColored(Color, Situation.GetDisplayName());
            ImGui::SameLine(); ImGui::BoolIcon(Situation.IsInSituation());
        }

        if (!bTreeOpen)
        {
            ImGui::Unindent();
        }
    }

    private void DisplayCooldowns(FColor Color, bool bTreeOpen = false)
    {
        if (_CooldownProfiles.IsEmpty())
            return;

        if (!bTreeOpen)
        {
            ImGui::Indent();
        }

        for (auto CooldownProfile : _CooldownProfiles)
        {
            ImGui::TextColored(Color, " CD");
            if (CooldownProfile.MinCooldownTimeSeconds != CooldownProfile.MaxCooldownTimeSeconds)
            {
                ImGui::SameLine(); ImGui::TextColored(Color, f"[ ID: {CooldownProfile.Id} | {CooldownProfile.MinCooldownTimeSeconds}s to {CooldownProfile.MaxCooldownTimeSeconds}s ]");
            }
            else
            {
                ImGui::SameLine(); ImGui::TextColored(Color, f"[ ID: {CooldownProfile.Id} | {CooldownProfile.MaxCooldownTimeSeconds}s ]");
            }

            if (CooldownProfile.bIgnoreOnThisNode)
            {
                ImGui::SameLine(); ImGui::TextColored(Color, "- Ignored");
            }
        }

        if (!bTreeOpen)
        {
            ImGui::Unindent();
        }
    }

    private void DisplayProbability()
    {
        if (!IsValid(_ProbabilityCalculation))
            return;

        ImGui::SameLine();
        ImGui::TextColored(FColor::White, f"{(_ProbabilityCalculation.GetProbability()):.2f}");
    }

    private void DisplayCooldown()
    {
        if (CooldownProfiles.IsEmpty())
            return;
        
        float CurrentCooldown = 0.0f;
        for (auto CooldownProfile : CooldownProfiles)
        {
            if (CooldownProfile.bIgnoreOnThisNode)
                continue;

            float FoundCooldown = Combat.GetBehaviorTreeNodeCooldownSecondsLeft(CooldownProfile);
            if (FoundCooldown < CurrentCooldown)
                continue;

            CurrentCooldown = FoundCooldown;
        }
        
        if (CurrentCooldown > 0.0f)
        {
            ImGui::SameLine();

        #if TEST
            switch (int(Combat.World.TimeSeconds * 2) % 4)
            {
                case 0: ImGui::TextColored(FColor::Orange, f"{Icon::HOURGLASS_START}"); break;
                case 1: ImGui::TextColored(FColor::Orange, f"{Icon::HOURGLASS_HALF}"); break;
                case 2: ImGui::TextColored(FColor::Orange, f"{Icon::HOURGLASS_END}"); break;
                case 3: ImGui::TextColored(FColor::Orange, f"{Icon::HOURGLASS_O}"); break;
            }
        #endif

            ImGui::SameLine();
            ImGui::TextColored(FColor::Orange, f"{(CurrentCooldown):.2f}s");

            ImGui::SetTooltipOnHover("Branch is in Cooldown");
        }
    }

    protected void DisplayImGuiForNode() {}
    protected void DisplayImGuiForTreeViewInfo() {}
    protected void DisplayImGuiSubTree() {}
#endif

    /** Returns a clean short name for debugging */
    FString GetDisplayName() const
    {
        FString Str = GetIDName();
        
        FString FinalName;
        FString Right;
        Str.Split("_",FinalName, Right, SearchDir = ESearchDir::FromEnd);

        return FinalName;
    }

    FString GetIDName() const
    {
        FString Str = Name.ToString();
        Str.RemoveFromStart("CBT");
        Str.RemoveFromStart("_");

        return Str;
    }
    
#if WITH_IMGUI
    FString GetResultString(ECBT_ExecutionResult Result) const
    {
        switch (Result)
        {
            case ECBT_ExecutionResult::Success:
                return Icon::CHECK_CIRCLE;
            case ECBT_ExecutionResult::Running:
                return Icon::PLAY_CIRCLE;
            case ECBT_ExecutionResult::Failure:
                return Icon::TIMES_CIRCLE;
            case ECBT_ExecutionResult::Skip:
                return Icon::ARROW_CIRCLE_RIGHT;
            case ECBT_ExecutionResult::None:
            default:
                return Icon::CIRCLE_O;            
        }
    }

    FColor GetResultColor(ECBT_ExecutionResult Result) const
    {
        switch (Result)
        {
            case ECBT_ExecutionResult::Success:
                return FColor::Green;
            case ECBT_ExecutionResult::Running:
                return FColor::Yellow;
            case ECBT_ExecutionResult::Failure:
                return FColor::Red;
            case ECBT_ExecutionResult::Skip:
                return FColor::Cyan;
            case ECBT_ExecutionResult::None:
            default:
                return FColor::Transparent;            
        }
    }

    FString GetLastExecutionResultString() const
    {
        return GetResultString(LastExecutionResult);
    }

    FString GetStatusString(ECBT_NodeStatus Status) const
    {
        switch (Status)
        {
            case ECBT_NodeStatus::Success:
                return Icon::CHECK_CIRCLE;
            case ECBT_NodeStatus::Running:
                return Icon::PLAY_CIRCLE;
            case ECBT_NodeStatus::Failure:
                return Icon::TIMES_CIRCLE;
            case ECBT_NodeStatus::Cancelled:
                return Icon::STOP_CIRCLE;
            case ECBT_NodeStatus::None:
            default:
                return Icon::CIRCLE_O;
        }
    }

    FColor GetStatusColor(ECBT_NodeStatus Status) const
    {
        switch (Status)
        {
            case ECBT_NodeStatus::Success:
                return FColor::Green;
            case ECBT_NodeStatus::Running:
                return FColor::Yellow;
            case ECBT_NodeStatus::Failure:
                return FColor::Red;
            case ECBT_NodeStatus::Cancelled:
                return FColor::Orange;
            case ECBT_NodeStatus::None:
            default:
                return FColor::Transparent;
        }
    }

    FString GetNodeStatusString() const
    {
        return GetStatusString(NodeStatus);
    }
#endif
    ECBT_NodeStatus GetNodeStatus() const property
    {
        switch(_LastExecutionResult)
        {
            case ECBT_ExecutionResult::Success:
                return ECBT_NodeStatus::Success;

            case ECBT_ExecutionResult::Failure:
                return ECBT_NodeStatus::Failure;

            case ECBT_ExecutionResult::None:
            case ECBT_ExecutionResult::Skip:
                return ECBT_NodeStatus::None;

            case ECBT_ExecutionResult::Running:
                return ECBT_NodeStatus::Running;

            default:
                return ECBT_NodeStatus::None;
        }
    }
    
    int opCmp(const UCBT_Node Other) const
    {
        if (SortLayer > Other.SortLayer)
            return -1;

        if (SortLayer < Other.SortLayer)
            return 1;

        return 0;
    }

    UCBT_Node GetParent() const final
    {
        return ParentNode;
    }

    bool TryCancelExecution()
    {
        return false;
    }

    void OnChildNodeSucceeded(UCBT_Node SucceededNode) 
    {
        OnNodeSucceeded();
    }

    void OnChildNodeCancelled(UCBT_Node CancelledNode) 
    {
        OnNodeCancelled(ECBT_ExecutionResult::Failure);
    }

    void OnChildNodeFailed(UCBT_Node FailedNode)
    {
        OnNodeFailed();
    }

    UCBT_Node AddRequirement(UFightAI_CombatSituation Situation)
    {
        _Requirements.Add(Situation);
        return this;
    }

    bool AreRequirementsFulfilled()
    {
        if (_Requirements.IsEmpty())
            return true;

        for (auto Situation : _Requirements)
        {
            if (!Situation.IsInSituation())
                return false;
        }

        return true;
    }

    /** Climbs the hierarchy to the last node opened that wasn't UCBT_Decorator and returns it.*/
    UCBT_FlowControlNode ExitToFlowControlNode()
    {
        UCBT_Node Node = GetParent();
        while (IsValid(Node) && !Node.IsA(UCBT_FlowControlNode::StaticClass()))
        {
            Node = Node.GetParent();
        }
        check(IsValid(Node));
        return Cast<UCBT_FlowControlNode>(Node);
    }

    UCBT_Node AddTreeCooldown(FString Id, float32 CooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false)
    {
        auto CooldownProfile = UBehaviorTreeCooldownProfile(Id, CooldownSeconds, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel);
        CooldownProfile.SetNode(this);
        if (bBlockTickingDuringActiveActions)
        {
            CooldownProfile.BlockTickingDuringActiveActions();
        }
        _CooldownProfiles.Add(CooldownProfile);
        return this;
    }

    UCBT_Node AddTreeCooldown(FString Id, float32 MinCooldownSeconds, float32 MaxCooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false)
    {
        auto CooldownProfile = UBehaviorTreeCooldownProfile(Id, MinCooldownSeconds, MaxCooldownSeconds, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel);
        CooldownProfile.SetNode(this);
        if (bBlockTickingDuringActiveActions)
        {
            CooldownProfile.BlockTickingDuringActiveActions();
        }
        _CooldownProfiles.Add(CooldownProfile);
        return this;
    }

    UCBT_Node AddTreeCooldown(FString Id, UNodeCooldownCalculation CooldownCalculation, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false)
    {
        auto CooldownProfile = UBehaviorTreeCooldownProfile(Id, CooldownCalculation, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel);
        CooldownProfile.SetNode(this);
        if (bBlockTickingDuringActiveActions)
        {
            CooldownProfile.BlockTickingDuringActiveActions();
        }
        _CooldownProfiles.Add(CooldownProfile);
        return this;
    }

    UCBT_Node AddTreeCooldownActivation(FString Id, float32 CooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false)
    {
        auto CooldownProfile = UBehaviorTreeCooldownProfile(Id, CooldownSeconds, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel, bInIgnoreOnThisNode = true);
        CooldownProfile.SetNode(this);
        if (bBlockTickingDuringActiveActions)
        {
            CooldownProfile.BlockTickingDuringActiveActions();
        }
        _CooldownProfiles.Add(CooldownProfile);
        return this;
    }

    UCBT_Node AddTreeCooldownActivation(FString Id, float32 MinCooldownSeconds, float32 MaxCooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false)
    {
        auto CooldownProfile = UBehaviorTreeCooldownProfile(Id, MinCooldownSeconds, MaxCooldownSeconds, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel, bInIgnoreOnThisNode = true);
        CooldownProfile.SetNode(this);
        if (bBlockTickingDuringActiveActions)
        {
            CooldownProfile.BlockTickingDuringActiveActions();
        }
        _CooldownProfiles.Add(CooldownProfile);
        return this;
    }

    UCBT_Node AddTreeCooldownActivation(FString Id, UNodeCooldownCalculation CooldownCalculation, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false,
        bool bBlockTickingDuringActiveActions = false)
    {
        auto CooldownProfile = UBehaviorTreeCooldownProfile(Id, CooldownCalculation, bInCooldownOnSuccess, bInCooldownOnFail, bInCooldownOnCancel, bInIgnoreOnThisNode = true);
        CooldownProfile.SetNode(this);
        if (bBlockTickingDuringActiveActions)
        {
            CooldownProfile.BlockTickingDuringActiveActions();
        }
        _CooldownProfiles.Add(CooldownProfile);
        return this;
    }

    UCBT_Node SetProbability(float Probability, float32 CheckCooldown = 1.0f)
    {
        return SetProbability(UNodeProbabilityCalculation(Probability), CheckCooldown);
    }

    UCBT_Node SetProbability(UNodeProbabilityCalculation ProbabilityCalculation, float32 CheckCooldown = 1.0f)
    {
        if (!IsValid(ProbabilityCalculation))
            return this;

        _ProbabilityCheckCooldownProfile = UBehaviorTreeCooldownProfile(GetIDName(), CheckCooldown);
        _ProbabilityCheckCooldownProfile.SetNode(this);
        _ProbabilityCheckCooldownProfile.ResultOnCooldown = ECBT_ExecutionResult::Failure;
        _ProbabilityCalculation = ProbabilityCalculation;
        return this;
    }

    void OnNodeSucceeded()
    {
        _LastExecutionResult = ECBT_ExecutionResult::Success;
        ActivateCooldowns(ECBT_NodeStatus::Success);

#if WITH_IMGUI
        if (IsValid(RootNode) && IsValid(this))
        {
            ImGui::TraceFrameSetSectionStatus(ImGui::MakeTraceID(RootNode), this, GetStatusString(ECBT_NodeStatus::Success), GetStatusColor(ECBT_NodeStatus::Success));
            ImGui::TraceFrameReportEventOnSection(ImGui::MakeTraceID(RootNode), this, f"{GetStatusString(ECBT_NodeStatus::Success)} {GetDisplayName()} Node Succeeded", GetStatusColor(ECBT_NodeStatus::Success));
        }
#endif

        if (!IsValid(ParentNode))
            return;

        ParentNode.OnChildNodeSucceeded(this);
    }

    void OnNodeCancelled(ECBT_ExecutionResult Result)
    {
        _LastExecutionResult = Result;
        ActivateCooldowns(ECBT_NodeStatus::Cancelled);

#if WITH_IMGUI
        if (IsValid(RootNode) && IsValid(this))
        {
            ImGui::TraceFrameSetSectionStatus(ImGui::MakeTraceID(RootNode), this, GetStatusString(ECBT_NodeStatus::Cancelled), GetStatusColor(ECBT_NodeStatus::Cancelled));
            ImGui::TraceFrameReportEventOnSection(ImGui::MakeTraceID(RootNode), this, f"{GetStatusString(ECBT_NodeStatus::Cancelled)} {GetDisplayName()} Node Cancelled", GetStatusColor(ECBT_NodeStatus::Cancelled));
        }
#endif

        if (!IsValid(ParentNode))
            return;

        ParentNode.OnChildNodeCancelled(this);
    }

    void OnNodeFailed()
    {
        _LastExecutionResult = ECBT_ExecutionResult::Failure;
        ActivateCooldowns(ECBT_NodeStatus::Failure);

#if WITH_IMGUI
        if (IsValid(RootNode) && IsValid(this))
        {
            ImGui::TraceFrameSetSectionStatus(ImGui::MakeTraceID(RootNode), this, GetStatusString(ECBT_NodeStatus::Failure), GetStatusColor(ECBT_NodeStatus::Failure));
            ImGui::TraceFrameReportEventOnSection(ImGui::MakeTraceID(RootNode), this, f"{GetStatusString(ECBT_NodeStatus::Failure)} {GetDisplayName()} Node Failed", GetStatusColor(ECBT_NodeStatus::Failure));
        }
#endif

        if (!IsValid(ParentNode))
            return;

        ParentNode.OnChildNodeFailed(this);
    }
}

UCLASS()
class UBehaviorTreeCooldownProfile
{
    UBehaviorTreeCooldownProfile(FString InId, float32 InCooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false, 
        bool bInIgnoreOnThisNode = false)
    {
        Id = InId;
        BaseMinCooldownTimeSeconds = InCooldownSeconds;
        BaseMaxCooldownTimeSeconds = InCooldownSeconds;
        bCooldownOnSuccess = bInCooldownOnSuccess;
        bCooldownOnFail = bInCooldownOnFail;
        bCooldownOnCancel = bInCooldownOnCancel;
        bIgnoreOnThisNode = bInIgnoreOnThisNode;
    }

    UBehaviorTreeCooldownProfile(FString InId, float32 InMinCooldownSeconds, float32 InMaxCooldownSeconds, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false, 
        bool bInIgnoreOnThisNode = false)
    {
        Id = InId;
        BaseMinCooldownTimeSeconds = InMinCooldownSeconds;
        BaseMaxCooldownTimeSeconds = InMaxCooldownSeconds;
        bCooldownOnSuccess = bInCooldownOnSuccess;
        bCooldownOnFail = bInCooldownOnFail;
        bCooldownOnCancel = bInCooldownOnCancel;
        bIgnoreOnThisNode = bInIgnoreOnThisNode;
    }

    UBehaviorTreeCooldownProfile(FString InId, UNodeCooldownCalculation InCooldownCalculation, 
        bool bInCooldownOnSuccess = true, bool bInCooldownOnFail = false, bool bInCooldownOnCancel = false, 
        bool bInIgnoreOnThisNode = false)
    {
        Id = InId;
        CooldownCalculation = InCooldownCalculation;
        bCooldownOnSuccess = bInCooldownOnSuccess;
        bCooldownOnFail = bInCooldownOnFail;
        bCooldownOnCancel = bInCooldownOnCancel;
        bIgnoreOnThisNode = bInIgnoreOnThisNode;
    }

    void SetNode(UCBT_Node Node)
    {
        _Node = Node;
    }

    UPROPERTY()
    private UCBT_Node _Node;

    UPROPERTY()
    FString Id;

    UPROPERTY()
    UNodeCooldownCalculation CooldownCalculation;

    UPROPERTY()
    ECBT_ExecutionResult ResultOnCooldown = ECBT_ExecutionResult::Failure;

    UPROPERTY()
    FGameplayTagContainer BlockTickingOnOwnedTags;

    UPROPERTY()
    FGameplayTagContainer RequireOwnedTagsToTick;

    UPROPERTY()
    bool bCooldownOnSuccess = true;

    UPROPERTY()
    bool bCooldownOnFail = false;

    UPROPERTY()
    bool bCooldownOnCancel = false;

    UPROPERTY()
    bool bIgnoreOnThisNode = false;

    UPROPERTY()
    protected float32 BaseMinCooldownTimeSeconds = 0.0f;

    float32 GetMinCooldownTimeSeconds() const property
    {
        if (!IsValid(_Node))
            return -1.0f;

        if (!IsValid(CooldownCalculation))
            return BaseMinCooldownTimeSeconds;

        return CooldownCalculation.GetCooldown(_Node.Combat);
    }

    UPROPERTY()
    protected float32 BaseMaxCooldownTimeSeconds = 0.0f;

    float32 GetMaxCooldownTimeSeconds() const property
    {
        if (!IsValid(_Node))
            return -1.0f;

        if (!IsValid(CooldownCalculation))
            return BaseMaxCooldownTimeSeconds;

        return CooldownCalculation.GetCooldown(_Node.Combat);
    }

    float32 GetSortLayer() const property
    {
        if (IsValid(_Node))
            return _Node.SortLayer;

        return MAX_flt;
    }

    void BlockTickingDuringActiveActions()
    {
        BlockTickingOnOwnedTags.AddTag(GameplayTag::State_Attack);
        BlockTickingOnOwnedTags.AddTag(GameplayTag::State_Taunt);
        BlockTickingOnOwnedTags.AddTag(GameplayTag::State_Dodge);
        BlockTickingOnOwnedTags.AddTag(GameplayTag::AICombatMove_Movement_AttackMove);
    }
}

////////////////////////////////////////////////////////
//  FLOW CONTROL NODES
////////////////////////////////////////////////////////

UCLASS()
class UCBT_FlowControlNode : UCBT_Node
{
    UPROPERTY()
    TArray<UCBT_Node> Nodes;

    default bIsTreeNode = true;

    protected UCBT_FlowControlNode _AddNode(UCBT_Node NodeToAdd)
    {
        NodeToAdd.ParentNode = this;
        Nodes.Add(NodeToAdd);
        return this;
    }

    UCBT_Node DoNode(UCBT_Node NodeToAdd, float32 InSortLayer = -1.0f)
    {
        _AddNode(NodeToAdd);

        if (InSortLayer >= 0.0f)
        {
            NodeToAdd.BaseSortLayer = InSortLayer;
        }

        return NodeToAdd;
    }

    UCBT_FlowControlNode ResetNodeTree()
    {
        Nodes.Reset();
        return this;
    }

    int GetNodeCount()
    {
        return Nodes.Num();
    }

#if WITH_IMGUI
    void DisplayImGuiSubTree() override
    {
        for (int i = 0; i < Nodes.Num(); i++)
        {
            DisplayImGuiNodeOrderInfo(i);

            Nodes[i].DisplayImGui();
        }      
    }

    void DisplayImGuiNodeOrderInfo(int NodeIndex) {};
#endif

    /** Climbs the hierarchy to the last node opened that wasn't UCBT_Decorator and returns it.*/
    UCBT_FlowControlNode CloseFlowControlNode()
    {
        UCBT_Node Node = GetParent();
        while (IsValid(Node) && !Node.IsA(UCBT_FlowControlNode::StaticClass()))
        {
            Node = Node.GetParent();
        }
        check(IsValid(Node));
        return Cast<UCBT_FlowControlNode>(Node);
    }

    UCBT_DoMove DoMove(UAITask_CombatMove CombatMove = nullptr)
    {
        auto NewNode = UCBT_DoMove();
        if (IsValid(CombatMove))
        {
            NewNode.SetMove(CombatMove);
        }

        _AddNode(NewNode);
        return NewNode;
    }

    UCBT_DoOperation DoOperation(UCombatOperation CombatOperation = nullptr)
    {
        auto NewNode = UCBT_DoOperation();
        if (IsValid(CombatOperation))
        {
            NewNode.SetOperation(CombatOperation);
        }

        _AddNode(NewNode);
        return NewNode;
    }

    ECBT_NodeStatus GetNodeStatus() const override property
    {
        auto CurrentStatus = Super::GetNodeStatus();
        if (CurrentStatus != ECBT_NodeStatus::Running)
            return CurrentStatus;

        if (IsValid(RootNode.CurrentMoveNode) && !RootNode.CurrentMoveNode.IsIndirectChildOf(this))
            return ECBT_NodeStatus::None;

        return CurrentStatus;
    }
}

mixin UCBT_FlowControlNode AsFlowControlNode(UCBT_Node Node)
{
    return Cast<UCBT_FlowControlNode>(Node);
}

/** Executes its child nodes until one succeeds, at which point it returns a success. 
 *  If all child nodes fail without ever returning running, it returns a failure
 *  If a node that returned running last tick fails, it returns a failure.
 */
UCLASS()
class UCBT_PrioritySelector : UCBT_FlowControlNode
{
    UPROPERTY()
    int CurrentNodeIndex = -1;
    protected ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_PrioritySelector::Tick"));
        for (int i = 0; i < Nodes.Num(); i++)
        {
            ECBT_ExecutionResult NextNodeResult = Nodes[i].ExecuteTick();
            switch (NextNodeResult)
            {
                case ECBT_ExecutionResult::Success:
                {
                    CurrentNodeIndex = -1;
                    return ECBT_ExecutionResult::Success;
                }
                case ECBT_ExecutionResult::Running:
                {
                    CurrentNodeIndex = i;
                    return ECBT_ExecutionResult::Running;
                }
                case ECBT_ExecutionResult::Failure:
                default:
                {
                    if (i == CurrentNodeIndex)
                    {
                        CurrentNodeIndex = -1;
                    }
                }
            }
        }
        return ECBT_ExecutionResult::Failure;
    }

#if WITH_IMGUI
    void DisplayImGuiNodeOrderInfo(int NodeIndex) override
    {
        ImGui::Text("");
        ImGui::TextColored(FColor(255, 255, 255, 64), f" ({NodeIndex + 1})");
        ImGui::SetTooltipOnHover("(Node Priority)");
        ImGui::SameLine();
    }

    void DisplayImGuiForNode() override
    {
        if (Nodes.Num() > 1 && !bIsBehavior)
        {
            ImGui::SameLine();
            ImGui::TextColored(FColor(255, 230, 0), "Priority");
            ImGui::SetTooltipOnHover("Selector Type");
        }
    }

    void DisplayImGuiSubTree() override
    {
        if (!this.IsA(UCBT_Root))
        {
            bool bFlag = true;
        }

        Super::DisplayImGuiSubTree();
    }
#endif

    bool TryCancelExecution() override
    {
        if (CurrentNodeIndex == -1)
            return false;

        return Nodes[CurrentNodeIndex].TryCancelExecution();
    }

    void OnChildNodeCancelled(UCBT_Node CancelledNode) override
    {        
        CurrentNodeIndex = -1;
        Super::OnChildNodeCancelled(CancelledNode);
    }

    void OnChildNodeFailed(UCBT_Node FailedNode) override
    {
        if (Nodes.Last() != FailedNode)
            return;

        Super::OnChildNodeFailed(FailedNode);
    }

    UCBT_PrioritySelector MakeBehavior()
    {
        MakeBehaviorInternal();
        return this;
    }
}

mixin UCBT_PrioritySelector AsPrioritySelector(UCBT_Node Node)
{
    return Cast<UCBT_PrioritySelector>(Node);
}

mixin UCBT_PrioritySelector PrioritySelector(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_PrioritySelector();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_PrioritySelector PrioritySelector(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_PrioritySelector();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_PrioritySelector PrioritySelector(UCBT_Tree Tree)
{
    auto NewNode = UCBT_PrioritySelector();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

/** Executes its child nodes until one succeeds, at which point it returns a success. 
 *  If all child nodes fail without ever returning running, it returns a failure
 *  If a node that returned running last tick fails, it returns a failure.
 *  Its nodes are sorted by BaseSortLayer value
 */
UCLASS()
class UCBT_SortedPrioritySelector : UCBT_FlowControlNode
{
    UPROPERTY()
    int CurrentNodeIndex = -1;

    protected ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_SortedPrioritySelector::Tick"));
        for (int i = 0; i < Nodes.Num(); i++)
        {
            ECBT_ExecutionResult NextNodeResult = Nodes[i].ExecuteTick();
            switch (NextNodeResult)
            {
                case ECBT_ExecutionResult::Success:
                {
                    CurrentNodeIndex = -1;
                    return ECBT_ExecutionResult::Success;
                }
                case ECBT_ExecutionResult::Running:
                {
                    CurrentNodeIndex = i;
                    return ECBT_ExecutionResult::Running;
                }
                case ECBT_ExecutionResult::Failure:
                default:
                {
                    if (i == CurrentNodeIndex)
                    {
                        CurrentNodeIndex = -1;
                    }
                }
            }
        }
        return ECBT_ExecutionResult::Failure;
    }

#if WITH_IMGUI
    void DisplayImGuiNodeOrderInfo(int NodeIndex) override
    {
        ImGui::Text("");
        ImGui::TextColored(FColor(255, 255, 255, 64), f" ({Nodes[NodeIndex].SortLayer:.2f})");
        ImGui::SetTooltipOnHover("(Node Priority)");
        ImGui::SameLine();
    }

    void DisplayImGuiForNode() override
    {
        if (Nodes.Num() > 1 && !bIsBehavior)
        {
            ImGui::SameLine();
            ImGui::TextColored(FColor(255, 230, 0), "Sorted Priority");
            ImGui::SetTooltipOnHover("Selector Type");
        }
    }
#endif
    
    void Sort()
    {
        QuickSort(Nodes);
    }

    private void QuickSort(TArray<UCBT_Node>& NodeList)
    {
        QuickSortHelper(NodeList, 0, NodeList.Num()-1);
    }

    private void QuickSortHelper(TArray<UCBT_Node>& NodeList, int FirstIndex, int LastIndex)
    {
        if (FirstIndex >= LastIndex)
            return;

        int SplitPoint = QuickSortPartition(NodeList, FirstIndex, LastIndex);

        QuickSortHelper(NodeList, FirstIndex, SplitPoint - 1);
        QuickSortHelper(NodeList, FirstIndex + 1, LastIndex);
    }


    private int QuickSortPartition(TArray<UCBT_Node>& NodeList, int FirstIndex, int LastIndex)
    {
        float PivotValue = NodeList[FirstIndex].SortLayer;

        int MarkerLeft = FirstIndex + 1;
        int MarkerRight = LastIndex;

        bool bHasFinished = false;
        while (!bHasFinished)
        {
            while (MarkerLeft <= MarkerRight && NodeList[MarkerLeft].SortLayer <= PivotValue)
            {
                MarkerLeft++;
            }

            while (NodeList[MarkerRight].SortLayer >= PivotValue && MarkerRight >= MarkerLeft)
            {
                MarkerRight--;
            }

            if (MarkerRight < MarkerLeft)
            {
                bHasFinished = true;
            }
            else
            {
                NodeList.Swap(MarkerLeft, MarkerRight);
            }
        }

        NodeList.Swap(FirstIndex, MarkerRight);

        return MarkerRight;
    }

    bool TryCancelExecution() override
    {
        if (CurrentNodeIndex == -1)
            return false;

        return Nodes[CurrentNodeIndex].TryCancelExecution();
    }

    void OnChildNodeCancelled(UCBT_Node CancelledNode) override
    {
        if (Nodes.Contains(RootNode.CurrentMoveNode))
            return;
        
        CurrentNodeIndex = -1;
        Super::OnChildNodeCancelled(CancelledNode);
    }

    void OnChildNodeFailed(UCBT_Node FailedNode) override
    {
        if (Nodes.Last() != FailedNode)
            return;

        Super::OnChildNodeFailed(FailedNode);
    }

    UCBT_SortedPrioritySelector MakeBehavior()
    {
        MakeBehaviorInternal();
        return this;
    }
}

mixin UCBT_SortedPrioritySelector AsSortedPrioritySelector(UCBT_Node Node)
{
    return Cast<UCBT_SortedPrioritySelector>(Node);
}

mixin UCBT_SortedPrioritySelector SortedPrioritySelector(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_SortedPrioritySelector();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_SortedPrioritySelector SortedPrioritySelector(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_SortedPrioritySelector();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_SortedPrioritySelector SortedPrioritySelector(UCBT_Tree Tree)
{
    auto NewNode = UCBT_SortedPrioritySelector();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

/** Executes its child nodes in a random order until one succeeds, at which point it returns a success.
 *  If all child nodes fail, it returns a failure.
 */
UCLASS()
class UCBT_RandomSelector : UCBT_FlowControlNode
{
    UPROPERTY()
    UCBT_Node CurrentNode = nullptr;

    UPROPERTY()
    int CurrentIndex = -1;

    UPROPERTY()
    TArray<float32> UncheckedNodeWeights;

    UPROPERTY()
    TArray<float32> Weights;

    void TryAddWeight(float32 Weight)
    {
        if (Weights.Num() != Nodes.Num())
            return;

        Weights.Add(Weight);
    }

    UCBT_Node DoNodeWithWeight(UCBT_Node NodeToAdd, float32 Weight)
    {
        TryAddWeight(Weight);
        return DoNode(NodeToAdd);
    }

    UCBT_Node DoNode(UCBT_Node NodeToAdd, float32 InSortLayer = -1.0f) override
    {
        TryAddWeight(1.0f);
        return Super::DoNode(NodeToAdd);
    }

    UCBT_DoMove DoMove(UAITask_CombatMove CombatMove = nullptr) override
    {
        TryAddWeight(1.0f);
        return Super::DoMove(CombatMove);
    }

    UCBT_DoMove DoMoveWithWeight(UAITask_CombatMove Move = nullptr, float32 Weight = 1.0f)
    {        
        TryAddWeight(Weight);
        return DoMove(Move);
    }

    UCBT_DoOperation DoOperation(UCombatOperation CombatOperation = nullptr) override
    {
        TryAddWeight(1.0f);
        return Super::DoOperation(CombatOperation);
    }

    UCBT_DoOperation DoOperationWithWeight(UCombatOperation CombatOperation = nullptr, float32 Weight = 1.0f)
    {
        TryAddWeight(Weight);
        return DoOperation(CombatOperation);
    }

    void NormalizeWeights()
    {
        float32 Total = 0.0f;
        for (float32 Weight : Weights)
        {
            Total += Weight;
        }

        if (Total == 0.0f)
            return;

        if (Total > 1.0f + 0.05f || Total < 1.0f - 0.05f)
        {
            for (float32& Weight : Weights)
            {
                Weight = Weight / Total;
            }
        }
    }

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_RandomSelector::Tick"));
        NormalizeWeights();

        if (UncheckedNodeWeights.Num() == 0)
        {
            for (float32 Weight : Weights)
            {
                UncheckedNodeWeights.Add(Weight);
            }
        }

        if (IsValid(CurrentNode))
        {
            ECBT_ExecutionResult Result = CurrentNode.ExecuteTick();
            
            if (Result == ECBT_ExecutionResult::Running)
                return ECBT_ExecutionResult::Running;

            CurrentNode = nullptr;
            return Result;
        }

        if (UncheckedNodeWeights.Num() > 0)
        {
            ECBT_ExecutionResult NextNodeResult = ECBT_ExecutionResult::Failure;
            
            while (NextNodeResult == ECBT_ExecutionResult::Failure)
            {
                CurrentIndex = WeightedRandomChoice::WeightedRandomIndex(UncheckedNodeWeights);

                CurrentNode = Nodes[CurrentIndex];

                NextNodeResult = CurrentNode.ExecuteTick();

                if (NextNodeResult != ECBT_ExecutionResult::Failure)
                {
                    UncheckedNodeWeights.Reset();
                    return NextNodeResult;
                }
                
                UncheckedNodeWeights.RemoveAt(CurrentIndex);

                if (UncheckedNodeWeights.Num() == 0)
                {
                    UncheckedNodeWeights.Reset();
                    return ECBT_ExecutionResult::Failure; 
                }
            }
        }

        return ECBT_ExecutionResult::Failure;
    }

#if WITH_IMGUI
    void DisplayImGuiNodeOrderInfo(int NodeIndex) override
    {
        NormalizeWeights();
        
        ImGui::Text("");
        ImGui::TextColored(FColor(255, 255, 255, 64), f" ({Weights[NodeIndex]:.3f})");
        ImGui::SetTooltipOnHover("(Node Priority)");
        ImGui::SameLine();
    }

    void DisplayImGuiForNode() override
    {
        if (Nodes.Num() > 1 && !bIsBehavior)
        {
            ImGui::SameLine();
            ImGui::TextColored(FColor(255, 230, 0), "Random");
            ImGui::SetTooltipOnHover("Selector Type");
        }
    }
#endif

    bool TryCancelExecution() override
    {
        if (!IsValid(CurrentNode))
            return false;

        return CurrentNode.TryCancelExecution();
    }

    void OnChildNodeCancelled(UCBT_Node CancelledNode) override
    {        
        CurrentNode == nullptr;
        Super::OnChildNodeCancelled(CancelledNode);
    }

    void OnChildNodeFailed(UCBT_Node FailedNode) override
    {
        if (UncheckedNodeWeights.Num() > 0)
            return;

        Super::OnChildNodeFailed(FailedNode);
    }

    UCBT_RandomSelector MakeBehavior()
    {
        MakeBehaviorInternal();
        return this;
    }
}

mixin UCBT_RandomSelector AsRandomSelector(UCBT_Node Node)
{
    return Cast<UCBT_RandomSelector>(Node);
}

mixin UCBT_RandomSelector RandomSelector(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_RandomSelector();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_RandomSelector RandomSelector(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_RandomSelector();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_RandomSelector RandomSelector(UCBT_Tree Tree)
{
    auto NewNode = UCBT_RandomSelector();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

/** Executes all child nodes in order. It returns a failure as soon as a node fails.
 *  It returns a success if all the nodes succeed.
 *  It returns a failure if there are no child nodes.
 */
UCLASS()
class UCBT_Sequence : UCBT_FlowControlNode
{
    UPROPERTY()
    int CurrentNodeIndex = 0;
    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_Sequence::Tick"));
        ECBT_ExecutionResult NextNodeResult = ECBT_ExecutionResult::Success;
        
        while (NextNodeResult == ECBT_ExecutionResult::Success)
        {
            NextNodeResult = Nodes[CurrentNodeIndex].ExecuteTick();
            switch (NextNodeResult)
            {
                case ECBT_ExecutionResult::Running:
                    return ECBT_ExecutionResult::Running;

                case ECBT_ExecutionResult::Success:
                {
                    CurrentNodeIndex++;
                    if (Nodes.Num() <= CurrentNodeIndex)
                    {
                        CurrentNodeIndex = 0;
                        return ECBT_ExecutionResult::Success;   
                    }

                    return ECBT_ExecutionResult::Running;
                }

                case ECBT_ExecutionResult::Failure:
                default:
                {
                    CurrentNodeIndex = 0;
                    return ECBT_ExecutionResult::Failure;
                }
            }
        }

        return ECBT_ExecutionResult::Failure;
    }

#if WITH_IMGUI
    void DisplayImGuiNodeOrderInfo(int NodeIndex) override
    {
        ImGui::Text("");
        ImGui::TextColored(FColor(255, 255, 255, 64), f" ({NodeIndex + 1})");
        ImGui::SetTooltipOnHover("(Node Priority)");
        ImGui::SameLine();
    }

    void DisplayImGuiForNode() override
    {
        if (Nodes.Num() > 1 && !bIsBehavior)
        {
            ImGui::SameLine();
            ImGui::TextColored(FColor(255, 230, 0), "Sequence");
            ImGui::SetTooltipOnHover("Selector Type");
        }
    }
#endif

    bool TryCancelExecution() override
    {
        return Nodes[CurrentNodeIndex].TryCancelExecution();
    }

    void OnChildNodeSucceeded(UCBT_Node SucceededNode) override
    {
        if (Nodes.Last() != SucceededNode)
            return;

        Super::OnChildNodeSucceeded(SucceededNode);
    }

    void OnChildNodeCancelled(UCBT_Node CancelledNode) override
    {
        CurrentNodeIndex = 0;
        Super::OnChildNodeCancelled(CancelledNode);
    }

    UCBT_Sequence MakeBehavior()
    {
        MakeBehaviorInternal();
        return this;
    }
}

mixin UCBT_Sequence AsSequence(UCBT_Node Node)
{
    return Cast<UCBT_Sequence>(Node);
}

mixin UCBT_Sequence Sequence(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_Sequence();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_Sequence Sequence(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_Sequence();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_Sequence Sequence(UCBT_Tree Tree)
{
    auto NewNode = UCBT_Sequence();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

/** Executes all child nodes in order. It returns a failure if it runs to completion and all child nodes failed.
 *  It returns a success if it runs to completion and any node succeeded.
 *  It returns a failure if there are no child nodes.
 */
UCLASS()
class UCBT_CompleteSequence : UCBT_FlowControlNode
{
    UPROPERTY()
    int CurrentNodeIndex = 0;
    bool bIsSuccess = false;
    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_CompleteSequence::Tick"));
        ECBT_ExecutionResult NextNodeResult = ECBT_ExecutionResult::Success;
        
        while (NextNodeResult == ECBT_ExecutionResult::Success || NextNodeResult == ECBT_ExecutionResult::Failure)
        {
            NextNodeResult = Nodes[CurrentNodeIndex].ExecuteTick();
            switch (NextNodeResult)
            {
                case ECBT_ExecutionResult::Running:
                    return ECBT_ExecutionResult::Running;

                case ECBT_ExecutionResult::Success:
                case ECBT_ExecutionResult::Failure:
                {
                    if (NextNodeResult == ECBT_ExecutionResult::Success)
                    {
                        bIsSuccess = true;
                    }

                    CurrentNodeIndex++;
                    if (Nodes.Num() <= CurrentNodeIndex)
                    {
                        CurrentNodeIndex = 0;

                        if (!bIsSuccess)
                            return ECBT_ExecutionResult::Failure;

                        bIsSuccess = false;
                        return ECBT_ExecutionResult::Success;   
                    }

                    continue;
                }

                default:
                {
                    CurrentNodeIndex = 0;
                    bIsSuccess = false;
                    return ECBT_ExecutionResult::Failure;
                }
            }
        }

        return ECBT_ExecutionResult::Failure;
    }

#if WITH_IMGUI
    void DisplayImGuiNodeOrderInfo(int NodeIndex) override
    {
        ImGui::Text("");
        ImGui::TextColored(FColor(255, 255, 255, 64), f" ({NodeIndex + 1})");
        ImGui::SetTooltipOnHover("(Node Priority)");
        ImGui::SameLine();
    }

    void DisplayImGuiForNode() override
    {
        if (Nodes.Num() > 1 && !bIsBehavior)
        {
            ImGui::SameLine();
            ImGui::TextColored(FColor(255, 230, 0), "Sequence");
            ImGui::SetTooltipOnHover("Selector Type");
        }
    }
#endif

    bool TryCancelExecution() override
    {
        return Nodes[CurrentNodeIndex].TryCancelExecution();
    }
    
    void OnChildNodeFailed(UCBT_Node FailedNode) override
    {
        if (Nodes.Last() != FailedNode)
            return;

        Super::OnChildNodeFailed(FailedNode);
    }

    void OnChildNodeSucceeded(UCBT_Node SucceededNode) override
    {
        if (Nodes.Last() != SucceededNode)
            return;

        Super::OnChildNodeSucceeded(SucceededNode);
    }

    void OnChildNodeCancelled(UCBT_Node CancelledNode) override
    {
        CurrentNodeIndex = 0;
        Super::OnChildNodeCancelled(CancelledNode);
    }

    UCBT_CompleteSequence MakeBehavior()
    {
        MakeBehaviorInternal();
        return this;
    }
}

mixin UCBT_CompleteSequence AsCompleteSequence(UCBT_Node Node)
{
    return Cast<UCBT_CompleteSequence>(Node);
}

mixin UCBT_CompleteSequence CompleteSequence(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_CompleteSequence();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_CompleteSequence CompleteSequence(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_CompleteSequence();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_CompleteSequence CompleteSequence(UCBT_Tree Tree)
{
    auto NewNode = UCBT_CompleteSequence();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

class UCBT_RandomAttackSelector : UCBT_RandomSelector
{
    UCBT_RandomAttackSelector AddAttack(const FAttackInfo& AttackInfo, float32 Weight = -1.0f, EAttackDirectionRequirement DirectionRequirementOverride = EAttackDirectionRequirement::None)
    {
        float32 FinalWeight = 1.0f;

        if (Weight == 0.0f)
            return this;

        if (Weight > 0.0f)
        {
            FinalWeight = Weight;
        }

        auto AttackData = AttackInfo.GetAttackMoveData(FinalWeight);

        if (DirectionRequirementOverride != EAttackDirectionRequirement::None)
        {
            Cast<UCM_Attack>(AttackData.CombatMove).AttackDirectionRequirement = DirectionRequirementOverride;
        }

        AddAttackWithWeight(AttackData);
        return this;
    }

    protected void AddAttackWithWeight(FAttackMoveData AttackData)
    {
        DoMoveWithWeight(AttackData.CombatMove, AttackData.Weight);
            //.AddRequirement(UCS_Not(UCS_CharacterOfInterestTooFarFromPreferredLocationForAttack(Cast<UCM_Attack>(AttackData.CombatMove))));
    }
}

class UCBT_RandomAttackComboChainerSelector : UCBT_RandomAttackSelector
{
    void AddAttackWithWeight(FAttackMoveData AttackData) override
    {
        DoOperationWithWeight(UCO_SetNextAttackInCombo(Cast<UCM_Attack>(AttackData.CombatMove)), AttackData.Weight);     
    }
}

class UCBT_RandomAttackSelectorSplitTree : UCBT_RandomSelector
{
    UCBT_RandomAttackSelectorSplitTree AddAttack(const FAttackInfo& AttackInfo, float BehaviorSortLayer, float32 Weight = -1.0f, EAttackDirectionRequirement DirectionRequirementOverride = EAttackDirectionRequirement::None)
    {
        float32 FinalWeight = 1.0f;

        if (Weight == 0.0f)
            return this;

        if (Weight > 0.0f)
        {
            FinalWeight = Weight;
        }

        auto AttackData = AttackInfo.GetAttackMoveData(FinalWeight);

        if (DirectionRequirementOverride != EAttackDirectionRequirement::None)
        {
            Cast<UCM_Attack>(AttackData.CombatMove).AttackDirectionRequirement = DirectionRequirementOverride;
        }

        AddAttackWithWeight(AttackData, BehaviorSortLayer);
        return this;
    }

    protected void AddAttackWithWeight(FAttackMoveData AttackData, float BehaviorSortLayer)
    {
        DoOperationWithWeight(
            UCO_SelectAttack(
                Cast<UCM_Attack>(AttackData.CombatMove),
                BehaviorSortLayer,
                this), 
            
                AttackData.Weight);
            //.AddRequirement(UCS_Not(UCS_CharacterOfInterestTooFarFromPreferredLocationForAttack(Cast<UCM_Attack>(AttackData.CombatMove))));
    }

    ECBT_ExecutionResult Tick() override
    {
        return Super::Tick();
    }
}

////////////////////////////////////////////////////////
//  EXECUTION NODES
////////////////////////////////////////////////////////

UCLASS()
class UCBT_ExecutionNode : UCBT_Node
{
    
}

/** Executes the move and waits for it to finish, returns success if the move task returned success. It returns failure if the move task returned failure or cancelled.*/
UCLASS()
class UCBT_DoMove : UCBT_ExecutionNode
{
    UCBT_DoMove(UAITask_CombatMove InMove)
    {
        _MoveTemplate = InMove;
    }

    default bActivateCooldownsFromTick = false;

    UPROPERTY()
    protected UAITask_CombatMove _MoveTemplate;

    UPROPERTY()
    UAITask_CombatMove RunningTask;

    const UAITask_CombatMove GetRunningTask()
    {
        return RunningTask;
    }

    UAITask_CombatMove GetMove() const property
    {
        return _MoveTemplate;
    }

    UCBT_DoMove SetMove(UAITask_CombatMove Value)
    {
        _MoveTemplate = Value;
        return this;
    }

    UPROPERTY()
    bool bIgnoreCooldown = false;

    UPROPERTY()
    ECBT_ExecutionResult ResultOnMoveNotAllowed = ECBT_ExecutionResult::Failure;

    UPROPERTY()
    bool bResultReturned = false;

    UPROPERTY()
    bool bMoveStarted = false;

    UPROPERTY()
    ECBT_ExecutionResult ExecutionResult = ECBT_ExecutionResult::None;

    UPROPERTY()
    ECBT_NodeStatus NodeStatusResult = ECBT_NodeStatus::None;

    UPROPERTY()
    ECBT_NodeStatus NodeStatusOnTaskNotStarted = ECBT_NodeStatus::None;

    ECBT_ExecutionResult Tick() override
    {
        ExecutionResult = ECBT_ExecutionResult::None;

        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_DoMove::Tick"));
        ECombatActionPerformAttemptResult TryPerformResult;
        
        if (!IsValid(Move))
            return ECBT_ExecutionResult::Failure;

        UAITask_CombatMove ActiveTask = nullptr;
        if (Move.IsA(UCM_Movement::StaticClass()))
        {
            TryPerformResult = Combat.ActionsHandler.TryPerformMovementNow(this, Move, Priority);
            ActiveTask = Combat.ActionsHandler.ActiveMovementTask;
        }
        else
        {
            TryPerformResult = Combat.ActionsHandler.TryPerformActionNow(this, Move, Priority);
            ActiveTask = Combat.ActionsHandler.ActiveActionTask;
        }

        if (TryPerformResult == ECombatActionPerformAttemptResult::AlreadyRunning)
            return ECBT_ExecutionResult::Running;

        if (TryPerformResult == ECombatActionPerformAttemptResult::MoveNotAllowed)
            return /*ECBT_ExecutionResult::Failure;*/ResultOnMoveNotAllowed;

        if (TryPerformResult == ECombatActionPerformAttemptResult::SuccessfullyStarted)
        {
            bMoveStarted = true;
            NodeStatusResult = ECBT_NodeStatus::Running;
            RunningTask = ActiveTask;
            return ECBT_ExecutionResult::Running;
        }

        return ECBT_ExecutionResult::Failure;
    }

    ECBT_ExecutionResult CheckFinishedCombatMoveResult(UAITask_CombatMove CombatMoveTask)
    {
        EGenericTaskResult TaskResult = CombatMoveTask.TaskResult;
        bool bMoveTaskWasAttack = CombatMoveTask.IsA(UCM_Attack::StaticClass());

        bMoveStarted = false;

        switch(TaskResult)
        {
            case EGenericTaskResult::Success:
            {
                NodeStatusResult = ECBT_NodeStatus::Success;
                OnNodeSucceeded();
                RunningTask = nullptr;
                return ECBT_ExecutionResult::Success;
            }
            
            case EGenericTaskResult::Cancelled:
            {
                NodeStatusResult = ECBT_NodeStatus::Cancelled;

                ECBT_ExecutionResult MoveResult = ECBT_ExecutionResult::Failure;                
                OnNodeCancelled(MoveResult);
                RunningTask = nullptr;
                return MoveResult;
            }

            case EGenericTaskResult::Failed:
            default:
            {
                NodeStatusResult = ECBT_NodeStatus::Failure;
                OnNodeFailed();
                RunningTask = nullptr;
                return ECBT_ExecutionResult::Failure;
            }
        }
    }

    void OnCombatMoveFinished(UAITask_CombatMove CombatMoveTask)
    {
        if (!IsValid(Combat) || !IsValid(RunningTask))
            return;

        if (CombatMoveTask != RunningTask)
            return;

        if (RootNode != Combat.BehaviorController.MovementTree)
        {
            if (CombatMoveTask.TaskResult == EGenericTaskResult::Success)
            {
                Combat.LastCombatMoveType = CombatMoveTask.Class;
            }
            else
            {
                Combat.LastCombatMoveType = nullptr;
            }
        }
            
        Combat.HandlePerformedMove(CombatMoveTask.Class, CombatMoveTask.MoveTypes);

        ExecutionResult = CheckFinishedCombatMoveResult(CombatMoveTask);
    }

    FString GetDisplayName() const override
    {
        FString NodeName = "Do Move";

        if (!IsValid(Move))
            return NodeName + ": None";

        return NodeName + ":";
    }

#if WITH_IMGUI
    void DisplayImGuiForNode() override
    {
        bool bBranchCancelled = false;

        FColor TextColorResult = FColor(255, 255, 255, 128);
        FColor TextColorName = FColor(255, 255, 255, 128);
        if (LastExecutionResult == ECBT_ExecutionResult::Success)
        {
            TextColorResult = FColor::Green;
        }

        if (LastExecutionResult == ECBT_ExecutionResult::Running && RootNode.bCurrentMoveDrawn)
        {
            bBranchCancelled = true;
            TextColorResult = FColor::Red;
        }

        FString LastResultString = Icon::CIRCLE_O;
        if (!bBranchCancelled)
        {
            LastResultString = GetLastExecutionResultString();
        }

        if (LastExecutionResult == ECBT_ExecutionResult::Running && !bBranchCancelled)
        {
            TextColorResult = FColor::Yellow;
            TextColorName = FColor::White;

            RootNodeMutable.bCurrentMoveDrawn = true;
        }
        
        ImGui::TextColored(TextColorResult, LastResultString);
        if (!bBranchCancelled)
        {
            ImGui::SetTooltipOnHover(f"Last Execution Result: {LastExecutionResult}");
        }
        else
        {
            ImGui::SetTooltipOnHover(f"Branch Cancelled!");
        }
        ImGui::SameLine();
        ImGui::TextColored(TextColorName, GetDisplayName());

        if (IsValid(Move))
        {
            ImGui::SameLine();
            ImGui::PushTextColor(TextColorName);
            Move.DisplayImGuiInTreeView(IsValid(RootNode.CurrentMoveNode) && Move == RootNode.CurrentMoveNode.Move);
            ImGui::PopTextColor();
        }
    }
#endif

    ECBT_NodeStatus GetNodeStatus() const override property
    {
        auto CombatActionsHandler = Combat.ActionsHandler;
        if (!IsValid(CombatActionsHandler) && _LastExecutionResult != ECBT_ExecutionResult::Running)
            return Super::GetNodeStatus();

        if (!CombatActionsHandler.NodesToRunningTasks.Contains(this))
        {
            if (ExecutionResult != ECBT_ExecutionResult::None)
            {
                return NodeStatusResult;
            }
            
            return NodeStatusOnTaskNotStarted;
        }

        if (!CombatActionsHandler.NodesToRunningTasks[this].IsActive())
            return ECBT_NodeStatus::None;

        if (CombatActionsHandler.NodesToRunningTasks[this].IsActive() && !CombatActionsHandler.NodesToRunningTasks[this].IsFinished())
            return ECBT_NodeStatus::Running;

        return ECBT_NodeStatus::None;
    }

    UCBT_DoMove IgnoreCombatMoveCooldown()
    {
        bIgnoreCooldown = true;
        return this;
    }

    void OnNodeSucceeded() override
    {
#if WITH_IMGUI
        if (IsValid(RootNode) && IsValid(Move))
        {
            ImGui::TraceFrameSetSectionStatus(ImGui::MakeTraceID(RootNode), Move, GetStatusString(ECBT_NodeStatus::Success), GetStatusColor(ECBT_NodeStatus::Success));
            ImGui::TraceFrameReportEventOnSection(ImGui::MakeTraceID(RootNode), Move, f"{GetStatusString(ECBT_NodeStatus::Success)} {Move.GetDisplayName()} Task Succeeded", GetStatusColor(ECBT_NodeStatus::Success));
        }

        if (IsValid(RootNode) && IsValid(RunningTask))
        {
            ImGui::TraceFrameSetSectionStatus(ImGui::MakeTraceID(RootNode), RunningTask, GetStatusString(ECBT_NodeStatus::Success), GetStatusColor(ECBT_NodeStatus::Success));
            ImGui::TraceFrameReportEventOnSection(ImGui::MakeTraceID(RootNode), RunningTask, f"{GetStatusString(ECBT_NodeStatus::Success)} {GetDisplayName()} Task Succeeded", GetStatusColor(ECBT_NodeStatus::Success));
        }
#endif
        Super::OnNodeSucceeded();        
    }

    void OnNodeCancelled(ECBT_ExecutionResult Result) override
    {
#if WITH_IMGUI
        if (IsValid(RootNode) && IsValid(Move))
        {
            ImGui::TraceFrameSetSectionStatus(ImGui::MakeTraceID(RootNode), Move, GetStatusString(ECBT_NodeStatus::Cancelled), GetStatusColor(ECBT_NodeStatus::Cancelled));
            ImGui::TraceFrameReportEventOnSection(ImGui::MakeTraceID(RootNode), Move, f"{GetStatusString(ECBT_NodeStatus::Cancelled)} {Move.GetDisplayName()} Task Cancelled", GetStatusColor(ECBT_NodeStatus::Cancelled));
        }

        if (IsValid(RootNode) && IsValid(RunningTask))
        {
            ImGui::TraceFrameSetSectionStatus(ImGui::MakeTraceID(RootNode), RunningTask, GetStatusString(ECBT_NodeStatus::Cancelled), GetStatusColor(ECBT_NodeStatus::Cancelled));
            ImGui::TraceFrameReportEventOnSection(ImGui::MakeTraceID(RootNode), RunningTask, f"{GetStatusString(ECBT_NodeStatus::Cancelled)} {GetDisplayName()} Task Cancelled", GetStatusColor(ECBT_NodeStatus::Cancelled));
        }
#endif
        Super::OnNodeCancelled(Result);        
    }

    void OnNodeFailed() override
    {
#if WITH_IMGUI
        if (IsValid(RootNode) && IsValid(Move))
        {        
            ImGui::TraceFrameSetSectionStatus(ImGui::MakeTraceID(RootNode), Move, GetStatusString(ECBT_NodeStatus::Failure), GetStatusColor(ECBT_NodeStatus::Failure));
            ImGui::TraceFrameReportEventOnSection(ImGui::MakeTraceID(RootNode), Move, f"{GetStatusString(ECBT_NodeStatus::Failure)} {Move.GetDisplayName()} Task Failed", GetStatusColor(ECBT_NodeStatus::Failure));
        }

        if (IsValid(RootNode) && IsValid(RunningTask))
        {
            ImGui::TraceFrameSetSectionStatus(ImGui::MakeTraceID(RootNode), RunningTask, GetStatusString(ECBT_NodeStatus::Failure), GetStatusColor(ECBT_NodeStatus::Failure));
            ImGui::TraceFrameReportEventOnSection(ImGui::MakeTraceID(RootNode), RunningTask, f"{GetStatusString(ECBT_NodeStatus::Failure)} {GetDisplayName()} Task Failed", GetStatusColor(ECBT_NodeStatus::Failure));
        }
#endif
        Super::OnNodeFailed();        
    }
}

mixin UCBT_DoMove AsDoMove(UCBT_Node Node)
{
    return Cast<UCBT_DoMove>(Node);
}

mixin UCBT_DoMove DoMove(UCBT_Tree Tree, UAITask_CombatMove CombatMove = nullptr)
{
    auto NewNode = UCBT_DoMove();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    if (IsValid(CombatMove))
    {
        NewNode.SetMove(CombatMove);
    }

    return NewNode;
}

UCLASS()
class UCBT_DoMoveIgnoringCooldown : UCBT_DoMove
{
    default bIgnoreCooldown = true;
    UCBT_DoMoveIgnoringCooldown(UAITask_CombatMove InMove)
    {
        _MoveTemplate = InMove;
    }
}

UCLASS()
class UCBT_ExecuteSelectedAttack : UCBT_DoMove
{
    default ResultOnMoveNotAllowed = ECBT_ExecutionResult::Running;
    default NodeStatusOnTaskNotStarted = ECBT_NodeStatus::Running;

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_ExecuteSelectedAttack::Tick"));
        return UCBT_DoMove::Tick();
    }

    ECBT_NodeStatus GetNodeStatus() const override property
    {
        return Super::GetNodeStatus();
    }
    
    UAITask_CombatMove GetMove() const override property
    {
        if (!IsValid(SelectedAttackHandler))
            return nullptr;

        return SelectedAttackHandler.Attack;
    }

    void OnCombatMoveFinished(UAITask_CombatMove CombatMoveTask) override
    {
        UCBT_DoMove::OnCombatMoveFinished(CombatMoveTask);

        if (!IsValid(Combat))
            return;

        Combat.ResetSelectedAttack();
        if (!IsValid(Combat.CombatGroup))
            return;
        
        if (Combat.CombatGroup.DoesCharacterHaveAttackToken(Combat.Self))
        {
            Combat.CombatGroup.SpendAttackToken(Combat.Self);
        }
    }

    void OnNodeCancelled(ECBT_ExecutionResult MoveResult) override
    {
        if (IsValid(Combat))
        {
            Combat.ResetSelectedAttack();
        }

        Super::OnNodeCancelled(MoveResult);        
    }

    void OnNodeFailed() override
    {
        if (IsValid(Combat))
        {
            Combat.ResetSelectedAttack();
        }

        Super::OnNodeFailed();
    }

    FString GetDisplayName() const override
    {
        FString NodeName = "Execute Selected Attack";
        
        if (!IsValid(Move))
            return NodeName + ": None";
        return NodeName + ":";
    }

    UAttackMoveHandler GetSelectedAttackHandler() const property
    {
        if (!IsValid(Combat))
            return nullptr;
        
        return Combat.SelectedAttackHandler;
    }

    TArray<UBehaviorTreeCooldownProfile> GetCooldownProfiles() const override property
    {
        return GetClosestCooldownProfilesInHierarchy();
    }
}

/** Executes the move and waits for it to finish, returns success if the move task returned success. It returns failure if the move task returned failure or cancelled.*/
UCLASS()
class UCBT_DoOperation : UCBT_ExecutionNode
{
    UCBT_DoOperation(UCombatOperation InOperation)
    {
        Operation = InOperation;
    }

    UPROPERTY()
    private UCombatOperation _Operation;

    UFUNCTION()
    UCombatOperation GetOperation() const property
    {
        return _Operation;
    }

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_DoOperation::Tick"));
        
        if (!ensure(IsValid(Operation)))
            return ECBT_ExecutionResult::Failure;            

        Operation.Combat = Combat;
        
        if (Operation.DoOperation())
            return ECBT_ExecutionResult::Success;

        return ECBT_ExecutionResult::Failure;        
    }

    FString GetDisplayName() const override
    {
        if (!IsValid(Operation))
            return "Do Operation: None";

        return "Do Operation:";
    }

#if WITH_IMGUI
    void DisplayImGui(FString TreeIDPrefix = "") override
    {
        bool bBranchCancelled = false;

        DisplayBehaviorImGui();

        FColor TextColorResult = FColor(255, 255, 255, 128);
        FColor TextColorName = FColor(255, 255, 255, 128);
        if (GetLastExecutionResult() == ECBT_ExecutionResult::Success)
        {
            TextColorResult = FColor::Green;
        }

        if (GetLastExecutionResult() == ECBT_ExecutionResult::Running && RootNode.bCurrentMoveDrawn)
        {
            bBranchCancelled = true;
            TextColorResult = FColor::Red;
        }

        FString LastResultString = Icon::CIRCLE_O;
        if (!bBranchCancelled)
        {
            LastResultString = GetLastExecutionResultString();
        }

        if (GetLastExecutionResult() == ECBT_ExecutionResult::Running && !bBranchCancelled)
        {
            TextColorResult = FColor::Yellow;
            TextColorName = FColor::White;
        }

        ImGui::TextColored(TextColorResult, LastResultString);
        ImGui::SameLine();
        ImGui::TextColored(TextColorName, GetDisplayName());

        if (!IsValid(Operation))
            return;

        ImGui::SameLine();
        ImGui::PushTextColor(TextColorName);
        Operation.DisplayImGuiInTreeView();
        ImGui::PopTextColor();
    }
#endif

    bool TryCancelExecution() override
    {
        return true;
    }

    void SetOperation(UCombatOperation Value) property
    {
        _Operation = Value;
    }
}

mixin UCBT_DoOperation AsDoOperation(UCBT_Node Node)
{
    return Cast<UCBT_DoOperation>(Node);
}

mixin UCBT_DoOperation DoOperation(UCBT_Tree Tree, UCombatOperation CombatOperation = nullptr)
{
    auto NewNode = UCBT_DoOperation();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    if (IsValid(CombatOperation))
    {
        NewNode.SetOperation(CombatOperation);
    }

    return NewNode;
}

////////////////////////////////////////////////////////
//  DECORATOR NODES
////////////////////////////////////////////////////////
UCLASS()
class UCBT_Decorator : UCBT_Node
{
    UPROPERTY()
    protected UCBT_Node _NextNode = nullptr;

    default bIsTreeNode = true;
    default bDebugTreeOpenByDefault = true;

    float32 GetSortLayer() const override property
    {
        if (!IsValid(_NextNode))
            return BaseSortLayer;

        return _NextNode.SortLayer;
    }

    UCBT_Node NextNode(UCBT_Node NodeToAdd)
    {
        NodeToAdd.ParentNode = this;
        _NextNode = NodeToAdd;
        return _NextNode;
    }

    void ResetNodeTree()
    {
        _NextNode = nullptr;
    }

    FString GetBehaviorName() const override property
    {
        if (!IsValid(_NextNode))
            return "";

        if (GetIsBehavior())
            return _NextNode.BehaviorName;

        return Super::GetBehaviorName();
    }

#if WITH_IMGUI
    void DisplayImGuiSubTree() override
    {
        if (!IsValid(_NextNode))
            return;

        _NextNode.DisplayImGui();        
    }
#endif

    bool GetIsBehavior() const property override
    {
        if (bIsBehavior)
            return true;

        if (!IsValid(_NextNode))
            return false;

        return _NextNode.bIsBehavior;
    }

    bool TryCancelExecution() override
    {
        if (!IsValid(_NextNode))
            return false;

        return _NextNode.TryCancelExecution();
    }

    UCBT_Decorator MakeBehavior()
    {
        MakeBehaviorInternal();
        return this;
    }

    UCBT_DoMove DoMove(UAITask_CombatMove CombatMove = nullptr)
    {
        auto NewNode = UCBT_DoMove();
        if (IsValid(CombatMove))
        {
            NewNode.SetMove(CombatMove);
        }

        NextNode(NewNode);
        return NewNode;
    }

    UCBT_DoOperation DoOperation(UCombatOperation CombatOperation = nullptr)
    {
        auto NewNode = UCBT_DoOperation();
        if (IsValid(CombatOperation))
        {
            NewNode.SetOperation(CombatOperation);
        }

        NextNode(NewNode);
        return NewNode;
    }
}

mixin UCBT_Decorator AsDecorator(UCBT_Node Node)
{
    return Cast<UCBT_Decorator>(Node);
}

/** Returns success when the next node returns failure and viceversa. Returns running when the next node returns running. */
UCLASS()
class UCBT_Inverter : UCBT_Decorator
{
    UCBT_Inverter(UCBT_Node InNextNode)
    {
        _NextNode = InNextNode;
    }

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_Inverter::Tick"));

        if (!ensure(IsValid(_NextNode)))
            return ECBT_ExecutionResult::Failure;

        ECBT_ExecutionResult Result = _NextNode.ExecuteTick();
        
        if (Result == ECBT_ExecutionResult::Running)
            return Result;

        if (Result == ECBT_ExecutionResult::Success)
            return ECBT_ExecutionResult::Failure;

        return ECBT_ExecutionResult::Success;
    }
}

mixin UCBT_Inverter Inverter(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_Inverter();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_Inverter Inverter(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_Inverter();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_Inverter Inverter(UCBT_Tree Tree)
{
    auto NewNode = UCBT_Inverter();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

/** Returns success when the next node returns success or failure. Returns running otherwise. */
UCLASS()
class UCBT_Succeeder : UCBT_Decorator
{
    UCBT_Succeeder(UCBT_Node InNextNode)
    {
        _NextNode = InNextNode;
    }

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_Succeeder::Tick"));
        if (!IsValid(_NextNode))
            return ECBT_ExecutionResult::Success;

        ECBT_ExecutionResult TickResult = _NextNode.ExecuteTick();
        if (TickResult != ECBT_ExecutionResult::Running)
            return ECBT_ExecutionResult::Success;

        return TickResult;
    }
}

mixin UCBT_Succeeder Succeeder(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_Succeeder();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_Succeeder Succeeder(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_Succeeder();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_Succeeder Succeeder(UCBT_Tree Tree)
{
    auto NewNode = UCBT_Succeeder();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

/** Skips the parent Selector */
class UCBT_Skipper : UCBT_Decorator
{
    UCBT_Skipper(UCBT_Node InNextNode)
    {
        _NextNode = InNextNode;
    }

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_Skipper::Tick"));
        if (!IsValid(_NextNode))
            return ECBT_ExecutionResult::Skip;

        ECBT_ExecutionResult TickResult = _NextNode.ExecuteTick();
        if (TickResult != ECBT_ExecutionResult::Running)
        {
            return ECBT_ExecutionResult::Skip;
        }

        return TickResult;
    }

#if WITH_IMGUI
    void DisplayImGui(FString TreeIDPrefix = "") override
    {
        if (!IsValid(_NextNode))
        {
            bool bBranchCancelled = false;

            DisplayBehaviorImGui();

            FColor TextColorResult = FColor(255, 255, 255, 128);
            FColor TextColorName = FColor(255, 255, 255, 128);
            if (GetLastExecutionResult() == ECBT_ExecutionResult::Success)
            {
                TextColorResult = FColor::Green;
            }

            if (GetLastExecutionResult() == ECBT_ExecutionResult::Running && RootNode.bCurrentMoveDrawn)
            {
                bBranchCancelled = true;
                TextColorResult = FColor::Red;
            }

            FString LastResultString = Icon::CIRCLE_O;
            if (!bBranchCancelled)
            {
                LastResultString = GetLastExecutionResultString();
            }

            if (GetLastExecutionResult() == ECBT_ExecutionResult::Running && !bBranchCancelled)
            {
                TextColorResult = FColor::Yellow;
                TextColorName = FColor::White;
            }

            ImGui::TextColored(TextColorResult, LastResultString);
            ImGui::SameLine();
            ImGui::TextColored(TextColorName, GetDisplayName());
        }
        else
        {
            Super::DisplayImGui();
        }
    }
#endif
}

mixin UCBT_Skipper Skipper(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_Skipper();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_Skipper Skipper(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_Skipper();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_Skipper Skipper(UCBT_Tree Tree)
{
    auto NewNode = UCBT_Skipper();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

/** Returns failure when the next node returns success or failure. Returns running otherwise. */
class UCBT_Failer : UCBT_Decorator
{
    UCBT_Failer(UCBT_Node InNextNode)
    {
        _NextNode = InNextNode;
    }

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_Failer::Tick"));
        ECBT_ExecutionResult TickResult = _NextNode.ExecuteTick();
        if (TickResult != ECBT_ExecutionResult::Running)
            return ECBT_ExecutionResult::Failure;

        return TickResult;
    }
}

mixin UCBT_Failer Failer(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_Failer();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_Failer Failer(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_Failer();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_Failer Failer(UCBT_Tree Tree)
{
    auto NewNode = UCBT_Failer();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

/** Returns success when the next node has returned success n times. Returns failure when the next node returns failure. Returns running otherwise. */
UCLASS()
class UCBT_RepeatAmount : UCBT_Decorator
{
    UCBT_RepeatAmount(int InTimesToRepeat)
    {
        TimesToRepeat = InTimesToRepeat;
    }

    UPROPERTY()
    int TimesToRepeat = 1;

    UPROPERTY()
    private int TimesDone = 0;

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_RepeatAmount::Tick"));
        ECBT_ExecutionResult Result = _NextNode.ExecuteTick();
        
        if (Result == ECBT_ExecutionResult::Running)
            return Result;

        if (Result == ECBT_ExecutionResult::Failure)
        {
            TimesDone = 0;
            return ECBT_ExecutionResult::Failure;
        }

        TimesDone++;
        if (TimesDone == TimesToRepeat)
        {
            TimesDone = 0;
            return ECBT_ExecutionResult::Success;
        }

        return ECBT_ExecutionResult::Running;
    }

#if WITH_IMGUI
    void DisplayImGuiForNode() override
    {               
        ImGui::SameLine();
        ImGui::TextColored(FColor(255, 255, 255, 128), f" ({TimesDone + 1}/{TimesToRepeat} Repeats)");

        ImGui::SetTooltipOnHover(f"Success after {TimesToRepeat} repeats.");        
    }
#endif
}

mixin UCBT_RepeatAmount RepeatAmount(UCBT_FlowControlNode Parent, int TimesToRepeat)
{
    auto NewNode = UCBT_RepeatAmount(TimesToRepeat);
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_RepeatAmount RepeatAmount(UCBT_Decorator Parent, int TimesToRepeat)
{
    auto NewNode = UCBT_RepeatAmount(TimesToRepeat);
    Parent.NextNode(NewNode);

    return NewNode;
}

/** Returns success when the next node has returned success n times. Never returns failure. Returns running otherwise. */
UCLASS()
class UCBT_RepeatUntilSuccessAmount : UCBT_Decorator
{
    UCBT_RepeatUntilSuccessAmount(int InTimesToRepeat)
    {
        TimesToRepeat = InTimesToRepeat;
    }

    UPROPERTY()
    int TimesToRepeat = 1;
    
    UPROPERTY()
    private int TimesDone = 0;

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_RepeatUntilSuccessAmount::Tick"));
        ECBT_ExecutionResult Result = _NextNode.ExecuteTick();
        
        if (Result == ECBT_ExecutionResult::Running)
            return Result;

        TimesDone++;
        if (TimesDone == TimesToRepeat)
        {
            TimesDone = 0;
            return ECBT_ExecutionResult::Success;
        }

        return ECBT_ExecutionResult::Running;
    }

#if WITH_IMGUI
    void DisplayImGuiForNode() override
    {               
        ImGui::SameLine();
        ImGui::TextColored(FColor(255, 255, 255, 128), f" ({TimesDone + 1}/{TimesToRepeat} Successes)");

        ImGui::SetTooltipOnHover(f"Success after {TimesToRepeat} successes.");        
    }
#endif
}

mixin UCBT_RepeatUntilSuccessAmount RepeatUntilSuccessAmount(UCBT_FlowControlNode Parent, int TimesToRepeat)
{
    auto NewNode = UCBT_RepeatUntilSuccessAmount(TimesToRepeat);
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_RepeatUntilSuccessAmount RepeatUntilSuccessAmount(UCBT_Decorator Parent, int TimesToRepeat)
{
    auto NewNode = UCBT_RepeatUntilSuccessAmount(TimesToRepeat);
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_RepeatUntilSuccessAmount RepeatUntilSuccessAmount(UCBT_Tree Tree, int TimesToRepeat)
{
    auto NewNode = UCBT_RepeatUntilSuccessAmount(TimesToRepeat);
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

/** Returns success when the next node returns success. It returns failure when the next node has failed n times. Returns running otherwise. */
UCLASS()
class UCBT_RetryAmount : UCBT_Decorator
{
    UCBT_RetryAmount(int InMaximumTries)
    {
        MaximumTries = InMaximumTries;
    }

    UPROPERTY()
    int MaximumTries = 1;
    
    UPROPERTY()
    private int NumTries = 0;

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_RetryAmount::Tick"));
        ECBT_ExecutionResult Result = _NextNode.ExecuteTick();

        if (Result == ECBT_ExecutionResult::Running)
            return Result;

        if (Result == ECBT_ExecutionResult::Success)
        {
            NumTries = 0;
            return ECBT_ExecutionResult::Success;
        }

        NumTries++;
        if (NumTries == MaximumTries)
        {
            NumTries = 0;
            return ECBT_ExecutionResult::Failure;
        }

        return ECBT_ExecutionResult::Running;
    }

#if WITH_IMGUI
    void DisplayImGuiForNode() override
    {               
        ImGui::SameLine();
        ImGui::TextColored(FColor(255, 255, 255, 128), f" ({NumTries + 1}/{MaximumTries} Repeats)");

        ImGui::SetTooltipOnHover(f"Failure after {MaximumTries} tries.");        
    }
#endif
}

mixin UCBT_RetryAmount RetryAmount(UCBT_FlowControlNode Parent, int MaximumTries)
{
    auto NewNode = UCBT_RetryAmount(MaximumTries);
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_RetryAmount RetryAmount(UCBT_Decorator Parent, int MaximumTries)
{
    auto NewNode = UCBT_RetryAmount(MaximumTries);
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_RetryAmount RetryAmount(UCBT_Tree Tree, int MaximumTries)
{
    auto NewNode = UCBT_RetryAmount(MaximumTries);
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

UCLASS()
class UNodeCooldownCalculation
{
    UNodeCooldownCalculation(float32 InBaseCooldown)
    {
        BaseCooldown = InBaseCooldown;
    }

    UPROPERTY()
    float32 BaseCooldown = 1.0f;

    float32 GetCooldown(UAIState_Combat_G1R Combat)
    {
        return BaseCooldown;
    }
}

UCLASS()
class UNodeCooldownCalculation_TauntTypeCooldown : UNodeCooldownCalculation
{
    UNodeCooldownCalculation_TauntTypeCooldown(FGameplayTag TauntTag)
    {
        TauntTypeTag = TauntTag;
    }

    UPROPERTY()
    FGameplayTag TauntTypeTag;

    float32 GetCooldown(UAIState_Combat_G1R Combat) override
    {
        if (Combat.Self.HasGameplayTag(GameplayTag::Combat_TestCharacterSimple) && Combat.Config.bUseTestTauntCooldown)
            return Combat.Config.TestTauntCooldown;
        
        if (!TauntTypeTag.IsValid() || !IsValid(Combat.CurrentCombatBehaviorSet))
            return 0.0f;

        return Combat.CurrentCombatBehaviorSet.GetTauntCooldownForType(TauntTypeTag);
    }
}

UCLASS()
class UNodeCooldownCalculation_TauntGeneralCooldownFromType : UNodeCooldownCalculation
{
    UNodeCooldownCalculation_TauntGeneralCooldownFromType(FGameplayTag TauntTag)
    {
        TauntTypeTag = TauntTag;
    }

    UPROPERTY()
    FGameplayTag TauntTypeTag;

    float32 GetCooldown(UAIState_Combat_G1R Combat) override
    {
        if (IsValid(Combat.Self) && Combat.Self.HasGameplayTag(GameplayTag::Combat_TestCharacterSimple) && Combat.Config.bUseTestTauntCooldown)
            return Combat.Config.TestTauntCooldown;

        if (!TauntTypeTag.IsValid() || !IsValid(Combat.CurrentCombatBehaviorSet))
            return 0.0f;

        return Combat.CurrentCombatBehaviorSet.GetTauntGeneralCooldownFromType(TauntTypeTag);
    }
}

UCLASS()
class UNodeCooldownCalculation_TauntFromCurrentBehaviorSet_Short : UNodeCooldownCalculation
{
    float32 GetCooldown(UAIState_Combat_G1R Combat) override
    {
        if (Combat.Self.HasGameplayTag(GameplayTag::Combat_TestCharacterSimple) && Combat.Config.bUseTestTauntCooldown)
            return Combat.Config.TestTauntCooldown;

        return Combat.CurrentCombatBehaviorSet.GetTauntCooldownForType(GameplayTag::Combat_Taunt_Short);
    }
}

UCLASS()
class UNodeCooldownCalculation_TauntFromCurrentBehaviorSet_Long : UNodeCooldownCalculation
{
    float32 GetCooldown(UAIState_Combat_G1R Combat) override
    {
        if (Combat.Self.HasGameplayTag(GameplayTag::Combat_TestCharacterSimple) && Combat.Config.bUseTestTauntCooldown)
            return Combat.Config.TestTauntCooldown;

        return Combat.CurrentCombatBehaviorSet.GetTauntCooldownForType(GameplayTag::Combat_Taunt_Observer);
    }
}

UCLASS()
class UNodeCooldownCalculation_TauntFromCurrentBehaviorSet_Aggressive : UNodeCooldownCalculation
{
    float32 GetCooldown(UAIState_Combat_G1R Combat) override
    {
        if (Combat.Self.HasGameplayTag(GameplayTag::Combat_TestCharacterSimple) && Combat.Config.bUseTestTauntCooldown)
            return Combat.Config.TestTauntCooldown;

        return Combat.CurrentCombatBehaviorSet.GetTauntCooldownForType(GameplayTag::Combat_Taunt_Aggressive);
    }
}

UCLASS()
class UNodeCooldownCalculation_WeaponSkillLevel : UNodeCooldownCalculation
{
    UNodeCooldownCalculation_WeaponSkillLevel(float32 InBaseCooldown)
    {
        BaseCooldown = InBaseCooldown;
    }

    float32 GetCooldown(UAIState_Combat_G1R Combat) override
    {
        return BaseCooldown * Combat.GetAttackBehaviorCooldownMultiplierBasedOnSkill();
    }
}

///////////////////////////////////////////
// Probability calculations
///////////////////////////////////////////

/** Object to pass into UCBT_ProbabilityCheck node to have a dynamic probability */
UCLASS()
class UNodeProbabilityCalculation
{
    UNodeProbabilityCalculation(float InProbability)
    {
        BaseProbability = InProbability;
    }

    UPROPERTY()
    float BaseProbability = 1.0f;

    float GetProbability()
    {
        return BaseProbability;
    }

    /** Combat class that contains this behavior tree node */
    UAIState_Combat_G1R GetCombat() const property
    {
        UObject Next = Outer;
        while (IsValid(Next) && !Next.IsA(UAIState_Combat_G1R::StaticClass()))
        {
            Next = Next.Outer;
        }

        return Cast<UAIState_Combat_G1R>(Next);
    }
}

/** Object to pass into UCBT_ProbabilityCheck node to have a dynamic probability */
UCLASS()
class UNodeProbabilityCalculation_CloseCurrentDynamicCombo : UNodeProbabilityCalculation
{
    float GetProbability() override
    {
        auto CurrentActionCombatMove = Combat.CurrentActionCombatMove;
        if (!IsValid(CurrentActionCombatMove)) 
            return BaseProbability;

        UCM_AttackDCombo CurrentComboMove = Cast<UCM_AttackDCombo>(CurrentActionCombatMove);
        if (!IsValid(CurrentComboMove))
            return BaseProbability;

        return Combat.GetChanceToCloseCombo(CurrentComboMove.AttacksDone);
    }
}

/** Requests an attack token from GL, it only executes its child node if the token is received. When the child node fails, cancels or succeeds, it returns the token */
UCLASS()
class UCBT_AttackTokenRequest : UCBT_Decorator
{
    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_AttackTokenRequest::Tick"));
        ECBT_ExecutionResult Result = ECBT_ExecutionResult::Failure;

        if (Combat.CombatGroup.DoesCharacterHaveAttackToken(Combat.Self))
        {
            Result = _NextNode.ExecuteTick();
        }
        else if (Combat.CombatGroup.RequestAttackToken(Combat.Self))
        {
            Result = _NextNode.ExecuteTick();
        }
        else
            return ECBT_ExecutionResult::Failure;

        if (Result == ECBT_ExecutionResult::Running)
            return Result;

        if (Result == ECBT_ExecutionResult::Success)
        {
            Combat.CombatGroup.SpendAttackToken(Combat.Self);
        }

        return Result;
    }
}

mixin UCBT_AttackTokenRequest AttackTokenRequest(UCBT_FlowControlNode Parent)
{
    auto NewNode = UCBT_AttackTokenRequest();
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_AttackTokenRequest AttackTokenRequest(UCBT_Decorator Parent)
{
    auto NewNode = UCBT_AttackTokenRequest();
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_AttackTokenRequest AttackTokenRequest(UCBT_Tree Tree)
{
    auto NewNode = UCBT_AttackTokenRequest();
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}

UCLASS()
class UCBT_While : UCBT_Decorator
{
    UCBT_While(UFightAI_CombatSituation InSituation)
    {
        Situation = InSituation;
    }   

    UPROPERTY()
    UFightAI_CombatSituation Situation;

    ECBT_ExecutionResult Tick() override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCBT_While::Tick"));
        if (!ensure(IsValid(_NextNode)))
            return ECBT_ExecutionResult::Failure;

        bool bIsInSituation = Situation.IsInSituation();
        
        if (bIsInSituation)
        {
            return _NextNode.ExecuteTick();
        }
        
        if (_NextNode.GetLastExecutionResult() == ECBT_ExecutionResult::Running)
        {
            TryCancelExecution();
        }

        return ECBT_ExecutionResult::Failure;
    }

    FString GetDisplayName() const override
    {
        if (!IsValid(Situation))
            return "While: None";
        return "While: " + Situation.GetDisplayName();
    }

    bool TryCancelExecution() override
    {
        if (IsValid(_NextNode))
            return false;
        
        return _NextNode.TryCancelExecution();
    }
    
}

mixin UCBT_While While(UCBT_FlowControlNode Parent, UFightAI_CombatSituation Situation)
{
    auto NewNode = UCBT_While(Situation);
    Parent.DoNode(NewNode);

    return NewNode;
}

mixin UCBT_While While(UCBT_Decorator Parent, UFightAI_CombatSituation Situation)
{
    auto NewNode = UCBT_While(Situation);
    Parent.NextNode(NewNode);

    return NewNode;
}

mixin UCBT_While While(UCBT_Tree Tree, UFightAI_CombatSituation Situation)
{
    auto NewNode = UCBT_While(Situation);
    Tree.Node = NewNode;
    NewNode.ParentNode = Tree;

    return NewNode;
}