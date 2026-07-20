UCLASS()
class UItMw_1H_Axe_Sickle_01_Trained: UItMw_1H_Axe_Sickle_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 8.0f);
    default m_SuperArmorDamageBase = 8;
    default m_Value = 5;
    default m_ComparedTo = UItMw_1H_Axe_Sickle_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 4.0f);
}

UCLASS()
class UItMw_1H_Axe_Sickle_01_Master: UItMw_1H_Axe_Sickle_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9.0f);
    default m_SuperArmorDamageBase = 9;
    default m_Value = 5;
    default m_ComparedTo = UItMw_1H_Axe_Sickle_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 3.0f);
}

UCLASS()
class UItMw_1H_Axe_Hatchet_01_Trained: UItMw_1H_Axe_Hatchet_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 10.0f);
    default m_SuperArmorDamageBase = 10;
    default m_Value = 7;
    default m_ComparedTo = UItMw_1H_Axe_Hatchet_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 4.0f);
}

UCLASS()
class UItMw_1H_Axe_Hatchet_01_Master: UItMw_1H_Axe_Hatchet_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 11.0f);
    default m_SuperArmorDamageBase = 11;
    default m_Value = 8;
    default m_ComparedTo = UItMw_1H_Axe_Hatchet_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 3.0f);
}

UCLASS()
class UItMw_1H_Axe_Old_01_Trained: UItMw_1H_Axe_Old_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 15.0f);
    default m_SuperArmorDamageBase = 15;
    default m_Value = 14;
    default m_ComparedTo = UItMw_1H_Axe_Old_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 8.0f);
}

UCLASS()
class UItMw_1H_Axe_Old_01_Master: UItMw_1H_Axe_Old_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 16.0f);
    default m_SuperArmorDamageBase = 16;
    default m_Value = 15;
    default m_ComparedTo = UItMw_1H_Axe_Old_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 6.0f);
}

UCLASS()
class UItMw_1H_Axe_01_Trained: UItMw_1H_Axe_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 32.0f);
    default m_SuperArmorDamageBase = 32;
    default m_Value = 149;
    default m_ComparedTo = UItMw_1H_Axe_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 21.0f);
}

UCLASS()
class UItMw_1H_Axe_01_Master: UItMw_1H_Axe_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 35.0f);
    default m_SuperArmorDamageBase = 35;
    default m_Value = 162;
    default m_ComparedTo = UItMw_1H_Axe_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 17.0f);
}

UCLASS()
class UItMw_1H_Axe_02_Trained: UItMw_1H_Axe_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 59.0f);
    default m_SuperArmorDamageBase = 59;
    default m_Value = 464;
    default m_ComparedTo = UItMw_1H_Axe_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 39.0f);
}

UCLASS()
class UItMw_1H_Axe_02_Master: UItMw_1H_Axe_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 64.0f);
    default m_SuperArmorDamageBase = 64;
    default m_Value = 506;
    default m_ComparedTo = UItMw_1H_Axe_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 32.0f);
}

UCLASS()
class UItMw_1H_Mace_Light_01_Trained: UItMw_1H_Mace_Light_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 9.0f);
    default m_SuperArmorDamageBase = 18;
    default m_Value = 6;
    default m_ComparedTo = UItMw_1H_Mace_Light_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 4.0f);
}

UCLASS()
class UItMw_1H_Mace_Light_01_Master: UItMw_1H_Mace_Light_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 10.0f);
    default m_SuperArmorDamageBase = 20;
    default m_Value = 6;
    default m_ComparedTo = UItMw_1H_Mace_Light_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 3.0f);
}

UCLASS()
class UItMw_1H_Mace_Sledgehammer_01_Trained: UItMw_1H_Mace_Sledgehammer_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 11.0f);
    default m_SuperArmorDamageBase = 22;
    default m_Value = 6;
    default m_ComparedTo = UItMw_1H_Mace_Sledgehammer_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 4.0f);
}

UCLASS()
class UItMw_1H_Mace_Sledgehammer_01_Master: UItMw_1H_Mace_Sledgehammer_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 12.0f);
    default m_SuperArmorDamageBase = 24;
    default m_Value = 6;
    default m_ComparedTo = UItMw_1H_Mace_Sledgehammer_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 3.0f);
}

UCLASS()
class UItMw_1H_Mace_01_Trained: UItMw_1H_Mace_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 26.0f);
    default m_SuperArmorDamageBase = 51;
    default m_Value = 87;
    default m_ComparedTo = UItMw_1H_Mace_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 17.0f);
}

UCLASS()
class UItMw_1H_Mace_01_Master: UItMw_1H_Mace_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 28.0f);
    default m_SuperArmorDamageBase = 56;
    default m_Value = 95;
    default m_ComparedTo = UItMw_1H_Mace_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 14.0f);
}

UCLASS()
class UItMw_1H_Mace_02_Trained: UItMw_1H_Mace_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 28.0f);
    default m_SuperArmorDamageBase = 56;
    default m_Value = 107;
    default m_ComparedTo = UItMw_1H_Mace_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 20.0f);
}

UCLASS()
class UItMw_1H_Mace_02_Master: UItMw_1H_Mace_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 30.0f);
    default m_SuperArmorDamageBase = 60;
    default m_Value = 117;
    default m_ComparedTo = UItMw_1H_Mace_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 16.0f);
}

UCLASS()
class UItMw_1H_Mace_03_Trained: UItMw_1H_Mace_03
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 29.0f);
    default m_SuperArmorDamageBase = 58;
    default m_Value = 117;
    default m_ComparedTo = UItMw_1H_Mace_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 19.0f);
}

UCLASS()
class UItMw_1H_Mace_03_Master: UItMw_1H_Mace_03
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 32.0f);
    default m_SuperArmorDamageBase = 63;
    default m_Value = 128;
    default m_ComparedTo = UItMw_1H_Mace_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 15.0f);
}

UCLASS()
class UItMw_1H_Mace_04_Trained: UItMw_1H_Mace_04
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 32.0f);
    default m_SuperArmorDamageBase = 64;
    default m_Value = 149;
    default m_ComparedTo = UItMw_1H_Mace_04::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 24.0f);
}

UCLASS()
class UItMw_1H_Mace_04_Master: UItMw_1H_Mace_04
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 35.0f);
    default m_SuperArmorDamageBase = 70;
    default m_Value = 162;
    default m_ComparedTo = UItMw_1H_Mace_04::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 19.0f);
}

UCLASS()
class UItMw_1H_Mace_War_01_Trained: UItMw_1H_Mace_War_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 39.0f);
    default m_SuperArmorDamageBase = 77;
    default m_Value = 217;
    default m_ComparedTo = UItMw_1H_Mace_War_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 25.0f);
}

UCLASS()
class UItMw_1H_Mace_War_01_Master: UItMw_1H_Mace_War_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 42.0f);
    default m_SuperArmorDamageBase = 84;
    default m_Value = 237;
    default m_ComparedTo = UItMw_1H_Mace_War_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 20.0f);
}

UCLASS()
class UItMw_1H_Mace_War_02_Trained: UItMw_1H_Mace_War_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 40.0f);
    default m_SuperArmorDamageBase = 80;
    default m_Value = 229;
    default m_ComparedTo = UItMw_1H_Mace_War_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 26.0f);
}

UCLASS()
class UItMw_1H_Mace_War_02_Master: UItMw_1H_Mace_War_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 44.0f);
    default m_SuperArmorDamageBase = 87;
    default m_Value = 250;
    default m_ComparedTo = UItMw_1H_Mace_War_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 21.0f);
}

UCLASS()
class UItMw_1H_Mace_War_03_Trained: UItMw_1H_Mace_War_03
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 41.0f);
    default m_SuperArmorDamageBase = 82;
    default m_Value = 243;
    default m_ComparedTo = UItMw_1H_Mace_War_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 26.0f);
}

UCLASS()
class UItMw_1H_Mace_War_03_Master: UItMw_1H_Mace_War_03
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 45.0f);
    default m_SuperArmorDamageBase = 89;
    default m_Value = 264;
    default m_ComparedTo = UItMw_1H_Mace_War_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 21.0f);
}

UCLASS()
class UItMw_1H_Mace_Warhammer_02_Trained: UItMw_1H_Mace_Warhammer_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 57.0f);
    default m_SuperArmorDamageBase = 113;
    default m_Value = 433;
    default m_ComparedTo = UItMw_1H_Mace_Warhammer_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 39.0f);
}

UCLASS()
class UItMw_1H_Mace_Warhammer_02_Master: UItMw_1H_Mace_Warhammer_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 62.0f);
    default m_SuperArmorDamageBase = 123;
    default m_Value = 472;
    default m_ComparedTo = UItMw_1H_Mace_Warhammer_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 32.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_01_Trained: UItMw_1H_Sword_Short_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 14.0f);
    default m_SuperArmorDamageBase = 14;
    default m_Value = 27;
    default m_ComparedTo = UItMw_1H_Sword_Short_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 7.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_01_Master: UItMw_1H_Sword_Short_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 15.0f);
    default m_SuperArmorDamageBase = 15;
    default m_Value = 29;
    default m_ComparedTo = UItMw_1H_Sword_Short_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 6.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_02_Trained: UItMw_1H_Sword_Short_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 16.0f);
    default m_SuperArmorDamageBase = 16;
    default m_Value = 36;
    default m_ComparedTo = UItMw_1H_Sword_Short_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 9.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_02_Master: UItMw_1H_Sword_Short_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 17.0f);
    default m_SuperArmorDamageBase = 17;
    default m_Value = 39;
    default m_ComparedTo = UItMw_1H_Sword_Short_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 7.0f);
}

UCLASS()
class UItMw_1H_Sword_Scythe_01_Trained: UItMw_1H_Sword_Scythe_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 17.0f);
    default m_SuperArmorDamageBase = 17;
    default m_Value = 20;
    default m_ComparedTo = UItMw_1H_Sword_Scythe_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 9.0f);
}

UCLASS()
class UItMw_1H_Sword_Scythe_01_Master: UItMw_1H_Sword_Scythe_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 18.0f);
    default m_SuperArmorDamageBase = 18;
    default m_Value = 22;
    default m_ComparedTo = UItMw_1H_Sword_Scythe_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 7.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_03_Trained: UItMw_1H_Sword_Short_03
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 24.0f);
    default m_SuperArmorDamageBase = 24;
    default m_Value = 66;
    default m_ComparedTo = UItMw_1H_Sword_Short_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 13.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_03_Master: UItMw_1H_Sword_Short_03
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 26.0f);
    default m_SuperArmorDamageBase = 26;
    default m_Value = 72;
    default m_ComparedTo = UItMw_1H_Sword_Short_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 11.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_04_Trained: UItMw_1H_Sword_Short_04
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 20.0f);
    default m_SuperArmorDamageBase = 20;
    default m_Value = 42;
    default m_ComparedTo = UItMw_1H_Sword_Short_04::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 13.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_04_Master: UItMw_1H_Sword_Short_04
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 22.0f);
    default m_SuperArmorDamageBase = 22;
    default m_Value = 46;
    default m_ComparedTo = UItMw_1H_Sword_Short_04::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 11.0f);
}

UCLASS()
class UItMw_1H_Sword_01_Trained: UItMw_1H_Sword_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 19.0f);
    default m_SuperArmorDamageBase = 19;
    default m_Value = 35;
    default m_ComparedTo = UItMw_1H_Sword_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 13.0f);
}

UCLASS()
class UItMw_1H_Sword_01_Master: UItMw_1H_Sword_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 21.0f);
    default m_SuperArmorDamageBase = 21;
    default m_Value = 38;
    default m_ComparedTo = UItMw_1H_Sword_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 10.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_05_Trained: UItMw_1H_Sword_Short_05
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 22.0f);
    default m_SuperArmorDamageBase = 22;
    default m_Value = 60;
    default m_ComparedTo = UItMw_1H_Sword_Short_05::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 15.0f);
}

UCLASS()
class UItMw_1H_Sword_Short_05_Master: UItMw_1H_Sword_Short_05
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 24.0f);
    default m_SuperArmorDamageBase = 24;
    default m_Value = 65;
    default m_ComparedTo = UItMw_1H_Sword_Short_05::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 12.0f);
}

UCLASS()
class UItMw_1H_Sword_02_Trained: UItMw_1H_Sword_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 33.0f);
    default m_SuperArmorDamageBase = 33;
    default m_Value = 160;
    default m_ComparedTo = UItMw_1H_Sword_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 18.0f);
}

UCLASS()
class UItMw_1H_Sword_02_Master: UItMw_1H_Sword_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 36.0f);
    default m_SuperArmorDamageBase = 36;
    default m_Value = 174;
    default m_ComparedTo = UItMw_1H_Sword_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 15.0f);
}

UCLASS()
class UItMw_1H_Sword_03_Trained: UItMw_1H_Sword_03
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 36.0f);
    default m_SuperArmorDamageBase = 36;
    default m_Value = 182;
    default m_ComparedTo = UItMw_1H_Sword_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 20.0f);
}

UCLASS()
class UItMw_1H_Sword_03_Master: UItMw_1H_Sword_03
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 39.0f);
    default m_SuperArmorDamageBase = 39;
    default m_Value = 198;
    default m_ComparedTo = UItMw_1H_Sword_03::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 16.0f);
}

UCLASS()
class UItMw_1H_Sword_04_Trained: UItMw_1H_Sword_04
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 37.0f);
    default m_SuperArmorDamageBase = 37;
    default m_Value = 194;
    default m_ComparedTo = UItMw_1H_Sword_04::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 21.0f);
}

UCLASS()
class UItMw_1H_Sword_04_Master: UItMw_1H_Sword_04
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 40.0f);
    default m_SuperArmorDamageBase = 40;
    default m_Value = 212;
    default m_ComparedTo = UItMw_1H_Sword_04::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 17.0f);
}

UCLASS()
class UItMw_1H_Sword_05_Trained: UItMw_1H_Sword_05
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 38.0f);
    default m_SuperArmorDamageBase = 38;
    default m_Value = 205;
    default m_ComparedTo = UItMw_1H_Sword_05::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 22.0f);
}

UCLASS()
class UItMw_1H_Sword_05_Master: UItMw_1H_Sword_05
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 41.0f);
    default m_SuperArmorDamageBase = 41;
    default m_Value = 224;
    default m_ComparedTo = UItMw_1H_Sword_05::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 18.0f);
}

UCLASS()
class UItMw_1H_Sword_Long_01_Trained: UItMw_1H_Sword_Long_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 44.0f);
    default m_SuperArmorDamageBase = 44;
    default m_Value = 280;
    default m_ComparedTo = UItMw_1H_Sword_Long_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 27.0f);
}

UCLASS()
class UItMw_1H_Sword_Long_01_Master: UItMw_1H_Sword_Long_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 48.0f);
    default m_SuperArmorDamageBase = 48;
    default m_Value = 305;
    default m_ComparedTo = UItMw_1H_Sword_Long_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 22.0f);
}

UCLASS()
class UItMw_1H_Sword_Broad_01_Trained: UItMw_1H_Sword_Broad_01
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 61.0f);
    default m_SuperArmorDamageBase = 61;
    default m_Value = 493;
    default m_ComparedTo = UItMw_1H_Sword_Broad_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 41.0f);
}

UCLASS()
class UItMw_1H_Sword_Broad_01_Master: UItMw_1H_Sword_Broad_01
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 66.0f);
    default m_SuperArmorDamageBase = 66;
    default m_Value = 538;
    default m_ComparedTo = UItMw_1H_Sword_Broad_01::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 33.0f);
}

UCLASS()
class UItMw_1H_Sword_Broad_02_Trained: UItMw_1H_Sword_Broad_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 63.0f);
    default m_SuperArmorDamageBase = 63;
    default m_Value = 525;
    default m_ComparedTo = UItMw_1H_Sword_Broad_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 43.0f);
}

UCLASS()
class UItMw_1H_Sword_Broad_02_Master: UItMw_1H_Sword_Broad_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 69.0f);
    default m_SuperArmorDamageBase = 69;
    default m_Value = 573;
    default m_ComparedTo = UItMw_1H_Sword_Broad_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 35.0f);
}

UCLASS()
class UItMw_1H_Sword_Bastard_02_Trained: UItMw_1H_Sword_Bastard_02
{
    default m_Description = "TrainedWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 71.0f);
    default m_SuperArmorDamageBase = 71;
    default m_Value = 638;
    default m_ComparedTo = UItMw_1H_Sword_Bastard_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 47.0f);
}

UCLASS()
class UItMw_1H_Sword_Bastard_02_Master: UItMw_1H_Sword_Bastard_02
{
    default m_Description = "MasterWeaponCraft";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 77.0f);
    default m_SuperArmorDamageBase = 77;
    default m_Value = 696;
    default m_ComparedTo = UItMw_1H_Sword_Bastard_02::StaticClass();
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 38.0f);
}