UCLASS()
class UAIState_Combat_Sleeper_Milten : UAIState_Combat_Human
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Sleeper_Milten::StaticClass());

    float32 TauntCooldown = 5.0f;

    // Cooldown timers local variables

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyCombatDistance = 1000.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.66f;
    }

    void ValidateSelectedAttack() override
    {
        Super::ValidateSelectedAttack();
        
        if (CharacterState.HasGameplayTag(GameplayTag::Debuff_Milten_Brazier))
        {
            ResetSelectedAttack();
        }
    }

    FString GetDisplayName() const override
    {
        return "SleeperTest_Milten - Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Sleeper_Milten_Observer : UCombatBehaviorSet_Human_Observer_Ranged
{
    
}

UCLASS()
class UWeaponBehaviorSet_Sleeper_Milten : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Rune_FireBall);

    // ATTACKS /////////
    FAttackInfo Fireball = FAttackInfo(
        UCM_Spell_Milten_Fireball(600.0f, 5000.0f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        50000.0f,
        InMinRange = 400.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(Fireball);

    FAttackInfo Firebolt = FAttackInfo(
        UCM_Spell_Milten_FireBolt(3), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        50000.0f,
        InMinRange = 200.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(Firebolt);

    FAttackInfo Teleport = FAttackInfo(
        UCM_Spell_Milten_Teleport(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        5000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(Teleport);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .DoNode(UCBT_Behavior_CombatMove(UCM_WaitForBrazierDamage()), 0.001f)
                    .AddRequirement(UCS_SelfHasTag(GameplayTag::Debuff_Milten_Brazier));

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Teleport")
                    .AddAttack(Teleport)
                    .AddTreeCooldown("Teleport", 5.0f)
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::Debuff_Milten_Brazier)))
                    .AddRequirement(UCS_EnemyCloserThan(150.0f));

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Firebolt")
                    .AddAttack(Firebolt)
                    .AddTreeCooldown("Firebolt", 3.0f)
                    //.AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::Debuff_Milten_Brazier)));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Fireball")
                    .AddAttack(Fireball)
                    .AddTreeCooldown("Fireball", 5.0f)
                    .AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::Debuff_Milten_Brazier)))
                    .AddRequirement(UCS_EnemyInsideDistanceRange(400, 50000));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Fireball")
                    .AddAttack(Fireball)
                    .AddTreeCooldown("Fireball", 5.0f)
                    //.AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::Debuff_Milten_Brazier)))
                    .AddRequirement(UCS_EnemyInsideDistanceRange(400, 50000));

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Firebolt")
                    .AddAttack(Firebolt)
                    .AddTreeCooldown("Firebolt", 3.0f)
                    .AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
                    .AddRequirement(UCS_Not(UCS_SelfHasTag(GameplayTag::Debuff_Milten_Brazier)));



    // MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////

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
}

UCLASS()
class UCombatBehaviorSetPackage_Sleeper_Milten : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Sleeper_Milten_Observer::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Sleeper_Milten::StaticClass());
}
