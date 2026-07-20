

namespace FCombatGroupRole
{
    /** Returns the name of the role as string. */
    FString GetRoleName(ECombatRole Role)
    {
        FString FullName = "" + Role;

        int32 IndexColon = 0;
        int32 IndexSpace = 0;
        FullName.FindLastChar(':', IndexColon);
        FullName.FindChar(' ', IndexSpace);

        return FullName.Mid(IndexColon + 1, IndexSpace - IndexColon - 1);
    }
}

enum ECombatFormation
{
    None,
    Line,
    Queue,
    VShape,
    MovingCircle
};

/** Messages that can be sent from individual group members. */
namespace CombatGroupMessage
{
    const FName HelpMe = n"HelpMe";
    const FName FocusAttack = n"FocusAttack";
    const FName Retreat = n"Retreat";
}

struct FCombatRoleGroup
{
    FCombatRoleGroup(ECombatRole InRole, int InNumAllowed = MAX_int32, float InSizeAllowed = MAX_flt, float InRoleSizeSlotMultiplier = 1.0f, float InPriority = 0.0f)
    {
        RoleType = InRole;
        NumAllowed = InNumAllowed;
        SizeAllowed = InSizeAllowed;
        RoleSizeSlotMultiplier = InRoleSizeSlotMultiplier;
        Priority = InPriority;
    }

    /** Role this represents. */
    UPROPERTY()
    ECombatRole RoleType = ECombatRole::None;

    /** How many Characters are allowed to do this? (Must be larger than NumRequired) */
    UPROPERTY()
    int NumAllowed = MAX_int32;

    /** How many Characters * Agent's RoleSlotSize sare allowed to do this at the same time? (Must be larger than NumRequired) */
    UPROPERTY()
    float SizeAllowed = MAX_flt;

    /** By how much should we scale an agent's RoleSlotSize for this role? */
    UPROPERTY()
    float RoleSizeSlotMultiplier = 1.0f;

    UPROPERTY()
    float Priority = 0.0f;

    /** Who's been given this Role right now? */
    UPROPERTY(AdvancedDisplay)
    TArray<AGothicCharacter> Members;

    /** Returns how many more members are allowed to do this Role. */
    int GetNumFreeSlots() const property
    {
        if (NumAllowed == MAX_int32)
            return MAX_int32;

        return NumAllowed - Members.Num();
    }

    float GetOccupiedSize() const property
    {
        float Size = 0.0f;
        for (auto Member : Members)
        {
            auto MemberAI = Member.GetCharacterAI();
            if (MemberAI == nullptr) 
                continue;

            UAIState_Combat_G1R MemberCombat = MemberAI.FindActiveStateByClass(UAIState_Combat_G1R);

            if (MemberCombat == nullptr)
                continue;

            Size += MemberCombat.GetCurrentBehaviorRoleSlotSize();
        }

        return Size;
    }

    /** Returns much more total member size is allowed into this Role. */
    float GetFreeSize() const property
    {
        if (SizeAllowed == MAX_flt)
            return MAX_flt;

        return SizeAllowed - OccupiedSize;
    }

    int opCmp(const FCombatRoleGroup& Other) const
    {
        if (Priority > Other.Priority)
            return -1;

        if (Priority < Other.Priority)
            return 1;

        return 0;
    }

    /** Color that members of this group are shown in */
    FColor GetDebugColor() const property
    {
        switch (RoleType)
        {
        case ECombatRole::None:
            return FColor::Silver;
        case ECombatRole::PassiveAttacker:
            return FColor::Yellow;
        case ECombatRole::ActiveAttacker:
            return FColor::Red;
        case ECombatRole::Observer:
            return FColor::Emerald;
        case ECombatRole::HealSelf:
            return FColor::Cyan;
        default:
        }
        return FColor::MakeRandomColor();
    }

    void DebugDraw()
    {
        for (auto& CharacterA : Members)
        {
            float HalfHeightA = CharacterA.CapsuleComponent.ScaledCapsuleHalfHeight;

            for (auto& CharacterB : Members)
            {
                float HalfHeightB = CharacterB.CapsuleComponent.ScaledCapsuleHalfHeight;

                DebugScript::DrawLine(CharacterA.ActorLocation + FVector::UpVector * HalfHeightA, 
                                      CharacterB.ActorLocation + FVector::UpVector * HalfHeightB, 
                                      GetDebugColor(), 0.0f, 0.0f);
            }

            DebugScript::DrawLine(CharacterA.ActorLocation + FVector::UpVector * HalfHeightA, 
                                  CharacterA.ActorLocation + FVector::UpVector * HalfHeightA * 3.0f, 
                                  GetDebugColor(), 10.0f, 0.0f);
        }
    }

}

struct FCharacterFitnessPair
{
    AGothicCharacter Character;
    float Fitness = 0.0f;

    int opCmp(const FCharacterFitnessPair& Other) const
    {
        if (Fitness > Other.Fitness)
            return -1;

        if (Fitness < Other.Fitness)
            return 1;

        return 0;
    }
}

UCLASS()
class UAIGroup_Combat : UAIGroup_Combat_Base
{
    // UAICombatPositioning CombatPositioning = UAICombatPositioning();
    UPROPERTY()
    bool bCombatPositioningSetupDone = false;

    /** Enemy that the group is targeting. */
    UPROPERTY()
    AGothicCharacter TargetEnemy;

    /** Character that has been selected in ImGui (Used if passed context character is null) */
    UPROPERTY()
    AGothicCharacter DebugSelectedCharacter;

    /** How often has the group performed a type of move while combat is going on? */
    UPROPERTY()
    TMap<FGameplayTag, int> NumTypeOfMoveWasPerformed;

    /** 
     * What Roles do we have? How many Characters can be given a specific Role at the same time? 
     * Sorted from low priority to high priority.
     */
    // UPROPERTY()
    // TArray<FCombatRoleGroup> AvailableRoles;

    UPROPERTY()
    UAICombatRoleSystem RoleSystem = UAICombatRoleSystem_Default();

    /** Highest amount of members that joined this combat group during this combat */
    UPROPERTY()
    int HighestMemberCountReached = 0;

    UPROPERTY()
    float FitnessOverflowThreshhold = 10.0f;

    UPROPERTY()
    private FVector CombatCenterOfMassLocation_Internal;

    UPROPERTY()
    private float CombatCenterOfMassSpeed = 0.0f;

    UPROPERTY()
    float CombatCenterOfMassAcceleration = 5.0f;

    UPROPERTY()
    float CombatCenterOfMassMaxSpeed = 50.0f;

    UPROPERTY()
    bool bMemberDamaged = false;

    UPROPERTY()
    UAIGroup_TokenSystem AttackTokenSystem = UAIGroup_TokenSystem(
        4,
        4,
        4,
        4,
        2.0f);

    FVector GetCombatCenterOfMass() const property
    {
        return CombatCenterOfMassLocation_Internal;
    }

    private void UpdateCombatCenterOfMass(float DeltaTimeSecs)
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIGroup_Combat::UpdateCombatCenterOfMass"));

        FVector CurrentCenterOfMass = GetGroupActiveAttackerCenterOfMass();

        FVector OldPosition = CombatCenterOfMass;

        if (OldPosition.ContainsNaN())
        {
            OldPosition = CurrentCenterOfMass;
        }

        FVector DirectionToActualCenterOfMass = CurrentCenterOfMass - OldPosition;
        DirectionToActualCenterOfMass.Normalize();

        CombatCenterOfMassSpeed = Math::Clamp(CombatCenterOfMassSpeed + CombatCenterOfMassAcceleration * DeltaTimeSecs, 0.0f, CombatCenterOfMassMaxSpeed);
        FVector Movement = DirectionToActualCenterOfMass * CombatCenterOfMassSpeed * DeltaTimeSecs;

        if (Movement.Size() > OldPosition.Distance(CurrentCenterOfMass))
        {
            CombatCenterOfMassLocation_Internal = CurrentCenterOfMass;
            return;
        }

        CombatCenterOfMassLocation_Internal = OldPosition + Movement;
    } 

    private FVector GetGroupActiveAttackerCenterOfMass() const property
    {
        TArray<AGothicCharacter> CharacterArray = RoleSystem.GetCharactersInRole(ECombatRole::ActiveAttacker);

        if (CharacterArray.IsEmpty())
        {
            CharacterArray = ConsciousJoinedCharacters;
        } 

        FVector SumVector = FVector::ZeroVector;
        for (auto Member : CharacterArray)
        {
            if (Member == nullptr)
                continue;

            SumVector += Member.ActorLocation;
        }

        SumVector = SumVector / CharacterArray.Num();

        return SumVector;
    }

    UFUNCTION(BlueprintOverride)
    void HandleMemberJoined(AGothicCharacter Character)
    {
        if (JoinedCharacters.Num() == 1)
        {
            SetupCombatPositioning();
            CombatCenterOfMassLocation_Internal = Character.ActorLocation;
            // RoleSystem.SetupRoleSystem();
        }

        if (RoleSystem.RoleCount == 0)
            return;

        // RoleSystem.AddCharacterToRole(Character, RoleSystem.FindRoleGroup(ECombatRole::Observer));

        HandleMemberCountChanged();

        if (HighestMemberCountReached < JoinedCharacters.Num())
            HighestMemberCountReached = JoinedCharacters.Num();
    }

    UFUNCTION(BlueprintOverride)
    void HandleMemberLeft(AGothicCharacter Character)
    {
        RoleSystem.RemoveCharacterFromAllRoleCategories(Character);

        ReturnAttackToken(Character);

        HandleMemberCountChanged();
    }

    /** Override to get notified when the groups member count changed */
    void HandleMemberCountChanged()
    {
        AttackTokenSystem.GroupCount = JoinedCharacters.Num();
        RebalanceRoles();
    }

    /** Override to decide what should happen when this message was sent. */
    void HandleMessage(FName Message, AGothicCharacter Sender, AGothicCharacter Receiver)
    {
        
    }

    /** Override to decide what should happen right before any group member will do a combat move with the given tags. */
    void HandleMemberAboutToPerformMove(AGothicCharacter Character, FGameplayTagContainer MoveTags)
    {

    }

    /** Called when the first attack has been performed by any group member. */
    void HandleFirstAttackPerformed(AGothicCharacter Attacker)
    {
        RebalanceRoles();
    }

    /** Called when an attack has been performed by any group member. */
    void HandleAttackPerformed(AGothicCharacter Attacker)
    {

    }

    /** Called when a group member got hit by the enemy */
    void HandleMemberGotHit(AGothicCharacter HitCharacter, AGothicCharacter Instigator)
    {
        RebalanceRoles();

        bMemberDamaged = true;
    }

    /** Override to decide what should happen when any group member did a combat move with the given tags. */
    void HandleMemberPerformedMove(AGothicCharacter Character, FGameplayTagContainer MoveTags)
    {
        // Count how often that type of move has been done so far
        for (auto& Tag : MoveTags.GameplayTags)
        {
            for (auto& Parent : Tag.GameplayTagParents.GameplayTags)
            {
                NumTypeOfMoveWasPerformed.FindOrAdd(Parent) += 1;
            }
        }

        if (MoveTags.HasTag(GameplayTag::Action_Attack))
        {
            if (HowManyTimesDidTheGroupDoAMoveWithTag(GameplayTag::Action_Attack) == 1)
            {
                HandleFirstAttackPerformed(Character);
            }

            HandleAttackPerformed(Character);
        }
    }

    /** Returns how many times all group members combined have done a move with the given tag during this combat instance. */
    int HowManyTimesDidTheGroupDoAMoveWithTag(FGameplayTag MoveTag) const
    {
        if (!NumTypeOfMoveWasPerformed.Contains(MoveTag))
            return 0;

        return NumTypeOfMoveWasPerformed[MoveTag];
    }

    /** Broadcasts this message to all group members of any role. */
    void BroadcastMessage(AGothicCharacter Sender, FName Message)
    {
        for (auto Member : JoinedCharacters)
        {
            if (Member != Sender)
            {
                HandleMessage(Message, Sender, Member);
            }
        }
    }

    void SetGroupTarget(AGothicCharacter Target)
    {
        TargetEnemy = Target;
        if (TargetEnemy.IsPlayerControlled())
        {
            RoleSystem = UAICombatRoleSystem_Player();
        }
        RoleSystem.SetupRoleSystem();
    }

    UFUNCTION(BlueprintOverride)
    float32 CalcFitnessOf(AGothicCharacter Character) const
    {
        auto CombatAI = Character.GetCombatAIState();

        if (!IsValid(CombatAI))
            return 0.0f;

        if (!(GetAvailableRolesOf(Character).Contains(ECombatRole::ActiveAttacker)))
            return 0.0f;

        return float32(CombatAI.CalculateFitness());
    }

    UFUNCTION(BlueprintOverride)
    TArray<ECombatRole> GatherAvailableRolesOf(AGothicCharacter Character) const
    {
        auto CombatAI = Character.GetCombatAIState();

        if (!IsValid(CombatAI))
            return TArray<ECombatRole>();

        return CombatAI.GatherAvailableRoles();
    }

    /** Moves characters into or out of higher-priority Roles when needed. */
    void RebalanceRoles() final
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIGroup_Combat::RebalanceRoles"));       

        ScheduleFitnessUpdates();
        ScheduleAvailableRoleUpdates();

        // Reset all role groups
        for (auto Iterator : RoleSystem.RoleCategoryContainers)
        {
            for (auto& Role : Iterator.Value.RoleGroups)
            {
                Role.Members.Reset();
            }
        }

        auto AttackRoleCategory = RoleSystem.RoleCategoryContainers[ECombatRoleCategories::Attack];
        int AttackRoleGroupIndex = 0;
        TArray<FCombatRoleGroup>& AttackRoleGroups = AttackRoleCategory.RoleGroups;

        auto SpareRoleCategory = RoleSystem.RoleCategoryContainers[ECombatRoleCategories::Spare];
        int SpareRoleGroupIndex = 0;
        TArray<FCombatRoleGroup>& SpareRoleGroups = SpareRoleCategory.RoleGroups;       

        // FitnessOfGroupMembers is expected to be sorted Lowest->Highest
        for (auto& FitnessPair : FitnessOfGroupMembers)
        {
            auto FitnessCharacter = FitnessPair.Key;

            FScopeCycleCounter ScopeCycleCounterSingleRole(FitnessCharacter);
            bool bRoleAssignedToCharacter = false;

            UAIState_Combat_G1R CharacterCombatClass = Cast<UAIState_Combat_G1R>(GetCombatStateOf(FitnessCharacter));
            bool bSituationalRoleAssigned = false;

            if (CharacterCombatClass == nullptr)
                continue;

            // Put character in their current role if they're in a combat move that locks role switching
            if (!CharacterCombatClass.CanSwitchRolesRightNow())
            {
                ECombatRole RoleToKeep = CharacterCombatClass.MyLastKnownOrder;
                SwitchRoles(FitnessCharacter, RoleSystem.FindRoleGroup(RoleToKeep));
                continue;
            }

            // Put character into situational role if they should use it and Group / Category restrictions allow it
            auto SituationalRoleCategory = RoleSystem.RoleCategoryContainers[ECombatRoleCategories::Situational];
            for (auto& SituationalRoleGroup : SituationalRoleCategory.RoleGroups)
            {
                auto Role = SituationalRoleGroup.RoleType;
                if (!CharacterCombatClass.ShouldUseBehaviorWithRole(Role))
                    continue;

                float CharacterRoleSize = CharacterCombatClass.GetRoleSlotSize(Role);

                if (SituationalRoleCategory.NumFreeSlots <= 0)
                    break;
                if (SituationalRoleCategory.FreeSize < CharacterRoleSize)
                    break;
                if (SituationalRoleGroup.NumFreeSlots <= 0)
                    continue;
                if (SituationalRoleGroup.FreeSize < CharacterRoleSize)
                    continue;

                SwitchRoles(FitnessCharacter, SituationalRoleGroup);
                bRoleAssignedToCharacter = true;
                ReturnAttackToken(FitnessCharacter);
                bSituationalRoleAssigned = true;
                break;
            }

            if (bSituationalRoleAssigned)
                continue;

            if (AttackRoleGroupIndex >= AttackRoleGroups.Num())
            {
                float CharacterRoleSize = CharacterCombatClass.GetRoleSlotSize(SpareRoleGroups[SpareRoleGroupIndex].RoleType);

                if (SpareRoleGroups[SpareRoleGroupIndex].NumFreeSlots > 0 && SpareRoleGroups[SpareRoleGroupIndex].FreeSize >= CharacterRoleSize)
                {
                    SwitchRoles(FitnessCharacter, SpareRoleGroups[SpareRoleGroupIndex]);
                    bRoleAssignedToCharacter = true;
                    if (SpareRoleGroups[SpareRoleGroupIndex].NumFreeSlots <= 0 || SpareRoleGroups[SpareRoleGroupIndex].FreeSize == 0.0f)
                    {
                        SpareRoleGroupIndex++;
                    }
                    continue;
                }
            }

            float CharacterRoleSize = CharacterCombatClass.GetRoleSlotSize(AttackRoleGroups[AttackRoleGroupIndex].RoleType);

            while (!bRoleAssignedToCharacter)
            {
                if (AttackRoleGroupIndex >= AttackRoleGroups.Num())
                {
                    CharacterRoleSize = CharacterCombatClass.GetRoleSlotSize(SpareRoleGroups[SpareRoleGroupIndex].RoleType);

                    if (SpareRoleGroups[SpareRoleGroupIndex].NumFreeSlots > 0 && SpareRoleGroups[SpareRoleGroupIndex].FreeSize >= CharacterRoleSize)
                    {
                        SwitchRoles(FitnessCharacter, SpareRoleGroups[SpareRoleGroupIndex]);
                        bRoleAssignedToCharacter = true;
                        if (SpareRoleGroups[SpareRoleGroupIndex].NumFreeSlots <= 0 || SpareRoleGroups[SpareRoleGroupIndex].FreeSize == 0.0f)
                        {
                            SpareRoleGroupIndex++;
                        }
                        continue;
                    }
                }

                if (AttackRoleGroupIndex >= AttackRoleGroups.Num())
                {
                    break;
                }

                if (AttackRoleGroups[AttackRoleGroupIndex].NumFreeSlots <= 0 || AttackRoleGroups[AttackRoleGroupIndex].FreeSize < CharacterRoleSize)
                {
                    AttackRoleGroupIndex++;
                    continue;
                }

                SwitchRoles(FitnessCharacter, AttackRoleGroups[AttackRoleGroupIndex]);
                bRoleAssignedToCharacter = true;
                if (AttackRoleCategory.NumFreeSlots <= 0 || AttackRoleCategory.FreeSize == 0.0f)
                {
                    AttackRoleGroupIndex = AttackRoleGroups.Num();
                }
                else if (AttackRoleGroups[AttackRoleGroupIndex].NumFreeSlots <= 0)
                {
                    AttackRoleGroupIndex++;
                }
            }

            // If all attack / spare roles have been filled and character shouldn't use any situational roles, place them in observer
            if (SpareRoleGroupIndex >= SpareRoleGroups.Num())
            {
                SwitchRoles(FitnessCharacter, RoleSystem.FindRoleGroup(ECombatRole::Observer));
                bRoleAssignedToCharacter = true;
                ReturnAttackToken(FitnessCharacter);
                continue;
            }
        }
    }

    /** Let the given character go into a different group Role. */
    protected void SwitchRoles(AGothicCharacter Character, FCombatRoleGroup& Target) final
    {
        UAIState_Combat Combat = GetCombatStateOf(Character);

        if (!IsValid(Combat))
            return;

        RoleSystem.SwitchRoles(Character, Target);

        if (Combat != nullptr)
        {
            Combat.SecondsILastSwitchedRoles = World.TimeSeconds;
        }
    }

    /** Value between 0..1 saying how close this character is to the enemy. 0 being the closest character, 1 being the furthest. */
    float GetDistanceToEnemyRatio(AGothicCharacter Character) const
    {
        if (TargetEnemy == nullptr)
            return 1.0f;
        
        if (JoinedCharacters.Num() <= 1)
            return 0.0f;

        float MyDistance = Character.GetDistanceTo(TargetEnemy);
        float MaxDistance = MyDistance;
        float MinDistance = MyDistance;

        for (auto Member : JoinedCharacters)
        {
            float MemberDistance = Member.GetDistanceTo(TargetEnemy);
            MaxDistance = Math::Max(MaxDistance, MemberDistance);
            MinDistance = Math::Min(MinDistance, MemberDistance);
        }
        return Math::GetMappedRangeValueClamped(FVector2D(MinDistance, MaxDistance), FVector2D(0, 1), MyDistance);
    }

    /** 
     * Returns the strength-ratio of the given character. The higher the number, the "stronger" the character 
     * is seen as. For example, this could be a calculation based on Level, Health and other attributes.
     */
    UFUNCTION(BlueprintOverride)
    float CalcStrengthRatioOf(AGothicCharacter Character) const
    {
        float Ratio = 0.0f;

        float Health = Character.GetHealthAttribute();
        float Strength = Character.GetStrengthAttribute();
        float Level = Character.GetLevelAttribute();

        Ratio += HighestHealthInGroup < 0.05f ? 1.0f : (Health / HighestHealthInGroup);
        Ratio += HighestStrengthInGroup < 0.05f ? 1.0f : (Strength / HighestStrengthInGroup);
        Ratio += HighestLevelInGroup < 0.05f ? 1.0f : (Level / HighestLevelInGroup);
        Ratio *= 0.33333f;

        return Ratio > 0.05f ? 1.0f : Ratio;
    }

    /** Returns the characters active combat state. */
    UAIState_Combat GetCombatStateOf(AGothicCharacter Character) const
    {
        return GetMemberAIStateByClass(Character, UAIState_Combat);
    }

    /** Returns true if any member of this group is currently in a combat state */
    bool IsAnyMemberInCombat() const
    {
        for (auto Member : JoinedCharacters)
        {
            if (Member.GetCharacterAI().IsInState(UAIState_Combat))
                return true;
        }

        return false;
    }

    /** Override from inheriting classes and add distance rings after the quadrant border update */
    void SetupCombatPositioning()
    {

    }

    /** Tick-function called by the leader of the group. */
    void Tick(float DeltaSeconds)
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"AIGroup_Combat::Tick"));

        RebalanceRoles();

        UpdateCombatCenterOfMass(DeltaSeconds);

        AttackTokenSystem.TickTimers();
    }

    /** Returns the character who is supposed to lead the fight, ie. give Roles to others. (optional) */
    UFUNCTION(BlueprintEvent)
    AGothicCharacter GetFightLeader() const
    {
        if (JoinedCharacters.IsEmpty())
            return nullptr;

        return JoinedCharacters[0];
    }

    UFUNCTION(BlueprintOverride)
    bool IsCharacterAllowedToJoin(const AGothicCharacter Character)
    {
        if (JoinedCharacters.Num() == 0)
            return true;

        return true;

        // return Character.Class.IsChildOf(GetFightLeader().Class);
    }

    /**
     * Line shaped formation pattern. Returned value is the offset in "Rows", you still need to
     * scale it by some amount to specify the distance between characters.
     * 
     *              +X
     *             Front          --> +X
     * 
     *     9 7 5 3 1 0 2 4 6 8 10
     */
    FVector GetLineShapedFormationOffsetForCharacter(const AGothicCharacter Character, const AActor TargetActor) const
    {
        int32 Idx = JoinedCharacters.FindIndex(Character);

        if (Idx == -1)
            return FVector::ZeroVector;

        if (Idx == 0 && TargetActor == JoinedCharacters[0])
            return FVector::ZeroVector;

        if (!JoinedCharacters.Contains(Cast<AGothicCharacter>(TargetActor)))
        {
            Idx += 1;
        }

        // Put even indices to the right, Odd to the left
        int Side = (Idx % 2 == 0) ? 1 : -1;
        float DistanceFromCenter = Idx / 2.0f;

        return FVector(0.0f, DistanceFromCenter * Side, 0.0f);
    }

    FVector GetQueueShapedFormationOffsetForCharacter(const AGothicCharacter Character, const AActor TargetActor) const
    {
        int32 Idx = JoinedCharacters.FindIndex(Character);

        if (Idx == -1)
            return FVector::ZeroVector;

        if (Idx == 0 && TargetActor == JoinedCharacters[0])
            return FVector::ZeroVector;

        if (!JoinedCharacters.Contains(Cast<AGothicCharacter>(TargetActor)))
        {
            Idx += 1;
        }
        
        int Side = (Idx % 2 == 0) ? 1 : -1;
        
        return FVector(-Idx, Side, 0.0f);
    }

    /**
     * Move in a circle around the target. Returned value is normalized and needs to be scaled.
     */
    FVector GetMovingCircleEnemyFormationOffsetForCharacter(const AGothicCharacter Character, const AActor TargetActor) const
    {
        int32 Idx = JoinedCharacters.FindIndex(Character);

        if (Idx == -1)
            return FVector::ZeroVector;

        int NumSpotsInCircle = JoinedCharacters.Num();

        float tRadiansPerSecond = 1.0f; //Character.MovementComponent.MaxSpeed / (2 * PI);
        float tDistanceBetweenEach = (2 * PI) / NumSpotsInCircle;
        float tMySpotOffset = tDistanceBetweenEach * Idx;
        float tMyOffset = Math::Fmod(tMySpotOffset + tRadiansPerSecond * World.TimeSeconds, 2 * PI);

        return FVector(Math::Sin(tMyOffset), Math::Cos(tMyOffset), 0.0f);
    }

#if WITH_IMGUI
    /** Override to add to this groups ImGui panel. */
    UFUNCTION(BlueprintOverride)
    void DisplayImGui(AGothicCharacter Character)
    {
        if (Character == nullptr)
        {
            Character = DebugSelectedCharacter;
        }
        else
        {
            DebugSelectedCharacter = Character;
        }

        if (!JoinedCharacters.Contains(DebugSelectedCharacter))
        {
            DebugSelectedCharacter = Character;
        }

        if (DebugSelectedCharacter == nullptr)
        {
            DebugSelectedCharacter = GetFightLeader();
        }
        
        DebugScript::DrawCircle(DebugSelectedCharacter.ActorLocation + FVector::UpVector * 100.0f, 20.0f, FColor::Cyan, 0.0f, 50.0f);
        DebugScript::DrawCircle(DebugSelectedCharacter.ActorLocation + FVector::UpVector * 200.0f, 20.0f, FColor::Cyan, 0.0f, 50.0f);

        ImGui::BulletText("Tokens available: " + f"{AttackTokenSystem.AvailableTokens}");
        if (ImGui::TreeNode("Roles", true))
        {
            for (auto Iterator : RoleSystem.RoleCategoryContainers)
            {
                FString CategoryNumOccupiedText = f"{Iterator.Value.TotalMemberCount}";
                FString CategorySizeOccupiedText = f"{Iterator.Value.GetOccupiedSize()}";
                FString CategoryNumAllowedText = Iterator.Value.TotalMembersAllowed == MAX_int32 ? "Any" : f"{Iterator.Value.TotalMembersAllowed}";
                FString CategorySizeAllowedText = Iterator.Value.TotalSizeAllowed == MAX_flt ? "Any" : f"{Iterator.Value.TotalSizeAllowed}";
                if (ImGui::TreeNodeColored(f"{Iterator.Value.CategoryName} [Num: {CategoryNumOccupiedText} | allowed: {CategoryNumAllowedText}][Size: {CategorySizeOccupiedText} | allowed: {CategorySizeAllowedText}]", FColor::White, true))
                {
                    for (auto& RoleGroup : Iterator.Value.RoleGroups)
                    {
                        FString RoleNumOccupiedText = f"{RoleGroup.Members.Num()}";
                        FString RoleSizeOccupiedText = f"{RoleGroup.GetOccupiedSize()}";
                        FString RoleNumAllowedText = RoleGroup.NumAllowed == MAX_int32 ? "Any" : f"{RoleGroup.NumAllowed}";
                        FString RoleSizeAllowedText = RoleGroup.SizeAllowed == MAX_flt ? "Any" : f"{RoleGroup.SizeAllowed}";
                        if (ImGui::TreeNodeColored(f"{FCombatGroupRole::GetRoleName(RoleGroup.RoleType)} [Num: {RoleNumOccupiedText} | allowed: {RoleNumAllowedText}][Size: {RoleSizeOccupiedText} | allowed: {RoleSizeAllowedText}]", RoleGroup.DebugColor, true))
                        {
                            for (auto& Member : RoleGroup.Members)
                            {   
                                if (Member == DebugSelectedCharacter)
                                {
                                    ImGui::PushTextColor(FColor::Green);
                                }

                                float Fitness = GetFitnessOf(Member);
                                UAIState_Combat CombatState = GetCombatStateOf(Member);

                                FString FitnessText = Fitness >= MAX_flt ? "MAX" : f"{Fitness:.1f}";
                                if (DoesCharacterHaveAttackToken(Member))
                                {
                                    FString TokenText = DoesCharacterHaveAttackToken(Member) ? "Attack Token" : "";
                                    ImGui::BulletText(f"{Member.CharacterUniqueName} [Fitness: {FitnessText}] " + TokenText);
                                    DebugScript::DrawSphere(Member.GetFeetLocation() + FVector::UpVector * 230.0f, 10.0f, FColor::Red);
                                }
                                else
                                {
                                    ImGui::BulletText(f"{Member.CharacterUniqueName} [Fitness: {FitnessText}]");
                                }

                                if (Member == DebugSelectedCharacter)
                                {
                                    ImGui::PopTextColor();
                                }

                                if (ImGui::IsItemClicked())
                                {
                                    DebugSelectedCharacter = Member;
                                }

                                if (ImGui::IsItemHovered())
                                {
                                    ImGui::BeginTooltip();

                                    for (auto State : Member.GetCharacterAI().CurrentStateStack)
                                    {
                                        UAIState_Combat_G1R MemberCombatState = Cast<UAIState_Combat_G1R>(State);

                                        if (MemberCombatState != nullptr)
                                        {
                                            FVector OffsetBack = (Member.ActorLocation - Gameplay::GetPlayerCameraManager(0).CameraLocation).GetSafeNormal();

                                            DebugScript::DrawLine(Member.ActorLocation + OffsetBack * 2, Member.ActorLocation + OffsetBack * 2 + FVector::UpVector * 500.0f, FColor::Black, 30.0f, 0.0f);
                                            DebugScript::DrawLine(Member.ActorLocation + OffsetBack, Member.ActorLocation + OffsetBack + FVector::UpVector * 500.0f, FColor::White, 26.0f, 0.0f);
                                            DebugScript::DrawLine(Member.ActorLocation, Member.ActorLocation + FVector::UpVector * 500.0f, RoleGroup.DebugColor, 20.0f, 0.0f);
                                            MemberCombatState.DisplayImGuiInTreeView();
                                            break;
                                        }
                                    }

                                    ImGui::EndTooltip();
                                }
                            }
                            ImGui::TreePop();
                        }
                        RoleGroup.DebugDraw();
                    }
                    ImGui::TreePop();
                }
            }
            ImGui::TreePop();
        }

        if (ImGui::Button("Rebalance"))
        {
            RebalanceRoles();
        }

        ImGui::Spacing();
        ImGui::Separator();
        ImGui::Spacing();

        UAIState_Combat CombatState = GetCombatStateOf(Character);
        check(CombatState != nullptr);
        if (CombatState != nullptr)
        { 
            if (GetAvailableRolesOf(Character).Contains(ECombatRole::ActiveAttacker))
            {
                int NumRows = CombatState.CombatFitnessMultipliers.Num() + 1;

                if (ImGui::BeginTable("This character's fitness", NumRows))
                {
                    ImGui::TableSetupColumn("Multiplier");
                    ImGui::TableSetupColumn("Reason");
                    ImGui::TableHeadersRow();

                    for (auto Multiplier : CombatState.CombatFitnessMultipliers)
                    {
                        if (!Multiplier.ShouldApply())
                            continue;

                        ImGui::TableNextRow();
                        ImGui::TableNextColumn();

                        ImGui::TextColored(FColor::White, f"{Multiplier.Value}");

                        ImGui::TableNextColumn();

                        ImGui::TextColored(FColor::White, Multiplier.Description);
                    }

                    ImGui::EndTable();
                }
            }
            else
            {
                if (ImGui::BeginTable("This character's fitness", 2))
                {
                    ImGui::TableSetupColumn("Multiplier");
                    ImGui::TableSetupColumn("Reason");
                    ImGui::TableHeadersRow();
                    ImGui::TableNextRow();
                    ImGui::TableNextColumn();

                    ImGui::TextColored(FColor::Red, "0.0");

                    ImGui::TableNextColumn();

                    ImGui::TextColored(FColor::White, "No Attacking behavior set that should be used.");

                    ImGui::EndTable();
                }
            }
        }

        if (ImGui::TreeNode("Moves", true))
        {
            for (auto& Tag : NumTypeOfMoveWasPerformed)
            {
                ImGui::Text(f"{Tag.Key.ToString()}: {Tag.Value}");
            }

            ImGui::TreePop();
        }
    }
#endif

    bool IsAnotherCharacterBetweenCharacterAndTarget(const AGothicCharacter Character)
    {
        TArray<AActor> ActorsToIgnore;
        ActorsToIgnore.Add(Character);
        ActorsToIgnore.Add(TargetEnemy);

        TArray<EObjectTypeQuery> ObjectTypes;
        ObjectTypes.Add(EObjectTypeQuery::Pawn);

        TArray<FHitResult> HitResults;
        bool bHit = System::CapsuleTraceMultiForObjects(
            Character.ActorLocation, 
            TargetEnemy.ActorLocation, 
            Character.CapsuleComponent.ScaledCapsuleRadius, 
            Character.CapsuleComponent.ScaledCapsuleHalfHeight,
            ObjectTypes,
            false, 
            ActorsToIgnore, 
            EDrawDebugTrace::None, // Change to enable visuals
            HitResults,
            false,
            FLinearColor::Green, FLinearColor::Red);

        if (bHit)
        {
            for (auto HitResult : HitResults)
            {
                AGothicCharacter HitCharacter = Cast<AGothicCharacter>(HitResult.Actor);

                if (HitCharacter == nullptr)
                    continue;                

                return true;
            }
        }

        return false;
    }

    AGothicCharacter GetAttackingCharacterFarthestFromTarget()
    {
        float Distance = 0.0f;
        AGothicCharacter FarthestCharacter = nullptr;

        for (auto Character : AttackingCharacters)
        {
            float CharacterDistance = Character.ActorLocation.Distance(TargetEnemy.ActorLocation);
            if (CharacterDistance > Distance)
            {
                Distance = CharacterDistance;
                FarthestCharacter = Character;
            }
        }

        return FarthestCharacter;
    }

    bool RequestAttackToken(const AGothicCharacter Character)
    {
        if (TryGrantAttackToken(Character))
            return true;
        
        AGothicCharacter FarthestAttackingCharacter = GetAttackingCharacterFarthestFromTarget();
        // if (FarthestAttackingCharacter.ActorLocation.Distance(TargetEnemy.ActorLocation) > Character.ActorLocation.Distance(TargetEnemy.ActorLocation) + 150.0f)
        // {
            SwapAttackTokens(FarthestAttackingCharacter, Character);
        //}
        
        return false;
    }

    private bool TryGrantAttackToken(const AGothicCharacter Character)
    {
        AttackTokenSystem.GrantToken(Character);
        return true;
    }

    void ReturnAttackToken(const AGothicCharacter Character)
    {
        AttackTokenSystem.ReturnToken(Character);
    }

    void SpendAttackToken(const AGothicCharacter Character)
    {
        AttackTokenSystem.SpendToken(Character);
    }

    private bool SwapAttackTokens(const AGothicCharacter CharacterLosingToken, const AGothicCharacter CharacterGettingToken)
    {
        return AttackTokenSystem.SwapToken(CharacterLosingToken, CharacterGettingToken);
    }

    bool DoesCharacterHaveAttackToken(const AGothicCharacter Character)
    {
        return AttackTokenSystem.DoesCharacterHaveToken(Character);
    }

    TArray<AGothicCharacter> GetAttackingCharacters() const property
    {
        return AttackTokenSystem.CharactersWithToken;
    }

    UFUNCTION(BlueprintOverride)
    TArray<AActor> GetGroupTargets() const
    {
        TArray<AActor> Targets;
        Targets.Add(TargetEnemy);
        
        return Targets;
    }
}

class UAIGroup_TokenSystem
{
    UAIGroup_TokenSystem(
        int InMaxGrantedTokensAllowed, 
        int InInitialTokenPoolAmount, 
        int InTokenMaximumOnRecover, 
        int InTokenRecoverAmount, 
        float InTokenRecoveryFrequencySeconds)
    {
        _MaxGrantedTokensAllowed = InMaxGrantedTokensAllowed;
        _InitialTokenPoolAmount = InInitialTokenPoolAmount;
        _TokenMaximumOnRecover = InTokenMaximumOnRecover;
        _TokenRecoverAmount = InTokenRecoverAmount;
        _TokenRecoveryFrequencySeconds = InTokenRecoveryFrequencySeconds;
    }

    UPROPERTY()
    private const int _MaxGrantedTokensAllowed = 3;

    UPROPERTY()
    private const int _InitialTokenPoolAmount = 3;

    UPROPERTY()
    private const int _TokenMaximumOnRecover = 3;

    UPROPERTY()
    private const int _TokenRecoverAmount = 3;

    UPROPERTY()
    private const float _TokenRecoveryFrequencySeconds = 6.0f;

    UPROPERTY()
    int GroupCount = 1;

    UPROPERTY()
    private const int _MaxFrequencySecondsAtGroupCount = 4.0f;

    
    int GetMaxGrantedTokensAllowed() const property
    {
        return _MaxGrantedTokensAllowed;
    } 

    int GetInitialTokenPoolAmount() const property
    {
        return _InitialTokenPoolAmount;
    }

    int GetTokenMaximumOnRecover() const property
    {
        return _TokenMaximumOnRecover;
    }

    int GetTokenRecoverAmount() const property
    {
        return _TokenRecoverAmount;
    }

    float GetTokenRecoveryFrequencySeconds() const property
    {
        if (GroupCount <= 2)
        {
            return 0.0f;
        }

        if (GroupCount >= _MaxFrequencySecondsAtGroupCount)
        {
            return _TokenRecoveryFrequencySeconds;
        }

        return _TokenRecoveryFrequencySeconds - _TokenRecoveryFrequencySeconds / _MaxFrequencySecondsAtGroupCount * (_MaxFrequencySecondsAtGroupCount - GroupCount);
    }



    UPROPERTY()
    private int _TokenPool = 3;

    int GetAvailableTokens() const property
    {
        return _TokenPool;
    }


    UPROPERTY()
    private TArray<AGothicCharacter> _CharactersWithToken;

    TArray<AGothicCharacter> GetCharactersWithToken() const property
    {
        return _CharactersWithToken;
    }

    UPROPERTY()
    private FInGameTime _LastTimeTokenPoolWentUnderMaximum;

    UPROPERTY()
    private FInGameTime _LastTimeTokenRecoveryTriggered;

    bool SwapToken(const AGothicCharacter CharacterLosingToken, const AGothicCharacter CharacterGettingToken)
    {
        if (!DoesCharacterHaveToken(CharacterLosingToken))
            return false;

        ReturnToken(CharacterLosingToken);
        return GiveToken(CharacterGettingToken);
    }

    bool GrantToken(const AGothicCharacter Character)
    {
        if (!GiveToken(Character))
            return false;

        if (_TokenPool >= TokenMaximumOnRecover)
            return true;

        _LastTimeTokenPoolWentUnderMaximum = FInGameTime::Now();
        return true;
    }

    bool GiveToken(const AGothicCharacter Character)
    {
        if (_TokenPool == 0)
            return false;

        if (DoesCharacterHaveToken(Character))
            return false;

        _TokenPool--;
        _CharactersWithToken.Add(Character);

        return true;
    }

    void ReturnToken(const AGothicCharacter Character)
    {
        if (!DoesCharacterHaveToken(Character))
            return;
        
        _CharactersWithToken.Remove(Character);
        _TokenPool++;
    }

    void SpendToken(const AGothicCharacter Character)
    {
        if (!DoesCharacterHaveToken(Character))
            return;

        _CharactersWithToken.Remove(Character);
    }

    bool DoesCharacterHaveToken(const AGothicCharacter Character)
    {
        return _CharactersWithToken.Contains(Character);
    }

    void TickTimers()
    {
        // Nothing to do if token pool has never been under maximum
        if (!_LastTimeTokenPoolWentUnderMaximum.IsValid())
            return;

        // Not enough time has passed since TokenPool under maximum
        float TimePassedSinceTokenPoolUnderMaximum = _LastTimeTokenPoolWentUnderMaximum.AgeInRealtimeSeconds;
        if (TimePassedSinceTokenPoolUnderMaximum < TokenRecoveryFrequencySeconds)
            return;

        // Already recovered after last time under maximum
        if (_LastTimeTokenRecoveryTriggered.IsValid() && 
            _LastTimeTokenRecoveryTriggered.AgeInRealtimeSeconds + TokenRecoveryFrequencySeconds <= _LastTimeTokenPoolWentUnderMaximum.AgeInRealtimeSeconds)
            return;

        if (!_LastTimeTokenRecoveryTriggered.IsValid())
        {
            RecoverTokenPool();
            return;
        }

        // Not enough time has passed since last recovery
        float TimePassedSinceLastRecovery = _LastTimeTokenRecoveryTriggered.AgeInRealtimeSeconds;
        if (TimePassedSinceLastRecovery < TokenRecoveryFrequencySeconds)
            return;

        RecoverTokenPool();
    }

    private void RecoverTokenPool()
    {
        _TokenPool = Math::Clamp(_TokenPool + TokenRecoverAmount, 0, TokenMaximumOnRecover);
        _LastTimeTokenRecoveryTriggered = FInGameTime::Now();
    }
}