// Copyright by THQ Nordic & Alkimia Interactive
class UInventoryFilter_G1R_All : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_All;
    default m_DisplayName = LocText("Text_FilterAll");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_AllItems.T_Icon_AllItems");
    default m_SortOrder = 1;
}

class UInventoryFilter_G1R_MeleeWeapons : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Melee;
    default m_DisplayName = LocText("Text_FilterMelee");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Melee.T_Icon_Melee");
    default m_SortOrder = 2;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Fist);
}

class UInventoryFilter_G1R_RangedWeapons : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Ranged;
    default m_DisplayName = LocText("Text_FilterRanged");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Bow.T_Icon_Bow");
    default m_SortOrder = 3;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Bow);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Crossbow);
    default m_ItemTags.AddTag(GameplayTag::Item_Ammo);
    default m_ItemTags.AddTag(GameplayTag::Item_Projectile_Arrow);
    default m_ItemTags.AddTag(GameplayTag::Item_Projectile_Bolt);
}

class UInventoryFilter_G1R_Magic : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Magic;
    default m_DisplayName = LocText("Text_FilterMagic");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Magic.T_Icon_Magic");
    default m_SortOrder = 4;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Rune);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Scroll);
}

class UInventoryFilter_G1R_Wereables : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Wereables;
    default m_DisplayName = LocText("Text_FilterWearables");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Armor.T_Icon_Armor");
    default m_SortOrder = 5;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Armor);
    default m_ItemTags.AddTag(GameplayTag::Item_Ring);
    default m_ItemTags.AddTag(GameplayTag::Item_Amulet);
}

class UInventoryFilter_G1R_Food : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Food;
    default m_DisplayName = LocText("Text_FilterFood");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Food.T_Icon_Food");
    default m_SortOrder = 6;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Food);
    default m_ItemTags.AddTag(GameplayTag::Item_Herb);
    default m_ItemTags.AddTag(GameplayTag::Item_Drug);
}

class UInventoryFilter_G1R_Potions : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Potions;
    default m_DisplayName = LocText("Text_FilterPotions");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Potion.T_Icon_Potion");
    default m_SortOrder = 7;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Potion);
}

class UInventoryFilter_G1R_Materials : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Materials;
    default m_DisplayName = LocText("Text_FilterMaterials");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Materials.T_Icon_Materials");
    default m_SortOrder = 8;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Ore);
    default m_ItemTags.AddTag(GameplayTag::Item_Material);
    default m_ItemTags.AddTag(GameplayTag::Item_Trophy);
    default m_ItemTags.AddTag(GameplayTag::Item_Property_Forge);
    default m_ItemTags.AddTag(GameplayTag::Item_Recipe);
}

class UInventoryFilter_G1R_Documents : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Documents;
    default m_DisplayName = LocText("Text_FilterDocuments");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Book.T_Icon_Book");
    default m_SortOrder = 9;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Writing);
}

class UInventoryFilter_G1R_Miscellaneous : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Miscellaneous;
    default m_DisplayName = LocText("Text_FilterMiscellaneous");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Misc.T_Icon_Misc");
    default m_SortOrder = 10;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Junk);
    default m_ItemTags.AddTag(GameplayTag::Item_Instrument);
    default m_ItemTags.AddTag(GameplayTag::Item_Lockpick);
    default m_ItemTags.AddTag(GameplayTag::Item_Weapon_Torch);
}

class UInventoryFilter_G1R_Artefacts : UInventoryFilter
{
    default m_FilterTag = GameplayTag::UI_Filter_Inventory_Artefacts;
    default m_DisplayName = LocText("Text_FilterArtefacts");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Key.T_Icon_Key");
    default m_SortOrder = 11;

    default m_ItemTags = FGameplayTagContainer();
    default m_ItemTags.AddTag(GameplayTag::Item_Quest);
    default m_ItemTags.AddTag(GameplayTag::Item_Key);
}