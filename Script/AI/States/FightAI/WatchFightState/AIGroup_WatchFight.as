/**
 * UAIGroup_WatchFight - per-fight observer group.
 */
UCLASS()
class UAIGroup_WatchFight : UGothicAIGroup
{
    /** Running anchor (centroid of last known fighter positions). */
    UPROPERTY()
    FVector AnchorLocation = FVector::ZeroVector;

    /** Principal axis of the fight (XY), normalized. Used for fight-zone avoidance. */
    UPROPERTY()
    FVector FightAxisXY = FVector::ForwardVector;

    /** Half-length of the fight along the principal axis (for capsule avoidance). */
    UPROPERTY()
    float FightAxisHalfLength = 100.0f;

    /** Ideal viewing radius for slot positions. Watchers may scale this locally too. */
    UPROPERTY()
    float IdealRadius = 700.0f;

    /** Random angular offset so multiple fights don't align the same way. */
    UPROPERTY()
    float GroupAngularOffsetRadians = 0.0f;

    /** Member -> stable slot index. */
    UPROPERTY()
    TMap<AGothicCharacter, int> SlotIndices;

    /** Conflict group this watch group is observing (key for matching). */
    UPROPERTY()
    UAIGroup_ConflictInstance ObservedConflict;

    /** Timestamp of last anchor/axis update; used by debug. */
    UPROPERTY()
    FInGameTime LastAnchorUpdateTime;

    UFUNCTION()
    int GetMemberCount() const property
    {
        return JoinedCharacters.Num();
    }

    UFUNCTION(BlueprintOverride)
    void HandleMemberJoined(AGothicCharacter Character)
    {
        if (!IsValid(Character))
            return;

        if (SlotIndices.Contains(Character))
            return;

        if (GroupAngularOffsetRadians == 0.0f && JoinedCharacters.Num() == 1)
        {
            GroupAngularOffsetRadians = Math::RandRange(0.0f, 2.0f * PI);
        }

        int Idx = FindLowestFreeSlotIndex();
        SlotIndices.Add(Character, Idx);
    }

    UFUNCTION(BlueprintOverride)
    void HandleMemberLeft(AGothicCharacter Character)
    {
        if (!IsValid(Character))
            return;

        SlotIndices.Remove(Character);
    }

    /**
     * Returns the angular slot (radians, XY-plane) for a member. The slot is
     * distributed evenly across [0..2pi) using the member count at query time
     * plus the group offset. This keeps spacing tight when members leave.
     */
    UFUNCTION()
    float GetSlotAngleForMember(AGothicCharacter Character) const
    {
        int Idx = 0;
        if (!SlotIndices.Find(Character, Idx))
            return GroupAngularOffsetRadians;

        int TotalSlots = Math::Max(1, GetMemberCount());
        return GroupAngularOffsetRadians + (2.0f * PI * Idx) / TotalSlots;
    }

    /**
     * Update anchor (centroid) and principal axis from current fighter set.
     * Anchor is exponentially smoothed to avoid jitter as fighters move.
     */
    UFUNCTION()
    void UpdateAnchorAndAxis(const TArray<AGothicCharacter>& Fighters)
    {
        if (Fighters.Num() <= 0)
            return;

        FVector Sum = FVector::ZeroVector;
        for (auto F : Fighters)
        {
            if (!IsValid(F))
                continue;

            Sum += F.GetActorLocation();
        }
        FVector NewAnchor = Sum / Math::Max(1, Fighters.Num());

        if (AnchorLocation.IsNearlyZero())
        {
            AnchorLocation = NewAnchor;
        }
        else
        {
            // Smooth ~30% blend per update; reposition runs at 0.3s.
            AnchorLocation = AnchorLocation * 0.70f + NewAnchor * 0.30f;
        }

        // Axis: vector between two most-distant fighters in XY.
        FVector AxisA = FVector::ZeroVector;
        FVector AxisB = FVector::ZeroVector;
        float MaxDistSq = 0.0f;
        for (int i = 0; i < Fighters.Num(); ++i)
        {
            if (!IsValid(Fighters[i]))
                continue;
            for (int j = i + 1; j < Fighters.Num(); ++j)
            {
                if (!IsValid(Fighters[j]))
                    continue;

                FVector A = Fighters[i].GetActorLocation();
                FVector B = Fighters[j].GetActorLocation();
                float DSq = (A - B).SizeSquared();
                if (DSq > MaxDistSq)
                {
                    MaxDistSq = DSq;
                    AxisA = A;
                    AxisB = B;
                }
            }
        }

        if (MaxDistSq > 1.0f)
        {
            FVector Axis = AxisB - AxisA;
            Axis.Z = 0.0f;
            FightAxisHalfLength = Math::Max(50.0f, Axis.Size() * 0.5f);
            FightAxisXY = Axis.GetSafeNormal();
        }
        else
        {
            FightAxisHalfLength = 50.0f;
        }

        LastAnchorUpdateTime = FInGameTime::Now();

        RebalanceSlotsBySide();
    }

    /**
     * Pairwise-swap slot indices for members whose current side relative to
     * the fight axis disagrees with their slot's side. Lets watchers keep
     * their physical position (no crossing) while the slot table rotates
     * with the fight axis. Iterates until no productive swap is found, bounded
     * by SlotIndices.Num() to guarantee termination.
     */
    UFUNCTION()
    void RebalanceSlotsBySide()
    {
        if (SlotIndices.Num() < 2 || AnchorLocation.IsNearlyZero())
            return;

        FVector Perp = FightAxisXY.CrossProduct(FVector::UpVector).GetSafeNormal();
        if (Perp.IsNearlyZero())
            return;

        int Guard = SlotIndices.Num();
        bool bSwapped = true;
        while (bSwapped && Guard > 0)
        {
            Guard -= 1;
            bSwapped = false;

            TArray<AGothicCharacter> Members;
            for (auto Pair : SlotIndices)
            {
                if (IsValid(Pair.Key))
                    Members.Add(Pair.Key);
            }

            for (int a = 0; a < Members.Num(); ++a)
            {
                auto A = Members[a];
                if (!IsValid(A))
                    continue;

                int CurSideA = SideOfPoint(A.FeetLocation, Perp);
                int SlotSideA = SideOfSlotIndex(A, Perp);
                if (CurSideA == 0 || SlotSideA == 0 || CurSideA == SlotSideA)
                    continue;

                for (int b = a + 1; b < Members.Num(); ++b)
                {
                    auto B = Members[b];
                    if (!IsValid(B))
                        continue;

                    int CurSideB = SideOfPoint(B.FeetLocation, Perp);
                    int SlotSideB = SideOfSlotIndex(B, Perp);
                    if (SlotSideB == CurSideA && SlotSideA == CurSideB)
                    {
                        int IdxA = 0;
                        int IdxB = 0;
                        SlotIndices.Find(A, IdxA);
                        SlotIndices.Find(B, IdxB);
                        SlotIndices.Add(A, IdxB);
                        SlotIndices.Add(B, IdxA);
                        bSwapped = true;
                        break;
                    }
                }

                if (bSwapped)
                    break;
            }
        }
    }

    int SideOfPoint(FVector P, FVector Perp) const
    {
        FVector Radial = P - AnchorLocation;
        Radial.Z = 0.0f;
        float D = Radial.DotProduct(Perp);
        if (D > 1.0f) return 1;
        if (D < -1.0f) return -1;
        return 0;
    }

    int SideOfSlotIndex(AGothicCharacter Member, FVector Perp) const
    {
        float Theta = GetSlotAngleForMember(Member);
        FVector SlotDir = FVector(Math::Cos(Theta), Math::Sin(Theta), 0.0f);
        float D = SlotDir.DotProduct(Perp);
        if (D > 0.0f) return 1;
        if (D < 0.0f) return -1;
        return 0;
    }

    /** Lowest unused slot index across current members. */
    UFUNCTION()
    int FindLowestFreeSlotIndex() const
    {
        TSet<int> Used;
        for (auto Pair : SlotIndices)
        {
            Used.Add(Pair.Value);
        }

        int Idx = 0;
        while (Used.Contains(Idx))
            ++Idx;

        return Idx;
    }
}

UAIGroup_WatchFight FindOrCreateWatchFightGroupForConflict(UAIGroup_ConflictInstance ConflictInstance, AGothicCharacter Joiner)
{
    if (!IsValid(ConflictInstance))
        return nullptr;

    if (!IsValid(Joiner))
        return nullptr;

    auto AllGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_WatchFight);
    for (auto Group : AllGroups)
    {
        auto WF = Cast<UAIGroup_WatchFight>(Group);
        if (!IsValid(WF))
            continue;

        if (WF.ObservedConflict == ConflictInstance)
        {
            auto JoinerAI = Cast<UGameplayAbility_CharacterAI_Gothic>(Joiner.GetCharacterAI());
            if (IsValid(JoinerAI))
                JoinerAI.JoinGroup(WF);
            return WF;
        }
    }

    auto JoinerAI = Cast<UGameplayAbility_CharacterAI_Gothic>(Joiner.GetCharacterAI());
    if (!IsValid(JoinerAI))
        return nullptr;

    JoinerAI.CreateAndJoinGroup(UAIGroup_WatchFight);
    auto Created = Cast<UAIGroup_WatchFight>(JoinerAI.GetGroupOfClass(UAIGroup_WatchFight));
    if (IsValid(Created))
    {
        Created.ObservedConflict = ConflictInstance;
    }
    return Created;
}
