
// ---------- BASE WEAPONS

UCLASS(Abstract)
class UMeleeWeaponBase : UWeaponMeleeDefinition
{
	default m_AutoTarget = true;
	default m_TargetConfigClass = UMeleeCharacterTargetConfig::StaticClass();

	default AddItemSpec(GameplayTag::Item_Range_Melee);
	default AddItemSpec(GameplayTag::Item_Property_Equipable);
	default AddItemSpec(GameplayTag::Action_Pick_ToInventory);

	default m_HitEffect = UGE_Damage;
	default m_Buoyancy = .01f;

	// Damages
	default m_SuperArmorDamageBase = 50;
	//

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
	default m_TryToStoreFirst = EInventoryTypes::MeleeSlot;

	// Control feedback
	default m_FeedbackData = UGenericMeleeFeedback;

	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Stone, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Stone);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Ice, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Mini_Ice, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Ice_Mini, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Fire, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Fire);
}

UCLASS(Abstract)
class UMeleeWeaponBase_Creature : UMeleeWeaponBase
{
	default m_ActionsKeywords.Add(UActionKeywords_Melee);
	default m_Icon = "/Game/UI/Textures/Common/Icons/T_Icon_Creatures.T_Icon_Creatures";
	
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
}


// ---------- RANGED WEAPONS

UCLASS(Abstract)
class UBow : UWeaponArcheryDefinition
{
	default m_Name = "Bow";
    default m_OnEquipEffect = UGE_Bow_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Archery);
	default m_HitEffect = UGE_Damage;

	default m_HoldsterLocation = EHoldsterLocation::Back;

	default m_CriticalWeakSpotsTags.AddTag(GameplayTag::Body_WeakSpot);
	default m_CriticalMultiplier = 1.5f;

	default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Range_Long);
	default AddItemSpec(GameplayTag::Item_Property_Equipable);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);
	default AddItemSpec(GameplayTag::Item_Property_LeftHand);
	default AddItemSpec(GameplayTag::Action_Pick_ToInventory);
	default AddItemSpec(GameplayTag::Item_Property_Allow_Crouch);
	default AddItemSpec(GameplayTag::Item_Property_TriggersTutorial);
	
    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);
		
	default m_ArrowGravityModifier = 1.0f;
	default m_MaxRange = 15000.0f;
	
	default m_AimingAccuracyParams.m_MaxMovementSpeed = 60.f;
	default m_AimingAccuracyParams.m_MaxBowStringStretch = 0.81f;
	default m_AimingAccuracyParams.m_MinBowStringStretch = 0.16f;
	default m_AimingAccuracyParams.m_SpeedWhenMinStretch = 2500.0;
	default m_AimingAccuracyParams.m_SpeedWhenMaxStretch = 6000.0;
	
	default m_AimingAccuracyParams.m_UntrainedSkillPerformance.m_DrawAnimationRate = 1.0f;
	default m_AimingAccuracyParams.m_UntrainedSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.0f;
	default m_AimingAccuracyParams.m_UntrainedSkillPerformance.m_DeviationRadius = 0.05f;
	default m_AimingAccuracyParams.m_UntrainedSkillPerformance.m_DeviationMaxDistance = 1.0f;
	default m_AimingAccuracyParams.m_UntrainedSkillPerformance.m_MaximumResistanceTimeWhileDrawing = 3.0f;

	default m_AimingAccuracyParams.m_TrainedSkillPerformance.m_DrawAnimationRate = 1.4f;
	default m_AimingAccuracyParams.m_TrainedSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.5f;
	default m_AimingAccuracyParams.m_TrainedSkillPerformance.m_DeviationRadius = 0.025f;
	default m_AimingAccuracyParams.m_TrainedSkillPerformance.m_DeviationMaxDistance = 1.0f;
	default m_AimingAccuracyParams.m_TrainedSkillPerformance.m_MaximumResistanceTimeWhileDrawing = 5.0f;

	default m_AimingAccuracyParams.m_MasterSkillPerformance.m_DrawAnimationRate = 1.75f;
	default m_AimingAccuracyParams.m_MasterSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 2.00f;
	default m_AimingAccuracyParams.m_MasterSkillPerformance.m_DeviationRadius = 0.0f;
	default m_AimingAccuracyParams.m_MasterSkillPerformance.m_DeviationMaxDistance = 1.0f;
	default m_AimingAccuracyParams.m_MasterSkillPerformance.m_MaximumResistanceTimeWhileDrawing = 10.0f;
	
	default m_QuickAccuracyParams.m_MaxMovementSpeed = 60.f;
	default m_QuickAccuracyParams.m_MaxBowStringStretch = 0.81f;
	default m_QuickAccuracyParams.m_MinBowStringStretch = 0.16f;
	default m_QuickAccuracyParams.m_SpeedWhenMinStretch = 2500.0;
	default m_QuickAccuracyParams.m_SpeedWhenMaxStretch = 4500.0;

	default m_QuickAccuracyParams.m_UntrainedSkillPerformance.m_DrawAnimationRate = 1.0f;
	default m_QuickAccuracyParams.m_UntrainedSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.0f;
	default m_QuickAccuracyParams.m_UntrainedSkillPerformance.m_DeviationRadius = 0.0f;
	default m_QuickAccuracyParams.m_UntrainedSkillPerformance.m_DeviationMaxDistance = 1000.0f;
	default m_QuickAccuracyParams.m_TrainedSkillPerformance.m_DrawAnimationRate = 1.0f;
	default m_QuickAccuracyParams.m_TrainedSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.5f;
	default m_QuickAccuracyParams.m_TrainedSkillPerformance.m_DeviationRadius = 0.0f;
	default m_QuickAccuracyParams.m_TrainedSkillPerformance.m_DeviationMaxDistance = 1000.0f;
	default m_QuickAccuracyParams.m_MasterSkillPerformance.m_DrawAnimationRate = 1.25f;
	default m_QuickAccuracyParams.m_MasterSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 2.0f;
	default m_QuickAccuracyParams.m_MasterSkillPerformance.m_DeviationRadius = 0.0f;
	default m_QuickAccuracyParams.m_MasterSkillPerformance.m_DeviationMaxDistance = 1000.0f;
	
	default m_ArrowDefinition = UItAm_Arrow;
	default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Items/Weapons/Ranged/Bow_AnimBP.Bow_AnimBP_C'";

	default m_FeedbackData = UGenericRangedFeedback;

	default m_TryToStoreFirst = EInventoryTypes::RangedSlot;

	default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver.MI_Quiver'";

	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Stone, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Stone);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Ice, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Mini_Ice, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Ice_Mini, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Fire, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Fire);
}

UCLASS(Abstract)
class UCrossbow : UWeaponArcheryDefinition
{
	default m_Name = "Crossbow";
	default m_OnEquipEffect = UGE_Crossbow_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Archery);
	default m_HitEffect = UGE_Damage;

    default SetItemType(GameplayTag::Item_Weapon_Crossbow);
	default AddItemSpec(GameplayTag::Item_Range_Long);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);
	default AddItemSpec(GameplayTag::Action_Pick_ToInventory);
	default AddItemSpec(GameplayTag::Item_Property_Allow_Crouch);
	default AddItemSpec(GameplayTag::Item_Property_TriggersTutorial);
	
    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);
	
	default m_HoldsterLocation = EHoldsterLocation::Back;

	default m_CriticalWeakSpotsTags.AddTag(GameplayTag::Body_WeakSpot);
	default m_CriticalMultiplier = 1.5f;

	default m_ArrowGravityModifier = 1.0f;
	
	default m_AimingAccuracyParams.m_MaxMovementSpeed = 120.f;
	default m_AimingAccuracyParams.m_MaxBowStringStretch = 0.81f;
	default m_AimingAccuracyParams.m_MinBowStringStretch = 0.16f;
	default m_AimingAccuracyParams.m_SpeedWhenMinStretch = 6000.0;
	default m_AimingAccuracyParams.m_SpeedWhenMaxStretch = 13000.0;


	default m_AimingAccuracyParams.m_UntrainedSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.0f;
	default m_AimingAccuracyParams.m_UntrainedSkillPerformance.m_DeviationRadius = 0.1f;
	default m_AimingAccuracyParams.m_UntrainedSkillPerformance.m_DeviationMaxDistance = 1000.0f;
	default m_AimingAccuracyParams.m_TrainedSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.0f;
	default m_AimingAccuracyParams.m_TrainedSkillPerformance.m_DeviationRadius = 0.05f;
	default m_AimingAccuracyParams.m_TrainedSkillPerformance.m_DeviationMaxDistance = 1000.0f;
	default m_AimingAccuracyParams.m_MasterSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.0f;
	default m_AimingAccuracyParams.m_MasterSkillPerformance.m_DeviationRadius = 0.0f;
	default m_AimingAccuracyParams.m_MasterSkillPerformance.m_DeviationMaxDistance = 1000.0f;


	default m_QuickAccuracyParams.m_MaxMovementSpeed = 120.f;
	default m_QuickAccuracyParams.m_MaxBowStringStretch = 0.81f;
	default m_QuickAccuracyParams.m_MinBowStringStretch = 0.16f;
	default m_QuickAccuracyParams.m_SpeedWhenMinStretch = 6000.0;
	default m_QuickAccuracyParams.m_SpeedWhenMaxStretch = 9000.0;
	
	default m_QuickAccuracyParams.m_UntrainedSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.0f;
	default m_QuickAccuracyParams.m_UntrainedSkillPerformance.m_DeviationRadius = 0.05f;
	default m_QuickAccuracyParams.m_UntrainedSkillPerformance.m_DeviationMaxDistance = 1000.0f;
	default m_QuickAccuracyParams.m_TrainedSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.0f;
	default m_QuickAccuracyParams.m_TrainedSkillPerformance.m_DeviationRadius = 0.025f;
	default m_QuickAccuracyParams.m_TrainedSkillPerformance.m_DeviationMaxDistance = 1000.0f;
	default m_QuickAccuracyParams.m_MasterSkillPerformance.m_ReleaseAndNotchArrowOntoBowAnimationRate = 1.0f;
	default m_QuickAccuracyParams.m_MasterSkillPerformance.m_DeviationRadius = .0f;
	default m_QuickAccuracyParams.m_MasterSkillPerformance.m_DeviationMaxDistance = 1000.0f;

	default m_ArrowDefinition = UItAm_Bolt;
	default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Items/Weapons/Ranged/Crossbow_AnimBP.Crossbow_AnimBP_C'";

	default m_TryToStoreFirst = EInventoryTypes::RangedSlot;

	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Stone, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Stone);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Ice, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Mini_Ice, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Ice_Mini, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
	default AddHitCueDataForSpecie(GameplayTag::Item_Damage_Physical, GameplayTag::Species_Creature_Golem_Fire, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Fire);
}


// ---------- MELEE WEAPONS

UCLASS(Abstract)
class UHumanFists: UMeleeWeaponBase
{
    default m_Name = "HumanFists";
    //default m_Description = "HumanFists_description";
	default m_OnEquipEffect = UGE_Fist_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded);
	
    default SetItemType(GameplayTag::Item_Weapon_Fist);
	default AddItemSpec(GameplayTag::Item_Grip_TwoHand);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
	default AddItemSpec(GameplayTag::Item_Property_NonTrade); 

    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	// Damage
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_DamageReduction = 5;
	default m_SuperArmorDamageBase = 5;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;

}

UCLASS(Abstract)
class USword1H: UMeleeWeaponBase
{
	default m_Name = "Sword1H";
	default m_OnEquipEffect = UGE_SwordOneHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded);
	
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
	default AddItemSpec(GameplayTag::Item_Grip_OneHand);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);

    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	default m_HoldsterLocation = EHoldsterLocation::Waist; 

	default m_DamageReduction = MAX_flt;

	// Damage
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;
}

UCLASS(Abstract)
class USword2H: UMeleeWeaponBase 
{
	default m_Name = "Sword2H";
	default m_OnEquipEffect = UGE_SwordTwoHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_TwoHanded);

    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
	default AddItemSpec(GameplayTag::Item_Grip_TwoHand);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);

    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	default m_HoldsterLocation = EHoldsterLocation::Back; 

	default m_DamageReduction = MAX_flt;

	// Damage
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;
}

UCLASS(Abstract)
class UMace1H: UMeleeWeaponBase //same as UMace2H but dodges do no break the combo
{
	default m_Name = "Mace1H";
	default m_OnEquipEffect = UGE_MaceOneHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded);

    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
	default AddItemSpec(GameplayTag::Item_Grip_OneHand);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);

    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	default m_HoldsterLocation = EHoldsterLocation::Waist;

	default m_DamageReduction = MAX_flt;

	//default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;

	default m_HitEffect = UGE_Blunt_Damage;
}

UCLASS(Abstract)
class UMace2H: UMeleeWeaponBase //Sword1H_v3
{
	default m_Name = "Mace2H";
	default m_OnEquipEffect = UGE_MaceTwoHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_TwoHanded);

    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
	default AddItemSpec(GameplayTag::Item_Grip_TwoHand);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);

    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	default m_HoldsterLocation = EHoldsterLocation::Back;

	default m_DamageReduction = MAX_flt;

	// Damage
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;
}

UCLASS(Abstract)
class UAxe1H: UMeleeWeaponBase
{
	default m_Name = "Axe1H";
	default m_OnEquipEffect = UGE_AxeOneHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded);

    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
	default AddItemSpec(GameplayTag::Item_Grip_OneHand);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);

    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	default m_HoldsterLocation = EHoldsterLocation::Waist;

	default m_DamageReduction = MAX_flt;

	//default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;
}

UCLASS(Abstract)
class UAxe2H: UMeleeWeaponBase
{
	default m_Name = "Axe2H";
	default m_OnEquipEffect = UGE_AxeTwoHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_TwoHanded);

    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
	default AddItemSpec(GameplayTag::Item_Grip_TwoHand);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);

    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	default m_HoldsterLocation = EHoldsterLocation::Back;

	default m_DamageReduction = MAX_flt;

	//default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Default value
	default m_CriticalMultiplier = 2.0f;
}

UCLASS(Abstract)
class UStaff2H: UMeleeWeaponBase
{
	default m_Name = "Staff2H";
	default m_OnEquipEffect = UGE_Staff_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_TwoHanded);
	
    default SetItemType(GameplayTag::Item_Weapon_Staff);
	default AddItemSpec(GameplayTag::Item_Grip_TwoHand);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);

    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	default m_HoldsterLocation = EHoldsterLocation::Back;

	default m_DamageReduction = MAX_flt;

	// Damage
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;

}

UCLASS(Abstract)
class UTorch1H: UMeleeWeaponBase
{
	default m_Name = "Torch1H";
	default m_OnEquipEffect = UGE_Torch_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded);

    default SetItemType(GameplayTag::Item_Weapon_Torch_OneHand);
	default AddItemSpec(GameplayTag::Item_Grip_OneHand);
	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
	default AddItemSpec(GameplayTag::Item_Property_Allow_Traverse);
	default AddItemSpec(GameplayTag::Item_Property_Allow_Crouch);
	default AddItemSpec(GameplayTag::Item_Property_EquipOnPick);
    default AddItemSpec(GameplayTag::Item_Property_Riding);

	default AddItemSpec(GameplayTag::AISpellKeywords_Damage_Fire);
	default AddItemSpec(GameplayTag::AISpellKeywords_Effect_Burn);
	default AddItemSpec(GameplayTag::Item_Property_Allow_Jump);
	default AddItemSpec(GameplayTag::Item_Property_Allow_Riding);
	default AddItemSpec(GameplayTag::Item_Property_UseNormalSpeedsInCombat);

	default AddCollisionEffect(GameplayTag::FX_Impact_Item_Torch);

	default m_MaxStack = 100.0f;
	
	default m_DamageReduction = MAX_flt;

	default m_HitEffect = UGE_Torch1H_Damage;
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);

	default m_HoldsterLocation = EHoldsterLocation::Waist;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;

	default m_TryToStoreFirst = EInventoryTypes::QuickItems;
}


// ---------- TEST WEAPONS CREATED AS SUPPORT TO DO CERTAIN TESTS

UCLASS(Abstract)
class UAxe1HTest: UMeleeWeaponBase
{
	default m_Name = "Axe1HTest";
	default m_OnEquipEffect = UGE_AxeOneHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded);
	
    default SetItemType(GameplayTag::Item_Weapon_PickaxeDemo_TwoHand);
	default AddItemSpec(GameplayTag::Item_Grip_OneHand);
	default AddItemSpec(GameplayTag::Item_Property_VisualCarry);

	default m_HoldsterLocation = EHoldsterLocation::Waist;

	default m_DamageReduction = MAX_flt;

	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;
}

UCLASS(Abstract)
class UTail_S1HTest: UMeleeWeaponBase
{
	default m_Name = "Sword1H";
	default m_OnEquipEffect = UGE_SwordOneHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded);
	
    default SetItemType(GameplayTag::Item_Weapon_Tail);
	default AddItemSpec(GameplayTag::Item_Grip_OneHand);

	default m_DamageReduction = MAX_flt;

	// Damage
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;

}

UCLASS(Abstract)
class UJaw_S1HTest: UMeleeWeaponBase
{
	default m_Name = "Sword1H";
	default m_OnEquipEffect = UGE_SwordOneHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded);
	
    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Grip_OneHand);

	default m_DamageReduction = MAX_flt;

	// Damage
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;

}

UCLASS(Abstract)
class USword1HTestLayerHits: UMeleeWeaponBase
{
	default m_Name = "Sword1HTestLayerHits";
	default m_OnEquipEffect = UGE_SwordOneHanded_Equip;
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded);
	
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHandTest);
	default AddItemSpec(GameplayTag::Item_Grip_OneHand);

	default m_HoldsterLocation = EHoldsterLocation::Waist; 
 
	default m_DamageReduction = MAX_flt;

	// Damage
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;
}


class UWorldImpactWeapon : UWeaponDefinition
{
	default m_Name = "UWorldImpactWeapon";

    default SetItemType(GameplayTag::Item_Weapon_Environment);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_WorldDamage::StaticClass();
    //default m_DamageBase.Add(GameplayTag::Item_Damage_Impact, 100);
	default m_SuperArmorDamageBase = 20.0f;  
}
