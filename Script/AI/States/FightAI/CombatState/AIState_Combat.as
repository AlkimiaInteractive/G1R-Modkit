/** Multiplier value and situation condition to apply to Combat Fitness */
UCLASS(Abstract)
class UCombatFitnessMultiplier
{
    UPROPERTY(EditDefaultsOnly)
    protected float DefaultValue = 1.0f;

    UPROPERTY()
    UAIState_Combat Combat = nullptr;

    UPROPERTY(EditDefaultsOnly)
    FString Description = "";

    UFUNCTION()
    bool ShouldApply()
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCombatFitnessMultiplier::ShouldApply"));

        if (!IsValid(Combat))
            return false; 

        return true;
    };

    UFUNCTION()
    float GetValue() property
    {
        return DefaultValue;
    }
}

UCLASS()
class USensedIncommingAttack
{
    USensedIncommingAttack(const FRememberedPerception&in InPerception)
    {
        Perception = InPerception;
    }

    UPROPERTY()
    FRememberedPerception Perception;
    
    FGameplayTag GetAttackTypeTag() const property
    {
        return Perception.EventTag;
    }
    
    float64 GetEstimatedTimeLeftUntilImpact() const property
    {
        return Perception.EstimatedTimeLeftUntilImpact;
    }
    
    float64 GetTimeSecondsFromStartToDamage() const property
    {
        return Perception.InitialTotalDurationOfEstimatedTimeOfImpact;
    }
    
    AGothicCharacter GetInstigator() const property
    {
        return Perception.Instigator.Character;
    }

    UPROPERTY()
    EIncomingAttackReaction Reaction = EIncomingAttackReaction::Count;

    UPROPERTY()
    bool bReactionDone = false;
}

enum EIncomingAttackReaction
{
    None,
    Wait,
    Dodge,
    Parry,
    Count
}

/** 
 * Basic combat state that provides combat related perceptions
 */
UCLASS()
class UAIState_Combat : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default AIStateTag = GameplayTag::AIState_Conflict_Combat;
    default BudgetWorkload = BudgetWorkload::CombatAI;

    default SwitchAIStateMode = ESwitchAIStateMode::EndState_DisallowGracefulExit;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Instant;

    /** Default Base Priority of this agent when assigning roles */
    UPROPERTY(EditDefaultsOnly)
    float AgentDefaultBasePriority = 1.0f;

    /** When the enemy is closer than this, ai should move away */
    UPROPERTY(EditDefaultsOnly)
    float EnemyTooCloseDistance = 70.0f;

    /** When the enemy is closer than this, it's considered in melee range. */
    UPROPERTY(EditDefaultsOnly)
    float EnemyCloseDistance = 250.0f;

    /** When the enemy is closer than this but further than EnemyCloseDistance, it's considered in range for long range melee attacks */
    UPROPERTY(EditDefaultsOnly)
    float EnemyLungeDistance = 300.0f;

    /** When the enemy is closer than this, it's considered in combat range. */
    UPROPERTY(EditDefaultsOnly)
    float EnemyCombatDistance = 1000.0f;

    UPROPERTY()
    float64 TimeSecondsToggledBlockStance = -MAX_flt;

    /** Object containing the role preference variables */
    UPROPERTY()
    TArray<UCombatFitnessMultiplier> CombatFitnessMultipliers;

    FGameplayTagContainer ImpairingTags;
    default ImpairingTags.AddTag(GameplayTag::State_Dead);
    default ImpairingTags.AddTag(GameplayTag::State_Defeated);
    default ImpairingTags.AddTag(GameplayTag::Debuff_Freeze);
    default ImpairingTags.AddTag(GameplayTag::Debuff_Paralyzed);
    default ImpairingTags.AddTag(GameplayTag::Debuff_Fear);
    default ImpairingTags.AddTag(GameplayTag::Debuff_Sleep);

    /** Time of last assess */
    float64 LastAssessTimeSeconds = 0.0f;

    /** Where the enemy was when we checked in the last cycle */
    UPROPERTY()
    FTransform EnemyTransformOnLastAssess;

    /** Time when we entered this combat state. */
    UPROPERTY(NotEditable)
    float TimeStateStarted = 0.0f;

    /** Kind of group we should join/create when combat starts. */
    TSubclassOf<UAIGroup_Combat> CombatGroupClass;

    /** Arrays of behavior nodes common accross all Main behavior trees of this combat class */
    UCBT_FlowControlNode CommonBehavior_HighPriority = UCBT_FlowControlNode();

    /** Arrays of behavior nodes common accross all Main behavior trees of this combat class */
    UCBT_FlowControlNode CommonBehavior_MediumPriority = UCBT_FlowControlNode();

    /** Arrays of behavior nodes common accross all Secondary behavior trees of this combat class */
    UCBT_FlowControlNode CommonBehavior_LowPriority = UCBT_FlowControlNode();

    /** Arrays of behavior nodes common accross all Movement behavior trees of this combat class */
    UCBT_FlowControlNode CommonBehavior_Movement = UCBT_FlowControlNode();

    /** Behavior sets this AI will use */
    UCombatBehaviorSetManager CombatBehaviorSetManager = UCombatBehaviorSetManager();

    /** Last combat behavior set class loaded */
    UCombatBehaviorSet CurrentCombatBehaviorSet = nullptr;

    /** Last known Group order for this character. */
    ECombatRole MyLastKnownOrder = ECombatRole::None;

    /** How many hits we landed on our opponent during the current action. Reset before DoCombatAction() is called. */
    int NumHitsInCycle = 0;

    /** How many hits we landed on our opponent while within this combat state. */
    int NumHitsTotal = 0;

    bool bForgotLastHit = true;

    /** World.TimeSeconds when this character last switched roles. */
    float SecondsILastSwitchedRoles = -1.0f;

    /** Sensed incoming attacks */
    TArray<USensedIncommingAttack> SensedIncomingAttacks;    

    FString GetDisplayName() const override
    {
        return "Base Combat";
    }

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DisplayImGui()
    {
        if (ImGui::CollapsingHeader("What is the enemy doing?", true))
        {
            if (ImGui::BeginTable("##enemy-actions", 2))
            {
                ImGui::TableNextColumn(); ImGui::Text("DistanceToTarget");             ImGui::TableNextColumn(); ImGui::Text("" +GetDistanceToCharacterOfInterest());                   
                ImGui::TableNextColumn(); ImGui::BoolIcon(IsEnemyMoving());            ImGui::TableNextColumn(); ImGui::Text("EnemyIsMoving");                     
                ImGui::TableNextColumn(); ImGui::BoolIcon(IsEnemyFacingMe());          ImGui::TableNextColumn(); ImGui::Text("EnemyIsFacingMe");                 
                ImGui::TableNextColumn(); ImGui::BoolIcon(AI.IsFocusedBy(CharacterOfInterest));      ImGui::TableNextColumn(); ImGui::Text("EnemyHasFocusedMe");             
                ImGui::TableNextColumn(); ImGui::BoolIcon(IsEnemyTurningTowardsMe());  ImGui::TableNextColumn(); ImGui::Text("EnemyIsTurningTowardsMe"); 
                ImGui::TableNextColumn(); ImGui::BoolIcon(IsEnemyRunningTowardsMe());  ImGui::TableNextColumn(); ImGui::Text("EnemyIsRunningTowardsMe"); 
                ImGui::TableNextColumn(); ImGui::BoolIcon(false);                      ImGui::TableNextColumn(); ImGui::Text("EnemyIsInWeaponCombo");       
                ImGui::TableNextColumn(); ImGui::BoolIcon(false);                      ImGui::TableNextColumn(); ImGui::Text("Hello world!");       
                ImGui::EndTable();
            }
        }

        if (ImGui::CollapsingHeader("What am I doing?", true))
        {
            if (ImGui::BeginTable("##my-actions", 2))
            {
                ImGui::TableNextColumn(); ImGui::BoolIcon(Self.CanMove());               ImGui::TableNextColumn(); ImGui::Text("CanMove");                                                                                      
                ImGui::TableNextColumn(); ImGui::BoolIcon(!Self.IsBlocked());            ImGui::TableNextColumn(); ImGui::Text("CanDoActions");                                                                                      
                ImGui::TableNextColumn(); ImGui::BoolIcon(Self.IsMoving());                  ImGui::TableNextColumn(); ImGui::Text("IsMoving");                                                                                      
                ImGui::TableNextColumn(); ImGui::BoolIcon(IsFacingEnemy());              ImGui::TableNextColumn(); ImGui::Text("IsFacingEnemy");         
                ImGui::TableNextColumn(); ImGui::BoolIcon(IsEnemyClose());               ImGui::TableNextColumn(); ImGui::Text("IsEnemyClose");                                                                              
                ImGui::TableNextColumn(); ImGui::BoolIcon(IsEnemyBarelyOutOfReach());    ImGui::TableNextColumn(); ImGui::Text("IsEnemyBarelyOutOfReach"); 
                ImGui::TableNextColumn(); ImGui::BoolIcon(IsRunningTowardsEnemy());      ImGui::TableNextColumn(); ImGui::Text("IsRunningTowardsEnemy");                                                            
                ImGui::TableNextColumn(); ImGui::BoolIcon(false);                        ImGui::TableNextColumn(); ImGui::Text("IsStrafingAroundEnemy");                                                            
                ImGui::TableNextColumn(); ImGui::BoolIcon(false);                        ImGui::TableNextColumn(); ImGui::Text("IsInWeaponCombo");                                                                        
                ImGui::TableNextColumn(); ImGui::BoolIcon(HasNoticedAnyIncomingAttack());  ImGui::TableNextColumn(); ImGui::Text("HasNoticedIncommingAttack");                                                                        
                ImGui::TableNextColumn(); ImGui::BoolIcon(Self.IsInBlockingStance());    ImGui::TableNextColumn(); ImGui::Text("IsInBlockingStance");
                ImGui::TableNextColumn(); ImGui::BoolIcon(Self.HasDrawnWeapon());        ImGui::TableNextColumn(); ImGui::Text("HasDrawnWeapon");
                ImGui::TableNextColumn(); ImGui::Text("Time since Blocking Toggle");     ImGui::TableNextColumn(); ImGui::Text("" + (World.TimeSeconds - TimeSecondsToggledBlockStance));                                                                   
                ImGui::TableNextColumn(); ImGui::Text("Walk Speed");                     ImGui::TableNextColumn(); ImGui::Text("" + Self.GetWalkSpeed());
                ImGui::TableNextColumn(); ImGui::Text("Mana");                           ImGui::TableNextColumn(); ImGui::Text("" + Self.GetManaAttribute() + "/" + Self.GetMaxManaAttribute());
                
                ImGui::EndTable();
            }
        }
    }
#endif

    UFUNCTION(BlueprintOverride)
    void TickTask(float DeltaTimeSecs)
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat::TickTask"));

        if (IsGroupLeader())
        {
            CombatGroup.Tick(DeltaTimeSecs);
        }

        // Make sure the more important enemies are updated more often than those in the background.
        if (MyLastKnownOrder == ECombatRole::None || MyLastKnownOrder == ECombatRole::ActiveAttacker)
        {
            BudgetWorkload = BudgetWorkload::CombatAIActiveAttacker;
        }
        else
        {
            BudgetWorkload = BudgetWorkload::CombatAI;
        }
    }

    /** Override to decide what happens before combat starts. (e.g. Draw a weapon) */
    void DoPrepareForCombat()
    {        
        SetCustomPathfollowingSetting(SetupCombatPathfollowingSettings());
        CombatBehaviorSetManager.CreatePackagesValidForCharacter(Self);

        DoCombatStartTaunt();
    }

void DoCombatStartTaunt()
    {
        if (!Context.HasTag(GameplayTag::Action_Taunt) || Self.IsSitting())
            return;

        if (Self.IsSwimming() || Self.IsDiving())
            return;

        if (DistanceToCharacterOfInterest < 500.0f)
            return;
        
        FGameplayTagContainer AllRequired;
        AllRequired.AddTag(GameplayTag::Combat_Taunt_Short);
        
        AI.TauntMatchingAll(AllRequired, FGameplayTagContainer());
    }


    /** Override to decide what happens after combat has ended. (e.g. Undraw a weapon) */
    void DoEndCombat()
    {
        if (Self.IsAiming())
        {
            FGameplayEventData Payload;
            GothicGAS::SendGameplayEvent(CharacterState, GameplayTag::End_Action_Aiming, Payload);
        }
    }

    /** Override to assess the situation the NPC finds itself in to choose the next action later. */
    void DoAssessSituation()
    {

    }

    /** Override to set variables after situation assessment */
    void DoPrepareCombatTick()
    {
        
    }

    /** Override to define the combat actions. This runs in parallel to the DoMovement coroutine. */
    void DoCombatAction()
    {

    }

    bool CanSwitchRolesRightNow() const
    {
        if (CharacterState.HasGameplayTag(GameplayTag::AICombatMove_LockRoles))
            return false;
        
        return true;
    }

    float CalculateFitness() const
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat::CalculateFitness"));
        if (Self.GetGothicAbilitySystemComponent().HasAnyGameplayTags(ImpairingTags))
            return 0.0f;                

        return CalculateTotalFitnessMultiplier();
    }

    float CalculateTotalFitnessMultiplier() const final
    {       
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat::CalculateTotalFitnessMultiplier"));

        float TotalFitnessMultiplier = 1.0f;
        for (auto FitnessMultiplier : CombatFitnessMultipliers)
        {
            FScopeCycleCounter ScopeCycleCounterFitnessMultiplierObject(FitnessMultiplier);

            if (!FitnessMultiplier.ShouldApply())
                continue;

            float Value = FitnessMultiplier.Value;
            TotalFitnessMultiplier *= Value;

            if (Value <= 0.01f)
                return TotalFitnessMultiplier;
        }

        return TotalFitnessMultiplier;
    }

    void SetupFitnessMultipliers() {}

    void AddFitnessMultiplier(UCombatFitnessMultiplier FitnessMultiplier)
    {
        FitnessMultiplier.Combat = this;
        CombatFitnessMultipliers.Add(FitnessMultiplier);
    }

    void CombatTelemetry()
    {
        auto PlayerCharacter = Gameplay::GetPlayerCharacter(0);
        if (!IsValid(PlayerCharacter))
            return;
        
        auto PlayerGothicCharacter = Cast<AGothicPlayerCharacter>(PlayerCharacter);
        if (!IsValid(PlayerGothicCharacter))
            return;

        auto PlayerState = Cast<AGothicPlayerState>(PlayerGothicCharacter.CharacterState);
        if (!IsValid(PlayerState))
            return;

        if (!IsValid(CharacterOfInterest))
            return;
        
        auto TargetId = CharacterOfInterest.CharacterUniqueName.ToString();
        auto InstigatorId = CharacterState.CharacterUniqueName.ToString();
        auto Assessment = StartingAssessmentTag.ToString();
        auto Pos = FIntVector2(Math::RoundToInt(CharacterState.CharacterLocation.X), Math::RoundToInt(CharacterState.CharacterLocation.Y));
        
        Log("[Telemetry] Combat Started");
        Log(f"\n[Telemetry]      PlayerState: {PlayerState}");
        Log(f"\n[Telemetry]      TargetId: {TargetId}");
        Log(f"\n[Telemetry]      InstigatorId: {InstigatorId}");
        Log(f"\n[Telemetry]      Assessment: {Assessment}");
        Log(f"\n[Telemetry]      PosX: {Pos.X}");
        Log(f"\n[Telemetry]      PosY: {Pos.Y}");

        UTelemetryHelper::OnCombatStart(PlayerState, TargetId, InstigatorId, Assessment, Pos.X, Pos.Y);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask();

        CombatTelemetry();

        TimeStateStarted = World.TimeSeconds;
        
        DoPrepareForCombat();

        while (!bShouldExitState)
        {
            DoAssessSituation();

            DoPrepareCombatTick();

            // auto AITargetEnemy = AI.GetTargetEnemy();
            // check (AITargetEnemy != nullptr);

            ForgetNoticedPerceptions();
            NumHitsInCycle = 0;

            if (CharacterOfInterest != nullptr)
            {
                EnemyTransformOnLastAssess = CharacterOfInterest.ActorTransform;
            }

            if (CombatGroup != nullptr)
            {
                MyLastKnownOrder = CombatGroup.RoleSystem.GetCharactersRoleType(Self);
            }

            DoCombatAction();

            WaitOneTick();
        }
    }

    /** Returns true if the given role is the same as this agent's current role */
    bool IsCurrentRole(ECombatRole Role) const
    {
        return GetCurrentRole() == Role;
    }

    /** Returns this character's current group role */
    ECombatRole GetCurrentRole() const
    {
        if (!IsValid(CombatGroup) || !IsValid(CombatGroup.RoleSystem))
            return ECombatRole::None;

        return CombatGroup.RoleSystem.GetCharactersRoleType(Self);
    }
    
    /** @return True, if this combat (sub)state has been going on for the given amount of time. */
    bool HasBeenInStateForSeconds(float Seconds) const
    {
        return World.TimeSeconds - TimeStateStarted >= Seconds;
    }

    bool IsEnemyFacingMe() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return CharacterOfInterest.IsFacingOtherCharacter(Self);
    }

    bool IsEnemyDoingCombo() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return CharacterOfInterest.IsInAttackCombo();
    }

    bool IsFacingEnemy() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return Self.IsFacingOtherCharacter(CharacterOfInterest);
    }

    bool IsEnemyIsOnMyBack() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return Self.IsBackFacingOtherCharacterDirectly(CharacterOfInterest);

    }

    bool IsMoving() const
    {
        return Self.IsMoving();
    }

    bool IsPathfollowing() const
    {
        return Self.IsPathfollowing();
    }

    bool IsEnemyMoving() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return CharacterOfInterest.IsMoving();
    }

    bool IsEnemyTooClose() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return CharacterOfInterest.GetDistanceToHitCollision(Self.ActorLocation) <= EnemyTooCloseDistance;
    }

    bool IsEnemyClose() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return CharacterOfInterest.GetDistanceToHitCollision(Self.ActorLocation) <= EnemyCloseDistance;
    }

    bool IsEnemyAtLungeDistance() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        float Distance = CharacterOfInterest.GetDistanceToHitCollision(Self.ActorLocation);
        return Distance <= EnemyLungeDistance && Distance > EnemyCloseDistance;
    }

    bool IsEnemyBarelyOutOfReach() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        float Distance = CharacterOfInterest.GetDistanceToHitCollision(Self.ActorLocation);

        return Distance > EnemyLungeDistance && Distance < EnemyCombatDistance;
    }

    bool IsEnemyWithinDangerousDistance() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        float Distance = CharacterOfInterest.GetDistanceToHitCollision(Self.ActorLocation);
        return Distance <= EnemyCloseDistance;
    }

    /** Returns true of the enemy is currently not facing us, but their desired rotation is suggesting that they want to. */
    bool IsEnemyTurningTowardsMe() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return CharacterOfInterest.IsTurningTowardsOtherCharacter(Self);
    }

    bool IsEnemyRunningTowardsMe() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return CharacterOfInterest.IsMovingTowardsOtherCharacter(Self);
    }

    bool IsRunningTowardsEnemy() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return Self.IsMovingTowardsOtherCharacter(CharacterOfInterest);
    }

    bool IsStrafing() const
    {
        return Math::Abs(Self.Velocity.UnsafeNormal.DotProduct(Self.ActorForwardVector)) < 0.5f;
    }

    bool IsEnemyStrafing() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return Math::Abs(CharacterOfInterest.Velocity.UnsafeNormal.DotProduct(CharacterOfInterest.ActorForwardVector)) < 0.5f;
    }

    void ForgetNoticedPerceptions()
    {
        LastAssessTimeSeconds = World.TimeSeconds;

        for (auto State : AI.CurrentStateStack)
        {
            if (State == this)
                break;

            UAIState_Combat ParentCombatState = Cast<UAIState_Combat>(State);

            if (ParentCombatState != nullptr)
            {
                ParentCombatState.ForgetNoticedPerceptions();
            }
        }
    }

    bool HasNoticedAnyIncomingAttack() const
    {
        return Self.Perception.Memory
            .Filter()
            .FilterAfter(LastAssessTimeSeconds)
            .FilterByType(GameplayTag::Perception_Character_Combat_Melee_IncommingAttack_Start)
            .FilterOriginCharacterIs(Self)
            .HasAny();
    }

    bool HasIncomingAttack(float TimeSecondsLeft = MAX_flt)
    {
        AGothicCharacter Instigator;
        if (!HasSensedIncomingAttackWithTagAndTimeLeft(Instigator, TimeSecondsLeft = TimeSecondsLeft))
            return false;

        return true;
    }

    bool HasIncomingAttackFromFront(float TimeSecondsLeft = MAX_flt)
    {
        AGothicCharacter Instigator;
        if (!HasSensedIncomingAttackWithTagAndTimeLeft(Instigator, TimeSecondsLeft = TimeSecondsLeft))
            return false;

        if (Instigator != nullptr && Self.IsBackFacingOtherCharacterDirectly(Instigator))
            return false;

        return true;
    }

    bool HasIncomingAttackFromBack(float TimeSecondsLeft = MAX_flt) 
    {
        AGothicCharacter Instigator;
        if (!HasSensedIncomingAttackWithTagAndTimeLeft(Instigator, TimeSecondsLeft = TimeSecondsLeft))
            return false;

        if (Instigator != nullptr && !Self.IsBackFacingOtherCharacterDirectly(Instigator))
            return false;

        return true;
    }

    bool HasIncomingAttackRightFromFront(float64 TimeSecondsLeft = MAX_flt)
    {
        AGothicCharacter Instigator;
        if (!HasSensedIncomingAttackWithTagAndTimeLeft(Instigator, GameplayTag::Combat_Attack_Right, TimeSecondsLeft = TimeSecondsLeft))
            return false;

        if (Instigator != nullptr && Self.IsBackFacingOtherCharacterDirectly(Instigator))
            return false;

        // Print("Incoming Attack Right from Front");
        return true;
    }

    bool HasIncomingAttackLeftFromFront(float64 TimeSecondsLeft = MAX_flt)
    {
        AGothicCharacter Instigator;
        if (!HasSensedIncomingAttackWithTagAndTimeLeft(Instigator, GameplayTag::Combat_Attack_Left, TimeSecondsLeft = TimeSecondsLeft))
            return false;

        if (Instigator != nullptr && Self.IsBackFacingOtherCharacterDirectly(Instigator))
            return false;

        // Print("Incoming Attack Left from Front");
        return true;
    }

    bool HasIncomingAttackTopFromFront(float64 TimeSecondsLeft = MAX_flt)
    {
        AGothicCharacter Instigator;
        if (!HasSensedIncomingAttackWithTagAndTimeLeft(Instigator, GameplayTag::Combat_Attack_Top, TimeSecondsLeft = TimeSecondsLeft))
            return false;

        if (Instigator != nullptr && Self.IsBackFacingOtherCharacterDirectly(Instigator))
            return false;

        // Print("Incoming Attack Top from Front");
        return true;
    }

    bool HasIncomingAttackBottomFromFront(float64 TimeSecondsLeft = MAX_flt)
    {
        AGothicCharacter Instigator;
        if (!HasSensedIncomingAttackWithTagAndTimeLeft(Instigator, GameplayTag::Combat_Attack_Bottom, TimeSecondsLeft = TimeSecondsLeft))
            return false;

        if (Instigator != nullptr && Self.IsBackFacingOtherCharacterDirectly(Instigator))
            return false;

        // Print("Incoming Attack Bottom from Front");
        return true;
    }

    bool HasSensedIncomingAttackWithTagAndTimeLeft(AGothicCharacter&out OutInstigator, FGameplayTag AttackTag = FGameplayTag(), float64 TimeSecondsLeft = MAX_flt)
    {
        bool bAttackFound = false;
        TArray<USensedIncommingAttack> ElementsToRemove;

        for (auto Attack : SensedIncomingAttacks)
        {
            if (Attack.bReactionDone || Attack.EstimatedTimeLeftUntilImpact <= 0.0f)
            {
                ElementsToRemove.Add(Attack);
                continue;
            }

            if (!Attack.Instigator.IsDoingAttack())
            {
                ElementsToRemove.Add(Attack);
                continue;
            }

            if (Attack.EstimatedTimeLeftUntilImpact > TimeSecondsLeft)
                continue;

            if (!Attack.Instigator.IsFacingOtherCharacter(Self))
                continue;

            if (Attack.Instigator.GetFeetLocation().Distance(Self.GetFeetLocation()) > Self.SimpleCollisionRadius + 300.0f)
                continue;

            OutInstigator = Attack.Instigator;

            bAttackFound = true;
            break;
        }

        for (auto Element : ElementsToRemove)
        {
            SensedIncomingAttacks.Remove(Element);
        }

        return bAttackFound;
    }

    bool HasNoticedHitOnTarget() const
    {
        return Self.Perception.Memory
            .Filter()
            .FilterAfter(LastAssessTimeSeconds)
            .FilterByType(GameplayTag::Perception_Attack_Hit)
            .FilterAffectedCharacterIsTarget()
            .FilterOriginCharacterIs(Self)
            .HasAny();
    }

    bool HasNoticedDamageOnTarget() const
    {
        return Self.Perception.Memory
            .Filter()
            .FilterAfter(LastAssessTimeSeconds)
            .FilterByType(GameplayTag::Perception_Attack_Hit_Damaged)
            .FilterAffectedCharacterIsTarget()
            .FilterOriginCharacterIs(Self)
            .HasAny();
    }

    bool HasNoticedMissOnTarget() const
    {
        return Self.Perception.Memory
            .Filter()
            .FilterAfter(LastAssessTimeSeconds)
            .FilterByType(GameplayTag::Perception_Incoming_Attack_Missed)
            .FilterOriginCharacterIs(Self)
            .HasAny();
    }

    bool HasNoticedDamageOnSelf() const
    {
        return Self.Perception.Memory
            .Filter()
            .FilterAfter(LastAssessTimeSeconds)
            .FilterByType(GameplayTag::Perception_Incoming_Attack_Hit_Damaged)
            .FilterOriginCharacterIs(Self)
            .HasAny();
    }

       bool HasNoticedDamageOnSelfLastSeconds(float32 seconds) const
    {
        return Self.Perception.Memory
            .Filter()
            .FilterAfter(seconds)
            .FilterByType(GameplayTag::Perception_Incoming_Attack_Hit_Damaged)
            .FilterOriginCharacterIs(Self)
            .HasAny();
    }

    bool HasNoticedHitOnSelf() const
    {
        return Self.Perception.Memory
            .Filter()
            .FilterAfter(LastAssessTimeSeconds)
            .FilterByType(GameplayTag::Perception_Incoming_Attack_Hit)
            .FilterOriginCharacterIs(Self)
            .HasAny();
    }

    bool HasNoticedCharacterLaunchingProjectileAtSelf()
    {
        auto MemoryArray = Self.Perception.Memory
            .Filter()
            .FilterAfter(LastAssessTimeSeconds)
            .FilterByType(GameplayTag::Event_Perception_Update)
            .ToArray();

        for (auto MemoryEvent : MemoryArray)
        {
            if (!IsValid(MemoryEvent.Origin.Character))
                continue;
            
            if (!MemoryEvent.Origin.Character.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_LaunchingSpell))
                continue;

            if (!MemoryEvent.Origin.Character.HasDrawnMagicSpellWithSpec(GameplayTag::AISpellKeywords_ProjectileSpeed))
                continue;

            if (!MemoryEvent.Origin.Character.IsFacingOtherCharacterDirectly(Self))
                continue;

            return true;
        }

        return false;
    }

    bool IsGroupLeader() const
    {
        if (!IsValid(CombatGroup))
            return false;
        
        return CombatGroup.GetFightLeader() == Self;
    }

    FVector RotatingPointAround(FVector Location, float Radius, float Speed)
    {
        return Location + FVector(Math::Sin(World.TimeSeconds * Speed), 
                                  Math::Cos(World.TimeSeconds * Speed), 0.0f) * Radius;
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        Super::OnDestroy(bInOwnerFinished);
        
        if (!bInOwnerFinished)
        {
            AI.StopFollowingActor(AI.TargetEnemy);
        }

        DoEndCombat();

        AI.CancelAITasksOfClass(UAITask_CombatMove::StaticClass());
    }

    /** How many seconds have passed since this character was hit? */
    float GetSecondsSinceLastHitOnMe() const property
    {
        auto MemoryArray = Self.Perception.Memory
            .Filter()
            .FilterAffectedCharacterIs(Self)
            .FilterByType(GameplayTag::Perception_Incoming_Attack_Hit)
            .ToArray();
        
        if (MemoryArray.Num() == 0)
            return -1.0f;
        
        return World.TimeSeconds - MemoryArray.Last().TimeUpdated;
    }

    /** How many seconds have passed since this character switched roles? */
    float GetSecondsSinceLastRoleSwitch() const property
    {
        if (SecondsILastSwitchedRoles < 0.0f)
            return -1.0f;

        return World.TimeSeconds - SecondsILastSwitchedRoles;
    }
    
    /** Combat group we're currently part of (might be null) */
    UAIGroup_Combat GetCombatGroup() const property
    {
        if (!IsValid(AI))
            return nullptr;

        return AI.GetGroupOfClass(UAIGroup_Combat);
    }

    /** Distance from us to our enemy */
    float GetDistanceToCharacterOfInterest() const property 
    { 
        if (!IsValid(CharacterOfInterest))
            return -1.0f;

        FVector CollisionPoint = GothicCombat::GetTargetClosestHurtCollisionPoint(AI.Character,CharacterOfInterest);
        if (CollisionPoint == FVector::ZeroVector)
        {
            Log(n"Combat", "GothicCombat::GetTargetClosestHurtCollisionPoint returned ZeroVector");
            return Self.FeetLocation.Distance(CharacterOfInterest.FeetLocation);
        }
        
        return Self.ActorLocation.Distance(CollisionPoint);
    }

    /** Height relative to our enemy */
    float GetHeightRelativeToCharacterOfInterest() const property 
    { 
        if (!IsValid(CharacterOfInterest))
            return 0.0f;
        
        return CharacterState.ActorLocation.Z - CharacterOfInterest.ActorLocation.Z;
    }

    /** Distance from us to our enemy on the previous assessment cycle. */
    float GetDistanceToTargetOnLastAssess() const property 
    { 
        return EnemyTransformOnLastAssess.Location.Distance(Self.ActorLocation); 
    }

    /** Direction vector that is pointing away from the target (into our direction) */
    FVector GetDirectionAwayFromTarget() const property 
    { 
        if (!IsValid(CharacterOfInterest))
            return FVector::ForwardVector;

        return (Self.ActorLocation - CharacterOfInterest.ActorLocation).UnsafeNormal; 
    }

    /** Returns an array with all the roles this agent can fulfill */
    TArray<ECombatRole> GatherAvailableRoles() const
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIState_Combat::GetAvailableRoles"));

        TArray<ECombatRole> Roles = TArray<ECombatRole>();

        for (auto CombatBehaviorSet : CombatBehaviorSetManager.CombatBehaviorSets)
        {
            FScopeCycleCounter ScopeCycleCounterCombatBehaviorSetObject(CombatBehaviorSet);

            if (CombatBehaviorSet.IsA(UCombatBehaviorSet_Observer::StaticClass()))
                continue;

            UWeaponBehaviorSet WeaponBehaviorSet = Cast<UWeaponBehaviorSet>(CombatBehaviorSet);
            if (WeaponBehaviorSet != nullptr && Self.Inventory.GetItemsMatchingAnyTypeOf(WeaponBehaviorSet.WeaponTagContainer).IsEmpty())
                continue;

            FString Reason;
            if (CombatBehaviorSet.ShouldUseBehavior(Reason))
            {
                for (auto Role : CombatBehaviorSet.GetRoles())
                {
                    Roles.Add(Role);
                }
            }
        }

        if (HasObserverBehaviorSet())
        {
            Roles.Add(ECombatRole::Observer);
        }

        return Roles;
    }

    /** Get Role Slot Size for given role */
    float GetRoleSlotSize(ECombatRole Role) const
    {
        float Size = 0.0f;

        for (auto BehaviorSet : CombatBehaviorSetManager.CombatBehaviorSets)
        {
            if (!BehaviorSet.GetRoles().Contains(Role))
                continue;

            if (Size != 0.0f && Size <= BehaviorSet.RoleSlotSize)
                continue;

            Size = BehaviorSet.RoleSlotSize;
        }

        return Size;
    }

    /** Get Role Slot Size for given role */
    float GetCurrentBehaviorRoleSlotSize() const
    {
        if (CurrentCombatBehaviorSet != nullptr)
            return CurrentCombatBehaviorSet.RoleSlotSize;

        return 0.0f;
    }

    /** Get Role Priority Order for current combat behavior set */
    float GetAgentTotalPriority() const property
    {
        return AgentBasePriority /** AgentRolePriority*/;
    }
    
    /** Get Role priority order for the current combat behavior set */
    float GetAgentRolePriority() const property
    {
        if (CurrentCombatBehaviorSet != nullptr)
            return CurrentCombatBehaviorSet.RolePriority;

        return 1.0f;
    }

    /** Get the base priority of an agent in the hierarchy */
    float GetAgentBasePriority() const property
    {
        return AgentDefaultBasePriority;
    }

    /** Find a group that is targeting my target or create one if not found */
    void JoinGroupAgainstTarget(AGothicCharacter Target)
    {
        AI.LeaveGroupsWithClass(UAIGroup_Combat);

        auto AvailableGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(CombatGroupClass);

        for (auto Group : AvailableGroups)
        {
            UAIGroup_Combat CGroup = Cast<UAIGroup_Combat>(Group);
            if (!IsValid(CGroup) || CGroup.TargetEnemy != Target) 
                continue;

            AI.JoinGroup(CGroup);
            return;
        }

        AI.CreateAndJoinGroup(CombatGroupClass);
        CharacterOfInterest = Target;
    }

    bool HasObserverBehaviorSet() const
    {
        for (auto CombatBehaviorSet : CombatBehaviorSetManager.CombatBehaviorSets)
        {
            if (CombatBehaviorSet.IsA(UCombatBehaviorSet_Observer::StaticClass()))
                return true;
        }
        return false;
    }

    bool ShouldUseBehaviorWithRole(ECombatRole Role) const
    {
        for (auto CombatBehaviorSet : CombatBehaviorSetManager.CombatBehaviorSets)
        {
            if (!CombatBehaviorSet.GetRoles().Contains(Role))
                continue;
            
            FString Reason;
            if (CombatBehaviorSet.ShouldUseBehavior(Reason))
            {
                return true;
            }
        }

        return false;
    }

    bool ShouldAttack()
    {
        return true;
    }

    bool ShouldMove()
    {
        return true;
    }

    FGothicPathfollowSettings SetupCombatPathfollowingSettings(FString AddToDebugOwnerName = "")
    {
        FGothicPathfollowSettings PathfollowSettings = AI.CharacterState.DefaultPathfollowingSetting;
        PathfollowSettings.DebugOwnerName = "AIState_Combat_" + AddToDebugOwnerName;

        PathfollowSettings.CrowdAgentSeparationWeight = 20.f;   // stay further apart
        PathfollowSettings.bSlowDownAtGoal = false;    // "near goal" is 2 * AgentRadius around goal location
        PathfollowSettings.bEnablePathPolyOptimization = true;  // may prevent turnarounds when NPC gets moved off their corridor, but ignores NavFilter!
        
        // avoid everybody else and when I stand around don't force others to path around me 
        PathfollowSettings.CrowdGroupsBehaviour = ECrowdGroupsBehaviour::AvoidAllAgents;   
        PathfollowSettings.CrowdIdleBehaviour = ECrowdIdleBehaviour::TryAvoidMe;
        PathfollowSettings.CrowdAvoidanceQuality = EScriptableCrowdAvoidanceQuality::High_CarefulCombat;
        PathfollowSettings.MoveFocusSettings.FocalPointHeightMultiplier = 0.6f;

        return PathfollowSettings;
    }
}