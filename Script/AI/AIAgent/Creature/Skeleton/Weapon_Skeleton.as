
UCLASS()
class USkeletonWeapon : UMeleeWeaponBase_Creature
{
    default m_Name = "Skeleton_Weapon";
    default m_OnEquipEffect = UGE_Skeleton_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 30); // 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 20.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}

UCLASS()
class USkeletonMageWeapon : UStaff2H
{
    default m_Name = "SkeletonMage_Weapon";
    default m_OnEquipEffect = UGE_Skeleton_Mage_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand); 
	default AddItemSpec(GameplayTag::Item_Property_Environment_Air_Flying);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 20.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Scepter_SkeletonMage_Visual.BP_ItMw_2H_Scepter_SkeletonMage_Visual_C'";

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	default m_ActionsKeywords.Add(USpellActionKeywords_SkeletonMageWeapon_SummonSkeletons::StaticClass());
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_SkeletonMageWeapon_SummonSkeletons::StaticClass(); // Only for test purposes 

	default m_ActionsKeywords.Add(USpellActionKeywords_SkeletonMageWeapon_SoulHarvest::StaticClass());
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_SkeletonMageWeapon_SoulHarvest::StaticClass(); // Only for test purposes 

	default m_ActionsKeywords.Add(USpellActionKeywords_MagicBeam_SkeletonMage::StaticClass()); 
	//default m_OnEquipEffect = UGE_EquipAbilitiesWhen_SkeletonMageWeapon_MagicBeam::StaticClass(); // Only for test purposes 

	default m_ActionsKeywords.Add(USpellActionKeywords_SkeletonMageWeapon_Teleport::StaticClass()); 
	//default m_OnEquipEffect = USpellActionKeywords_SkeletonMageWeapon_Teleport::StaticClass(); // Only for test purposes 

}