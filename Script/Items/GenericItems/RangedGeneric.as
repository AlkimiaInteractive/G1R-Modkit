UCLASS()
class UItRw_Bow_Small_01: UBow
{
    default m_Name = "ItRw_Bow_Small_01";
    default m_Value = 32;
    default m_Weight = 1.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 20.0f);
    default m_SuperArmorDamageBase = 16;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_01_Visual.BP_ItRw_Bow_Small_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_01_World.BP_ItRw_Bow_Small_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Small_01.T_ItemIcon_ItRw_Bow_Small_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 10.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Small_01.MI_Quiver_Bow_Small_01'";
}

UCLASS()
class UItRw_Bow_Small_02: UBow
{
    default m_Name = "ItRw_Bow_Small_02";
    default m_Value = 64;
    default m_Weight = 1.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 24.0f);
    default m_SuperArmorDamageBase = 19.200000000000003;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_02_Visual.BP_ItRw_Bow_Small_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_02_World.BP_ItRw_Bow_Small_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Small_02.T_ItemIcon_ItRw_Bow_Small_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 14.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Small_02.MI_Quiver_Bow_Small_02'";
}

UCLASS()
class UItRw_Bow_Small_03: UBow
{
    default m_Name = "ItRw_Bow_Small_03";
    default m_Value = 126;
    default m_Weight = 1.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 28.0f);
    default m_SuperArmorDamageBase = 22.400000000000002;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_03_Visual.BP_ItRw_Bow_Small_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_03_World.BP_ItRw_Bow_Small_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Small_03.T_ItemIcon_ItRw_Bow_Small_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 18.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Small_03.MI_Quiver_Bow_Small_03'";
}

UCLASS()
class UItRw_Bow_Small_04: UBow
{
    default m_Name = "ItRw_Bow_Small_04";
    default m_Value = 153;
    default m_Weight = 1.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 32.0f);
    default m_SuperArmorDamageBase = 25.6;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_04_Visual.BP_ItRw_Bow_Small_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_04_World.BP_ItRw_Bow_Small_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Small_04.T_ItemIcon_ItRw_Bow_Small_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 22.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Small_04.MI_Quiver_Bow_Small_04'";
}

UCLASS()
class UItRw_Bow_Wolf: UBow
{
    default m_Name = "ItRw_Bow_Wolf";
    default m_Value = 174;
    default m_Weight = 1.2f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 35.0f);
    default m_SuperArmorDamageBase = 28;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Wolf_Visual.BP_ItRw_Bow_Wolf_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Wolf_World.BP_ItRw_Bow_Wolf_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Wolf.T_ItemIcon_ItRw_Bow_Wolf";
    default m_Description = "ItRw_Bow_Wolf_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 25.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Wolf.MI_Quiver_Bow_Wolf'";
}

UCLASS()
class UItRw_Bow_Small_05: UBow
{
    default m_Name = "ItRw_Bow_Small_05";
    default m_Value = 182;
    default m_Weight = 1.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 36.0f);
    default m_SuperArmorDamageBase = 28.8;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_05_Visual.BP_ItRw_Bow_Small_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Small_05_World.BP_ItRw_Bow_Small_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Small_05.T_ItemIcon_ItRw_Bow_Small_05";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 26.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Small_05.MI_Quiver_Bow_Small_05'";
}

UCLASS()
class UItRw_Bow_Long_01: UBow
{
    default m_Name = "ItRw_Bow_Long_01";
    default m_Value = 211;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 40.0f);
    default m_SuperArmorDamageBase = 32;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_01_Visual.BP_ItRw_Bow_Long_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_01_World.BP_ItRw_Bow_Long_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_01.T_ItemIcon_ItRw_Bow_Long_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 30.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Long_01.MI_Quiver_Long_01'";
}

UCLASS()
class UItRw_Bow_Long_02: UBow
{
    default m_Name = "ItRw_Bow_Long_02";
    default m_Value = 243;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 44.0f);
    default m_SuperArmorDamageBase = 35.200000000000003;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_02_Visual.BP_ItRw_Bow_Long_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_02_World.BP_ItRw_Bow_Long_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_02.T_ItemIcon_ItRw_Bow_Long_02";
    default m_Description = "ItRw_Bow_Long_02_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 34.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Long_02.MI_Quiver_Long_02'";
}

UCLASS()
class UItRw_Bow_Long_03: UBow
{
    default m_Name = "ItRw_Bow_Long_03";
    default m_Value = 275;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 48.0f);
    default m_SuperArmorDamageBase = 38.400000000000006;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_03_Visual.BP_ItRw_Bow_Long_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_03_World.BP_ItRw_Bow_Long_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_03.T_ItemIcon_ItRw_Bow_Long_03";
    default m_Description = "ItRw_Bow_Long_03_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 38.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Long_03.MI_Quiver_Long_03'";
}

UCLASS()
class UItRw_Bow_Long_04: UBow
{
    default m_Name = "ItRw_Bow_Long_04";
    default m_Value = 309;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 52.0f);
    default m_SuperArmorDamageBase = 41.6;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_04_Visual.BP_ItRw_Bow_Long_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_04_World.BP_ItRw_Bow_Long_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_04.T_ItemIcon_ItRw_Bow_Long_04";
    default m_Description = "ItRw_Bow_Long_04_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 40.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Long_04.MI_Quiver_Long_04'";
}

UCLASS()
class UItRw_Bow_Long_05: UBow
{
    default m_Name = "ItRw_Bow_Long_05";
    default m_Value = 344;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 56.0f);
    default m_SuperArmorDamageBase = 44.800000000000004;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_05_Visual.BP_ItRw_Bow_Long_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_05_World.BP_ItRw_Bow_Long_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_05.T_ItemIcon_ItRw_Bow_Long_05";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 43.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Long_05.MI_Quiver_Bow_Long_05'";
}

UCLASS()
class UItRw_Bow_Long_06: UBow
{
    default m_Name = "ItRw_Bow_Long_06";
    default m_Value = 380;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 60.0f);
    default m_SuperArmorDamageBase = 48;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_06_Visual.BP_ItRw_Bow_Long_06_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_06_World.BP_ItRw_Bow_Long_06_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_06.T_ItemIcon_ItRw_Bow_Long_06";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 45.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Long_06.MI_Quiver_Bow_Long_06'";
}

UCLASS()
class UItRw_Bow_Long_07: UBow
{
    default m_Name = "ItRw_Bow_Long_07";
    default m_Value = 417;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 64.0f);
    default m_SuperArmorDamageBase = 51.2;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_07_Visual.BP_ItRw_Bow_Long_07_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_07_World.BP_ItRw_Bow_Long_07_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_07.T_ItemIcon_ItRw_Bow_Long_07";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 49.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Long_07.MI_Quiver_Bow_Long_07'";
}

UCLASS()
class UItRw_Bow_Long_08: UBow
{
    default m_Name = "ItRw_Bow_Long_08";
    default m_Value = 455;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 68.0f);
    default m_SuperArmorDamageBase = 54.400000000000006;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_08_Visual.BP_ItRw_Bow_Long_08_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_08_World.BP_ItRw_Bow_Long_08_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_08.T_ItemIcon_ItRw_Bow_Long_08";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 53.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Long_08.MI_Quiver_Bow_Long_08'";
}

UCLASS()
class UItRw_Bow_Diego: UBow
{
    default m_Name = "ItRw_Bow_Diego";
    default m_Value = 252;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 70.0f);
    default m_SuperArmorDamageBase = 56;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Diego_Visual.BP_ItRw_Bow_Diego_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Diego_World.BP_ItRw_Bow_Diego_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Diego.T_ItemIcon_ItRw_Bow_Diego";
    default m_Description = "ItRw_Bow_Diego_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 55.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Diego.MI_Quiver_Bow_Diego'";
}

UCLASS()
class UItRw_Bow_Long_09: UBow
{
    default m_Name = "ItRw_Bow_Long_09";
    default m_Value = 494;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 72.0f);
    default m_SuperArmorDamageBase = 57.6;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_09_Visual.BP_ItRw_Bow_Long_09_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_09_World.BP_ItRw_Bow_Long_09_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_09.T_ItemIcon_ItRw_Bow_Long_09";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 57.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Long_09.MI_Quiver_Bow_Long_09'";
}

UCLASS()
class UItRw_Bow_Long_10: UBow
{
    default m_Name = "ItRw_Bow_Long_10";
    default m_Value = 140;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 30.0f);
    default m_SuperArmorDamageBase = 24;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_10_Visual.BP_ItRw_Bow_Long_10_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_10_World.BP_ItRw_Bow_Long_10_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_10.T_ItemIcon_ItRw_Bow_Long_10";
    default m_Description = "ItRw_Bow_Long_10_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 20.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Long_10.MI_Quiver_Bow_Long_10'";
}

UCLASS()
class UItRw_Bow_Long_11: UBow
{
    default m_Name = "ItRw_Bow_Long_11";
    default m_Value = 167;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 34.0f);
    default m_SuperArmorDamageBase = 27.2;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_11_Visual.BP_ItRw_Bow_Long_11_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_11_World.BP_ItRw_Bow_Long_11_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_11.T_ItemIcon_ItRw_Bow_Long_11";
    default m_Description = "ItRw_Bow_Long_11_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 24.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Long_11.MI_Quiver_Bow_Long_11'";
}

UCLASS()
class UItRw_Bow_Long_12: UBow
{
    default m_Name = "ItRw_Bow_Long_12";
    default m_Value = 189;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 37.0f);
    default m_SuperArmorDamageBase = 29.6;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_12_Visual.BP_ItRw_Bow_Long_12_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Long_12_World.BP_ItRw_Bow_Long_12_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Long_12.T_ItemIcon_ItRw_Bow_Long_12";
    default m_Description = "ItRw_Bow_Long_12_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 27.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_Long_12.MI_Quiver_Bow_Long_12'";
}

UCLASS()
class UItRw_Bow_War_01: UBow
{
    default m_Name = "ItRw_Bow_War_01";
    default m_Value = 535;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 76.0f);
    default m_SuperArmorDamageBase = 60.800000000000004;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_01_Visual.BP_ItRw_Bow_War_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_01_World.BP_ItRw_Bow_War_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_War_01.T_ItemIcon_ItRw_Bow_War_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 61.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_War_01.MI_Quiver_Bow_War_01'";
}

UCLASS()
class UItRw_Bow_War_02: UBow
{
    default m_Name = "ItRw_Bow_War_02";
    default m_Value = 565;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 79.0f);
    default m_SuperArmorDamageBase = 63.2;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_02_Visual.BP_ItRw_Bow_War_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_02_World.BP_ItRw_Bow_War_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_War_02.T_ItemIcon_ItRw_Bow_War_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 64.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_War_02.MI_Quiver_Bow_War_02'";
}

UCLASS()
class UItRw_Bow_War_03: UBow
{
    default m_Name = "ItRw_Bow_War_03";
    default m_Value = 597;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 82.0f);
    default m_SuperArmorDamageBase = 65.600000000000009;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_03_Visual.BP_ItRw_Bow_War_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_03_World.BP_ItRw_Bow_War_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_War_03.T_ItemIcon_ItRw_Bow_War_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 67.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_War_03.MI_Quiver_Bow_War_03'";
}

UCLASS()
class UItRw_Bow_War_04: UBow
{
    default m_Name = "ItRw_Bow_War_04";
    default m_Value = 629;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 85.0f);
    default m_SuperArmorDamageBase = 68;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_04_Visual.BP_ItRw_Bow_War_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_04_World.BP_ItRw_Bow_War_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_War_04.T_ItemIcon_ItRw_Bow_War_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 70.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_War_04.MI_Quiver_Bow_War_04'";
}

UCLASS()
class UItRw_Bow_War_05: UBow
{
    default m_Name = "ItRw_Bow_War_05";
    default m_Value = 661;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 88.0f);
    default m_SuperArmorDamageBase = 70.400000000000006;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_05_Visual.BP_ItRw_Bow_War_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_War_05_World.BP_ItRw_Bow_War_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_War_05.T_ItemIcon_ItRw_Bow_War_05";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 73.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Bow_War_05.MI_Quiver_Bow_War_05'";
}

UCLASS()
class UItRw_Crossbow_01: UCrossbow
{
    default m_Name = "ItRw_Crossbow_01";
    default m_Value = 292;
    default m_Weight = 4.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 60.0f);
    default m_SuperArmorDamageBase = 40;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_01_Visual.BP_ItRw_Crossbow_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_01_World.BP_ItRw_Crossbow_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Crossbow_01.T_ItemIcon_ItRw_Crossbow_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Crossbow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 30.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Crossbow_01.MI_Quiver_Crossbow_01'";
}

UCLASS()
class UItRw_Crossbow_02: UCrossbow
{
    default m_Name = "ItRw_Crossbow_02";
    default m_Value = 629;
    default m_Weight = 4.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 102.0f);
    default m_SuperArmorDamageBase = 68;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_02_Visual.BP_ItRw_Crossbow_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_02_World.BP_ItRw_Crossbow_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Crossbow_02.T_ItemIcon_ItRw_Crossbow_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Crossbow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 65.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Crossbow_02.MI_Quiver_Crossbow_02'";
}

UCLASS()
class UItRw_Crossbow_03: UCrossbow
{
    default m_Name = "ItRw_Crossbow_03";
    default m_Value = 683;
    default m_Weight = 4.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 108.0f);
    default m_SuperArmorDamageBase = 72;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_03_Visual.BP_ItRw_Crossbow_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_03_World.BP_ItRw_Crossbow_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Crossbow_03.T_ItemIcon_ItRw_Crossbow_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Crossbow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 70.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Crossbow_03.MI_Quiver_Crossbow_03'";
}

UCLASS()
class UItRw_Crossbow_04: UCrossbow
{
    default m_Name = "ItRw_Crossbow_04";
    default m_Value = 795;
    default m_Weight = 4.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 120.0f);
    default m_SuperArmorDamageBase = 80;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_04_Visual.BP_ItRw_Crossbow_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Crossbow_04_World.BP_ItRw_Crossbow_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Crossbow_04.T_ItemIcon_ItRw_Crossbow_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Crossbow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 80.0f);
    default m_QuiverMaterial = "/Script/Engine.MaterialInstanceConstant'/Game/Assets/Characters/Humans/Clothes/Quiver/Material/MI_Quiver_Crossbow_04.MI_Quiver_Crossbow_04'";
}