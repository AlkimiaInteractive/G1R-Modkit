
UCLASS()
class UItMw_2H_Axe_Gorn: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Gorn";
    default m_Value = 372;
    default m_Weight = 5.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 100.0f);
    default m_SuperArmorDamageBase = 100;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Gorn_Visual.BP_ItMw_2H_Axe_Gorn_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Gorn_World.BP_ItMw_2H_Axe_Gorn_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Gorn.T_ItemIcon_ItMw_2H_Axe_Gorn";
    default m_Description = "ItMw_2H_Axe_Gorn_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 85.0f);
}

UCLASS()
class UItMw_2H_Axe_Heavy_01: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Heavy_01";
    default m_Value = 2262;
    default m_Weight = 7.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 94.0f);
    default m_SuperArmorDamageBase = 94;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_01_Visual.BP_ItMw_2H_Axe_Heavy_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_01_World.BP_ItMw_2H_Axe_Heavy_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Heavy_01.T_ItemIcon_ItMw_2H_Axe_Heavy_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 79.0f);
}

UCLASS()
class UItMw_2H_Axe_Heavy_02: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Heavy_02";
    default m_Value = 2344;
    default m_Weight = 7.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 96.0f);
    default m_SuperArmorDamageBase = 96;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_02_Visual.BP_ItMw_2H_Axe_Heavy_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_02_World.BP_ItMw_2H_Axe_Heavy_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Heavy_02.T_ItemIcon_ItMw_2H_Axe_Heavy_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 81.0f);
}

UCLASS()
class UItMw_2H_Axe_Heavy_03: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Heavy_03";
    default m_Value = 2428;
    default m_Weight = 7.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 98.0f);
    default m_SuperArmorDamageBase = 98;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_03_Visual.BP_ItMw_2H_Axe_Heavy_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_03_World.BP_ItMw_2H_Axe_Heavy_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Heavy_03.T_ItemIcon_ItMw_2H_Axe_Heavy_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 83.0f);
}

UCLASS()
class UItMw_2H_Axe_Heavy_04: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Heavy_04";
    default m_Value = 2513;
    default m_Weight = 7.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 100.0f);
    default m_SuperArmorDamageBase = 100;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_04_Visual.BP_ItMw_2H_Axe_Heavy_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Heavy_04_World.BP_ItMw_2H_Axe_Heavy_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Heavy_04.T_ItemIcon_ItMw_2H_Axe_Heavy_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 85.0f);
}

UCLASS()
class UItMw_2H_Axe_Lee: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Lee";
    default m_Value = 382;
    default m_Weight = 5.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 105.0f);
    default m_SuperArmorDamageBase = 105;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Lee_Visual.BP_ItMw_2H_Axe_Lee_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Lee_World.BP_ItMw_2H_Axe_Lee_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Lee.T_ItemIcon_ItMw_2H_Axe_Lee";
    default m_Description = "ItMw_2H_Axe_Lee_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 90.0f);
}

UCLASS()
class UItMw_2H_Axe_Light_01: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Light_01";
    default m_Value = 1612;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 77.0f);
    default m_SuperArmorDamageBase = 77;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Light_01_Visual.BP_ItMw_2H_Axe_Light_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Light_01_World.BP_ItMw_2H_Axe_Light_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Light_01.T_ItemIcon_ItMw_2H_Axe_Light_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 62.0f);
}

UCLASS()
class UItMw_2H_Axe_Light_02: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Light_02";
    default m_Value = 1684;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 79.0f);
    default m_SuperArmorDamageBase = 79;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Light_02_Visual.BP_ItMw_2H_Axe_Light_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Light_02_World.BP_ItMw_2H_Axe_Light_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Light_02.T_ItemIcon_ItMw_2H_Axe_Light_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 64.0f);
}

UCLASS()
class UItMw_2H_Axe_Light_03: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Light_03";
    default m_Value = 1720;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 80.0f);
    default m_SuperArmorDamageBase = 80;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Light_03_Visual.BP_ItMw_2H_Axe_Light_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Light_03_World.BP_ItMw_2H_Axe_Light_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Light_03.T_ItemIcon_ItMw_2H_Axe_Light_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 65.0f);
}

UCLASS()
class UItMw_2H_Axe_Old_01: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Old_01";
    default m_Value = 1273;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 67.0f);
    default m_SuperArmorDamageBase = 67;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Old_01_Visual.BP_ItMw_2H_Axe_Old_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Old_01_World.BP_ItMw_2H_Axe_Old_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Old_01.T_ItemIcon_ItMw_2H_Axe_Old_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 54.0f);
}

UCLASS()
class UItMw_2H_Axe_Old_02: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Old_02";
    default m_Value = 1305;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 68.0f);
    default m_SuperArmorDamageBase = 68;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Old_02_Visual.BP_ItMw_2H_Axe_Old_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Old_02_World.BP_ItMw_2H_Axe_Old_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Old_02.T_ItemIcon_ItMw_2H_Axe_Old_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 55.0f);
}

UCLASS()
class UItMw_2H_Axe_Old_03: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Old_03";
    default m_Value = 1338;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 69.0f);
    default m_SuperArmorDamageBase = 69;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Old_03_Visual.BP_ItMw_2H_Axe_Old_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Old_03_World.BP_ItMw_2H_Axe_Old_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Old_03.T_ItemIcon_ItMw_2H_Axe_Old_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 55.0f);
}

UCLASS()
class UItMw_2H_Axe_Orc_01: UMace2H
{
    default m_Name = "ItMw_2H_Axe_Orc_01";
    default m_Value = 24;
    default m_Weight = 8.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 50.0f);
    default m_SuperArmorDamageBase = 80;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_01_Visual.BP_ItMw_2H_Axe_Orc_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_01_World.BP_ItMw_2H_Axe_Orc_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orc_01.T_ItemIcon_ItMw_2H_Axe_Orc_01";
    default m_Description = "ItMw_2H_Axe_Orc_01_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 42.0f);
}

UCLASS()
class UItMw_2H_Axe_Orc_02: UMace2H
{
    default m_Name = "ItMw_2H_Axe_Orc_02";
    default m_Value = 26;
    default m_Weight = 8.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 55.0f);
    default m_SuperArmorDamageBase = 90;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_02_Visual.BP_ItMw_2H_Axe_Orc_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_02_World.BP_ItMw_2H_Axe_Orc_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orc_02.T_ItemIcon_ItMw_2H_Axe_Orc_02";
    default m_Description = "ItMw_2H_Axe_Orc_02_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 47.0f);
}

UCLASS()
class UItMw_2H_Axe_Orc_03: UMace2H
{
    default m_Name = "ItMw_2H_Axe_Orc_03";
    default m_Value = 28;
    default m_Weight = 9.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 60.0f);
    default m_SuperArmorDamageBase = 100;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_03_Visual.BP_ItMw_2H_Axe_Orc_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_03_World.BP_ItMw_2H_Axe_Orc_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orc_03.T_ItemIcon_ItMw_2H_Axe_Orc_03";
    default m_Description = "ItMw_2H_Axe_Orc_03_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 52.0f);
}

UCLASS()
class UItMw_2H_Axe_Orc_04: UMace2H
{
    default m_Name = "ItMw_2H_Axe_Orc_04";
    default m_Value = 32;
    default m_Weight = 9.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 65.0f);
    default m_SuperArmorDamageBase = 110;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_04_Visual.BP_ItMw_2H_Axe_Orc_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_04_World.BP_ItMw_2H_Axe_Orc_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orc_04.T_ItemIcon_ItMw_2H_Axe_Orc_04";
    default m_Description = "ItMw_2H_Axe_Orc_04_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 54.0f);
}

UCLASS()
class UItMw_2H_Axe_Orik: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Orik";
    default m_Value = 364;
    default m_Weight = 5.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 95.0f);
    default m_SuperArmorDamageBase = 95;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orik_Visual.BP_ItMw_2H_Axe_Orik_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orik_World.BP_ItMw_2H_Axe_Orik_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orik.T_ItemIcon_ItMw_2H_Axe_Orik";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 80.0f);
}

UCLASS()
class UItMw_2H_Axe_Pickaxe: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Pickaxe";
    default m_Value = 4;
    default m_Weight = 4.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 7.0f);
    default m_SuperArmorDamageBase = 7;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Pickaxe_Visual.BP_ItMw_2H_Axe_Pickaxe_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Pickaxe_World.BP_ItMw_2H_Axe_Pickaxe_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Pickaxe.T_ItemIcon_ItMw_2H_Axe_Pickaxe";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NoThreat);
    default AddItemSpec(GameplayTag::Item_Property_Mining);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
}

UCLASS()
class UItMw_2H_Axe_Torlof: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Torlof";
    default m_Value = 368;
    default m_Weight = 5.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 99.0f);
    default m_SuperArmorDamageBase = 99;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Torlof_Visual.BP_ItMw_2H_Axe_Torlof_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Torlof_World.BP_ItMw_2H_Axe_Torlof_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Torlof.T_ItemIcon_ItMw_2H_Axe_Torlof";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 84.0f);
}

UCLASS()
class UItMw_2H_Mace_Orc_01: UMace2H
{
    default m_Name = "ItMw_2H_Mace_Orc_01";
    default m_Value = 38;
    default m_Weight = 10.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 75.0f);
    default m_SuperArmorDamageBase = 150;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Mace_Orc_01_Visual.BP_ItMw_2H_Mace_Orc_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Mace_Orc_01_World.BP_ItMw_2H_Mace_Orc_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Mace_Orc_01.T_ItemIcon_ItMw_2H_Mace_Orc_01";
    default m_Description = "ItMw_2H_Mace_Orc_01_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 60.0f);
}

UCLASS()
class UItMw_2H_Scepter_Skeletonmage: UStaff2H
{
    default m_Name = "ItMw_2H_Scepter_Skeletonmage";
    default m_Value = 1;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.0f);
    default m_SuperArmorDamageBase = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Scepter_Skeletonmage_Visual.BP_ItMw_2H_Scepter_Skeletonmage_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Scepter_Skeletonmage_World.BP_ItMw_2H_Scepter_Skeletonmage_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Scepter_Skeletonmage.T_ItemIcon_ItMw_2H_Scepter_Skeletonmage";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UItMw_2H_Staff_02: UStaff2H
{
    default m_Name = "ItMw_2H_Staff_02";
    default m_Value = 52;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 19.0f);
    default m_SuperArmorDamageBase = 19;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_02_Visual.BP_ItMw_2H_Staff_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_02_World.BP_ItMw_2H_Staff_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Staff_02.T_ItemIcon_ItMw_2H_Staff_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 16.0f);
}

UCLASS()
class UItMw_2H_Staff_Orc: UMace2H
{
    default m_Name = "ItMw_2H_Staff_Orc";
    default m_Value = 51;
    default m_Weight = 3.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 10.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Orc_Visual.BP_ItMw_2H_Staff_Orc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Orc_World.BP_ItMw_2H_Staff_Orc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Staff_Orc.T_ItemIcon_ItMw_2H_Staff_Orc";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UItMw_2H_Staff_Scepter: UStaff2H
{
    default m_Name = "ItMw_2H_Staff_Scepter";
    default m_Value = 100;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 26.0f);
    default m_SuperArmorDamageBase = 26;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Scepter_Visual.BP_ItMw_2H_Staff_Scepter_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Scepter_World.BP_ItMw_2H_Staff_Scepter_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Staff_Scepter.T_ItemIcon_ItMw_2H_Staff_Scepter";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 20.0f);
}

UCLASS()
class UItMw_2H_Staff_Ulumulu: UStaff2H
{
    default m_Name = "ItMw_2H_Staff_Ulumulu";
    default m_Value = 423;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 35.0f);
    default m_SuperArmorDamageBase = 35;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Ulumulu_Visual.BP_ItMw_2H_Staff_Ulumulu_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Ulumulu_World.BP_ItMw_2H_Staff_Ulumulu_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Staff_Ulumulu.T_ItemIcon_ItMw_2H_Staff_Ulumulu";
    default m_Description = "ItMw_2H_Staff_Ulumulu_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);;
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 25.0f);
}

UCLASS()
class UItMw_2H_Staff_Unorc: UMace2H
{
    default m_Name = "ItMw_2H_Staff_Unorc";
    default m_Value = 51;
    default m_Weight = 3.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 10.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_Visual.BP_ItMw_2H_Staff_Unorc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_World.BP_ItMw_2H_Staff_Unorc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Staff_Unorc.T_ItemIcon_ItMw_2H_Staff_Unorc";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
}

UCLASS()
class UItMw_2H_Sword_01: USword2H
{
    default m_Name = "ItMw_2H_Sword_01";
    default m_Value = 1757;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 81.0f);
    default m_SuperArmorDamageBase = 81;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_01_Visual.BP_ItMw_2H_Sword_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_01_World.BP_ItMw_2H_Sword_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_01.T_ItemIcon_ItMw_2H_Sword_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 66.0f);
}

UCLASS()
class UItMw_2H_Sword_02: USword2H
{
    default m_Name = "ItMw_2H_Sword_02";
    default m_Value = 1831;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 83.0f);
    default m_SuperArmorDamageBase = 83;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_02_Visual.BP_ItMw_2H_Sword_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_02_World.BP_ItMw_2H_Sword_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_02.T_ItemIcon_ItMw_2H_Sword_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 68.0f);
}

UCLASS()
class UItMw_2H_Sword_03: USword2H
{
    default m_Name = "ItMw_2H_Sword_03";
    default m_Value = 1907;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 85.0f);
    default m_SuperArmorDamageBase = 85;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_03_Visual.BP_ItMw_2H_Sword_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_03_World.BP_ItMw_2H_Sword_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_03.T_ItemIcon_ItMw_2H_Sword_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 70.0f);
}

UCLASS()
class UItMw_2H_Sword_Beliar: USword2H
{
    default m_Name = "ItMw_2H_Sword_Beliar";
    default m_Value = 2955;
    default m_Weight = 6.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 110.0f);
    default m_SuperArmorDamageBase = 110;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Beliar_Visual.BP_ItMw_2H_Sword_Beliar_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Beliar_World.BP_ItMw_2H_Sword_Beliar_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Beliar.T_ItemIcon_ItMw_2H_Sword_Beliar";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 95.0f);
}

UCLASS()
class UItMw_2H_Sword_Heavy_01: USword2H
{
    default m_Name = "ItMw_2H_Sword_Heavy_01";
    default m_Value = 1945;
    default m_Weight = 6.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 86.0f);
    default m_SuperArmorDamageBase = 86;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_01_Visual.BP_ItMw_2H_Sword_Heavy_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_01_World.BP_ItMw_2H_Sword_Heavy_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Heavy_01.T_ItemIcon_ItMw_2H_Sword_Heavy_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 71.0f);
}

UCLASS()
class UItMw_2H_Sword_Heavy_02: USword2H
{
    default m_Name = "ItMw_2H_Sword_Heavy_02";
    default m_Value = 2022;
    default m_Weight = 6.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 88.0f);
    default m_SuperArmorDamageBase = 88;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_02_Visual.BP_ItMw_2H_Sword_Heavy_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_02_World.BP_ItMw_2H_Sword_Heavy_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Heavy_02.T_ItemIcon_ItMw_2H_Sword_Heavy_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 73.0f);
}

UCLASS()
class UItMw_2H_Sword_Heavy_03: USword2H
{
    default m_Name = "ItMw_2H_Sword_Heavy_03";
    default m_Value = 2101;
    default m_Weight = 6.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 90.0f);
    default m_SuperArmorDamageBase = 90;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_03_Visual.BP_ItMw_2H_Sword_Heavy_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_03_World.BP_ItMw_2H_Sword_Heavy_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Heavy_03.T_ItemIcon_ItMw_2H_Sword_Heavy_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 75.0f);
}

UCLASS()
class UItMw_2H_Sword_Heavy_04: USword2H
{
    default m_Name = "ItMw_2H_Sword_Heavy_04";
    default m_Value = 2181;
    default m_Weight = 6.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 92.0f);
    default m_SuperArmorDamageBase = 92;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_04_Visual.BP_ItMw_2H_Sword_Heavy_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Heavy_04_World.BP_ItMw_2H_Sword_Heavy_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Heavy_04.T_ItemIcon_ItMw_2H_Sword_Heavy_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 77.0f);
}

UCLASS()
class UItMw_2H_Sword_Innos: USword2H
{
    default m_Name = "ItMw_2H_Sword_Innos";
    default m_Value = 400;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 110.0f);
    default m_SuperArmorDamageBase = 110;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Innos_Visual.BP_ItMw_2H_Sword_Innos_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Innos_World.BP_ItMw_2H_Sword_Innos_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Innos.T_ItemIcon_ItMw_2H_Sword_Innos";
    default m_Description = "ItMw_2H_Sword_Innos_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 95.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_01: USword2H
{
    default m_Name = "ItMw_2H_Sword_Light_01";
    default m_Value = 1055;
    default m_Weight = 4.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 60.0f);
    default m_SuperArmorDamageBase = 60;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_01_Visual.BP_ItMw_2H_Sword_Light_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_01_World.BP_ItMw_2H_Sword_Light_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Light_01.T_ItemIcon_ItMw_2H_Sword_Light_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 50.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_02: USword2H
{
    default m_Name = "ItMw_2H_Sword_Light_02";
    default m_Value = 1404;
    default m_Weight = 4.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 71.0f);
    default m_SuperArmorDamageBase = 71;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_02_Visual.BP_ItMw_2H_Sword_Light_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_02_World.BP_ItMw_2H_Sword_Light_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Light_02.T_ItemIcon_ItMw_2H_Sword_Light_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 56.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_03: USword2H
{
    default m_Name = "ItMw_2H_Sword_Light_03";
    default m_Value = 1472;
    default m_Weight = 4.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 73.0f);
    default m_SuperArmorDamageBase = 73;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_03_Visual.BP_ItMw_2H_Sword_Light_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_03_World.BP_ItMw_2H_Sword_Light_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Light_03.T_ItemIcon_ItMw_2H_Sword_Light_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 58.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_04: USword2H
{
    default m_Name = "ItMw_2H_Sword_Light_04";
    default m_Value = 1507;
    default m_Weight = 4.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 74.0f);
    default m_SuperArmorDamageBase = 74;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_04_Visual.BP_ItMw_2H_Sword_Light_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_04_World.BP_ItMw_2H_Sword_Light_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Light_04.T_ItemIcon_ItMw_2H_Sword_Light_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 59.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_05: USword2H
{
    default m_Name = "ItMw_2H_Sword_Light_05";
    default m_Value = 1576;
    default m_Weight = 4.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 76.0f);
    default m_SuperArmorDamageBase = 76;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_05_Visual.BP_ItMw_2H_Sword_Light_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Light_05_World.BP_ItMw_2H_Sword_Light_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Light_05.T_ItemIcon_ItMw_2H_Sword_Light_05";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 61.0f);
}

UCLASS()
class UItMw_2H_Sword_Old_01: USword2H
{
    default m_Name = "ItMw_2H_Sword_Old_01";
    default m_Value = 1085;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 61.0f);
    default m_SuperArmorDamageBase = 61;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Old_01_Visual.BP_ItMw_2H_Sword_Old_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Old_01_World.BP_ItMw_2H_Sword_Old_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Old_01.T_ItemIcon_ItMw_2H_Sword_Old_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 50.0f);
}

UCLASS()
class UItMw_2H_Sword_Orc_01: UMace2H
{
    default m_Name = "ItMw_2H_Sword_Orc_01";
    default m_Value = 22;
    default m_Weight = 7.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 45.0f);
    default m_SuperArmorDamageBase = 70;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Orc_01_Visual.BP_ItMw_2H_Sword_Orc_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Orc_01_World.BP_ItMw_2H_Sword_Orc_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Orc_01.T_ItemIcon_ItMw_2H_Sword_Orc_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Orc_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 37.0f);
}

UCLASS()
class UItMw_2H_Sword_Thorus: USword2H
{
    default m_Name = "ItMw_2H_Sword_Thorus";
    default m_Value = 340;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 90.0f);
    default m_SuperArmorDamageBase = 90;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Thorus_Visual.BP_ItMw_2H_Sword_Thorus_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Thorus_World.BP_ItMw_2H_Sword_Thorus_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Thorus.T_ItemIcon_ItMw_2H_Sword_Thorus";
    default m_Description = "ItMw_2H_Sword_Thorus_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 75.0f);
}

UCLASS()
class UItMw_2H_Sword_Uriziel_01: USword2H
{
    default m_Name = "ItMw_2H_Sword_Uriziel_01";
    default m_UniqueName = n"ItMw_2H_Sword_Uriziel_01";
    default m_Value = 6824;
    default m_Weight = 6.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 90.0f);
    default m_SuperArmorDamageBase = 90;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Uriziel_01_Visual.BP_ItMw_2H_Sword_Uriziel_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Uriziel_01_World.BP_ItMw_2H_Sword_Uriziel_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Uriziel_01.T_ItemIcon_ItMw_2H_Sword_Uriziel_01";
    default m_Description = "ItMw_2H_Sword_Uriziel_01_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_UnEquipBeforePick);
    default m_EventWhenPickUp = GameplayTag::Message_UrizielSwordBarrier_Disable;
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 30.0f);
}

UCLASS()
class UItMw_2H_Sword_Uriziel_02: USword2H
{
    default m_Name = "ItMw_2H_Sword_Uriziel_02";
    default m_Value = 6824;
    default m_Weight = 6.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 90.0f);
    default m_SuperArmorDamageBase = 90;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Uriziel_02_Visual.BP_ItMw_2H_Sword_Uriziel_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Uriziel_02_World.BP_ItMw_2H_Sword_Uriziel_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Uriziel_02.T_ItemIcon_ItMw_2H_Sword_Uriziel_02";
    default m_Description = "ItMw_2H_Sword_Uriziel_02_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 30.0f);
}

UCLASS()
class UItMw_2H_Sword_Uriziel_03: USword2H
{
    default m_Name = "ItMw_2H_Sword_Uriziel_03";
    default m_Value = 6824;
    default m_Weight = 6.0f;
    default m_HitEffect = UGE_Uriziel_03_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 90.0f);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 40.0f);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 20.0f);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Ice, 20.0f);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Impact_Wind, 20.0f);
    default m_SuperArmorDamageBase = 120;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Uriziel_03_Visual.BP_ItMw_2H_Sword_Uriziel_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Uriziel_03_World.BP_ItMw_2H_Sword_Uriziel_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Uriziel_03.T_ItemIcon_ItMw_2H_Sword_Uriziel_03";
    default m_Description = "ItMw_2H_Sword_Uriziel_03_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_Lit);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 30.0f);
}

UCLASS()
class UItMw_2H_Sword_Wind: USword2H
{
    default m_Name = "ItMw_2H_Sword_Wind";
    default m_Value = 400;
    default m_Weight = 5.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 105.0f);
    default m_SuperArmorDamageBase = 105;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Wind_Visual.BP_ItMw_2H_Sword_Wind_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Wind_World.BP_ItMw_2H_Sword_Wind_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Wind.T_ItemIcon_ItMw_2H_Sword_Wind";
    default m_Description = "ItMw_2H_Sword_Wind_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 90.0f);
}

