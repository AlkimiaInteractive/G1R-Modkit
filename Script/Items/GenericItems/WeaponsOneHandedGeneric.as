
UCLASS()
class UItMw_1H_Torch_Gob: UMace1H
{
    default m_Name = "ItMw_1H_Torch";
    default m_Value = 1;
    default m_Weight = 1.0f;
    default m_HitEffect = UGE_Torch1H_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_SuperArmorDamageBase = 14.0f;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Torch_Visual.BP_ItMw_1H_Torch_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Torch_World.BP_ItMw_1H_Torch_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Torch.T_ItemIcon_ItMw_1H_Torch";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Lit);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
    default m_ReplaceBy = UItMw_1H_Torch::StaticClass();
}

UCLASS()
class UItMw_1H_Torch: UTorch1H
{
    default m_Name = "ItMw_1H_Torch";
    default m_Value = 2;
    default m_Weight = 0.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 5.0f);
    default m_SuperArmorDamageBase = 2.0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Torch_Visual.BP_ItMw_1H_Torch_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Torch_World.BP_ItMw_1H_Torch_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Torch.T_ItemIcon_ItMw_1H_Torch";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Torch_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_DropOnItemSwap);
    default AddItemSpec(GameplayTag::Item_Property_AllowSprint);
    default AddItemSpec(GameplayTag::Item_Lockpick);
    default AddItemSpec(GameplayTag::Item_Property_Lit);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
}

UCLASS()
class UItMw_1H_Mace_Club_01: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Club_01";
    default m_Value = 2;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 5.0f);
    default m_SuperArmorDamageBase = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Club_01_Visual.BP_ItMw_1H_Mace_Club_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Club_01_World.BP_ItMw_1H_Mace_Club_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Club_01.T_ItemIcon_ItMw_1H_Mace_Club_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
}

UCLASS()
class UItMw_1H_Mace_Poker_01: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Poker_01";
    default m_Value = 3;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 6.0f);
    default m_SuperArmorDamageBase = 12;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Poker_01_Visual.BP_ItMw_1H_Mace_Poker_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Poker_01_World.BP_ItMw_1H_Mace_Poker_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Poker_01.T_ItemIcon_ItMw_1H_Mace_Poker_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
}

UCLASS()
class UItMw_1H_Axe_Sickle_01: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_Sickle_01";
    default m_Value = 4;
    default m_Weight = 1.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 7.0f);
    default m_SuperArmorDamageBase = 7;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Sickle_01_Visual.BP_ItMw_1H_Axe_Sickle_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Sickle_01_World.BP_ItMw_1H_Axe_Sickle_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Sickle_01.T_ItemIcon_ItMw_1H_Axe_Sickle_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_Reaping);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
}

UCLASS()
class UItMw_1H_Mace_Light_01: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Light_01";
    default m_Value = 5;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 8.0f);
    default m_SuperArmorDamageBase = 16;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Light_01_Visual.BP_ItMw_1H_Mace_Light_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Light_01_World.BP_ItMw_1H_Mace_Light_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Light_01.T_ItemIcon_ItMw_1H_Mace_Light_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
}

UCLASS()
class UItMw_1H_Axe_Hatchet_01: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_Hatchet_01";
    default m_Value = 6;
    default m_Weight = 1.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9.0f);
    default m_SuperArmorDamageBase = 9;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Hatchet_01_Visual.BP_ItMw_1H_Axe_Hatchet_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Hatchet_01_World.BP_ItMw_1H_Axe_Hatchet_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Hatchet_01.T_ItemIcon_ItMw_1H_Axe_Hatchet_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
}

UCLASS()
class UItMw_1H_Mace_Sledgehammer_01: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Sledgehammer_01";
    default m_Value = 5;
    default m_Weight = 4.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 10.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Sledgehammer_01_Visual.BP_ItMw_1H_Mace_Sledgehammer_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Sledgehammer_01_World.BP_ItMw_1H_Mace_Sledgehammer_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Sledgehammer_01.T_ItemIcon_ItMw_1H_Mace_Sledgehammer_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
}

UCLASS()
class UItMw_1H_Sword_Old_01: USword1H
{
    default m_Name = "ItMw_1H_Sword_Old_01";
    default m_Value = 10;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 10.0f);
    default m_SuperArmorDamageBase = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Old_01_Visual.BP_ItMw_1H_Sword_Old_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Old_01_World.BP_ItMw_1H_Sword_Old_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Old_01.T_ItemIcon_ItMw_1H_Sword_Old_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 5.0f);
}

UCLASS()
class UItMw_1H_Mace_Nailmace_01: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Nailmace_01";
    default m_Value = 13;
    default m_Weight = 3.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 11.0f);
    default m_SuperArmorDamageBase = 22;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Nailmace_01_Visual.BP_ItMw_1H_Mace_Nailmace_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Nailmace_01_World.BP_ItMw_1H_Mace_Nailmace_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Nailmace_01.T_ItemIcon_ItMw_1H_Mace_Nailmace_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 7.0f);
}

UCLASS()
class UItMw_1H_Sword_Old_02: USword1H
{
    default m_Name = "ItMw_1H_Sword_Old_02";
    default m_Value = 12;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 12.0f);
    default m_SuperArmorDamageBase = 12;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Old_02_Visual.BP_ItMw_1H_Sword_Old_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Old_02_World.BP_ItMw_1H_Sword_Old_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Old_02.T_ItemIcon_ItMw_1H_Sword_Old_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 8.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_01: USword1H
{
    default m_Name = "ItMw_1H_Sword_Short_01";
    default m_Value = 24;
    default m_Weight = 1.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 12.0f);
    default m_SuperArmorDamageBase = 12;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_01_Visual.BP_ItMw_1H_Sword_Short_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_01_World.BP_ItMw_1H_Sword_Short_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Short_01.T_ItemIcon_ItMw_1H_Sword_Short_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 8.0f);
}

UCLASS()
class UItMw_1H_Axe_Old_01: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_Old_01";
    default m_Value = 12;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 13.0f);
    default m_SuperArmorDamageBase = 13;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Old_01_Visual.BP_ItMw_1H_Axe_Old_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Old_01_World.BP_ItMw_1H_Axe_Old_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Old_01.T_ItemIcon_ItMw_1H_Axe_Old_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 9.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_02: USword1H
{
    default m_Name = "ItMw_1H_Sword_Short_02";
    default m_Value = 32;
    default m_Weight = 1.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 14.0f);
    default m_SuperArmorDamageBase = 14;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_02_Visual.BP_ItMw_1H_Sword_Short_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_02_World.BP_ItMw_1H_Sword_Short_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Short_02.T_ItemIcon_ItMw_1H_Sword_Short_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 10.0f);
}

UCLASS()
class UItMw_1H_Sword_Scythe_01: UAxe1H
{
    default m_Name = "ItMw_1H_Sword_Scythe_01";
    default m_Value = 18;
    default m_Weight = 2.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 15.0f);
    default m_SuperArmorDamageBase = 15;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Scythe_01_Visual.BP_ItMw_1H_Sword_Scythe_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Scythe_01_World.BP_ItMw_1H_Sword_Scythe_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Scythe_01.T_ItemIcon_ItMw_1H_Sword_Scythe_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_Reaping);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 10.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_03: USword1H
{
    default m_Name = "ItMw_1H_Sword_Short_03";
    default m_Value = 60;
    default m_Weight = 1.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 21.0f);
    default m_SuperArmorDamageBase = 21;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_03_Visual.BP_ItMw_1H_Sword_Short_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_03_World.BP_ItMw_1H_Sword_Short_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Short_03.T_ItemIcon_ItMw_1H_Sword_Short_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 15.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_04: USword1H
{
    default m_Name = "ItMw_1H_Sword_Short_04";
    default m_Value = 38;
    default m_Weight = 1.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 18.0f);
    default m_SuperArmorDamageBase = 18;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_Visual.BP_ItMw_1H_Sword_Short_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_04_World.BP_ItMw_1H_Sword_Short_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Short_04.T_ItemIcon_ItMw_1H_Sword_Short_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 15.0f);
}

UCLASS()
class UItMw_1H_Axe_Bran: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_Bran";
    default m_Value = 54;
    default m_Weight = 2.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 20.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Bran_Visual.BP_ItMw_1H_Axe_Bran_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Bran_World.BP_ItMw_1H_Axe_Bran_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Bran.T_ItemIcon_ItMw_1H_Axe_Bran";
    default m_Description = "ItMw_1H_Axe_Bran_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 10.0f);
}

UCLASS()
class UItMw_1H_Mace_Fortuno: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Fortuno";
    default m_Value = 54;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20.0f);
    default m_SuperArmorDamageBase = 40;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Fortuno_Visual.BP_ItMw_1H_Mace_Fortuno_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Fortuno_World.BP_ItMw_1H_Mace_Fortuno_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Fortuno.T_ItemIcon_ItMw_1H_Mace_Fortuno";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 12.0f);
}

UCLASS()
class UItMw_1H_Sword_01: USword1H
{
    default m_Name = "ItMw_1H_Sword_01";
    default m_Value = 31;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 17.0f);
    default m_SuperArmorDamageBase = 17;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_01_Visual.BP_ItMw_1H_Sword_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_01_World.BP_ItMw_1H_Sword_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_01.T_ItemIcon_ItMw_1H_Sword_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 14.0f);
}

UCLASS()
class UItMw_1H_Sword_Whistler: USword1H
{
    default m_Name = "ItMw_1H_Sword_Whistler";
    default m_Value = 54;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 20.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Whistler_Visual.BP_ItMw_1H_Sword_Whistler_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Whistler_World.BP_ItMw_1H_Sword_Whistler_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Whistler.T_ItemIcon_ItMw_1H_Sword_Whistler";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 17.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_05: USword1H
{
    default m_Name = "ItMw_1H_Sword_Short_05";
    default m_Value = 54;
    default m_Weight = 1.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 20.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_05_Visual.BP_ItMw_1H_Sword_Short_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Short_05_World.BP_ItMw_1H_Sword_Short_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Short_05.T_ItemIcon_ItMw_1H_Sword_Short_05";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 17.0f);
}

UCLASS()
class UItMw_1H_Sword_Lightguard_01: USword1H
{
    default m_Name = "ItMw_1H_Sword_Lightguard_01";
    default m_Value = 70;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 22.0f);
    default m_SuperArmorDamageBase = 22;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Lightguard_01_Visual.BP_ItMw_1H_Sword_Lightguard_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Lightguard_01_World.BP_ItMw_1H_Sword_Lightguard_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Lightguard_01.T_ItemIcon_ItMw_1H_Sword_Lightguard_01";
    default m_Description = "ItMw_1H_Sword_Lightguard_01_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 16.0f);
}

UCLASS()
class UItMw_1H_Mace_01: UMace1H
{
    default m_Name = "ItMw_1H_Mace_01";
    default m_Value = 79;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 23.0f);
    default m_SuperArmorDamageBase = 46;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_01_Visual.BP_ItMw_1H_Mace_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_01_World.BP_ItMw_1H_Mace_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_01.T_ItemIcon_ItMw_1H_Mace_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 19.0f);
}

UCLASS()
class UItMw_1H_Mace_02: UMace1H
{
    default m_Name = "ItMw_1H_Mace_02";
    default m_Value = 97;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 25.0f);
    default m_SuperArmorDamageBase = 50;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_02_Visual.BP_ItMw_1H_Mace_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_02_World.BP_ItMw_1H_Mace_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_02.T_ItemIcon_ItMw_1H_Mace_02";
    default m_Description = "ItMw_1H_Mace_02_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 22.0f);
}

UCLASS()
class UItMw_1H_Mace_03: UMace1H
{
    default m_Name = "ItMw_1H_Mace_03";
    default m_Value = 106;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 26.0f);
    default m_SuperArmorDamageBase = 52;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_03_Visual.BP_ItMw_1H_Mace_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_03_World.BP_ItMw_1H_Mace_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_03.T_ItemIcon_ItMw_1H_Mace_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 21.0f);
}

UCLASS()
class UItMw_1H_Axe_01: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_01";
    default m_Value = 135;
    default m_Weight = 2.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 29.0f);
    default m_SuperArmorDamageBase = 29;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_01_Visual.BP_ItMw_1H_Axe_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_01_World.BP_ItMw_1H_Axe_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_01.T_ItemIcon_ItMw_1H_Axe_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 23.0f);
}

UCLASS()
class UItMw_1H_Mace_04: UMace1H
{
    default m_Name = "ItMw_1H_Mace_04";
    default m_Value = 135;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 29.0f);
    default m_SuperArmorDamageBase = 58;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_04_Visual.BP_ItMw_1H_Mace_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_04_World.BP_ItMw_1H_Mace_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_04.T_ItemIcon_ItMw_1H_Mace_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 26.0f);
}

UCLASS()
class UItMw_1H_Sword_02: USword1H
{
    default m_Name = "ItMw_1H_Sword_02";
    default m_Value = 145;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 30.0f);
    default m_SuperArmorDamageBase = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_02_Visual.BP_ItMw_1H_Sword_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_02_World.BP_ItMw_1H_Sword_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_02.T_ItemIcon_ItMw_1H_Sword_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 20.0f);
}

UCLASS()
class UItMw_1H_Sword_03: USword1H
{
    default m_Name = "ItMw_1H_Sword_03";
    default m_Value = 165;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 32.0f);
    default m_SuperArmorDamageBase = 32;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_03_Visual.BP_ItMw_1H_Sword_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_03_World.BP_ItMw_1H_Sword_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_03.T_ItemIcon_ItMw_1H_Sword_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 22.0f);
}

UCLASS()
class UItMw_1H_Sword_04: USword1H
{
    default m_Name = "ItMw_1H_Sword_04";
    default m_Value = 176;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 33.0f);
    default m_SuperArmorDamageBase = 33;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_04_Visual.BP_ItMw_1H_Sword_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_04_World.BP_ItMw_1H_Sword_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_04.T_ItemIcon_ItMw_1H_Sword_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 23.0f);
}

UCLASS()
class UItMw_1H_Sword_05: USword1H
{
    default m_Name = "ItMw_1H_Sword_05";
    default m_Value = 186;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 34.0f);
    default m_SuperArmorDamageBase = 34;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_05_Visual.BP_ItMw_1H_Sword_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_05_World.BP_ItMw_1H_Sword_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_05.T_ItemIcon_ItMw_1H_Sword_05";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 24.0f);
}

UCLASS()
class UItMw_1H_Mace_War_01: UMace1H
{
    default m_Name = "ItMw_1H_Mace_War_01";
    default m_Value = 197;
    default m_Weight = 4.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 35.0f);
    default m_SuperArmorDamageBase = 70;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_War_01_Visual.BP_ItMw_1H_Mace_War_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_War_01_World.BP_ItMw_1H_Mace_War_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_War_01.T_ItemIcon_ItMw_1H_Mace_War_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 27.0f);
}

UCLASS()
class UItMw_1H_Mace_War_02: UMace1H
{
    default m_Name = "ItMw_1H_Mace_War_02";
    default m_Value = 208;
    default m_Weight = 4.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 36.0f);
    default m_SuperArmorDamageBase = 72;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_War_02_Visual.BP_ItMw_1H_Mace_War_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_War_02_World.BP_ItMw_1H_Mace_War_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_War_02.T_ItemIcon_ItMw_1H_Mace_War_02";
    default m_Description = "ItMw_1H_Mace_War_02_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 28.0f);
}

UCLASS()
class UItMw_1H_Mace_War_03: UMace1H
{
    default m_Name = "ItMw_1H_Mace_War_03";
    default m_Value = 220;
    default m_Weight = 4.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 37.0f);
    default m_SuperArmorDamageBase = 74;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_War_03_Visual.BP_ItMw_1H_Mace_War_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_War_03_World.BP_ItMw_1H_Mace_War_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_War_03.T_ItemIcon_ItMw_1H_Mace_War_03";
    default m_Description = "ItMw_1H_Mace_War_03_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 29.0f);
}

UCLASS()
class UItMw_1H_Sword_Long_01: USword1H
{
    default m_Name = "ItMw_1H_Sword_Long_01";
    default m_Value = 254;
    default m_Weight = 3.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 40.0f);
    default m_SuperArmorDamageBase = 40;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_01_Visual.BP_ItMw_1H_Sword_Long_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_01_World.BP_ItMw_1H_Sword_Long_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Long_01.T_ItemIcon_ItMw_1H_Sword_Long_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 30.0f);
}

UCLASS()
class UItMw_1H_Sword_Long_02: USword1H
{
    default m_Name = "ItMw_1H_Sword_Long_02";
    default m_Value = 278;
    default m_Weight = 3.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 42.0f);
    default m_SuperArmorDamageBase = 42;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_02_Visual.BP_ItMw_1H_Sword_Long_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_02_World.BP_ItMw_1H_Sword_Long_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Long_02.T_ItemIcon_ItMw_1H_Sword_Long_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 32.0f);
}

UCLASS()
class UItMw_1H_Sword_Long_03: USword1H
{
    default m_Name = "ItMw_1H_Sword_Long_03";
    default m_Value = 303;
    default m_Weight = 3.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 44.0f);
    default m_SuperArmorDamageBase = 44;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_03_Visual.BP_ItMw_1H_Sword_Long_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_03_World.BP_ItMw_1H_Sword_Long_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Long_03.T_ItemIcon_ItMw_1H_Sword_Long_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 34.0f);
}

UCLASS()
class UItMw_1H_Sword_Bastard_01: USword1H
{
    default m_Name = "ItMw_1H_Sword_Bastard_01";
    default m_Value = 315;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 45.0f);
    default m_SuperArmorDamageBase = 45;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_01_Visual.BP_ItMw_1H_Sword_Bastard_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_01_World.BP_ItMw_1H_Sword_Bastard_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Bastard_01.T_ItemIcon_ItMw_1H_Sword_Bastard_01";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 35.0f);
}

UCLASS()
class UItMw_1H_Sword_Long_04: USword1H
{
    default m_Name = "ItMw_1H_Sword_Long_04";
    default m_Value = 328;
    default m_Weight = 3.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 46.0f);
    default m_SuperArmorDamageBase = 46;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_04_Visual.BP_ItMw_1H_Sword_Long_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_04_World.BP_ItMw_1H_Sword_Long_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Long_04.T_ItemIcon_ItMw_1H_Sword_Long_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 36.0f);
}

UCLASS()
class UItMw_1H_Sword_Long_05: USword1H
{
    default m_Name = "ItMw_1H_Sword_Long_05";
    default m_Value = 354;
    default m_Weight = 3.0f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 48.0f);
    default m_SuperArmorDamageBase = 48;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_05_Visual.BP_ItMw_1H_Sword_Long_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Long_05_World.BP_ItMw_1H_Sword_Long_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Long_05.T_ItemIcon_ItMw_1H_Sword_Long_05";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 38.0f);
}

UCLASS()
class UItMw_1H_Mace_Warhammer_01: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Warhammer_01";
    default m_Value = 380;
    default m_Weight = 4.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 50.0f);
    default m_SuperArmorDamageBase = 100;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Warhammer_01_Visual.BP_ItMw_1H_Mace_Warhammer_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Warhammer_01_World.BP_ItMw_1H_Mace_Warhammer_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Warhammer_01.T_ItemIcon_ItMw_1H_Mace_Warhammer_01";
    default m_Description = "ItMw_1H_Mace_Warhammer_01_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 42.0f);
}

UCLASS()
class UItMw_1H_Mace_Warhammer_02: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Warhammer_02";
    default m_Value = 393;
    default m_Weight = 4.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 51.0f);
    default m_SuperArmorDamageBase = 102;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Warhammer_02_Visual.BP_ItMw_1H_Mace_Warhammer_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Warhammer_02_World.BP_ItMw_1H_Mace_Warhammer_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Warhammer_02.T_ItemIcon_ItMw_1H_Mace_Warhammer_02";
    default m_Description = "ItMw_1H_Mace_Warhammer_02_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 43.0f);
}

UCLASS()
class UItMw_1H_Mace_Warhammer_03: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Warhammer_03";
    default m_Value = 407;
    default m_Weight = 4.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 52.0f);
    default m_SuperArmorDamageBase = 104;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Warhammer_03_Visual.BP_ItMw_1H_Mace_Warhammer_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Warhammer_03_World.BP_ItMw_1H_Mace_Warhammer_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Warhammer_03.T_ItemIcon_ItMw_1H_Mace_Warhammer_03";
    default m_Description = "ItMw_1H_Mace_Warhammer_03_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 44.0f);
}

UCLASS()
class UItMw_1H_Axe_02: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_02";
    default m_Value = 421;
    default m_Weight = 2.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 53.0f);
    default m_SuperArmorDamageBase = 53;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_02_Visual.BP_ItMw_1H_Axe_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_02_World.BP_ItMw_1H_Axe_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_02.T_ItemIcon_ItMw_1H_Axe_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 43.0f);
}

UCLASS()
class UItMw_1H_Axe_03: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_03";
    default m_Value = 434;
    default m_Weight = 2.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 54.0f);
    default m_SuperArmorDamageBase = 54;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_03_Visual.BP_ItMw_1H_Axe_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_03_World.BP_ItMw_1H_Axe_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_03.T_ItemIcon_ItMw_1H_Axe_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 44.0f);
}

UCLASS()
class UItMw_1H_Axe_Silas: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_Silas";
    default m_Value = 202;
    default m_Weight = 2.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 55.0f);
    default m_SuperArmorDamageBase = 55;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Silas_Visual.BP_ItMw_1H_Axe_Silas_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Silas_World.BP_ItMw_1H_Axe_Silas_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Silas.T_ItemIcon_ItMw_1H_Axe_Silas";
    default m_Description = "ItMw_1H_Axe_Silas_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 45.0f);
}

UCLASS()
class UItMw_1H_Mace_Namib: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Namib";
    default m_Value = 202;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 55.0f);
    default m_SuperArmorDamageBase = 110;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Namib_Visual.BP_ItMw_1H_Mace_Namib_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Namib_World.BP_ItMw_1H_Mace_Namib_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Namib.T_ItemIcon_ItMw_1H_Mace_Namib";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 47.0f);
}

UCLASS()
class UItMw_1H_Sword_Paw: USword1H
{
    default m_Name = "ItMw_1H_Sword_Paw";
    default m_Value = 202;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 55.0f);
    default m_SuperArmorDamageBase = 55;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Paw_Visual.BP_ItMw_1H_Sword_Paw_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Paw_World.BP_ItMw_1H_Sword_Paw_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Paw.T_ItemIcon_ItMw_1H_Sword_Paw";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 45.0f);
}

UCLASS()
class UItMw_1H_Sword_Broad_01: USword1H
{
    default m_Name = "ItMw_1H_Sword_Broad_01";
    default m_Value = 448;
    default m_Weight = 3.2f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 55.0f);
    default m_SuperArmorDamageBase = 55;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Broad_01_Visual.BP_ItMw_1H_Sword_Broad_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Broad_01_World.BP_ItMw_1H_Sword_Broad_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Broad_01.T_ItemIcon_ItMw_1H_Sword_Broad_01";
    default m_Description = "ItMw_1H_Sword_Broad_01_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 45.0f);
}

UCLASS()
class UItMw_1H_Sword_Broad_02: USword1H
{
    default m_Name = "ItMw_1H_Sword_Broad_02";
    default m_Value = 477;
    default m_Weight = 3.2f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 57.0f);
    default m_SuperArmorDamageBase = 57;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Broad_02_Visual.BP_ItMw_1H_Sword_Broad_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Broad_02_World.BP_ItMw_1H_Sword_Broad_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Broad_02.T_ItemIcon_ItMw_1H_Sword_Broad_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 47.0f);
}

UCLASS()
class UItMw_1H_Sword_Broad_03: USword1H
{
    default m_Name = "ItMw_1H_Sword_Broad_03";
    default m_Value = 491;
    default m_Weight = 3.2f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 58.0f);
    default m_SuperArmorDamageBase = 58;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Broad_03_Visual.BP_ItMw_1H_Sword_Broad_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Broad_03_World.BP_ItMw_1H_Sword_Broad_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Broad_03.T_ItemIcon_ItMw_1H_Sword_Broad_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 48.0f);
}

UCLASS()
class UItMw_1H_Sword_Broad_04: USword1H
{
    default m_Name = "ItMw_1H_Sword_Broad_04";
    default m_Value = 506;
    default m_Weight = 3.2f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 59.0f);
    default m_SuperArmorDamageBase = 59;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Broad_04_Visual.BP_ItMw_1H_Sword_Broad_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Broad_04_World.BP_ItMw_1H_Sword_Broad_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Broad_04.T_ItemIcon_ItMw_1H_Sword_Broad_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 49.0f);
}

UCLASS()
class UItMw_1H_Axe_Cord: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_Cord";
    default m_Value = 220;
    default m_Weight = 2.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 60.0f);
    default m_SuperArmorDamageBase = 60;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Cord_Visual.BP_ItMw_1H_Axe_Cord_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Cord_World.BP_ItMw_1H_Axe_Cord_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Cord.T_ItemIcon_ItMw_1H_Axe_Cord";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 50.0f);
}

UCLASS()
class UItMw_1H_Mace_Orun: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Orun";
    default m_Value = 220;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 60.0f);
    default m_SuperArmorDamageBase = 120;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Orun_Visual.BP_ItMw_1H_Mace_Orun_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Orun_World.BP_ItMw_1H_Mace_Orun_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Orun.T_ItemIcon_ItMw_1H_Mace_Orun";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 52.0f);
}

UCLASS()
class UItMw_1H_Mace_Lester: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Lester";
    default m_Value = 220;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 60.0f);
    default m_SuperArmorDamageBase = 120;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Lester_Visual.BP_ItMw_1H_Mace_Lester_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Lester_World.BP_ItMw_1H_Mace_Lester_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Lester.T_ItemIcon_ItMw_1H_Mace_Lester";
    default m_Description = "ItMw_1H_Mace_Lester_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 52.0f);
}

UCLASS()
class UItMw_1H_Sword_Bastard_02: USword1H
{
    default m_Name = "ItMw_1H_Sword_Bastard_02";
    default m_Value = 580;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 64.0f);
    default m_SuperArmorDamageBase = 64;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_02_Visual.BP_ItMw_1H_Sword_Bastard_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_02_World.BP_ItMw_1H_Sword_Bastard_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Bastard_02.T_ItemIcon_ItMw_1H_Sword_Bastard_02";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 51.0f);
}

UCLASS()
class UItMw_1H_Axe_Lares: UAxe1H
{
    default m_Name = "ItMw_1H_Axe_Lares";
    default m_Value = 224;
    default m_Weight = 2.8f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 65.0f);
    default m_SuperArmorDamageBase = 65;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Lares_Visual.BP_ItMw_1H_Axe_Lares_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Axe_Lares_World.BP_ItMw_1H_Axe_Lares_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Lares.T_ItemIcon_ItMw_1H_Axe_Lares";
    default m_Description = "ItMw_1H_Axe_Lares_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 52.0f);
}

UCLASS()
class UItMw_1H_Sword_Arto: USword1H
{
    default m_Name = "ItMw_1H_Sword_Arto";
    default m_Value = 224;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 65.0f);
    default m_SuperArmorDamageBase = 65;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Arto_Visual.BP_ItMw_1H_Sword_Arto_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Arto_World.BP_ItMw_1H_Sword_Arto_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Arto.T_ItemIcon_ItMw_1H_Sword_Arto";
    default m_Description = "ItMw_1H_Sword_Arto_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 54.0f);
}

UCLASS()
class UItMw_1H_Sword_Bastard_03: USword1H
{
    default m_Name = "ItMw_1H_Sword_Bastard_03";
    default m_Value = 596;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 65.0f);
    default m_SuperArmorDamageBase = 65;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_03_Visual.BP_ItMw_1H_Sword_Bastard_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_03_World.BP_ItMw_1H_Sword_Bastard_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Bastard_03.T_ItemIcon_ItMw_1H_Sword_Bastard_03";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 53.0f);
}

UCLASS()
class UItMw_1H_Sword_Bastard_04: USword1H
{
    default m_Name = "ItMw_1H_Sword_Bastard_04";
    default m_Description = "ItMw_1H_Sword_Bastard_04_description";
    default m_Value = 611;
    default m_Weight = 3.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 66.0f);
    default m_SuperArmorDamageBase = 66;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_04_Visual.BP_ItMw_1H_Sword_Bastard_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_04_World.BP_ItMw_1H_Sword_Bastard_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Bastard_04.T_ItemIcon_ItMw_1H_Sword_Bastard_04";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 54.0f);
}

UCLASS()
class UItMw_1H_Sword_Kalom: USword1H
{
    default m_Name = "ItMw_1H_Sword_Kalom";
    default m_Value = 264;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 70.0f);
    default m_SuperArmorDamageBase = 70;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Kalom_Visual.BP_ItMw_1H_Sword_Kalom_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Kalom_World.BP_ItMw_1H_Sword_Kalom_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Kalom.T_ItemIcon_ItMw_1H_Sword_Kalom";
    default m_Description = "ItMw_1H_Sword_Kalom_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 55.0f);
}

UCLASS()
class UItMw_1H_Sword_Raven: USword1H
{
    default m_Name = "ItMw_1H_Sword_Raven";
    default m_Value = 264;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 70.0f);
    default m_SuperArmorDamageBase = 70;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Raven_Visual.BP_ItMw_1H_Sword_Raven_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Raven_World.BP_ItMw_1H_Sword_Raven_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Raven.T_ItemIcon_ItMw_1H_Sword_Raven";
    default m_Description = "ItMw_1H_Sword_Raven_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 55.0f);
}

UCLASS()
class UItMw_1H_Sword_Scar: USword1H
{
    default m_Name = "ItMw_1H_Sword_Scar";
    default m_Value = 315;
    default m_Weight = 2.5f;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 85.0f);
    default m_SuperArmorDamageBase = 85;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Scar_Visual.BP_ItMw_1H_Sword_Scar_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Scar_World.BP_ItMw_1H_Sword_Scar_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Scar.T_ItemIcon_ItMw_1H_Sword_Scar";
    default m_Description = "ItMw_1H_Sword_Scar_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_TrackOwnership);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 70.0f);
}

