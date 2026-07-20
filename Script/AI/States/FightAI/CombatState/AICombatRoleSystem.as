enum ECombatRoleCategories
{
    None,
    Attack,
    Situational,
    Spare,


    Max
}

struct FCombatRoleHandle
{
    FCombatRoleHandle(ECombatRole InRoleType, ECombatRoleCategories InRoleCategory, int InRoleGroupIndex)
    {
        RoleType = InRoleType;
        RoleCategory = InRoleCategory;
        RoleGroupIndex = InRoleGroupIndex;
    }

    ECombatRole RoleType = ECombatRole::None;
    ECombatRoleCategories RoleCategory = ECombatRoleCategories::None;
    int RoleGroupIndex = -1;
}

UCLASS()
class UAICombatRoleCategoryContainer
{
    UPROPERTY()
    float TotalSizeAllowed = MAX_flt;

    UPROPERTY()
    int TotalMembersAllowed = MAX_int32;

    // default Roles.Add(FCombatRoleGroup(ECombatRole::None, InNumRequired = MAX_int32, InNumAllowed = 0));

    UPROPERTY()
    TArray<FCombatRoleGroup> RoleGroups;

    const FString GetCategoryName() const property { return "Default";};

    void RemoveCharacterFromAllRoles(AGothicCharacter Character)
    {
        for (auto& Role : RoleGroups)
        {
            Role.Members.Remove(Character);
        }
    }

    bool ContainsRoleOfType(ECombatRole RoleType) const
    {
        for (auto& Role : RoleGroups)
        {
            if (Role.RoleType == RoleType) return true;
        }

        return false;
    }

    void AddRoleGroup(FCombatRoleGroup RoleGroup)
    {
        RoleGroups.Add(RoleGroup);
        RoleGroups.Sort();
    }

    /** Returns how many more members are allowed to do this Role. */
    int GetNumFreeSlots() const property
    {
        if (TotalMembersAllowed == MAX_int32)
            return MAX_int32;

        return TotalMembersAllowed - TotalMemberCount;
    }

    float GetOccupiedSize() const property
    {
        float Size = 0.0f;
        for (auto& RoleGroup : RoleGroups)
        {
            Size += RoleGroup.GetOccupiedSize();
        }

        return Size;
    }

    /** Returns much more total member size is allowed into this Role. */
    float GetFreeSize() const property
    {
        if (TotalSizeAllowed == MAX_flt)
            return MAX_flt;

        return TotalSizeAllowed - OccupiedSize;
    }

    int GetTotalMemberCount() const property
    {
        int Count = 0;

        for (auto& RoleGroup : RoleGroups)
        {
            Count += RoleGroup.Members.Num();
        }

        return Count;
    }
}

UCLASS()
class UAICombatRoleCategoryContainer_Attack : UAICombatRoleCategoryContainer
{
    const FString GetCategoryName() const property override
    {
        return "Attack";
    }
}

UCLASS()
class UAICombatRoleCategoryContainer_Situational : UAICombatRoleCategoryContainer
{
    default TotalMembersAllowed = 1;

    const FString GetCategoryName() const property override
    {
        return "Situational";
    }
}

UCLASS()
class UAICombatRoleCategoryContainer_Spare : UAICombatRoleCategoryContainer
{
    default RoleGroups.Add(FCombatRoleGroup(ECombatRole::Observer));

    const FString GetCategoryName() const property override
    {
        return "Spare";
    }
}

/** Role setup, contains the required amounts and allowed amounts for every possible role */
UCLASS()
class UAICombatRoleSystem
{
    UPROPERTY()
    TMap<ECombatRoleCategories, UAICombatRoleCategoryContainer> RoleCategoryContainers;

    UPROPERTY(BlueprintHidden)
    TMap<AGothicCharacter, ECombatRole> CharacterRoles;

    UPROPERTY(BlueprintHidden)
    TMap<ECombatRole, FCombatRoleHandle> RoleQuickAccess;

    default RoleCategoryContainers.Add(ECombatRoleCategories::Attack, UAICombatRoleCategoryContainer_Attack());
    default RoleCategoryContainers.Add(ECombatRoleCategories::Situational, UAICombatRoleCategoryContainer_Situational());
    default RoleCategoryContainers.Add(ECombatRoleCategories::Spare, UAICombatRoleCategoryContainer_Spare());

    void SetupRoleSystem()
    {
        InitializeRoleQuickAccess();
    }

    private void InitializeRoleQuickAccess()
    {
        for (auto Iterator : RoleCategoryContainers)
        {
            for (auto& RoleGroup : Iterator.Value.RoleGroups)
            {
                if (RoleGroup.RoleType == ECombatRole::None)
                    continue;

                // check(!RoleQuickAccess.Contains(RoleGroup.RoleType), "Tried to add the same combat role type more than once.");
                if (RoleQuickAccess.Contains(RoleGroup.RoleType))
                    continue;

                RoleQuickAccess.Add(RoleGroup.RoleType, FCombatRoleHandle(RoleGroup.RoleType, Iterator.Key, Iterator.Value.RoleGroups.FindIndex(RoleGroup)));
            }
        }
    }

    void RemoveCharacterFromAllRoleCategories(AGothicCharacter Character)
    {
        for (auto Iterator : RoleCategoryContainers)
        {
            Iterator.Value.RemoveCharacterFromAllRoles(Character);
        }
    }

    void RemoveCharacterFromCurrentRoleGroup(AGothicCharacter Character)
    {
        if (!CharacterRoles.Contains(Character) || !RoleQuickAccess.Contains(CharacterRoles[Character]))
        {
            RemoveCharacterFromAllRoleCategories(Character);
            return;
        }

        auto RoleHandle = RoleQuickAccess[CharacterRoles[Character]];
        ECombatRoleCategories RoleCategory = RoleHandle.RoleCategory;
        int RoleGroupIndex = RoleHandle.RoleGroupIndex;

        RoleCategoryContainers[RoleCategory].RoleGroups[RoleGroupIndex].Members.Remove(Character);
        CharacterRoles.Remove(Character);
    }

    ECombatRole GetCharactersRoleType(AGothicCharacter Character) const final
    {
        if (!CharacterRoles.Contains(Character))
            return ECombatRole::None;

        return CharacterRoles[Character];
    }

    int GetRoleCount() const property
    {
        int TotalCount = 0;
        for (auto Iterator : RoleCategoryContainers)
        {
            TotalCount += Iterator.Value.RoleGroups.Num();
        }

        return TotalCount;
    }

    bool IsRoleInCategory(ECombatRole Role, ECombatRoleCategories RoleCategory) const final
    {
        if (!RoleCategoryContainers.Contains(RoleCategory))
            return false;

        if (!RoleQuickAccess.Contains(Role))
            return false;

        return RoleQuickAccess[Role].RoleCategory == RoleCategory;
    }

    /** Returns a value between 0..1, where more important Roles get higher values. 1 being the most important Role. */
    float GetRolePriority(ECombatRole Role) const final
    {
        if (!IsRoleInCategory(Role, ECombatRoleCategories::Attack) && !IsRoleInCategory(Role, ECombatRoleCategories::Situational))
            return 0.0f;

        // return RoleCategoryContainers[ECombatRoleCategories::Attack].GetRolePriorityRatio(Role);
        return FindRoleGroup(Role).Priority;
    }

    /** Returns how many characters have been given the same role as the given character. */
    void GetNumCharactersInRoleOf(AGothicCharacter Character, int& MyIndex, int& NumInRole) const final
    {
        if (!CharacterRoles.Contains(Character) || !RoleQuickAccess.Contains(CharacterRoles[Character]))
        {
            MyIndex = -1;
            NumInRole = -1;
            return;
        }

        auto RoleHandle = RoleQuickAccess[CharacterRoles[Character]];
        ECombatRoleCategories RoleCategory = RoleHandle.RoleCategory;
        int RoleGroupIndex = RoleHandle.RoleGroupIndex;

        int Index = RoleCategoryContainers[RoleCategory].RoleGroups[RoleGroupIndex].Members.FindIndex(Character);

        if (Index >= 0)
        {
            MyIndex = Index;
            NumInRole = RoleCategoryContainers[RoleCategory].RoleGroups[RoleGroupIndex].Members.Num();
            return;
        }

        MyIndex = 0;
        NumInRole = 0;       
    }

    /** Returns how many characters have been given the same role as the given character. */
    int GetNumCharactersInRoleOf(AGothicCharacter Character) const final
    {
        int MyIndex = 0;
        int NumInRole = 0;

        GetNumCharactersInRoleOf(Character, MyIndex, NumInRole);

        return NumInRole;
    }

    /** Returns how many characters have been given this role. */
    int GetNumCharactersInRole(ECombatRole Role) const final
    {
        return FindRoleGroup(Role).Members.Num();
    }

    /** Returns all characters that have been given this role. */
    TArray<AGothicCharacter> GetCharactersInRole(ECombatRole Role) const final
    {
        if (FindRoleGroup(Role).RoleType == ECombatRole::None) 
            return TArray<AGothicCharacter>();
        
        return FindRoleGroup(Role).Members;
    }

    /** Returns how many more characters can do this Role. */
    int32 GetNumFreeSlotsForRole(ECombatRole Role) const final
    {
        return FindRoleGroup(Role).NumFreeSlots;
    }

    /** Returns how many more characters can do this Role. */
    float GetFreeSizeForRole(ECombatRole Role) const final
    {
        return FindRoleGroup(Role).NumFreeSlots;
    }

    /** Returns the state of the given Role. */
    FCombatRoleGroup& FindRoleGroup(ECombatRole Role)
    {
        if (!RoleQuickAccess.Contains(Role))
            return RoleCategoryContainers[ECombatRoleCategories::Spare].RoleGroups[0];
        
        auto RoleHandle = RoleQuickAccess[Role];
        ECombatRoleCategories RoleCategory = RoleHandle.RoleCategory;
        int RoleGroupIndex = RoleHandle.RoleGroupIndex;

        return RoleCategoryContainers[RoleCategory].RoleGroups[RoleGroupIndex];
    }

    const FCombatRoleGroup& FindRoleGroup(ECombatRole Role) const
    {
        if (!RoleQuickAccess.Contains(Role))
            return RoleCategoryContainers[ECombatRoleCategories::Spare].RoleGroups[0];
        
        auto RoleHandle = RoleQuickAccess[Role];
        ECombatRoleCategories RoleCategory = RoleHandle.RoleCategory;
        int RoleGroupIndex = RoleHandle.RoleGroupIndex;

        return RoleCategoryContainers[RoleCategory].RoleGroups[RoleGroupIndex];
    }

    FCombatRoleGroup& GetCharactersRoleGroup(AGothicCharacter Character)
    {
        return FindRoleGroup(GetCharactersRoleType(Character));
    }

    /** Let the given character go into a different group Role. */
    void SwitchRoles(AGothicCharacter Character, ECombatRole TargetRoleType) final
    {
        FCombatRoleGroup& TargetRoleGroup = FindRoleGroup(TargetRoleType);

        SwitchRoles(Character, TargetRoleGroup);
    }

    /** Let the given character go into a different group Role. */
    void SwitchRoles(AGothicCharacter Character, FCombatRoleGroup& TargetRoleGroup) final
    {
        RemoveCharacterFromCurrentRoleGroup(Character);
        AddCharacterToRole(Character, TargetRoleGroup);
    }

    void AddCharacterToRole(AGothicCharacter Character, FCombatRoleGroup& TargetRoleGroup) final
    {
        TargetRoleGroup.Members.Add(Character);
        CharacterRoles.Add(Character, TargetRoleGroup.RoleType);
    }

    TArray<ECombatRole> GetAvailableRoles() const final
    {
        TArray<ECombatRole> Roles;
        for (auto Iterator : RoleQuickAccess)
        {
            Roles.Add(Iterator.Key);
        }

        return Roles;
    }
}

/** Role setup used whenever the AI's target doesn't require any other specific role system */
UCLASS()
class UAICombatRoleSystem_Default : UAICombatRoleSystem
{
    void SetupRoleSystem() override
    {
        RoleCategoryContainers[ECombatRoleCategories::Attack].TotalSizeAllowed = 3.0f;
        RoleCategoryContainers[ECombatRoleCategories::Attack].AddRoleGroup(FCombatRoleGroup(ECombatRole::PassiveAttacker, InSizeAllowed = 2.0f, InRoleSizeSlotMultiplier = 0.5f, InPriority = 0.5f));
        RoleCategoryContainers[ECombatRoleCategories::Attack].AddRoleGroup(FCombatRoleGroup(ECombatRole::ActiveAttacker, InSizeAllowed = 2.0f, InPriority = 1.0f));

        RoleCategoryContainers[ECombatRoleCategories::Situational].AddRoleGroup(FCombatRoleGroup(ECombatRole::HealSelf, InNumAllowed = 1, InPriority = 0.0f));
        
        Super::SetupRoleSystem();
    }
}

/** Role setup used whenever the AI's target is a player */
UCLASS()
class UAICombatRoleSystem_Player : UAICombatRoleSystem
{
    void SetupRoleSystem() override
    {
        RoleCategoryContainers[ECombatRoleCategories::Attack].TotalSizeAllowed = 4.0f;
        RoleCategoryContainers[ECombatRoleCategories::Attack].AddRoleGroup(FCombatRoleGroup(ECombatRole::PassiveAttacker, InSizeAllowed = 2.0f, InRoleSizeSlotMultiplier = 0.5f, InPriority = 0.0f));
        RoleCategoryContainers[ECombatRoleCategories::Attack].AddRoleGroup(FCombatRoleGroup(ECombatRole::ActiveAttacker, InSizeAllowed = 2.0f, InPriority = 1.0f));

        RoleCategoryContainers[ECombatRoleCategories::Situational].AddRoleGroup(FCombatRoleGroup(ECombatRole::HealSelf, InNumAllowed = 1, InPriority = 0.0f));
        
        Super::SetupRoleSystem();
    }
}