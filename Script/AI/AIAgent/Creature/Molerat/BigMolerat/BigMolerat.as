class USpawnAIAgentDefinition_BigMolerat : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_BigMolerat;
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Creature/Molerat/AIAgentCharacter_MotherMolerat.AIAgentCharacter_MotherMolerat_C'";
}

UCLASS()
class UAIAgentConfig_BigMolerat : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_BigMolerat;
	default m_LocomotionConfig = ULocomotionConfig_MotherMolerat;
	default m_AnimConfig = UAnimConfig_BigMolerat;

	default m_NavigationConfig = UAIAgentConfig_Navigation_Molerat;

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
}

UCLASS()
class ABigMolerat : AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_BigMolerat;
}

UCLASS()
class UCharacterDefinition_Creature_BigMolerat : UCharacterDefinition_Creature_Molerat
{
    default m_UniqueName = n"MotherMolerat";
    default m_AIAbility = UGameplayAbility_CharacterAI_BigMolerat;
    default m_Species = GameplayTag::Species_Creature_Molerat_Queen;

    default SetAttributeValue("AttributeSet_LevelProgression.Level", 15);
	default SetAttributeValue("AttributeSet_Strength.Strength", 70);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 12);
    default SetAttributeValue("AttributeSet_Health.Health", 400); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 400);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 150);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 150);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 30);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 5);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 5);

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 150);

    default AddToInventory(UItFo_Muttonraw::StaticClass(), 4, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Teeth_01::StaticClass(), 2, EInventoryTypes::MainContainer);
}

UCLASS()
class UGameplayAbility_CharacterAI_BigMolerat : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Molerat_Base;
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_BigMolerat);
    // default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Molerat);
}

UCLASS()
class UAnimConfig_BigMolerat : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature;
    default m_IKConfig = UIKConfig_Molerat;

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Molerat_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_BigMolerat);
    default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_MotherMolerat_Combat);
}

UCLASS()
class UWeaponMeleeItemAnimConfig_BigMolerat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Molerat/Molerat_AnimBP_Combat.Molerat_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_01.A_Molerat_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_02.A_Molerat_IdleBreaker_02'", 1.0f, 4);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_03.A_Molerat_IdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_04.A_Molerat_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_05.A_Molerat_IdleBreaker_05'", 2.0f, 3);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Breaker/A_Molerat_WalkBreaker_01.A_Molerat_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Breaker/A_Molerat_WalkBreaker_02.A_Molerat_WalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Breaker/A_Molerat_WalkBreaker_03.A_Molerat_WalkBreaker_03'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Breaker/A_Molerat_WalkBreaker_04.A_Molerat_WalkBreaker_04'", 1.0f, 4);

   // TURNS
   default m_TurnsData = UTurnsData_Molerat;
   //

    // HITS
    default m_HitsData = UHitData_Default_Molerat;
    // 
}

//////////////////
UCLASS()
class UAttackMeleeConfig_MotherMolerat_Attack_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Attacks/MotherMolerat/Molerat_TopAttack01_Mother_Montage.Molerat_TopAttack01_Mother_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Parried/Molerat_N_Hit_Parried_Top_Montage.Molerat_N_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Deflected/Molerat_N_HitDeflected_Top_Montage.Molerat_N_HitDeflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.9f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_MotherMolerat_Attack_Top2 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Attacks/MotherMolerat/Molerat_TopAttack02_Mother_Montage.Molerat_TopAttack02_Mother_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Parried/Molerat_N_Hit_Parried_Top_Montage.Molerat_N_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Deflected/Molerat_N_HitDeflected_Top_Montage.Molerat_N_HitDeflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.9f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_MotherMolerat_Attack_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_MotherMolerat_Attack_Top;
    default m_GA_Attack = UGA_AttackMelee;
}

UCLASS()
class UComboAttackConfig_MotherMolerat_Attack_Top2 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_MotherMolerat_Attack_Top2;
    default m_GA_Attack = UGA_AttackMelee;
}

//Dig attack
UCLASS()
class UAttackMeleeConfig_MotherMolerat_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Attacks/MotherMolerat/A_Molerat_Attack_Dig_Mother_Montage.A_Molerat_Attack_Dig_Mother_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Parried/A_Molerat_N_Hit_Parried_Dig_Montage.A_Molerat_N_Hit_Parried_Dig_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Deflected/A_Molerat_N_HitDeflected_Dig_Montage.A_Molerat_N_HitDeflected_Dig_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.9f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_MotherMolerat_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_MotherMolerat_Attack_Bottom;
    default m_GA_Attack = UGA_AttackCharge;
}

UCLASS()
class UWeaponMeleeItemAnimConfig_MotherMolerat_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Molerat/Molerat_AnimBP_Combat.Molerat_AnimBP_Combat_C'";

    // COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Idles/Breaker/A_Molerat_CombatIdleBreaker_01.A_Molerat_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Idles/Breaker/A_Molerat_CombatIdleBreaker_02.A_Molerat_CombatIdleBreaker_02'", 1.0f, 4);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Idles/Breaker/A_Molerat_CombatIdleBreaker_03.A_Molerat_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Idles/Breaker/A_Molerat_CombatIdleBreaker_04.A_Molerat_CombatIdleBreaker_04'", 1.0f, 2);

    // COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Breaker/A_Molerat_CombatWalkBreaker_01.A_Molerat_CombatWalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Breaker/A_Molerat_CombatWalkBreaker_02.A_Molerat_CombatWalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Breaker/A_Molerat_CombatWalkBreaker_03.A_Molerat_CombatWalkBreaker_03'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Breaker/A_Molerat_CombatWalkBreaker_04.A_Molerat_CombatWalkBreaker_04'", 1.0f, 4);

    // TURNS
    default m_TurnsData = UTurnsData_Molerat_Combat;
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    default m_RotateSpeedCharge = 15.0f;
    
    // Equip
    default m_EquipData = UEquipData_Molerat;
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_MotherMolerat_Attack_Top;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_MotherMolerat_Attack_Bottom;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =   UComboAttackConfig_MotherMolerat_Attack_Top2;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =   UComboAttackConfig_MotherMolerat_Attack_Top2;

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) =   UComboAttackConfig_Molerat_MoveBwd; 
    //

	// HITS
    default m_HitsData = UHitData_Default_Molerat;
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_Molerat;
    //
    
    // TAUNTS
    default m_TauntData = UTauntData_Molerat;
}

UCLASS()
class UAIState_Combat_BigMolerat : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_BigMolerat);

    default Config.PositioningValuesSizeMultiplier = 1.1f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.85f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        MovementSpeedChangeDistanceToCollisionRadiusRatio = 4.0f;

        EnemyTooCloseDistance = 70.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.0f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////    
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    void TestConfigValues() override
    {
        EnemyTooCloseDistance = 40.0f;
        EnemyLungeDistance = 300.0f;
        EnemyCombatDistance = 250.0f;
        
    }

    FString GetDisplayName() const override
    {
        return "BigMolerat - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_BigMolerat_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    FString GetDisplayName() const override
    {
        return "BigMolerat - Creature Combat";
    }

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f);
}

UCLASS()
class UWeaponBehaviorSet_BigMolerat : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default BaseRoleSlotSize = 0.5f;
    default BaseRolePriority = 0.0f;

    // ATTACKS /////////
    FAttackInfo MeleeAttackTop = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 300.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackTop);

    FAttackInfo MeleeAttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 200.0f,
        bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackLeft);

    FAttackInfo DigChargeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Charge, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMinRange = 300.0f,
        InMaxRange = 750.0f,
        bInMaxRangeOverride = true);
    default AddAttack(DigChargeAttack);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.3f), 0.1f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);
    
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Dig Charge")
                .AddAttack(DigChargeAttack)
                .AddTreeCooldown("dig", 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(400.0f, 3000.0f));

    // default Behavior_MediumPriority()
    //         .AttackTree(2.0f, "ShortRange Bite")
    //             .AddAttack(MeleeAttackLeft)
    //             .AddTreeCooldown(CooldownID_MainMelee, 2.5f)
    //             .AddRequirement(UCS_EnemyCloserThan(270.0f))
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(3.0f,"Longrange Bite")
                .AddAttack(MeleeAttackTop)
                .AddTreeCooldown(CooldownID_MainMelee, 2.5f)
                .AddRequirement(UCS_EnemyCloserThan(500.0f))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Passive Melee")
                .AddAttack(MeleeAttackTop)
                .AddTreeCooldown(CooldownID_PassiveMelee, 7.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_BigMolerat : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_BigMolerat_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_BigMolerat);
}