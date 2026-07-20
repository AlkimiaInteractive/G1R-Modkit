
UCLASS()
class UItAt_Ring_Mordrag: UItemDefinition
{
    default m_Name = "ItAt_Ring_Mordrag";
    default m_Value = 125;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Mordrag_Visual.BP_ItAt_Ring_Mordrag_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Mordrag_World.BP_ItAt_Ring_Mordrag_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Mordrag.T_ItemIcon_ItAt_Ring_Mordrag";
    default m_MaxStack = 1;
    default m_Description = "ItAt_Ring_Mordrag_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Mordrag::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Fire_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Fire_02";
    default m_Value = 350;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Fire_02_Visual.BP_ItAt_Ring_Fire_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Fire_02_World.BP_ItAt_Ring_Fire_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Fire_02.T_ItemIcon_ItAt_Ring_Fire_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Fire_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Magic_03: UItemDefinition
{
    default m_Name = "ItAt_Ring_Magic_03";
    default m_Value = 200;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magic_03_Visual.BP_ItAt_Ring_Magic_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magic_03_World.BP_ItAt_Ring_Magic_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Magic_03.T_ItemIcon_ItAt_Ring_Magic_03";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Magic_03::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Enlight: UItemDefinition
{
    default m_Name = "ItAt_Ring_Enlight";
    default m_Value = 375;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Enlight_Visual.BP_ItAt_Ring_Enlight_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Enlight_World.BP_ItAt_Ring_Enlight_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Enlight.T_ItemIcon_ItAt_Ring_Enlight";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Enlight::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Fire_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Fire_01";
    default m_Value = 175;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Fire_01_Visual.BP_ItAt_Ring_Fire_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Fire_01_World.BP_ItAt_Ring_Fire_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Fire_01.T_ItemIcon_ItAt_Ring_Fire_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Fire_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Skill_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Skill_02";
    default m_Value = 250;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Skill_02_Visual.BP_ItAt_Ring_Skill_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Skill_02_World.BP_ItAt_Ring_Skill_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Skill_02.T_ItemIcon_ItAt_Ring_Skill_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Skill_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Total_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Total_02";
    default m_Value = 1350;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Total_02_Visual.BP_ItAt_Ring_Total_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Total_02_World.BP_ItAt_Ring_Total_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Total_02.T_ItemIcon_ItAt_Ring_Total_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Total_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Life_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Life_02";
    default m_Value = 300;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Life_02_Visual.BP_ItAt_Ring_Life_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Life_02_World.BP_ItAt_Ring_Life_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Life_02.T_ItemIcon_ItAt_Ring_Life_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Life_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Ranged_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Ranged_02";
    default m_Value = 800;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Ranged_02_Visual.BP_ItAt_Ring_Ranged_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Ranged_02_World.BP_ItAt_Ring_Ranged_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Ranged_02.T_ItemIcon_ItAt_Ring_Ranged_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Ranged_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Magicfire_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Magicfire_02";
    default m_Value = 550;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magicfire_02_Visual.BP_ItAt_Ring_Magicfire_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magicfire_02_World.BP_ItAt_Ring_Magicfire_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Magicfire_02.T_ItemIcon_ItAt_Ring_Magicfire_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Magicfire_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Weapon_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Weapon_01";
    default m_Value = 400;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Weapon_01_Visual.BP_ItAt_Ring_Weapon_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Weapon_01_World.BP_ItAt_Ring_Weapon_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Weapon_01.T_ItemIcon_ItAt_Ring_Weapon_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Weapon_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Skill_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Skill_01";
    default m_Value = 125;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Skill_01_Visual.BP_ItAt_Ring_Skill_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Skill_01_World.BP_ItAt_Ring_Skill_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Skill_01.T_ItemIcon_ItAt_Ring_Skill_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Skill_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Total_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Total_01";
    default m_Value = 695;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Total_01_Visual.BP_ItAt_Ring_Total_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Total_01_World.BP_ItAt_Ring_Total_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Total_01.T_ItemIcon_ItAt_Ring_Total_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Total_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Life_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Life_01";
    default m_Value = 150;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Life_01_Visual.BP_ItAt_Ring_Life_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Life_01_World.BP_ItAt_Ring_Life_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Life_01.T_ItemIcon_ItAt_Ring_Life_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Life_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Magic_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Magic_01";
    default m_Value = 150;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magic_01_Visual.BP_ItAt_Ring_Magic_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magic_01_World.BP_ItAt_Ring_Magic_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Magic_01.T_ItemIcon_ItAt_Ring_Magic_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Magic_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Weapon_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Weapon_02";
    default m_Value = 600;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Weapon_02_Visual.BP_ItAt_Ring_Weapon_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Weapon_02_World.BP_ItAt_Ring_Weapon_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Weapon_02.T_ItemIcon_ItAt_Ring_Weapon_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Weapon_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Strong_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Strong_01";
    default m_Value = 125;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Strong_01_Visual.BP_ItAt_Ring_Strong_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Strong_01_World.BP_ItAt_Ring_Strong_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Strong_01.T_ItemIcon_ItAt_Ring_Strong_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Strong_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Magicfire_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Magicfire_01";
    default m_Value = 295;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magicfire_01_Visual.BP_ItAt_Ring_Magicfire_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magicfire_01_World.BP_ItAt_Ring_Magicfire_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Magicfire_01.T_ItemIcon_ItAt_Ring_Magicfire_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Magicfire_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Magic_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Magic_02";
    default m_Value = 120;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magic_02_Visual.BP_ItAt_Ring_Magic_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Magic_02_World.BP_ItAt_Ring_Magic_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Magic_02.T_ItemIcon_ItAt_Ring_Magic_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Magic_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Ranged_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Ranged_01";
    default m_Value = 400;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Ranged_01_Visual.BP_ItAt_Ring_Ranged_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Ranged_01_World.BP_ItAt_Ring_Ranged_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Ranged_01.T_ItemIcon_ItAt_Ring_Ranged_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Ranged_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Projectile_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Projectile_02";
    default m_Value = 400;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Projectile_02_Visual.BP_ItAt_Ring_Projectile_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Projectile_02_World.BP_ItAt_Ring_Projectile_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Projectile_02.T_ItemIcon_ItAt_Ring_Projectile_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Projectile_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Strong_02: UItemDefinition
{
    default m_Name = "ItAt_Ring_Strong_02";
    default m_Value = 250;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Strong_02_Visual.BP_ItAt_Ring_Strong_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Strong_02_World.BP_ItAt_Ring_Strong_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Strong_02.T_ItemIcon_ItAt_Ring_Strong_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Strong_02::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Projectile_01: UItemDefinition
{
    default m_Name = "ItAt_Ring_Projectile_01";
    default m_Value = 200;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Projectile_01_Visual.BP_ItAt_Ring_Projectile_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Projectile_01_World.BP_ItAt_Ring_Projectile_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Projectile_01.T_ItemIcon_ItAt_Ring_Projectile_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Projectile_01::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Scatty: UItemDefinition
{
    default m_Name = "ItAt_Ring_Scatty";
    default m_Value = 50;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Scatty_Visual.BP_ItAt_Ring_Scatty_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Scatty_World.BP_ItAt_Ring_Scatty_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Scatty.T_ItemIcon_ItAt_Ring_Scatty";
    default m_MaxStack = 99;
    default m_Description = "ItAt_Ring_Scatty_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Scatty::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItAt_Ring_Power: UItemDefinition
{
    default m_Name = "ItAt_Ring_Power";
    default m_Value = 200;
    default m_ItemVisual = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Power_Visual.BP_ItAt_Ring_Power_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ring/BP_ItAt_Ring_Power_World.BP_ItAt_Ring_Power_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Ring_Power.T_ItemIcon_ItAt_Ring_Power";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Ring);
    default m_OnEquipEffect = UGE_ItAt_Ring_Power::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

