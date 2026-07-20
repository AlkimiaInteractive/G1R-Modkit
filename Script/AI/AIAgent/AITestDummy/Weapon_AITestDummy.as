
// UCLASS()
// class UAITestDummyWeapon : UMeleeWeaponBase
// {
//     default m_Name = "AITestDummy_Weapon";
//     default m_OnEquipEffect = UGE_AITestDummy_Equip::StaticClass();

//     default SetItemType(GameplayTag::Item_Weapon_Jaw);
// 	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

//     default m_HitEffect = UGE_Damage::StaticClass();
//     default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9);
//     default m_DamageReduction = 5.0;
// 	default m_SuperArmorDamageBase = 20.0f;

// 	// Super Armor
// 	default m_StartRegenerateSc = 5.0f;
// 	default m_HpRegenerateTick = 20.0f;
// 	default m_BlockSuperArmorMultiplier = 1.0f;

// 	// Control feedback
// 	default m_FeedbackData = UAITestDummyFeedback::StaticClass();
// }

// UCLASS()
// class UAITestDummyMageWeapon : UStaff2H
// {
//     default m_Name = "AITestDummyMage_Weapon";
//     default m_OnEquipEffect = UGE_AITestDummy_Mage_Equip::StaticClass();

//     default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand); 
// 	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

//     default m_HitEffect = UGE_Damage::StaticClass();
//     default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 9);
//     default m_DamageReduction = 5.0;
// 	default m_SuperArmorDamageBase = 20.0f;

// 	default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Scepter_AITestDummyMage_Visual.BP_ItMw_2H_Scepter_AITestDummyMage_Visual_C'";

// 	// Super Armor
// 	default m_StartRegenerateSc = 5.0f;
// 	default m_HpRegenerateTick = 20.0f;
// 	default m_BlockSuperArmorMultiplier = 1.0f;

// 	// Control feedback
// 	default m_FeedbackData = UAITestDummyFeedback::StaticClass();

// }