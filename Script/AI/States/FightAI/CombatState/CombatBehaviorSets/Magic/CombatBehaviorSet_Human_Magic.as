UCLASS()
class UCombatBehaviorSet_Human_Magic : UCombatBehaviorSet
{
    default Roles.Add(ECombatRole::PassiveAttacker);
    default Roles.Add(ECombatRole::ActiveAttacker);

    float32 TauntCooldown = 5.0f;

    default TauntCooldown_Base = 10.0f;
    default TauntCooldown_General = 10.0f;

    FAttackInfo AttackUniversalSpellCasting = FAttackInfo(
        UCM_CastSpell_GenericUniversal(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetAttackerRoleSet(),
        bInMaxRangeOverride = true,
        InMaxRange = 3000.0f,
        InMinRange = 0.0f);
    default AddAttack(AttackUniversalSpellCasting);

    FAttackInfo ExecutionAttack = FAttackInfo(
        UCM_Attack_ExecuteDefeatedCharacter(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        bInMaxRangeOverride = true,
        InMinRange = 0.0f,
        InMaxRange = 150.0f);
    default AddAttack(ExecutionAttack);

    // BEHAVIORS ///////
    ///// ANY ROLE /////
    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_MagicSpellStopCastingAny(), InSortLayer = 0.001f);

    default Behavior_MediumPriority()
                    .AttackTree(0.5f, "Execution Attack")
                        .AddAttack(ExecutionAttack)
                        .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    ///// ACTIVE ATTACKER /////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Main Magic")
                    .AddAttack(AttackUniversalSpellCasting)
                    .AddTreeCooldown("DoMagic", 2.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    ///// PASSIVE ATTACKER /////
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Passive Magic")
                    .AddAttack(AttackUniversalSpellCasting)
                    .AddTreeCooldown("DoMagic_Passive", 15.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    // MOVEMENT
    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());

    // default Behavior_MediumPriority()
    //         .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 10.0f))
    //             .AddRequirement(UCS_Not(UCS_EnemyDefeated()));
    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (!Combat.Self.HasDrawnMagicSpell())
        {
            Reason = "No rune or scroll drawn";
            return false;
        }

        return true;
    }

    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.Config.PreferredDistance = 450.0f;
        Combat.Positioning.MinimumPositionDistance = 30.0f;
        Combat.EnemyTooCloseDistance = 0.0f;
        Combat.EnemyCloseDistance = 250.0f;
        Combat.EnemyLungeDistance = 700.0f;

        if (Combat.SelectedSpellAction == nullptr)
            return;

        if (Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Circle_OnCaster) ||
            Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Cone))
        {
            Combat.Config.PreferredDistance = Combat.SelectedSpellAction.SpellConfigFromContainer.SpellConfig.SpellAreaRange * 0.6f;
        }
    }

    float GetRolePriority() override property
    {
        //TODO: Change based on current spell level / Character level?
        if (Combat.SelectedSpellAction == nullptr)
            return Super::GetRolePriority();

        if (!Combat.SelectedItem.IsA(URuneItem::StaticClass()))
            return Super::GetRolePriority();

        return Super::GetRolePriority() + Cast<URuneItem>(Combat.SelectedItem).RequiredMagicCircleLevel * 0.125f; //RequiredMagicCircleLevel / MaxLevel (8)
    }

    bool IsValidForCharacter(const AGothicCharacter Character) const override
    {
        FGameplayTagContainer Types;
        Types.AddTag(GameplayTag::Item_Weapon_Rune);
        Types.AddTag(GameplayTag::Item_Weapon_Scroll);
        for (auto Item : Character.Inventory.GetItemsMatchingAnyTypeOf(Types))
        {
            USpellContainer SpellContainer = Cast<USpellContainer>(Item);
            if (SpellContainer == nullptr)
                continue;

            if (Character.CanUseSpell(SpellContainer, false))
                return true;
        }

        return false;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Human_Magic : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_Human_Magic::StaticClass());
}