// Only for tests

UCLASS()
class UHumanFoot : UMeleeWeaponBase
{
	default m_Name = "Human_Foot";
	default m_OnEquipEffect = UGE_Fist_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Foot);
	
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_DamageReduction = 5;
}

UCLASS()
class UHumanFist_NoWeapon : UHumanFists
{
	default m_Name = "HumanFists";
	////default m_Description = "HumanFists_Description";
	default m_OnEquipEffect = UGE_Fist_Equip::StaticClass();
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_HumanFists.T_ItemIcon_HumanFists";
}

UCLASS()
class UWatchFightWeapon : UMeleeWeaponBase
{
	default m_Name = "WatchFight";

    default SetItemType(GameplayTag::Item_Weapon_WatchFight);
    default AddItemSpec(GameplayTag::Item_Property_NoThreat);

    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
	default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden);

    default m_OnEquipEffect = UGE_Weapon_Melee_Equip_WatchFight;
}

UCLASS()
class UHumanFist_NoWeapon_Demo : UHumanFists
{
	default m_Name = "HumanFists";
	////default m_Description = "HumanFists_Description";
	default m_OnEquipEffect = UGE_Fist_Equip::StaticClass();
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_HumanFists.T_ItemIcon_HumanFists";
    // Damage
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 10.0f);
}

UCLASS()
class UHumanFist_NoWeapon_Climbing : UHumanFists
{
	default m_Name = "Human_Fist_Climbing";
	default m_OnEquipEffect = UGE_Fist_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Climbing_Fist);
	default AddItemSpec(GameplayTag::Item_Property_Environment_Climbing); 
	default AddItemSpec(GameplayTag::Item_Property_Unswitchable); 
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden);
    default AddItemSpec(GameplayTag::Item_Property_MustForceUnequip);
    default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UHumanFist_NoWeapon_Swimming : UHumanFists
{
	default m_Name = "Human_Fist_Swimming";
	default m_OnEquipEffect = UGE_Fist_Equip_Swimming::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Swimming);
	default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Surface);    // to throw punches while on the surface
    //default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Underwater); // to throw punches while underwater
	default AddItemSpec(GameplayTag::Item_Property_Unswitchable); 
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden); 
    default AddItemSpec(GameplayTag::Item_Property_MustForceUnequip);
    default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UHumanFist_NoWeapon_Diving : UHumanFists
{
	default m_Name = "Human_Fist_Diving";
	default m_OnEquipEffect = UGE_Fist_Equip_Swimming::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Diving);
	default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Underwater);    // to throw punches while diving
    //default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Underwater); // to throw punches while underwater
	default AddItemSpec(GameplayTag::Item_Property_Unswitchable); 
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden); 
    default AddItemSpec(GameplayTag::Item_Property_MustForceUnequip);
    default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UHumanFist_NoWeapon_WaterWalking : UHumanFists
{
	default m_Name = "Human_Fist_WaterWalking";
	default m_OnEquipEffect = UGE_Fist_Equip_WaterWalking::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_WaterWalking);
	default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Walking);    // to throw punches while on the surface
	default AddItemSpec(GameplayTag::Item_Property_Allow_Traverse);    // Allow traverse while WaterWalking
    //default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Underwater); // to throw punches while underwater
	default AddItemSpec(GameplayTag::Item_Property_Unswitchable);
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden); 
    default AddItemSpec(GameplayTag::Item_Property_MustForceUnequip);
    default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class USword1H_TestWeapon_Short : USword1H
{
	default m_Name = "Sword1HTest_Short";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_01_Visual.BP_ItMw_1H_Sword_Short_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_01_World.BP_ItMw_1H_Sword_Short_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Short_01.T_ItemIcon_ItMw_1H_Sword_Short_01";
    //default m_Description = "Sword1HTest_Short";
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class USword1H_TestWeapon_Long : USword1H
{
	default m_Name = "Sword1HTest_Long";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_Visual.BP_ItMw_1H_Sword_Short_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_World.BP_ItMw_1H_Sword_Short_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Short_04.T_ItemIcon_ItMw_1H_Sword_Short_04";
    //default m_Description = "Sword1HTest_Long";
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class USword1H_TestWeapon_Long_Back : USword1H
{
	default m_Name = "Sword1HTest_Long";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_Visual.BP_ItMw_1H_Sword_Short_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_World.BP_ItMw_1H_Sword_Short_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Short_04.T_ItemIcon_ItMw_1H_Sword_Short_04";
    //default m_Description = "Sword1HTest_Long";
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_HoldsterLocation = EHoldsterLocation::Back; 
}

UCLASS()
class USword2H_TestWeapon_Short : USword2H
{
	default m_Name = "Sword2HTest_Short";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_01_Visual.BP_ItMw_2H_Sword_Light_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_01_World.BP_ItMw_2H_Sword_Light_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Light_01.T_ItemIcon_ItMw_2H_Sword_Light_01";
    //default m_Description = "Sword2HTest_Short";
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class USword2H_TestWeapon_Long : USword2H
{
	default m_Name = "Sword2HTest_Long";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_03_Visual.BP_ItMw_2H_Sword_Heavy_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_03_World.BP_ItMw_2H_Sword_Heavy_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Heavy_03.T_ItemIcon_ItMw_2H_Sword_Heavy_03";
    //default m_Description = "Sword2HTest_Long";
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class USword2H_TestWeapon_Longest_Uriziel : USword2H
{
	default m_Name = "Sword2HTest_Long_Uriziel";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Uriziel_01_Visual.BP_ItMw_2H_Sword_Uriziel_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Uriziel_01_World.BP_ItMw_2H_Sword_Uriziel_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Uriziel_01.T_ItemIcon_ItMw_2H_Sword_Uriziel_01";
    //default m_Description = "Sword2HTest_Long_Uriziel";
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UAxe1H_TestWeapon_Short : UAxe1H
{
	default m_Name = "Axe1HTest_Short";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Hatchet_01_Visual.BP_ItMw_1H_Axe_Hatchet_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Hatchet_01_World.BP_ItMw_1H_Axe_Hatchet_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Hatchet_01.T_ItemIcon_ItMw_1H_Axe_Hatchet_01";
    //default m_Description = "ItMw_1H_Axe_Hatchet_01_description";
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UAxe1H_TestWeapon_Long : UAxe1H
{
	default m_Name = "Axe1HTest_Long";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Old_01_Visual.BP_ItMw_1H_Axe_Old_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Old_01_World.BP_ItMw_1H_Axe_Old_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Old_01.T_ItemIcon_ItMw_1H_Axe_Old_01";
    //default m_Description = "Axe1HTest_Long";
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UAxe1H_TestWeapon_Longest_Sickle : UAxe1H
{
	default m_Name = "Axe1HTest_Long_Sickle";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Sickle_01_Visual.BP_ItMw_1H_Axe_Sickle_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Sickle_01_World.BP_ItMw_1H_Axe_Sickle_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Sickle_01.T_ItemIcon_ItMw_1H_Axe_Sickle_01";
    //default m_Description = "Axe1HTest_Long_Sickle";
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UAxe2H_TestWeapon_Short : UAxe2H
{
    default m_Name = "Axe2HTest_Short";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Old_03_Visual.BP_ItMw_2H_Axe_Old_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Old_03_World.BP_ItMw_2H_Axe_Old_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Old_03.T_ItemIcon_ItMw_2H_Axe_Old_03";
    //default m_Description = "Axe2HTest_Short";
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UAxe2H_TestWeapon_Shortest_Pickaxe : UAxe2H
{
    default m_Name = "Axe2HTest_Short_Pickaxe";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Pickaxe_Visual.BP_ItMw_2H_Axe_Pickaxe_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Pickaxe_World.BP_ItMw_2H_Axe_Pickaxe_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Pickaxe.T_ItemIcon_ItMw_2H_Axe_Pickaxe";
    //default m_Description = "Axe2HTest_Short_Pickaxe";
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NoThreat);
    default AddItemSpec(GameplayTag::Item_Property_Mining);
}

UCLASS()
class UAxe2H_TestWeapon_Long : UAxe2H
{
    default m_Name = "Axe2HTest_Long";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_04_Visual.BP_ItMw_2H_Axe_Heavy_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_04_World.BP_ItMw_2H_Axe_Heavy_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Heavy_04.T_ItemIcon_ItMw_2H_Axe_Heavy_04";
    //default m_Description = "Axe2HTest_Long";
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UMace1H_TestWeapon_Short : UMace1H
{
    default m_Name = "Mace1HTest_Short";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Sledgehammer_01_Visual.BP_ItMw_1H_Mace_Sledgehammer_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Sledgehammer_01_World.BP_ItMw_1H_Mace_Sledgehammer_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Sledgehammer_01.T_ItemIcon_ItMw_1H_Mace_Sledgehammer_01";
    //default m_Description = "Mace1HTest_Short";
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UMace1H_TestWeapon_Long : UMace1H
{
    default m_Name = "Mace1HTest_Long";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Warhammer_03_Visual.BP_ItMw_1H_Mace_Warhammer_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Warhammer_03_World.BP_ItMw_1H_Mace_Warhammer_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Warhammer_03.T_ItemIcon_ItMw_1H_Mace_Warhammer_03";
    //default m_Description = "Mace1HTest_Long";
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UMace2H_TestWeapon_Short : UMace2H
{
    default m_Name = "Mace2HTest_Short";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_04_Visual.BP_ItMw_2H_Axe_Orc_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_04_World.BP_ItMw_2H_Axe_Orc_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orc_04.T_ItemIcon_ItMw_2H_Axe_Orc_04";
    //default m_Description = "Mace2HTest_Short";
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UMace2H_TestWeapon_Short_Mace : UMace2H
{
    default m_Name = "Mace2HTest_Short_Mace";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Mace_Orc_01_Visual.BP_ItMw_2H_Mace_Orc_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Mace_Orc_01_World.BP_ItMw_2H_Mace_Orc_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Mace_Orc_01.T_ItemIcon_ItMw_2H_Mace_Orc_01";
    //default m_Description = "Mace2HTest_Short_Mace";
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UMace2H_TestWeapon_Long : UMace2H
{
    default m_Name = "Mace2HTest_Long";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Orc_01_Visual.BP_ItMw_2H_Sword_Orc_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Orc_01_World.BP_ItMw_2H_Sword_Orc_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Orc_01.T_ItemIcon_ItMw_2H_Sword_Orc_01";
    //default m_Description = "Mace2HTest_Long";
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UStaff2H_TestWeapon_Short : UStaff2H
{
    default m_Name = "Staff2HTest_Short";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Scepter_Visual.BP_ItMw_2H_Staff_Scepter_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Scepter_World.BP_ItMw_2H_Staff_Scepter_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Staff_Scepter.T_ItemIcon_ItMw_2H_Staff_Scepter";
    //default m_Description = "Staff2HTest_Short";
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UStaff2H_TestWeapon_Long_Ulumulu : UStaff2H
{
    default m_Name = "Staff2HTest_Long_Ulumulu";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Ulumulu_Visual.BP_ItMw_2H_Staff_Ulumulu_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Ulumulu_World.BP_ItMw_2H_Staff_Ulumulu_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Staff_Ulumulu.T_ItemIcon_ItMw_2H_Staff_Ulumulu";
    //default m_Description = "Staff2HTest_Long_Ulumulu";
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UBow_TestWeapon_Small : UBow
{
    default m_Name = "ItRw_Bow_War_02";
    default m_Value = 720;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_02_Visual.BP_ItRw_Bow_War_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_02_World.BP_ItRw_Bow_War_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_War_02.T_ItemIcon_ItRw_Bow_War_02";
    //default m_Description = "ItRw_Bow_War_02_description";
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UBow_TestWeapon_Long: UBow
{
    default m_Name = "ItRw_Bow_Long_09";
    default m_Value = 615;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_09_Visual.BP_ItRw_Bow_Long_09_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_09_World.BP_ItRw_Bow_Long_09_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_09.T_ItemIcon_ItRw_Bow_Long_09";
    //default m_Description = "ItRw_Bow_Long_09_description";
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UCrossbow_TestWeapon_Narrow : UCrossbow
{
    default m_Name = "ItRw_Crossbow_01";
    default m_Value = 328;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_01_Visual.BP_ItRw_Crossbow_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_01_World.BP_ItRw_Crossbow_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Crossbow_01.T_ItemIcon_ItRw_Crossbow_01";
    //default m_Description = "ItRw_Crossbow_01_description";
    default SetItemType(GameplayTag::Item_Weapon_Crossbow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UCrossbow_TestWeapon_Wide : UCrossbow
{
    default m_Name = "ItRw_Crossbow_02";
    default m_Value = 814;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_02_Visual.BP_ItRw_Crossbow_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_02_World.BP_ItRw_Crossbow_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Crossbow_02.T_ItemIcon_ItRw_Crossbow_02";
    //default m_Description = "ItRw_Crossbow_02_description";
    default SetItemType(GameplayTag::Item_Weapon_Crossbow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

// APPLE THAT HEALS A LOT TO DO CERTAIN TESTS ----
UCLASS()
class UApple_Test : UItemDefinition
{
    default m_Name = "ItFo_Apple";
    //default m_Description = "ItFo_Apple_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Apple_Visual.BP_ItFo_Apple_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Apple_World.BP_ItFo_Apple_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Apple.T_ItemIcon_ItFo_Apple";
    default m_Value = 4;
    default m_MaxStack = 99;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1000.0f).AddMag(GameplayTag::GE_Param_Duration, 1);
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}
// END APPLE THAT HEALS A LOT TO DO CERTAIN TESTS ----

// WEAPON TO TEST KNOCKBACKS ----
UCLASS()
class USword1H_KnockbackTest_Weapon: UTail_S1HTest
{
	default m_Name = "S1H to test Knockbacks";
    default m_ItemVisual = n"Blueprint'/Game/AnimLibrary/Humanoid/Man/Items/Test/BP_TestS1H_Knockback_Visual.BP_TestS1H_Knockback_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_04_World.BP_ItMw_1H_Sword_04_World_C'";
	
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 0.01f);
    default m_SuperArmorDamageBase = 20000;
	default AddItemSpec(GameplayTag::Item_Property_Mining);
}
// END WEAPON TO TEST KNOCKBACKS ----

// WEAPON TO TEST RIPOSTES ----
UCLASS()
class USword1H_S1H_RiposteTest_Weapon: UJaw_S1HTest
{
	default m_Name = "S1H to test Riposte";
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_Visual.BP_ItMw_1H_Sword_Short_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_World.BP_ItMw_1H_Sword_Short_04_World_C'";
	
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 0.01f);
    default m_SuperArmorDamageBase = 20000;
	default AddItemSpec(GameplayTag::Item_Property_Mining);
}
// END WEAPON TO TEST RIPOSTES ----

// Test A1H using the pickaxedemo tag----
UCLASS()
class UAxe1HTest_Weapon: UAxe1HTest
{
	default m_Name = "Axe1HTest";
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_03_Visual.BP_ItMw_1H_Axe_03_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_03_World.BP_ItMw_1H_Axe_03_World_C'";

	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
}
// END Test A1H using the pickaxedemo tag----

// WEAPON TO TEST HITS WITH DIRECTIONAL LAYERS ----
UCLASS()
class USword1H_TestWeapon_LayerHits : USword1HTestLayerHits
{
	default m_Name = "Sword1HTest_LayerHits";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_Visual.BP_ItMw_1H_Sword_Short_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_World.BP_ItMw_1H_Sword_Short_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Short_04.T_ItemIcon_ItMw_1H_Sword_Short_04";
    //default m_Description = "Sword1HTest_Long";
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}
// END WEAPON TO TEST HITS WITH DIRECTIONAL LAYERS ----

// PLAYTEST STUFF ----
UCLASS()
class UItMw_1H_Sword_Old_01_PlayerPlayTest : USword1H
{
    default m_Name = "ItMw_1H_Sword_Old_01";
    default m_Value = 31;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 22.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Old_01_Visual.BP_ItMw_1H_Sword_Old_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Old_01_World.BP_ItMw_1H_Sword_Old_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Old_01.T_ItemIcon_ItMw_1H_Sword_Old_01";
    //default m_Description = "ItMw_1H_Sword_Old_01_description";
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 0.0f);
}
// END OF PLAYTEST STUFF ----

//QA EQUIPMENT ----
UCLASS()
class UItMw_1H_Sword_QA : USword1H
{
    default m_Name = "ItMw_1H_Sword_QA";
    default m_Value = 200;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 100.0f);
    default m_SuperArmorDamageBase = 50;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_04_Visual.BP_ItMw_1H_Sword_Bastard_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_04_World.BP_ItMw_1H_Sword_Bastard_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Bastard_04.T_ItemIcon_ItMw_1H_Sword_Bastard_04";
    //default m_Description = "ItMw_1H_Sword_Bastard_04_description";
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 0.0f);
}

UCLASS()
class UItRw_Bow_QA: UBow
{
    default m_Name = "ItRw_Bow_QA";
    default m_Value = 862;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 100.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_05_Visual.BP_ItRw_Bow_War_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_05_World.BP_ItRw_Bow_War_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_War_05.T_ItemIcon_ItRw_Bow_War_05";
    //default m_Description = "ItRw_Bow_War_05_description";
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 0.0f);
}

UCLASS()
class UGE_QA_Armor: UGE_Armor_Equip
{
    default IncreaseAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Edge", 50);
    default IncreaseAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Blunt", 50);
    default IncreaseAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Point", 5);
    default IncreaseAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Fire", 25);
    default IncreaseAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Wind", 1);
    default IncreaseAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Ice", 1);
    default IncreaseAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Energy", 1);
    default IncreaseAttribute(UAttributeSet_Strength::StaticClass(), n"Strength", 0);
    default IncreaseAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity", 0);
    default IncreaseAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth", 0);
    default IncreaseAttribute(UAttributeSet_Mana::StaticClass(), n"Mana", 0);
    default IncreaseAttribute(UAttributeSet_LevelProgression::StaticClass(), n"Toughness", 0);
}

UCLASS()
class UQA_Armor: URyl_Armor
{
    default m_Name = "QA_Armor";
    default m_OnEquipEffect = UGE_QA_Armor::StaticClass();
}


//END OF QA EQUIPMENT ---- 