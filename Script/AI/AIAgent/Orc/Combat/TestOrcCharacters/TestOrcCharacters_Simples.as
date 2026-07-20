UCLASS()
class UCharacterDefinition_TestOrcSimple_SpecialParent : UCharacterDefinition_Orc_Test
{
    default SetAttributeValue("AttributeSet_Health.Health", 10000);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 10000);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 8);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 8);
    default SetAttributeValue("AttributeSet_Strength.Strength", 50);
    default SetAttributeValue("AttributeSet_Mana.Mana", 100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 100);

    default m_InitialGuildEffect = UGE_Guild_Orc_Shaman::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Omniperception::StaticClass();

    default m_AIAbility = UGameplayAbility_CharacterAI_TestOrcSimple::StaticClass();

    default AddToInventory(UItFo_Apple::StaticClass(), 15, EInventoryTypes::QuickItems);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 15, EInventoryTypes::QuickItems);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Undead_SpecialParent : UCharacterDefinition_OrcUndead
{
    default SetAttributeValue("AttributeSet_Health.Health", 10000);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 10000);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 8);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 8);
    default SetAttributeValue("AttributeSet_Strength.Strength", 50);
    default SetAttributeValue("AttributeSet_Mana.Mana", 100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 100);

    default m_InitialGuildEffect = UGE_Guild_Orc_Shaman::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Omniperception::StaticClass();

    default m_AIAbility = UGameplayAbility_CharacterAI_TestOrcSimple::StaticClass();

    default AddToInventory(UItFo_Apple::StaticClass(), 15, EInventoryTypes::QuickItems);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 15, EInventoryTypes::QuickItems);
}

UCLASS()
class UAIState_Combat_TestOrcSimple : UAIState_Combat_SimplifiedTest
{
    default AssessmentModuleClass = nullptr;
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_TestOrcSimple::StaticClass());

    float32 TauntCooldown = 1.0f;
    default bCanDoTauntsWhileMoving = true;

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 200.0f;
        EnemyCombatDistance = 1200.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.25f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    FString GetDisplayName() const override
    {
        return "Test Orc Simple";
    }

    // default CommonBehavior_Movement
    //     .DoNode(UCBT_MoveToDoSelectedAttack());
}

UCLASS()
class UWeaponBehaviorSet_TestOrcSimple : UWeaponBehaviorSet_TestOrcSimple_Parent
{
    // BEHAVIORS ///////

    // --------- ATTACK ---------
    default Behavior_MediumPriority()
                .AttackTree()
                    .AddAttack(TestAttack_L01)
                    // .AddAttack(TestAttack_R01)
                    // .AddAttack(TestAttack_L_R02)
                    // .AddAttack(TestAttack_R_L03)
                    // .AddAttack(TestAttack_B01)
                    // .AddAttack(TestAttack_T01)
                    // .AddAttack(TestAttack_LH)
                    // .AddAttack(TestAttack_B_R02)
                    // .AddAttack(TestAttack_B_B02)
                    // .AddAttack(TestAttack_L_T02)
                    .AddTreeCooldown("Attack", 5.0f)
                    .AddRequirement(UCS_EnemyTooClose());

    // --------- JUST WAIT ---------
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_Wait());

    // --------- TAUNT ---------
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_TestRandomTauntWhenClose());

    // --------- WALK AND TAUNT ---------
    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_TestWaypointsAandB());
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_TestRandomTauntWhenClose());

    // --------- WALK AND STOP WHEN PLAYER IS TOO CLOSE ---------
    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_TestWaypointsAandB())
    //         .AddRequirement(UCS_Not(UCS_EnemyTooClose()));
    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_Wait())
    //         .AddRequirement((UCS_EnemyTooClose()));

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 4000.0f;
        Combat.EnemyCloseDistance = 5000.0f;
    }
}

UCLASS()
class UWeaponBehaviorSet_TestOrcSimple_Fireball : UWeaponBehaviorSet_TestOrcSimple_Parent
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_PickaxeDemo);
    // BEHAVIORS ///////

    // --------- ATTACK ---------
    default Behavior_MediumPriority()
                .AttackTree()
                    .AddAttack(TestFireballAttack)
                    .AddTreeCooldown("Attack", 5.0f)
                    .AddRequirement(UCS_EnemyTooClose());

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 4000.0f;
        Combat.EnemyCloseDistance = 5000.0f;
    }
}
UCLASS()
class UWeaponBehaviorSet_TestOrcSimple_Pyro : UWeaponBehaviorSet_TestOrcSimple_Parent
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    // BEHAVIORS ///////

    // --------- ATTACK ---------
    default Behavior_MediumPriority()
                .AttackTree()
                    .AddAttack(TestPyrokinesisAttack)
                    .AddTreeCooldown("Attack", 5.0f)
                    .AddRequirement(UCS_EnemyTooClose());

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 4000.0f;
        Combat.EnemyCloseDistance = 5000.0f;
    }
}
UCLASS()
class UWeaponBehaviorSet_TestOrcSimple_BallL : UWeaponBehaviorSet_TestOrcSimple_Parent
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    // BEHAVIORS ///////

    // --------- ATTACK ---------
    default Behavior_MediumPriority()
                .AttackTree()
                    .AddAttack(TestBallLightingAttack)
                    .AddTreeCooldown("Attack", 5.0f)
                    .AddRequirement(UCS_EnemyTooClose());

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 4000.0f;
        Combat.EnemyCloseDistance = 5000.0f;
    }
}
UCLASS()
class UWeaponBehaviorSet_TestOrcSimple_ChainL : UWeaponBehaviorSet_TestOrcSimple_Parent
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    // BEHAVIORS ///////

    // --------- ATTACK ---------
    default Behavior_MediumPriority()
                .AttackTree()
                    .AddAttack(TestChainLightingAttack)
                    .AddTreeCooldown("Attack", 5.0f)
                    .AddRequirement(UCS_EnemyTooClose());

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 4000.0f;
        Combat.EnemyCloseDistance = 5000.0f;
    }
}


UCLASS()
class UWeaponBehaviorSet_TestOrcSimple_Storm : UWeaponBehaviorSet_TestOrcSimple_Parent
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Tail);
    // BEHAVIORS ///////

    // --------- ATTACK ---------
    default Behavior_MediumPriority()
                .AttackTree()
                    .AddAttack(TestStormOfFireAttack)
                    .AddTreeCooldown("Attack", 5.0f)
                    .AddRequirement(UCS_EnemyTooClose());

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 4000.0f;
        Combat.EnemyCloseDistance = 5000.0f;
    }
}


UCLASS()
class UWeaponBehaviorSet_TestOrcSimple_Breath : UWeaponBehaviorSet_TestOrcSimple_Parent
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw);
    // BEHAVIORS ///////

    // --------- ATTACK ---------
    default Behavior_MediumPriority()
                .AttackTree()
                    .AddAttack(TestBreathOfDeathAttack)
                    .AddTreeCooldown("Attack", 5.0f)
                    .AddRequirement(UCS_EnemyTooClose());

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 4000.0f;
        Combat.EnemyCloseDistance = 5000.0f;
    }
}

UCLASS()
class UGameplayAbility_CharacterAI_TestOrcSimple : UGameplayAbility_CharacterAI_Gothic
{
    /// ITEM SCORING
    /// Melee Weapon Scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_MeleeWeapon_BasePriorityBySkill());
    /// Ranged weapon scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_BasePriorityBySkill());
    /// Misc item scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_ActualWeaponBonus());

    default AssessmentModuleClass = UAIARM_TestCharacterSimple;
  
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_TestOrcSimple::StaticClass());
}

UCLASS()
class UCombatBehaviorSetPackage_TestOrcSimple : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TestOrcSimple::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TestOrcSimple_Fireball::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TestOrcSimple_Pyro::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TestOrcSimple_BallL::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TestOrcSimple_ChainL::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TestOrcSimple_Storm::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TestOrcSimple_Breath::StaticClass());
}

UCLASS()
class UWeaponBehaviorSet_TestOrcSimple_Parent : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Fist);

    // default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    // default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    // default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    // default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Tail);
    // default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw);
    // default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_PickaxeDemo);    

    FAttackInfo TestAttack_L01 = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestAttack_L01);    

    FAttackInfo TestAttack_R01 = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestAttack_R01); 

    FAttackInfo TestAttack_B01 = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);;
    default AddAttack(TestAttack_B01); 

    FAttackInfo TestAttack_T01 = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestAttack_T01);

    FAttackInfo TestAttack_L_R02 = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestAttack_L_R02);    

    FAttackInfo TestAttack_R_L02 = FAttackInfo(
        UCM_AttackSCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestAttack_R_L02); 

    FAttackInfo TestAttack_B_R02 = FAttackInfo(
        UCM_AttackSCombo_BottomRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestAttack_B_R02);  

    FAttackInfo TestAttack_B_B02 = FAttackInfo(
        UCM_AttackSCombo_BottomTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);;
    default AddAttack(TestAttack_B_B02);  

    FAttackInfo TestAttack_L_T02 = FAttackInfo(
        UCM_AttackSCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);;
    default AddAttack(TestAttack_L_T02);  

    FAttackInfo TestAttack_L_R03 = FAttackInfo(
        UCM_AttackSCombo_RightLeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestAttack_L_R03); 

    FAttackInfo TestAttack_R_L03 = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestAttack_R_L03);

    //Attack to test hip LH
    FAttackInfo TestAttack_LH = FAttackInfo(
        UCM_Attack_Extra01(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestAttack_LH); 

    // Test Spells
    FAttackInfo TestPyrokinesisAttack = FAttackInfo(
        UCM_OrcShamanSpell_Pyrokinesis_CastForSeconds(5.0f), //UCM_Attack_Extra01
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestPyrokinesisAttack); 

    FAttackInfo TestBallLightingAttack = FAttackInfo(
        UCM_OrcShamanSpell_BallLightning_CastChargedBasedOnDistance(40.0f,4000.0f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        // 400.0f,
        4000.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(TestBallLightingAttack);

    FAttackInfo TestFireballAttack = FAttackInfo(
        UCM_OrcShamanSpell_FireBall_CastChargedBasedOnDistance(40.0f,4000.0f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        // 400.0f,
        4000.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(TestFireballAttack);

    FAttackInfo TestChainLightingAttack = FAttackInfo(
        UCM_OrcShamanSpell_ChainLightning_CastForSeconds(5.0f), //UCM_Attack_Extra03 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        4000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestChainLightingAttack);

    FAttackInfo TestStormOfFireAttack = FAttackInfo(
        UCM_OrcShamanSpell_StormOfFire(), //UCM_Attack_Extra04 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        4000.0f,
        40.0f,
        bInMaxRangeOverride = true);
    default AddAttack(TestStormOfFireAttack);

    FAttackInfo TestBreathOfDeathAttack = FAttackInfo(
        UCM_OrcShamanSpell_BreathOfDeath(), //UCM_Attack_Extra04 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        4000.0f,
        40.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(TestBreathOfDeathAttack);
    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 4000.0f;
        Combat.EnemyCloseDistance = 5000.0f;
    }
}


//-------------------------------------------

class USpawnAIAgentDefinition_TestOrcSimple_NoWeapon : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_NoWeapon::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_NoWeapon : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_NoWeapon::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Fists : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Fists::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Fists : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Fists::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Fists_Warrior : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Fists_Warrior::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_TempleWarrior.AIAgentCharacter_TestOrcSimple_TempleWarrior_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Fists_Warrior : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Fists_Warrior::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Sword : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Sword::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Sword : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Sword::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Axe : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Axe::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Axe : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Axe::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Mace : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Mace::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_TempleWarrior.AIAgentCharacter_TestOrcSimple_TempleWarrior_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Mace : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Mace::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Staff : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Staff::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Staff : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Staff::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Staff_Undead : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Staff_Undead::StaticClass();
    // default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_Varrag.AIAgentCharacter_TestOrcSimple_Varrag_C'";
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Staff_Undead : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Staff_Undead::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Staff_Fireball : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Staff_Fireball::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Staff_Fireball : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Staff_Fireball::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Staff_Pyrokinesis : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Staff_Pyrokinesis::StaticClass();
    // default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_Varrag.AIAgentCharacter_TestOrcSimple_Varrag_C'";
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Staff_Pyrokinesis : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Staff_Pyrokinesis::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Staff_BallLighting : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Staff_BallLighting::StaticClass();
    // default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_Varrag.AIAgentCharacter_TestOrcSimple_Varrag_C'";
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Staff_BallLighting : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Staff_BallLighting::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Staff_ChainLighting : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Staff_ChainLighting::StaticClass();
    // default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_Varrag.AIAgentCharacter_TestOrcSimple_Varrag_C'";
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Staff_ChainLighting : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Staff_ChainLighting::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Staff_StormOfFire : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Staff_StormOfFire::StaticClass();
    // default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_Varrag.AIAgentCharacter_TestOrcSimple_Varrag_C'";
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Staff_StormOfFire : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Staff_StormOfFire::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Staff_BreathOfDeath : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Staff_BreathOfDeath::StaticClass();
    // default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_Varrag.AIAgentCharacter_TestOrcSimple_Varrag_C'";
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Staff_BreathOfDeath : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Staff_BreathOfDeath::StaticClass();
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_NoWeapon : UCharacterDefinition_TestOrcSimple_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_No_weapon";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OPS_OrcPeasantM24_2091::StaticClass();
    default AddToInventory(UFakeNoWeaponOrc_weapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Fists : UCharacterDefinition_TestOrcSimple_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_Fists";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OPS_OrcPeasantM24_2091::StaticClass();
    default AddToInventory(UHumanFist_NoWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Fists_Warrior : UCharacterDefinition_TestOrcSimple_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_Fists_Warrior";  
    default AddToInventory(UHumanFist_NoWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Sword : UCharacterDefinition_TestOrcSimple_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_Sword";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSC_OrcScoutM01_2021::StaticClass();
    default AddToInventory(UItMw_2H_Sword_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Axe : UCharacterDefinition_TestOrcSimple_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_Axe";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OWR_OrcWarriorM01_2001::StaticClass();
    default AddToInventory(UItMw_2H_Axe_Orc_03_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Mace : UCharacterDefinition_TestOrcSimple_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_Mace";  
    // default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOW_UndeadOrcTempleGuard12_3011::StaticClass();
    default AddToInventory(UItMw_2H_Mace_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Staff : UCharacterDefinition_TestOrcSimple_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_Staff";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSM_OrcShamanM03_2066::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Orc_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Staff_Undead : UCharacterDefinition_TestOrcSimple_Undead_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_Staff_Undead";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragHashor::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Staff_Fireball : UCharacterDefinition_TestOrcSimple_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_Fireball";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSM_OrcShamanM03_2066::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Orc_vOrc_Fireball::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Staff_Pyrokinesis : UCharacterDefinition_TestOrcSimple_Undead_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_Pyrokinesis";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragHashor::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_vOrc_Pyrokinesis::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Staff_BallLighting : UCharacterDefinition_TestOrcSimple_Undead_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_BallLighting";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragKasorg::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_vOrc_BallLighting::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Staff_ChainLighting : UCharacterDefinition_TestOrcSimple_Undead_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_ChainLighting";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragUnhilqt::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_vOrc_ChainLighting::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Staff_StormOfFire : UCharacterDefinition_TestOrcSimple_Undead_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_StormOfFire";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragRuuushk::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_vOrc_StormOfFire::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Staff_BreathOfDeath : UCharacterDefinition_TestOrcSimple_Undead_SpecialParent
{
    default m_UniqueName = n"Test_Orc_Simple_BreathOfDeath";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragArushat::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_vOrc_BreathOfDeath::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_Orc_Test : UCharacterDefinition
{
	default m_CharacterType = GameplayTag::AIAgent_Orc;
    default m_Species = GameplayTag::Species_Orc;
    
    default m_CharacterSizeGroup = GameplayTag::Character_Size_Orc;
    
    default m_AbilitiesEffect = UGE_Orc_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Orc_Player::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Human::StaticClass();

    default m_InitialGuildEffect = UGE_Guild_None::StaticClass();

    /*default m_MutableAsset = "MO_OrcM";
    default m_MutableAssetPath = "/Game/Assets/Characters/Orcs/Mutable/Man/";*/

    // Other
    default m_CameraConfig = UOrcCamera::StaticClass();
	
    // Initial character attributes values
    default SetAttributeValue("AttributeSet_Health.Health", 100);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 100);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100);
    default SetAttributeValue("AttributeSet_LevelProgression.Level", 1);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience", 0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 0);
    default SetAttributeValue("AttributeSet_Mana.Mana", 25);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 25);
    default SetAttributeValue("AttributeSet_Movement.SpeedModifier", 1);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 25);
    default SetAttributeValue("AttributeSet_Strength.Strength", 100);
    default SetAttributeValue("AttributeSet_Pickpocketing.PickPocketing", 0);
       
    // Inventory
    FGameplayTagContainer meleeSlotItemCategories;
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Axe);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Sword);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Orc);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Staff);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Fist);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_PickaxeDemo);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Tail);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Foot);
    default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

    FGameplayTagContainer rangedSlotItemCategories;
    default rangedSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Bow);
    default rangedSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Crossbow);
    default CreateInventory(EInventoryTypes::RangedSlot, rangedSlotItemCategories, 1);

    FGameplayTagContainer armorSlotItemCategories;
    default armorSlotItemCategories.AddTag(GameplayTag::Item_Armor);
    default CreateInventory(EInventoryTypes::ArmorSlot, armorSlotItemCategories, 1);

    FGameplayTagContainer ringLeftSlotItemCategories;
    default ringLeftSlotItemCategories.AddTag(GameplayTag::Item_Ring);
    default CreateInventory(EInventoryTypes::RingLeft, ringLeftSlotItemCategories, 1);

    FGameplayTagContainer ringRightSlotItemCategories;
    default ringRightSlotItemCategories.AddTag(GameplayTag::Item_Ring);
    default CreateInventory(EInventoryTypes::RingRight, ringRightSlotItemCategories, 1);

    FGameplayTagContainer amuletSlotItemCategories;
    default amuletSlotItemCategories.AddTag(GameplayTag::Item_Amulet);
    default CreateInventory(EInventoryTypes::RingRight, amuletSlotItemCategories, 1);

    //default AddToInventory(UItRw_Bow_Diego::StaticClass(), 1, EInventoryTypes::RangedSlot);
    // default AddToInventory(UItMw_2H_Axe_Orc_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);

    // default AddToInventory(UHumanFist_NoWeapon::StaticClass(), 1);
    // default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    // default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	//

    // Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneName = n"root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
    //

    // Skills
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());

    default m_AIAbility = UGameplayAbility_CharacterAI_Orc::StaticClass();
    default m_UniqueName = n"Orc";
}