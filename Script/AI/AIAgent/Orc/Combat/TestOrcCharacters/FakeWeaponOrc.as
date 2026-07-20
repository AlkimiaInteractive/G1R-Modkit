// --- FAKE NO WEAPON ORC

UCLASS(Abstract)
class UFakeNoWeaponOrc: UMeleeWeaponBase
{
	default m_Name = "HumanFists";
    //default m_Description = "HumanFists_description";
	default m_OnEquipEffect = UGE_Fist_Equip::StaticClass();
	default m_ActionsKeywords.Add(UActionKeywords_Melee_OneHanded::StaticClass());
	
    default SetItemType(GameplayTag::Item_Weapon_Foot);
	default AddItemSpec(GameplayTag::Item_Grip_TwoHand);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	default AddItemSpec(GameplayTag::Item_Property_NonDroppable);

	// Damage
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_DamageReduction = 5;
	default m_SuperArmorDamageBase = 20;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	default m_CriticalMultiplier = 2.0f;

}

UCLASS()
class UFakeNoWeaponOrc_weapon: UFakeNoWeaponOrc
{
    default m_Name = "FakeNoWeaponOrc";
	//default m_Description = "FakeNoWeaponOrc_Description";
	default m_OnEquipEffect = UGE_Fist_Equip::StaticClass();
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_HumanFists.T_ItemIcon_HumanFists";
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_FakeNoWeapon : UWeaponMeleeItemAnimConfig
{
    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/TEST_OrcM_FakeNoWeapon_AnimBP.TEST_OrcM_FakeNoWeapon_AnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_Orc::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Orc::StaticClass();
    //

	// DODGE
    default m_DodgesData = UDodgesData_Default_Orc::StaticClass();
    //

    // CONSUME
    default m_ConsumablesData = UConsumablesData_Orc::StaticClass();
    //

    //PICKUPS
    default m_PicksData = UPicksData_Orc::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Orc_Fists;
}