class USpawnAIAgentDefinition_TestOrcSimple_Taunts_Fists : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Taunts_Fists::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Taunts_Fists : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Taunts_Fists::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Taunts_Sword : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Taunts_Sword::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Taunts_Sword : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Taunts_Sword::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Taunts_Axe : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Taunts_Axe::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Taunts_Axe : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Taunts_Axe::StaticClass();
}

class USpawnAIAgentDefinition_TestOrcSimple_Taunts_Mace : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrcSimple_Taunts_Mace::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_Taunts_TempleWarrior.AIAgentCharacter_TestOrcSimple_Taunts_TempleWarrior_C'";
}
UCLASS()
class UAIAgentConfig_TestOrcSimple_Taunts_Mace : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrcSimple_Taunts_Mace::StaticClass();
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_TauntParent : UCharacterDefinition_TestOrcSimple_SpecialParent
{
    default m_AIAbility = UGameplayAbility_CharacterAI_TestOrcSimple_Taunts;
}


UCLASS()
class UCharacterDefinition_TestOrcSimple_Taunts_Fists : UCharacterDefinition_TestOrcSimple_TauntParent
{
    default m_UniqueName = n"Test_Orc_Simple_Fists";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OPS_OrcPeasantM24_2091::StaticClass();
    default AddToInventory(UHumanFist_NoWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Taunts_Sword : UCharacterDefinition_TestOrcSimple_TauntParent
{
    default m_UniqueName = n"Test_Orc_Simple_Sword";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSC_OrcScoutM01_2021::StaticClass();
    default AddToInventory(UItMw_2H_Sword_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Taunts_Axe : UCharacterDefinition_TestOrcSimple_TauntParent
{
    default m_UniqueName = n"Test_Orc_Simple_Axe";  
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OWR_OrcWarriorM01_2001::StaticClass();
    default AddToInventory(UItMw_2H_Axe_Orc_03_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrcSimple_Taunts_Mace : UCharacterDefinition_TestOrcSimple_TauntParent
{
    default m_UniqueName = n"Test_Orc_Simple_Mace";  
    // default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOW_UndeadOrcTempleGuard12_3011::StaticClass();
    default AddToInventory(UItMw_2H_Mace_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}


UCLASS()
class UAIState_Combat_TestOrcSimple_Taunts: UAIState_Combat_SimplifiedTest
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_TestOrcSimple_Taunts::StaticClass());

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
class UWeaponBehaviorSet_TestOrcSimple_Taunts: UWeaponBehaviorSet_TestOrcSimple_Parent
{
    // BEHAVIORS ///////

    // --------- TAUNT ---------
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_TestRandomTauntWhenClose());

    // --------- WALK AND TAUNT ---------
    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_TestWaypointsAandB());
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_TestRandomTauntWhenClose());

    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 4000.0f;
        Combat.EnemyCloseDistance = 5000.0f;
    }
}

UCLASS()
class UGameplayAbility_CharacterAI_TestOrcSimple_Taunts: UGameplayAbility_CharacterAI_Gothic
{
    /// ITEM SCORING
    /// Melee Weapon Scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_MeleeWeapon_BasePriorityBySkill());
    /// Ranged weapon scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_BasePriorityBySkill());
    /// Misc item scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_ActualWeaponBonus());

    default AssessmentModuleClass = UAIARM_TestCharacterSimple;
  
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_TestOrcSimple_Taunts::StaticClass());
}

UCLASS()
class UCombatBehaviorSetPackage_TestOrcSimple_Taunts: UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_TestOrcSimple_Taunts::StaticClass());
}