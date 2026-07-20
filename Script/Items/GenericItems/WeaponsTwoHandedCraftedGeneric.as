UCLASS()
class UItMw_2H_Axe_Pickaxe_Trained: UItMw_2H_Axe_Pickaxe
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 8.0f);
    default m_SuperArmorDamageBase = 8;
    default m_Value = 5;
    default m_ComparedTo = UItMw_2H_Axe_Pickaxe::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 4.0f);
}

UCLASS()
class UItMw_2H_Axe_Pickaxe_Master: UItMw_2H_Axe_Pickaxe
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9.0f);
    default m_SuperArmorDamageBase = 9;
    default m_Value = 5;
    default m_ComparedTo = UItMw_2H_Axe_Pickaxe::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 3.0f);
}

UCLASS()
class UItMw_2H_Axe_Old_02_Trained: UItMw_2H_Axe_Old_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 75.0f);
    default m_SuperArmorDamageBase = 75;
    default m_Value = 1436;
    default m_ComparedTo = UItMw_2H_Axe_Old_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 51.0f);
}

UCLASS()
class UItMw_2H_Axe_Old_02_Master: UItMw_2H_Axe_Old_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 82.0f);
    default m_SuperArmorDamageBase = 82;
    default m_Value = 1566;
    default m_ComparedTo = UItMw_2H_Axe_Old_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 41.0f);
}

UCLASS()
class UItMw_2H_Axe_Light_01_Trained: UItMw_2H_Axe_Light_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 85.0f);
    default m_SuperArmorDamageBase = 85;
    default m_Value = 1774;
    default m_ComparedTo = UItMw_2H_Axe_Light_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 57.0f);
}

UCLASS()
class UItMw_2H_Axe_Light_01_Master: UItMw_2H_Axe_Light_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 93.0f);
    default m_SuperArmorDamageBase = 93;
    default m_Value = 1935;
    default m_ComparedTo = UItMw_2H_Axe_Light_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 46.0f);
}

UCLASS()
class UItMw_2H_Axe_Light_02_Trained: UItMw_2H_Axe_Light_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 87.0f);
    default m_SuperArmorDamageBase = 87;
    default m_Value = 1853;
    default m_ComparedTo = UItMw_2H_Axe_Light_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 59.0f);
}

UCLASS()
class UItMw_2H_Axe_Light_02_Master: UItMw_2H_Axe_Light_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 95.0f);
    default m_SuperArmorDamageBase = 95;
    default m_Value = 2021;
    default m_ComparedTo = UItMw_2H_Axe_Light_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 48.0f);
}

UCLASS()
class UItMw_2H_Axe_Heavy_02_Trained: UItMw_2H_Axe_Heavy_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 106.0f);
    default m_SuperArmorDamageBase = 106;
    default m_Value = 2579;
    default m_ComparedTo = UItMw_2H_Axe_Heavy_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 75.0f);
}

UCLASS()
class UItMw_2H_Axe_Heavy_02_Master: UItMw_2H_Axe_Heavy_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 116.0f);
    default m_SuperArmorDamageBase = 116;
    default m_Value = 2813;
    default m_ComparedTo = UItMw_2H_Axe_Heavy_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 60.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_01_Trained: UItMw_2H_Sword_Light_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 66.0f);
    default m_SuperArmorDamageBase = 66;
    default m_Value = 1161;
    default m_ComparedTo = UItMw_2H_Sword_Light_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 46.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_01_Master: UItMw_2H_Sword_Light_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 72.0f);
    default m_SuperArmorDamageBase = 72;
    default m_Value = 1266;
    default m_ComparedTo = UItMw_2H_Sword_Light_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 37.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_02_Trained: UItMw_2H_Sword_Light_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 79.0f);
    default m_SuperArmorDamageBase = 79;
    default m_Value = 1545;
    default m_ComparedTo = UItMw_2H_Sword_Light_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 52.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_02_Master: UItMw_2H_Sword_Light_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 86.0f);
    default m_SuperArmorDamageBase = 86;
    default m_Value = 1685;
    default m_ComparedTo = UItMw_2H_Sword_Light_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 42.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_03_Trained: UItMw_2H_Sword_Light_03
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 81.0f);
    default m_SuperArmorDamageBase = 81;
    default m_Value = 1620;
    default m_ComparedTo = UItMw_2H_Sword_Light_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 53.0f);
}

UCLASS()
class UItMw_2H_Sword_Light_03_Master: UItMw_2H_Sword_Light_03
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 88.0f);
    default m_SuperArmorDamageBase = 88;
    default m_Value = 1767;
    default m_ComparedTo = UItMw_2H_Sword_Light_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 43.0f);
}

UCLASS()
class UItMw_2H_Sword_01_Trained: UItMw_2H_Sword_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 90.0f);
    default m_SuperArmorDamageBase = 90;
    default m_Value = 1933;
    default m_ComparedTo = UItMw_2H_Sword_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 61.0f);
}

UCLASS()
class UItMw_2H_Sword_01_Master: UItMw_2H_Sword_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 98.0f);
    default m_SuperArmorDamageBase = 98;
    default m_Value = 2109;
    default m_ComparedTo = UItMw_2H_Sword_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 49.0f);
}

UCLASS()
class UItMw_2H_Sword_Heavy_01_Trained: UItMw_2H_Sword_Heavy_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 95.0f);
    default m_SuperArmorDamageBase = 95;
    default m_Value = 2140;
    default m_ComparedTo = UItMw_2H_Sword_Heavy_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 66.0f);
}

UCLASS()
class UItMw_2H_Sword_Heavy_01_Master: UItMw_2H_Sword_Heavy_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 104.0f);
    default m_SuperArmorDamageBase = 104;
    default m_Value = 2334;
    default m_ComparedTo = UItMw_2H_Sword_Heavy_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 53.0f);
}