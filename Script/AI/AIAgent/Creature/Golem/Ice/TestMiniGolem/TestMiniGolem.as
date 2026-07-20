class USpawnAIAgentDefinition_TestCharacter_Test_Mini_Golem_Ice : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestCharacter_Test_Mini_Golem_Ice::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/TEST_MiniGolem/AIAgentCharacter_TEST_MiniGolemIce.AIAgentCharacter_TEST_MiniGolemIce_C'";
}

// class USpawnAIAgentDefinition_TestCharacter_Test_Mini_Golem_Ice_Heal : USpawnAIAgentDefinition
// {
//     default AIAgentConfigClass = UAIAgentConfig_TestCharacter_Test_Mini_Golem_Ice_Heal::StaticClass();
//     default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/TEST_MiniGolem/AIAgentCharacter_TEST_MiniGolemIce.AIAgentCharacter_TEST_MiniGolemIce_C'";
// }

UCLASS()
class UAIAgentConfig_TestCharacter_Test_Mini_Golem_Ice : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Test_Mini_Golem_Ice::StaticClass();
    default m_LocomotionConfig = ULocomotionConfig_Test_Mini_Golem_Ice::StaticClass();
    default m_AnimConfig = UAnimConfig_Test_Mini_Golem_Ice::StaticClass();

    default m_NavigationConfig = UAIAgentConfig_Navigation_Golem::StaticClass();
	
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestCharacter_Test_Mini_Golem_Ice_Heal : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Test_Mini_Golem_Ice_Heal::StaticClass();
    default m_LocomotionConfig = ULocomotionConfig_Test_Mini_Golem_Ice::StaticClass();
    default m_AnimConfig = UAnimConfig_Test_Mini_Golem_Ice::StaticClass();

    default m_NavigationConfig = UAIAgentConfig_Navigation_Golem::StaticClass();
	
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UCharacterDefinition_Test_Mini_Golem_Ice : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Golem_Mini_Ice;
	default m_Species = GameplayTag::Species_Creature_Golem_Mini_Ice;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_Test_Mini_Golem_Ice_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Test_Mini_Golem_Ice_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Golem::StaticClass();

    default m_CueData.Add(GameplayTag::State_Summoned, UCueVisualConfig_Summoned_Golem::StaticClass());

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

    default AddToInventory(UIceGolemWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	// default AddToInventory(UTestMiniIceGolemWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default AddToInventory(UItAt_Icegolem_01::StaticClass(), 1, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Icegolem_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	
	// Other
    default m_CameraConfig = UGolemCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 0.1f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 100);
	default SetAttributeValue("AttributeSet_Strength.Strength", 0); //150
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 150);
    default SetAttributeValue("AttributeSet_Health.Health", 30); //150
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 30); //150
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100);
	default SetAttributeValue("AttributeSet_Mana.Mana", 500);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 500);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 90);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 9999);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 9999);
	// protection[PROT_FLY] = 9999;

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	//default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Test_Mini_Golem_Ice::StaticClass();
    default m_UniqueName = n"AITestCharacter_Test_Mini_Golem_Ice";
}

UCLASS()
class UCharacterDefinition_Test_Mini_Golem_Ice_Heal : UCharacterDefinition_Test_Mini_Golem_Ice
{
    //default m_AIAbility = UGameplayAbility_CharacterAI_Test_Mini_Golem_Ice_Heal::StaticClass();
    default m_UniqueName = n"AITestCharacter_Test_Mini_Golem_Ice_Heal";
}

UCLASS()
class UGameplayAbility_CharacterAI_Test_Mini_Golem_Ice : UGameplayAbility_CreatureAI
{
    //default InitialDailyRoutineClass = UDailyRoutine_Golem_Ice::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Test_Mini_Golem_Ice::StaticClass());
}

// UCLASS()
// class UGameplayAbility_CharacterAI_Test_Mini_Golem_Ice_Heal : UGameplayAbility_CreatureAI
// {
//     //default InitialDailyRoutineClass = UDailyRoutine_Golem_Ice::StaticClass();
    
//     default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Test_Mini_Golem_Ice_Heal::StaticClass());

//     default MinimumPreferredLocationConflictRadius = 10000.0f;

//     // TROLL target scoring entry to prioritize goblins if GrabGoblin Attack is selected
//     default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_TargetIceGolemForHealAttack(), 100.0f);

//     // TROLL selects and evaluates goblins as targets if GrabGoblin Attack is selected
//     TArray<AGothicCharacter> GetAvailableTargets() override
//     {
//         TArray<AGothicCharacter> AvailableTargets = Super::GetAvailableTargets();

//         // TODO: Fix, faulty outside of spawning distance
//         auto FoundActors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGolemIce::StaticClass(), CharacterState.CharacterLocation, 4000.0f);

//         for (auto OtherActor : FoundActors)
//         {
//             auto OtherCharacter = Cast<AGothicCharacter>(OtherActor);

//             if (OtherCharacter == nullptr)
//                 continue;

//             if (!OtherCharacter.CharacterState.Species.MatchesTag(GameplayTag::Species_Creature_Golem_Ice))
//                 continue;

//             if (OtherCharacter.HasGameplayTag(GameplayTag::State_Dead))
//                 continue;

//             AvailableTargets.Add(OtherCharacter);
//         }

//         return AvailableTargets;
//     }
// }

UCLASS()
class UGE_Test_Mini_Golem_Ice_AI : UGE_Golem_AI
{
    // default AddAbility(UGA_IceGolem_SpecialState_SummonMiniGolem::StaticClass());
    default RemoveAbility(UGA_BreakSuperArmor::StaticClass());
    // default AddAbility(UGA_BreakSuperArmor_IceGolem::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    // default AddAbility(UGA_IceGolem_EnvironmentAttack_ActivateMiniGolems::StaticClass());
}

UCLASS()
class UGE_Test_Mini_Golem_Ice_Player : UGE_Golem_Player
{
    // default AddAbility(UGA_IceGolem_SpecialState_SummonMiniGolem::StaticClass());
    default RemoveAbility(UGA_BreakSuperArmor::StaticClass());
    // default AddAbility(UGA_BreakSuperArmor_IceGolem::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    // default AddAbility(UGA_IceGolem_EnvironmentAttack_ActivateMiniGolems::StaticClass());
}

//////////////////
// Attack
UCLASS()
class UAttackMeleeConfig_Test_Mini_Golem_Ice_AttackLeft : UAttackMeleeConfig
{
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/TEST_MiniGolem/Attacks/A_Test_Mini_IceGolem_Direction_Attack01_Montage.A_Test_Mini_IceGolem_Direction_Attack01_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.5f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Test_Mini_Golem_Ice_AttackRight : UAttackMeleeConfig
{
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/TEST_MiniGolem/Attacks/A_Test_Mini_IceGolem_Direction_Attack02_Montage.A_Test_Mini_IceGolem_Direction_Attack02_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.5f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Test_Mini_Golem_Ice_Charge : UAttackMeleeConfig
{
    // default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/A_IceGolem_ChargeAttack01_Montage.A_IceGolem_ChargeAttack01_Montage'";
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/A_IceGolem_ChargeAttack01_Montage1.A_IceGolem_ChargeAttack01_Montage1'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Test_Mini_Golem_Ice_AttackLeft : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Test_Mini_Golem_Ice_AttackLeft::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right, UComboAttackConfig_Test_Mini_Golem_Ice_AttackRight::StaticClass());
}

UCLASS()
class UComboAttackConfig_Test_Mini_Golem_Ice_AttackRight : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Test_Mini_Golem_Ice_AttackRight::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Test_Mini_Golem_Ice_Charge : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Test_Mini_Golem_Ice_Charge::StaticClass();
	default m_GA_Attack = UGA_AttackCharge::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Test_Mini_Golem_Ice : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/TEST_MiniGolem/Test_Mini_Ice_Golem_AnimBP.Test_Mini_Ice_Golem_AnimBP_C'";
	
    /*
    //IDLE BREAKERS
    default AddIdleBreaker(n"", 0.4f, 1);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"", 0.4f, 1);
    
    */

   // TURNS
   default m_TurnsData = UTurnsData_Golem_Ice::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Golem_Ice::StaticClass();
    //    

    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Test_Mini_Golem_Ice_Combat : UWeaponMeleeItemAnimConfig
{

	// default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Ice_Golem/Ice_Golem_AnimBP_Combat.Ice_Golem_AnimBP_Combat_C'";

    // //COMBAT IDLE BREAKERS
    // //default AddIdleBreaker(n"", 0.4f, 1);    
    
    // //COMBAT WALK BREAKERS
    // //default AddWalkBreaker(n"", 0.6f, 1);

    // // TURNS
    // default m_TurnsData = UTurnsData_Golem_Ice_Combat::StaticClass();
    // //

    // // Rotate Magnet
    // default m_RotateSpeedMagnetPlayer = 180.0f;
    // default m_RotateSpeedMagnetAI = 180.0f;
    // default m_RotateSpeedCharge = 15.0f.0f;
    
    // // Equip
    // default m_EquipData = UEquipData_Golem_Ice::StaticClass();

    // // COMBOS (see Combos_Human.as)
    // default m_Attacks.Add(GameplayTag::Combat_Attack_Left,  UComboAttackConfig_Test_Mini_Golem_Ice_AttackLeft::StaticClass());
    // default m_Attacks.Add(GameplayTag::Combat_Attack_Right, UComboAttackConfig_Test_Mini_Golem_Ice_AttackRight::StaticClass());
    // default m_Attacks.Add(GameplayTag::Item_Projectile, UProjectile_Golem_Ice_Throw_IceBolt::StaticClass());
    // //

	// // HITS
    // default m_HitsData = UHitData_Golem_Ice::StaticClass();
    // // 

    // // DODGES
    // default m_DodgesData = UDodgesData_Golem_Ice::StaticClass();
    // //

    // // TAUNTS
    // default m_TauntData = UTauntData_Golem_Ice::StaticClass(); 
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Bark).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/Skeleton_Taunt_01_AnimMontage.Skeleton_Taunt_01_AnimMontage'"));
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Howl).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/A_Skeleton_Taunt_03_Montage.A_Skeleton_Taunt_03_Montage'"));
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Scream).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Taunt/A_Skeleton_Taunt_02_Montage.A_Skeleton_Taunt_02_Montage'"));
    //
}

UCLASS()
class UAnimConfig_Test_Mini_Golem_Ice : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

	default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Test_Mini_Golem_Ice::StaticClass());

	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Test_Mini_Golem_Ice_Combat::StaticClass());    
}

UCLASS()
class ULocomotionConfig_Test_Mini_Golem_Ice: ULocomotionConfig_Golem
{
	default m_SpeedConfig = USpeedConfig_Test_Mini_Golem_Ice::StaticClass();
};


// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Test_Mini_Golem_Ice: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 100); // 30 //50
	default m_Speeds.Add(EWalkSpeed::Running, 85); // 99 //165
	default m_Speeds.Add(EWalkSpeed::Sprinting, 200); //214 //357
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Test_Mini_Golem_Ice: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Test_Mini_Golem_Ice::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Test_Mini_Golem_Ice: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Test_Mini_Golem_Ice::StaticClass());
};


UCLASS()
class USpeedConfig_Test_Mini_Golem_Ice: USpeedConfig_Golem
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Test_Mini_Golem_Ice::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Test_Mini_Golem_Ice::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Test_Mini_Golem_Ice::StaticClass();
}

UCLASS()
class UTestMiniIceGolemWeapon : UGolemWeapon
{
    default m_Name = "Test_Mini_Ice_Golem_Weapon";
    default m_OnEquipEffect = UGE_Golem_Equip::StaticClass();

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 10);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 20.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}
