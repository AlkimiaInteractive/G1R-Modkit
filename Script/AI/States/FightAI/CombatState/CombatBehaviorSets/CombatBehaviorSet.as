enum ECombatBehaviorSetTree
{
    Main,
    Secondary,
    Movement,
    Count
}

UCLASS()
class UCombatBehaviorSet
{
    UAIState_Combat_G1R FindOuterCombat() const
    {
        UObject Next = Outer;
        while (Next != nullptr && !Next.IsA(UAIState_Combat_G1R))
        {
            Next = Next.Outer;
        }

        return Cast<UAIState_Combat_G1R>(Next);
    }

    /** Cached outer Combat Object for faster access. This is being used a lot. */
    UAIState_Combat_G1R Combat = FindOuterCombat();

    UPROPERTY()
    bool bTesting = false;

    FString CooldownID_MainMelee = "Main_Melee";
    FString CooldownID_PassiveMelee = "Passive_Melee";
    FString CooldownID_ChasingAttack = "Persecutory";
    
    UCBT_Root HighPriorityTree = UCBT_Root(ECombatActionPriority::High);
    UCBT_Root MediumPriorityTree = UCBT_Root(ECombatActionPriority::Medium);
    UCBT_Root LowPriorityTree = UCBT_Root(ECombatActionPriority::Low);
    UCBT_Root MovementTree = UCBT_Root(ECombatActionPriority::Movement);

    protected float BaseRoleSlotSize = 1.0f;
    protected float BaseRolePriority = 0.0f;

    protected float32 TauntCooldown_Base = 5.0f;
    protected float32 TauntCooldown_General = 5.0f;
    protected TMap<FGameplayTag, float32> TauntCooldown_ByType;

    UPROPERTY(EditDefaultsOnly)
    bool bBlockBehaviorSwitchWhenAttackSelected = true;

    float32 GetTauntCooldownForType(FGameplayTag TauntTypeTag)
    {
        float32 Result;
        if (!TauntCooldown_ByType.Find(TauntTypeTag, Result))
            return TauntCooldown_Base;

        return Result;
    }

    float32 GetTauntGeneralCooldownFromType(FGameplayTag TauntTypeTag)
    {
        float32 Result;
        if (!TauntCooldown_ByType.Find(TauntTypeTag, Result) || Result >= TauntCooldown_General)
            return TauntCooldown_General;

        return Result;
    }

    UPROPERTY()
    TArray<FAttackInfo> Attacks;

    void AddAttack(FAttackInfo Attack)
    {
        Attacks.Add(Attack);
    }

    /** Use for time sensitive tasks, reactions (reactive block, parry, riposte, dodge incoming attacks) */
    UFUNCTION()
    UCBT_SortedPrioritySelector Behavior_HighPriority()
    {
        return HighPriorityTree;
    }

    /** Use for non time sensitive tasks that affect gameplay (attack selection and execution, consuming items, positional dodges, proactive block) */
    UFUNCTION()
    UCBT_SortedPrioritySelector Behavior_MediumPriority()
    {
        return MediumPriorityTree;
    }

    /** Use for non time sensitive tasks that do not affect gameplay (taunts) */
    UFUNCTION()
    UCBT_SortedPrioritySelector Behavior_LowPriority()
    {
        return LowPriorityTree;
    }

    /** Use for all movement tasks */
    UFUNCTION()
    UCBT_SortedPrioritySelector Behavior_Movement()
    {
        return MovementTree;
    }

    bool ShouldUseBehaviorAndRoleAllowsTo(FString&out Reason = "") const final
    {
        if (Combat.CombatGroup == nullptr)
        {
            Reason = "CombatGroup is nullptr";
            return false;
        }

        if (!Combat.IsTestingEnabled && !Roles.Contains(Combat.CombatGroup.RoleSystem.GetCharactersRoleType(Combat.Self)))
        {
            Reason = "Behavior can't fulfill current Combat Role";
            return false;
        }

        if (!ShouldUseBehavior(Reason))
            return false;

        return true;
    }

    FString GetBehaviorName() const property
    {
        return "";
    }

    bool GetIsBehavior() const property
    {
        return false;
    }

    bool ShouldUseBehavior(FString&out Reason = "") const { return true; }
    void SetupConfigValues() {}

    protected TSet<ECombatRole> Roles;
    TSet<ECombatRole> GetRoles() const final
    {
        return Roles;
    }
    bool IsForRole(ECombatRole Role) const
    {
        return Roles.Contains(Role);
    }

    FString GetDisplayName() const
    {
        FString Str = Name.ToString();
        Str.RemoveFromStart("CombatBehaviorSet");
        Str.RemoveFromStart("_");

        FString FinalName;
        FString Right;
        Str.Split("_",FinalName, Right, SearchDir = ESearchDir::FromEnd);

        return FinalName;
    }

    float GetRoleSlotSize() property
    {
        return BaseRoleSlotSize;
    }

    float GetRolePriority() property
    {
        return BaseRolePriority;
    }

    void TickBehaviorSet(float DeltaTimeSecs) {}

    bool IsValidForCharacter(const AGothicCharacter Character) const
    {
        return true;
    }
}

UCLASS()
class UWeaponBehaviorSet : UCombatBehaviorSet
{
    UPROPERTY()
    FGameplayTagContainer WeaponTagContainer;

    UPROPERTY()
    int TrainingRequired = -1;

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        FGameplayTag TypeTag = Combat.Self.GetDrawnWeaponTypeTag();

        if (!TypeTag.MatchesAny(WeaponTagContainer))
        {
            Reason = "Drawn weapon tag not matching";
            return false;
        }

        return true;
    }

    FString GetDisplayName() const override
    {
        FString Str = Name.ToString();
        Str.RemoveFromStart("WeaponBehaviorSet");
        Str.RemoveFromStart("_");

        FString FinalName;
        FString Right;
        Str.Split("_",FinalName, Right, SearchDir = ESearchDir::FromEnd);

        return FinalName;
    }

    bool IsValidForCharacter(const AGothicCharacter Character) const override
    {
        if (Character.Inventory.GetItemsMatchingAnyTypeOf(WeaponTagContainer).Num() == 0)
            return false;

        if (!IsCharacterCorrectTrainingLevel(Character))
            return false;

        return Super::IsValidForCharacter(Character);
    }

    bool IsCharacterCorrectTrainingLevel(const AGothicCharacter Character) const
    {
        return true;
    }
}

UCLASS()
class UCombatBehaviorSet_Observer : UCombatBehaviorSet
{
    default Roles.Add(ECombatRole::Observer);

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (Combat.IsCurrentRole(ECombatRole::Observer))
            return true;

        Reason = "Not Observer role";
        return false;
    }
}

UCLASS()
class UWeaponBehaviorSet_Melee : UWeaponBehaviorSet
{
    default Roles.Add(ECombatRole::ActiveAttacker);
    default Roles.Add(ECombatRole::PassiveAttacker);

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (Combat.CharacterOfInterest == nullptr)
        {
            Reason = "CharacterOfInterest is nullptr";
            return false;
        }

        auto AvailableAttackWithLongestReach = GetAvailableAttackWithLongestReach();
        if (AvailableAttackWithLongestReach.IsRangedAttack())
            return true;

        if (Combat.IsOnNavmesh() && !Combat.IsTargetReachable(AvailableAttackWithLongestReach.MaxRange))
        {
            Reason = "Enemy not reachable in melee";
            return false;
        }

        return true;
    }

    FAttackInfo GetAvailableAttackWithLongestReach() const
    {
        FAttackInfo LongestAttack;
        float LongestRange = 0.0f;

        for (auto& Attack : Attacks)
        {
            if (Attack.MaxRange <= LongestRange)
                continue;

            if (!Attack.AllowedRoles.Contains(Combat.GetCurrentRole()))
                continue;

            if (!(Attack.IsRangedAttack() ||
                Attack.UsageType != EAttackUsageType::Regular))
                continue;

            LongestRange = Attack.MaxRange;
            LongestAttack = Attack;
        }

        return LongestAttack;
    }
}

UCLASS()
class UWeaponBehaviorSet_Ranged : UWeaponBehaviorSet
{
    default Roles.Add(ECombatRole::ActiveAttacker);
    default Roles.Add(ECombatRole::PassiveAttacker);
}

UCLASS()
class UCombatBehaviorSetPackage
{
    UPROPERTY()
    TSet<TSubclassOf<UCombatBehaviorSet>> CombatBehaviorSetClasses;

    /** Merges this Package's CombatBehaviorSetClasses Set with PackageClass' CombatBehaviorSetClasses Set */
    UFUNCTION()
    void AddPackage(TSubclassOf<UCombatBehaviorSetPackage> PackageClass)
    {
        const UCombatBehaviorSetPackage CombatBehaviorSetPackage = Cast<UCombatBehaviorSetPackage>(PackageClass.Get().DefaultObject);
        for (auto CombatBehaviorSetClass : CombatBehaviorSetPackage.CombatBehaviorSetClasses)
        {
            CombatBehaviorSetClasses.Add(CombatBehaviorSetClass);
        }
    }
}

UCLASS()
class UCombatBehaviorSetManager : UCombatBehaviorSetPackage
{
    UPROPERTY()
    TSet<UCombatBehaviorSet> CombatBehaviorSets;

    TMap<ECombatRole, float> MinSlotSizesByRole;

    /** Instances the valid behavior sets for the given character */
    void CreatePackagesValidForCharacter(const AGothicCharacter Character)
    {
        for (auto CombatBehaviorSetClass : CombatBehaviorSetClasses)
        {
            const UCombatBehaviorSet CombatBehaviorSet = Cast<UCombatBehaviorSet>(CombatBehaviorSetClass.Get().DefaultObject);
            if (!CombatBehaviorSet.IsValidForCharacter(Character))
                continue;

            auto NewSet = Cast<UCombatBehaviorSet>(NewObject(Outer, CombatBehaviorSetClass));
            CombatBehaviorSets.Add(NewSet);

            for (auto Role : NewSet.GetRoles())
            {
                if (MinSlotSizesByRole.Contains(Role))
                {
                    MinSlotSizesByRole.Add(Role, Math::Min(MinSlotSizesByRole[Role], NewSet.RoleSlotSize));
                }
                else
                {
                    MinSlotSizesByRole.Add(Role, NewSet.RoleSlotSize);
                }
            }
        }
    }
}

UCLASS()
class UWeaponBehaviorSet_Melee_Human : UWeaponBehaviorSet_Melee
{
    //default Roles.Remove(ECombatRole::PassiveAttacker);

    FAttackInfo ExecutionAttack = FAttackInfo(
        UCM_Attack_ExecuteDefeatedCharacter(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        bInMaxRangeOverride = true,
        InMinRange = 0.0f,
        InMaxRange = 150.0f);
    default AddAttack(ExecutionAttack);

    default Behavior_MediumPriority()
                    .AttackTree(0.5f, "Execution Attack")
                        .AddAttack(ExecutionAttack)
                        .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
}

UCLASS()
class UWeaponBehaviorSet_Ranged_Human : UWeaponBehaviorSet_Ranged
{
    FAttackInfo ExecutionAttack = FAttackInfo(
        UCM_Attack_ExecuteDefeatedCharacter(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        bInMaxRangeOverride = true,
        InMinRange = 0.0f,
        InMaxRange = 150.0f);
    default AddAttack(ExecutionAttack);

    default Behavior_MediumPriority()
                    .AttackTree(0.5f, "Execution Attack")
                        .AddAttack(ExecutionAttack)
                        .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                        .AddRequirement(UCS_EnemyCloserThan(250.0f));
}

UCLASS()
class UCombatBehaviorSetPackage_Human_Melee : UCombatBehaviorSetPackage
{
    default AddPackage(UCombatBehaviorSetPackage_Human_S1H);
    default AddPackage(UCombatBehaviorSetPackage_Human_S2H);
    default AddPackage(UCombatBehaviorSetPackage_Human_A1H);
    default AddPackage(UCombatBehaviorSetPackage_Human_A2H);
    default AddPackage(UCombatBehaviorSetPackage_Human_M1H);
    default AddPackage(UCombatBehaviorSetPackage_Human_T1H);
    default AddPackage(UCombatBehaviorSetPackage_Human_M2H);
    default AddPackage(UCombatBehaviorSetPackage_Human_Sff2H);
    default AddPackage(UCombatBehaviorSetPackage_Human_Fists);
}

UCLASS()
class UCombatBehaviorSetPackage_Orc_Melee : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Orc_A1H);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Orc_M1H);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Orc_S1H);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Orc_Fists);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Orc_Sff1H_Shaman);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Orc_Sff1H);
}