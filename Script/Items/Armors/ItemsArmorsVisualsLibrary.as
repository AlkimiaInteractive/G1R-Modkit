
UCLASS()
class UGur_Armor_H_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuruCorKalom";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Boots = "Boots_01";
    UPROPERTY()
    FString Necklace = "Necklace_01";
    UPROPERTY()
    FString Accessories = "None";
    UPROPERTY()
    FString Poncho = "Poncho_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UGur_Armor_M_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "Guru";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Boots = "Boots_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UNov_Armor_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "NoviceArmor";
    UPROPERTY()
    FString Shirt = "None";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Forearm_L = "None";
    UPROPERTY()
    FString Forearm_R = "None";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Boots = "None";
    UPROPERTY()
    FString Poncho = "None";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Flesh);
}

UCLASS()
class UTpl_Armor_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "TemplarArmor";
    UPROPERTY()
    FString Shirt = "None";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Arms = "None";
    UPROPERTY()
    FString Forearms = "None";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString LegProtections = "None";
    UPROPERTY()
    FString Knees = "None";
    UPROPERTY()
    FString Boots = "Boots_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Flesh);
}

UCLASS()
class UGrd_Armor_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Shoulders = "Shoulders_01";
    UPROPERTY()
    FString Arms = "None";
    UPROPERTY()
    FString Belt = "Belt_02";
    UPROPERTY()
    FString Tassets = "None";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Knees = "None";
    UPROPERTY()
    FString Boots = "Boots_02";
    UPROPERTY()
    FString Bracelet = "None";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UKdf_Armor_H_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "HFireRobe";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UKdf_Armor_L_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "FireRobe";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UStt_Armor_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Forearm_L = "None";
    UPROPERTY()
    FString Forearm_R = "None";
    UPROPERTY()
    FString Hand_L = "None";
    UPROPERTY()
    FString Hand_R = "None";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Boots = "Boots_02";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UKdw_Armor_H_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "HWaterRobe";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UKdw_Armor_L_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "WaterRobe";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UOrg_Armor_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Scarve = "Scarve_01";
    UPROPERTY()
    FString Cape = "None";
    UPROPERTY()
    FString Arms = "None";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Bag = "None";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString LegProtection_L = "None";
    UPROPERTY()
    FString LegProtection_R = "None";
    UPROPERTY()
    FString Knees = "None";
    UPROPERTY()
    FString Boots = "Boots_02";
    UPROPERTY()
    FString Bracelet = "None";
    UPROPERTY()
    FString Fur = "Fur_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class USld_Armor_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Scarve = "None";
    UPROPERTY()
    FString Forearms = "None";
    UPROPERTY()
    FString Belt = "None";
    UPROPERTY()
    FString UnderBelt = "UnderBelt_01";
    UPROPERTY()
    FString Tassets = "None";
    UPROPERTY()
    FString TassetsRear = "None";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString LegProtection_L = "None";
    UPROPERTY()
    FString Knees = "None";
    UPROPERTY()
    FString Boots = "Boots_01";
    UPROPERTY()
    FString Accessories = "None";
    UPROPERTY()
    FString Bracelet = "None";
    UPROPERTY()
    FString Fur = "None";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UCrw_Armor_H_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "CrawlerPlateArmor";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_MineCrawler);
}

UCLASS()
class UDmb_Armor_M_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RobeDark";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UEbr_Armor_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "OreBaronGomez";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Armor = "Armor_01";
    UPROPERTY()
    FString Shoulders = "Shoulders_01";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Boots = "Boots_01";
    UPROPERTY()
    FString Bracelet = "Bracelet_01";
    UPROPERTY()
    FString Fur = "Fur_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class UEbr_Armor_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "OreBaron";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Shoulders = "Shoulders_01";
    UPROPERTY()
    FString Hands = "Hands_01";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Boots = "Boots_01";
    UPROPERTY()
    FString Fur = "Fur_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class UEbr_Armor_M_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "OreBaronBartholo";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Hands = "Hands_01";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Boots = "Boots_01";
    UPROPERTY()
    FString Necklace = "None";
    UPROPERTY()
    FString Accessories = "None";
    UPROPERTY()
    FString Fur = "Fur_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class ULaw_Armor_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "JudgeRobe";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UOre_Armor_H_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "IOreArmor";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Ore);
}

UCLASS()
class UOre_Armor_M_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "AOreArmor";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Ore);
}

UCLASS()
class URyl_Armor_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RoyalGuardArmor";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class USfb_Armor_L_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "Digger";
    UPROPERTY()
    FString Shirt = "Shirt_07";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Forearm_L = "Forearm_L_01";
    UPROPERTY()
    FString Forearm_R = "Forearm_R_01";
    UPROPERTY()
    FString Hand_L = "None";
    UPROPERTY()
    FString Hand_R = "None";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Bag = "None";
    UPROPERTY()
    FString Pants = "Pants_02";
    UPROPERTY()
    FString LegProtection_L = "LegProtection_L_01";
    UPROPERTY()
    FString LegProtection_R = "LegProtection_R_01";
    UPROPERTY()
    FString LegProtections = "None";
    UPROPERTY()
    FString Boot_L = "Boot_L_03";
    UPROPERTY()
    FString Boot_R = "Boot_R_03";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UVlk_Armor_L_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "Digger";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Forearm_L = "Forearm_L_02";
    UPROPERTY()
    FString Forearm_R = "Forearm_R_02";
    UPROPERTY()
    FString Hand_L = "None";
    UPROPERTY()
    FString Hand_R = "None";
    UPROPERTY()
    FString Belt = "Belt_02";
    UPROPERTY()
    FString Bag = "None";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString LegProtection_L = "LegProtection_L_02";
    UPROPERTY()
    FString LegProtection_R = "LegProtection_R_02";
    UPROPERTY()
    FString LegProtections = "None";
    UPROPERTY()
    FString Boot_L = "Boot_L_05";
    UPROPERTY()
    FString Boot_R = "Boot_R_05";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UVlk_Armor_M_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "Digger";
    UPROPERTY()
    FString Shirt = "Shirt_02";
    UPROPERTY()
    FString Armor = "Armor_01";
    UPROPERTY()
    FString Forearm_L = "Forearm_L_03";
    UPROPERTY()
    FString Forearm_R = "Forearm_R_03";
    UPROPERTY()
    FString Hand_L = "Hand_L_01";
    UPROPERTY()
    FString Hand_R = "Hand_R_01";
    UPROPERTY()
    FString Belt = "Belt_03";
    UPROPERTY()
    FString Bag = "None";
    UPROPERTY()
    FString Pants = "Pants_06";
    UPROPERTY()
    FString LegProtection_L = "LegProtection_L_03";
    UPROPERTY()
    FString LegProtection_R = "LegProtection_R_03";
    UPROPERTY()
    FString LegProtections = "LegProtections_01";
    UPROPERTY()
    FString Boot_L = "Boot_L_04";
    UPROPERTY()
    FString Boot_R = "Boot_R_04";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UNH_Armor_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "NH_BaseCloth";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UStt_Armor_Top_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Shirt = "Shirt_02";
    UPROPERTY()
    FString Armor = "Armor_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);

}

UCLASS()
class UStt_Armor_Top_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Shirt = "Shirt_03";
    UPROPERTY()
    FString Armor = "Armor_02";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UStt_Armor_Mid_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Belt = "Belt_02";
}

UCLASS()
class UStt_Armor_Mid_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Belt = "Belt_03";
}

UCLASS()
class UStt_Armor_Bot_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Boots = "Boots_02";
}

UCLASS()
class UStt_Armor_Bot_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Pants = "Pants_02";
    UPROPERTY()
    FString Boots = "Boots_02";
}

UCLASS()
class UStt_Armor_Top_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Shirt = "Shirt_02";
    UPROPERTY()
    FString Armor = "Armor_03";
    UPROPERTY()
    FString Forearm_L = "Forearm_L_01";
    UPROPERTY()
    FString Forearm_R = "Forearm_R_03";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UStt_Armor_Top_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Shirt = "Shirt_03";
    UPROPERTY()
    FString Armor = "Armor_03";
    UPROPERTY()
    FString Forearm_L = "Forearm_L_02";
    UPROPERTY()
    FString Forearm_R = "Forearm_R_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UStt_Armor_Mid_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Hand_L = "Hand_L_04";
    UPROPERTY()
    FString Hand_R = "Hand_R_04";
    UPROPERTY()
    FString Belt = "Belt_02";
}

UCLASS()
class UStt_Armor_Mid_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Hand_L = "Hand_L_03";
    UPROPERTY()
    FString Hand_R = "Hand_R_03";
    UPROPERTY()
    FString Belt = "Belt_03";
}

UCLASS()
class UStt_Armor_Bot_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Boots = "Boots_03";
}

UCLASS()
class UStt_Armor_Bot_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Pants = "Pants_02";
    UPROPERTY()
    FString Boots = "Boots_03";
}

UCLASS()
class UStt_Armor_Top_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Shirt = "Shirt_04";
    UPROPERTY()
    FString Armor = "Armor_03";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UStt_Armor_Top_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Shirt = "Shirt_05";
    UPROPERTY()
    FString Armor = "Armor_03";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UStt_Armor_Mid_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Hands = "Hands_01";
    UPROPERTY()
    FString Belt = "Belt_04";
}

UCLASS()
class UStt_Armor_Mid_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Hands = "Hands_02";
    UPROPERTY()
    FString Belt = "Belt_05";
}

UCLASS()
class UStt_Armor_Bot_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Pants = "Pants_03";
    UPROPERTY()
    FString Boots = "Boots_02";
}

UCLASS()
class UStt_Armor_Bot_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "ShadowArmor";
    UPROPERTY()
    FString Pants = "Pants_03";
    UPROPERTY()
    FString Boots = "Boots_03";
}

UCLASS()
class UGrd_Armor_Top_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Shoulders = "Shoulders_02";
    UPROPERTY()
    FString Arms = "None";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UGrd_Armor_Top_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Shirt = "Shirt_02";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Shoulders = "Shoulders_03";
    UPROPERTY()
    FString Arms = "None";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UGrd_Armor_Mid_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString Tassets = "None";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Bracelet = "Bracelet_01";
}

UCLASS()
class UGrd_Armor_Mid_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Belt = "Belt_02";
    UPROPERTY()
    FString Tassets = "None";
    UPROPERTY()
    FString Skirt = "Skirt_02";
    UPROPERTY()
    FString Bracelet = "Bracelet_02";
}

UCLASS()
class UGrd_Armor_Bot_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Knees = "Knees_02";
    UPROPERTY()
    FString Boots = "Boots_02";
}

UCLASS()
class UGrd_Armor_Bot_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Pants = "Pants_02";
    UPROPERTY()
    FString Knees = "Knees_01";
    UPROPERTY()
    FString Boots = "Boots_01";
}

UCLASS()
class UGrd_Armor_Top_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Shirt = "Shirt_03";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Shoulders = "Shoulders_04";
    UPROPERTY()
    FString Arms = "Arms_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UGrd_Armor_Top_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Shirt = "Shirt_04";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Shoulders = "Shoulders_04";
    UPROPERTY()
    FString Arms = "Arms_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UGrd_Armor_Mid_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Belt = "Belt_03";
    UPROPERTY()
    FString Tassets = "Tassets_02";
    UPROPERTY()
    FString Skirt = "Skirt_01";
    UPROPERTY()
    FString Bracelet = "Bracelet_03";
}

UCLASS()
class UGrd_Armor_Mid_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Belt = "Belt_03";
    UPROPERTY()
    FString Tassets = "Tassets_01";
    UPROPERTY()
    FString Skirt = "Skirt_02";
    UPROPERTY()
    FString Bracelet = "Bracelet_04";
}

UCLASS()
class UGrd_Armor_Bot_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Knees = "Knees_03";
    UPROPERTY()
    FString Boots = "Boots_04";
}

UCLASS()
class UGrd_Armor_Bot_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Pants = "Pants_02";
    UPROPERTY()
    FString Knees = "Knees_03";
    UPROPERTY()
    FString Boots = "Boots_03";
}

UCLASS()
class UGrd_Armor_Top_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Shirt = "Shirt_05";
    UPROPERTY()
    FString Armor = "Armor_01";
    UPROPERTY()
    FString Shoulders = "Shoulders_05";
    UPROPERTY()
    FString Arms = "Arms_02";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class UGrd_Armor_Top_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Shirt = "Shirt_05";
    UPROPERTY()
    FString Armor = "Armor_02";
    UPROPERTY()
    FString Shoulders = "Shoulders_05";
    UPROPERTY()
    FString Arms = "Arms_02";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class UGrd_Armor_Mid_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Belt = "Belt_04";
    UPROPERTY()
    FString Tassets = "Tassets_03";
    UPROPERTY()
    FString Skirt = "None";
    UPROPERTY()
    FString Bracelet = "Bracelet_05";
}

UCLASS()
class UGrd_Armor_Mid_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Belt = "Belt_04";
    UPROPERTY()
    FString Tassets = "Tassets_04";
    UPROPERTY()
    FString Skirt = "None";
    UPROPERTY()
    FString Bracelet = "Bracelet_06";
}

UCLASS()
class UGrd_Armor_Bot_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Pants = "Pants_03";
    UPROPERTY()
    FString Knees = "Knees_04";
    UPROPERTY()
    FString Boots = "Boots_05";
}

UCLASS()
class UGrd_Armor_Bot_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "GuardArmor";
    UPROPERTY()
    FString Pants = "Pants_03";
    UPROPERTY()
    FString Knees = "Knees_04";
    UPROPERTY()
    FString Boots = "Boots_06";
}

UCLASS()
class UOrg_Armor_Top_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Shirt = "Shirt_02";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Scarve = "Scarve_02";
    UPROPERTY()
    FString Cape = "None";
    UPROPERTY()
    FString Arms = "None";
    UPROPERTY()
    FString Fur = "Fur_02";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UOrg_Armor_Top_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Shirt = "Shirt_03";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Scarve = "Scarve_03";
    UPROPERTY()
    FString Cape = "None";
    UPROPERTY()
    FString Arms = "None";
    UPROPERTY()
    FString Fur = "Fur_03";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UOrg_Armor_Mid_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Belt = "Belt_02";
    UPROPERTY()
    FString Bag = "Bag_01";
    UPROPERTY()
    FString Bracelet = "Bracelet_01";
}

UCLASS()
class UOrg_Armor_Mid_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Belt = "Belt_03";
    UPROPERTY()
    FString Bag = "Bag_02";
    UPROPERTY()
    FString Bracelet = "Bracelet_02";
}

UCLASS()
class UOrg_Armor_Bot_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString LegProtection_L = "LegProtection_L_01";
    UPROPERTY()
    FString LegProtection_R = "LegProtection_R_01";
    UPROPERTY()
    FString Knees = "None";
    UPROPERTY()
    FString Boots = "Boots_01";
}

UCLASS()
class UOrg_Armor_Bot_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Pants = "Pants_02";
    UPROPERTY()
    FString LegProtection_L = "LegProtection_L_02";
    UPROPERTY()
    FString LegProtection_R = "LegProtection_R_02";
    UPROPERTY()
    FString Knees = "None";
    UPROPERTY()
    FString Boots = "Boots_02";
}

UCLASS()
class UOrg_Armor_Top_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Shirt = "Shirt_04";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Scarve = "Scarve_05";
    UPROPERTY()
    FString Cape = "Cape_01";
    UPROPERTY()
    FString Arms = "None";
    UPROPERTY()
    FString Fur = "Fur_04";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UOrg_Armor_Top_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Shirt = "Shirt_04";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Scarve = "Scarve_07";
    UPROPERTY()
    FString Cape = "Cape_02";
    UPROPERTY()
    FString Arms = "None";
    UPROPERTY()
    FString Fur = "Fur_05";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UOrg_Armor_Mid_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Belt = "Belt_04";
    UPROPERTY()
    FString Bag = "Bag_03";
    UPROPERTY()
    FString Bracelet = "Bracelet_03";
}

UCLASS()
class UOrg_Armor_Mid_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Belt = "Belt_05";
    UPROPERTY()
    FString Bag = "Bag_04";
    UPROPERTY()
    FString Bracelet = "Bracelet_04";
}

UCLASS()
class UOrg_Armor_Bot_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Pants = "Pants_04";
    UPROPERTY()
    FString LegProtection_L = "None";
    UPROPERTY()
    FString LegProtection_R = "None";
    UPROPERTY()
    FString Knees = "None";
    UPROPERTY()
    FString Boots = "Boots_03";
}

UCLASS()
class UOrg_Armor_Bot_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Pants = "Pants_05";
    UPROPERTY()
    FString LegProtection_L = "None";
    UPROPERTY()
    FString LegProtection_R = "None";
    UPROPERTY()
    FString Knees = "None";
    UPROPERTY()
    FString Boots = "Boots_04";
}

UCLASS()
class UOrg_Armor_Top_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Shirt = "Shirt_05";
    UPROPERTY()
    FString Shoulders = "Shoulders_01";
    UPROPERTY()
    FString Scarve = "Scarve_08";
    UPROPERTY()
    FString Cape = "None";
    UPROPERTY()
    FString Arms = "None";
    UPROPERTY()
    FString Fur = "Fur_06";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UOrg_Armor_Top_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Shirt = "Shirt_05";
    UPROPERTY()
    FString Shoulders = "Shoulders_04";
    UPROPERTY()
    FString Scarve = "Scarve_09";
    UPROPERTY()
    FString Cape = "None";
    UPROPERTY()
    FString Arms = "Arms_01";
    UPROPERTY()
    FString Fur = "Fur_07";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UOrg_Armor_Mid_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Belt = "Belt_06";
    UPROPERTY()
    FString Bag = "Bag_05";
    UPROPERTY()
    FString Bracelet = "Bracelet_05";
}

UCLASS()
class UOrg_Armor_Mid_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Belt = "Belt_07";
    UPROPERTY()
    FString Bag = "Bag_06";
    UPROPERTY()
    FString Bracelet = "Bracelet_06";
}

UCLASS()
class UOrg_Armor_Bot_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Pants = "Pants_07";
    UPROPERTY()
    FString LegProtection_L = "LegProtection_L_03";
    UPROPERTY()
    FString LegProtection_R = "None";
    UPROPERTY()
    FString Knees = "Knees_01";
    UPROPERTY()
    FString Boots = "Boots_05";
}

UCLASS()
class UOrg_Armor_Bot_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "RogueArmor";
    UPROPERTY()
    FString Pants = "Pants_08";
    UPROPERTY()
    FString LegProtection_L = "LegProtection_L_03";
    UPROPERTY()
    FString LegProtection_R = "None";
    UPROPERTY()
    FString Knees = "Knees_01";
    UPROPERTY()
    FString Boots = "Boots_06";
}

UCLASS()
class USld_Armor_Top_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Shirt = "Shirt_02";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Shoulders = "Shoulders_01";
    UPROPERTY()
    FString Scarve = "None";
    UPROPERTY()
    FString Forearms = "Forearms_01";
    UPROPERTY()
    FString Fur = "None";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class USld_Armor_Top_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Shirt = "Shirt_05";
    UPROPERTY()
    FString Armor = "None";
    UPROPERTY()
    FString Shoulders = "Shoulders_01";
    UPROPERTY()
    FString Scarve = "None";
    UPROPERTY()
    FString Forearms = "Forearms_01";
    UPROPERTY()
    FString Fur = "None";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class USld_Armor_Mid_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Belt = "Belt_01";
    UPROPERTY()
    FString UnderBelt = "UnderBelt_01";
    UPROPERTY()
    FString Tassets = "None";
    UPROPERTY()
    FString TassetsRear = "None";
    UPROPERTY()
    FString LegProtection_L = "None";
    UPROPERTY()
    FString Bracelet = "Bracelet_01";
}

UCLASS()
class USld_Armor_Mid_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Belt = "Belt_02";
    UPROPERTY()
    FString UnderBelt = "UnderBelt_02";
    UPROPERTY()
    FString Tassets = "None";
    UPROPERTY()
    FString TassetsRear = "None";
    UPROPERTY()
    FString LegProtection_L = "None";
    UPROPERTY()
    FString Bracelet = "Bracelet_02";
}

UCLASS()
class USld_Armor_Bot_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Pants = "Pants_01";
    UPROPERTY()
    FString Knees = "Knees_01";
    UPROPERTY()
    FString Boots = "Boots_01";
    UPROPERTY()
    FString Accessories = "Accessories_01";
}

UCLASS()
class USld_Armor_Bot_L_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Pants = "Pants_02";
    UPROPERTY()
    FString Knees = "Knees_02";
    UPROPERTY()
    FString Boots = "Boots_02";
    UPROPERTY()
    FString Accessories = "Accessories_01";
}

UCLASS()
class USld_Armor_Top_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Shirt = "Shirt_06";
    UPROPERTY()
    FString Armor = "Armor_01";
    UPROPERTY()
    FString Shoulders = "Shoulders_02";
    UPROPERTY()
    FString Scarve = "None";
    UPROPERTY()
    FString Forearms = "Forearms_02";
    UPROPERTY()
    FString Fur = "Fur_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class USld_Armor_Top_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Shirt = "Shirt_06";
    UPROPERTY()
    FString Armor = "Armor_01";
    UPROPERTY()
    FString Shoulders = "Shoulders_02";
    UPROPERTY()
    FString Scarve = "None";
    UPROPERTY()
    FString Forearms = "Forearms_04";
    UPROPERTY()
    FString Fur = "Fur_02";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class USld_Armor_Mid_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Belt = "Belt_03";
    UPROPERTY()
    FString UnderBelt = "UnderBelt_03";
    UPROPERTY()
    FString Tassets = "None";
    UPROPERTY()
    FString TassetsRear = "None";
    UPROPERTY()
    FString LegProtection_L = "None";
    UPROPERTY()
    FString Bracelet = "Bracelet_03";
}

UCLASS()
class USld_Armor_Mid_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Belt = "Belt_04";
    UPROPERTY()
    FString UnderBelt = "UnderBelt_04";
    UPROPERTY()
    FString Tassets = "None";
    UPROPERTY()
    FString TassetsRear = "None";
    UPROPERTY()
    FString LegProtection_L = "None";
    UPROPERTY()
    FString Bracelet = "Bracelet_04";
}

UCLASS()
class USld_Armor_Bot_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Pants = "Pants_03";
    UPROPERTY()
    FString Knees = "Knees_03";
    UPROPERTY()
    FString Boots = "Boots_03";
    UPROPERTY()
    FString Accessories = "Accessories_02";
}

UCLASS()
class USld_Armor_Bot_M_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Pants = "Pants_04";
    UPROPERTY()
    FString Knees = "Knees_04";
    UPROPERTY()
    FString Boots = "Boots_04";
    UPROPERTY()
    FString Accessories = "Accessories_02";
}

UCLASS()
class USld_Armor_Top_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Shirt = "Shirt_07";
    UPROPERTY()
    FString Armor = "Armor_02";
    UPROPERTY()
    FString Shoulders = "Shoulders_03";
    UPROPERTY()
    FString Scarve = "Scarve_01";
    UPROPERTY()
    FString Forearms = "Forearms_01";
    UPROPERTY()
    FString Fur = "Fur_03";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class USld_Armor_Top_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Shirt = "Shirt_07";
    UPROPERTY()
    FString Armor = "Armor_02";
    UPROPERTY()
    FString Shoulders = "Shoulders_03";
    UPROPERTY()
    FString Scarve = "Scarve_01";
    UPROPERTY()
    FString Forearms = "Forearms_02";
    UPROPERTY()
    FString Fur = "Fur_04";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class USld_Armor_Mid_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Belt = "Belt_05";
    UPROPERTY()
    FString UnderBelt = "UnderBelt_05";
    UPROPERTY()
    FString Tassets = "Tassets_01";
    UPROPERTY()
    FString TassetsRear = "TassetsRear_01";
    UPROPERTY()
    FString LegProtection_L = "LegProtection_L_01";
    UPROPERTY()
    FString Bracelet = "Bracelet_05";
}

UCLASS()
class USld_Armor_Mid_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Belt = "Belt_06";
    UPROPERTY()
    FString UnderBelt = "UnderBelt_06";
    UPROPERTY()
    FString Tassets = "Tassets_01";
    UPROPERTY()
    FString TassetsRear = "TassetsRear_01";
    UPROPERTY()
    FString LegProtection_L = "LegProtection_L_02";
    UPROPERTY()
    FString Bracelet = "Bracelet_06";
}

UCLASS()
class USld_Armor_Bot_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Pants = "Pants_05";
    UPROPERTY()
    FString Knees = "Knees_05";
    UPROPERTY()
    FString Boots = "Boots_05";
    UPROPERTY()
    FString Accessories = "Accessories_03";
}

UCLASS()
class USld_Armor_Bot_H_02_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "MercenaryArmor";
    UPROPERTY()
    FString Pants = "Pants_06";
    UPROPERTY()
    FString Knees = "Knees_06";
    UPROPERTY()
    FString Boots = "Boots_06";
    UPROPERTY()
    FString Accessories = "Accessories_03";
}

UCLASS()
class UNov_Armor_Bot_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "NoviceArmor";
    UPROPERTY()
    FString Boots = "Boots_02";
}

UCLASS()
class UNov_Armor_Top_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "NoviceArmor";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Poncho = "Poncho_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UNov_Armor_Mid_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "NoviceArmor";
    UPROPERTY()
    FString Forearm_L = "Forearm_L_01";
    UPROPERTY()
    FString Forearm_R = "Forearm_R_02";
    UPROPERTY()
    FString Belt = "Belt_04";
    UPROPERTY()
    FString Skirt = "Skirt_04";
    UPROPERTY()
    FString Pants = "Pants_01";
}

UCLASS()
class UNov_Armor_Top_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "NoviceArmor";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Shoulders = "Shoulders_01";
    UPROPERTY()
    FString Poncho = "Poncho_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Fabric);
}

UCLASS()
class UTpl_Armor_Top_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "TemplarArmor";
    UPROPERTY()
    FString Shirt = "None";
    UPROPERTY()
    FString Armor = "Armor_01";
    UPROPERTY()
    FString Shoulders = "None";
    UPROPERTY()
    FString Forearms = "None";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Leather);
}

UCLASS()
class UTpl_Armor_Mid_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "TemplarArmor";
    UPROPERTY()
    FString Arms = "Arms_01";
    UPROPERTY()
    FString Belt = "Belt_01";
}

UCLASS()
class UTpl_Armor_Bot_L_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "TemplarArmor";
    UPROPERTY()
    FString LegProtections = "LegProtections_01";
    UPROPERTY()
    FString Knees = "None";
}

UCLASS()
class UTpl_Armor_Top_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "TemplarArmor";
    UPROPERTY()
    FString Shirt = "None";
    UPROPERTY()
    FString Armor = "Armor_01";
    UPROPERTY()
    FString Shoulders = "Shoulders_01";
    UPROPERTY()
    FString Forearms = "None";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class UTpl_Armor_Mid_M_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "TemplarArmor";
    UPROPERTY()
    FString Arms = "Arms_02";
    UPROPERTY()
    FString Belt = "Belt_02";
}

UCLASS()
class UTpl_Armor_Top_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "TemplarArmor";
    UPROPERTY()
    FString Shirt = "Shirt_01";
    UPROPERTY()
    FString Armor = "Armor_02";
    UPROPERTY()
    FString Shoulders = "Shoulders_01";
    UPROPERTY()
    FString Forearms = "Forearms_01";
    default m_TagsToAdd.AddTag(GameplayTag::ArmorMaterial_Metal);
}

UCLASS()
class UTpl_Armor_Mid_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "TemplarArmor";
    UPROPERTY()
    FString Arms = "Arms_02";
    UPROPERTY()
    FString Belt = "Belt_03";
}

UCLASS()
class UTpl_Armor_Bot_H_01_VisualsDefinition: UArmorVisualsDefinition_Armor
{
    UPROPERTY()
    FString Clothes = "TemplarArmor";
    UPROPERTY()
    FString LegProtections = "LegProtections_01";
    UPROPERTY()
    FString Knees = "Knees_01";
}

