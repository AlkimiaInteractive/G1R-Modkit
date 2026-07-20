UCLASS(Abstract)
class UArmorVisualsDefinition_OrcsBase : UArmorVisualsDefinition
{
    default m_MutableAsset = "MO_OrcF";
    default m_MutableAssetPath = "/Game/Assets/Characters/Orcs/Mutable/Female/";
    default m_PreBakedSKsPath = "/Game/Assets/Characters/Orcs/Prebaked/";

    UPROPERTY()
    FString Body = "None";
    UPROPERTY()
    FString Clothes = "None";
	UPROPERTY()
	FString HairType = "None";
    UPROPERTY()
    FString Hair = "None";

    UPROPERTY()
	FString Accessories_Shaman = "None";
	UPROPERTY()
	FString Skirt_Shaman = "None";
    UPROPERTY()
	FString Boots_Shaman = "None";
    UPROPERTY()
	FString BootsProtections_Shaman = "None";
    UPROPERTY()
	FString Shirt_Shaman = "None";
    UPROPERTY()
	FString UnderShirt_Shaman = "None";
    UPROPERTY()
	FString Armor_Shaman = "None";
    UPROPERTY()
	FString Pants_Shaman = "None";
    UPROPERTY()
	FString Arm_L_Shaman = "None";
    UPROPERTY()
	FString Arm_R_Shaman = "None";
    UPROPERTY()
	FString Bracelet_L_Shaman = "None";
    UPROPERTY()
	FString Bracelet_R_Shaman = "None";
    UPROPERTY()
	FString Forearm_L_Shaman = "None";
    UPROPERTY()
	FString Forearm_R_Shaman = "None";
    UPROPERTY()
	FString LegProtections_Shaman = "None";
    UPROPERTY()
	FString LegProtection_L_Shaman = "None";
    UPROPERTY()
	FString LegProtection_R_Shaman = "None";
     UPROPERTY()
	FString LegProtectionUp_L_Shaman = "None";
    UPROPERTY()
	FString LegProtectionUp_R_Shaman = "None";
     UPROPERTY()
	FString Ropes_L_Shaman = "None";
    UPROPERTY()
	FString Ropes_R_Shaman = "None";
     UPROPERTY()
	FString Metal_L_Shaman = "None";
    UPROPERTY()
	FString Metal_R_Shaman = "None";
	UPROPERTY()
	FString LegAccessories_Shaman = "None";
    UPROPERTY()
	FString Belt_Shaman = "None";
    UPROPERTY()
	FString UnderBelt_Shaman = "None";
    UPROPERTY()
	FString Head_Shaman = "None";
    UPROPERTY()
	FString Earring_L_Shaman = "None";
    UPROPERTY()
	FString Earring_R_Shaman = "None";
    UPROPERTY()
	FString Necklace_Shaman = "None";
    UPROPERTY()
	FString Fur_Shaman = "None";
}

UCLASS(Abstract)
class UArmorVisualsDefinition_MaleOrcs : UArmorVisualsDefinition_OrcsBase
{
    default m_MutableAsset = "MO_OrcM";
    default m_MutableAssetPath = "/Game/Assets/Characters/Orcs/Mutable/Man/";

    UPROPERTY()
	FString Beard = "None";
    UPROPERTY()
    FString FaceHair = "None";

    UPROPERTY()
	FString UnderSkirt_Shaman = "None";
    UPROPERTY()
	FString Hands_Shaman = "None";

    UPROPERTY()
    FString Shirt_Base = "None";
    UPROPERTY()
    FString Belt_Base = "None";
    UPROPERTY()
    FString Pants_Base = "None";
    UPROPERTY()
    FString Arm_L_Base = "None";
    UPROPERTY()
    FString Arm_R_Base = "None";
    UPROPERTY()
	FString LegProtection_L_Base = "None";
	UPROPERTY()
	FString LegProtection_R_Base = "None";
    UPROPERTY()
	FString Forearm_L_Base = "None";
    UPROPERTY()
	FString Forearm_R_Base = "None";
    UPROPERTY()
	FString Necklace_Base = "None";
    UPROPERTY()
	FString Boots_Base = "None";
    UPROPERTY()
	FString Skirt_Base = "None";

    UPROPERTY()
    FString Hands_Slave = "None";
    UPROPERTY()
    FString Skirt_Slave = "None";
    UPROPERTY()
    FString Pants_Slave = "None";
    UPROPERTY()
    FString Boots_Slave = "None";
    UPROPERTY()
    FString Necklace_Slave = "None";
    UPROPERTY()
    FString Chain_Slave = "None";
    UPROPERTY()
    FString ChainWrist_Slave = "None";
    UPROPERTY()
    FString ChainFeet_Slave = "None";
    UPROPERTY()
	FString Forearm_L_Slave = "None";
    UPROPERTY()
	FString Forearm_R_Slave = "None";

    UPROPERTY()
    FString Head_Varrag = "None";
    UPROPERTY()
    FString Shoulders_Varrag = "None";

    UPROPERTY()
    FString UnderBelt_Cook = "None";
    UPROPERTY()
    FString Belt_Cook = "None";
    UPROPERTY()
    FString Pants_Cook = "None";
    UPROPERTY()
    FString Boots_Cook = "None";
    UPROPERTY()
    FString Necklace_Cook = "None";
    UPROPERTY()
    FString Accessories_Cook = "None";
    UPROPERTY()
    FString Shirt_Cook = "None";
    UPROPERTY()
    FString Skirt_Cook = "None";
    UPROPERTY()
    FString Arm_L_Cook = "None";
    UPROPERTY()
    FString Arm_R_Cook = "None";
    UPROPERTY()
	FString Forearm_L_Cook = "None";
    UPROPERTY()
	FString Forearm_R_Cook = "None";

    UPROPERTY()
	FString Skirt_Warrior = "None";
	UPROPERTY()
	FString Shirt_Warrior = "None";
	UPROPERTY()
	FString LegProtection_L_Warrior = "None";
	UPROPERTY()
	FString LegProtection_R_Warrior = "None";
    UPROPERTY()
	FString Armor_Warrior = "None";
    UPROPERTY()
	FString Shoulder_L_Warrior = "None";
    UPROPERTY()
	FString Shoulder_R_Warrior = "None";
    UPROPERTY()
	FString Arms_Warrior = "None";
    UPROPERTY()
	FString Forearm_L_Warrior = "None";
    UPROPERTY()
	FString Forearm_R_Warrior = "None";
    UPROPERTY()
	FString Belt_Warrior = "None";
    UPROPERTY()
	FString UnderBelt_Warrior = "None";
    UPROPERTY()
	FString Tassets_Warrior = "None";
    UPROPERTY()
	FString Pants_Warrior = "None";
    UPROPERTY()
	FString Boots_Warrior = "None";
    UPROPERTY()
	FString Necklace_Warrior = "None";
    UPROPERTY()
	FString Accessories_Warrior = "None";
    UPROPERTY()
	FString Fur_Warrior = "None";

    UPROPERTY()
	FString Necklace_TempleWarrior = "None";
	UPROPERTY()
	FString Shirt_TempleWarrior = "None";
	UPROPERTY()
	FString Belt_TempleWarrior = "None";
	UPROPERTY()
	FString UnderBelt_TempleWarrior = "None";
	UPROPERTY()
	FString Boots_TempleWarrior = "None";
    UPROPERTY()
	FString Head_TempleWarrior = "None";
    UPROPERTY()
	FString Fur_TempleWarrior = "None";
    UPROPERTY()
	FString BootsProtections_TempleWarrior = "None";
    UPROPERTY()
	FString Forearm_L_TempleWarrior = "None";
	UPROPERTY()
    FString Forearm_R_TempleWarrior = "None";
    UPROPERTY()
	FString Accessories_TempleWarrior = "None";
    UPROPERTY()
	FString Tassets_TempleWarrior = "None";
    UPROPERTY()
	FString TassetsRear_TempleWarrior = "None";
    UPROPERTY()
	FString Pants_TempleWarrior = "None";
    UPROPERTY()
	FString Arms_TempleWarrior = "None";
    UPROPERTY()
	FString Knee_L_TempleWarrior = "None";
	UPROPERTY()
    FString Knee_R_TempleWarrior = "None";
    UPROPERTY()
	FString Elbow_L_TempleWarrior = "None";
	UPROPERTY()
    FString Elbow_R_TempleWarrior = "None";

	UPROPERTY()
	FString Head_ClanWarrior = "None";
    UPROPERTY()
	FString Armor_ClanWarrior = "None";
    UPROPERTY()
	FString Arms_ClanWarrior = "None";
    UPROPERTY()
	FString Belt_ClanWarrior = "None";
    UPROPERTY()
	FString UnderBelt_ClanWarrior = "None";
    UPROPERTY()
	FString Tassets_ClanWarrior = "None";
    UPROPERTY()
	FString TassetsRear_ClanWarrior = "None";
    UPROPERTY()
	FString Shirt_ClanWarrior = "None";
    UPROPERTY()
	FString Pants_ClanWarrior = "None";
    UPROPERTY()
	FString Fur_ClanWarrior = "None";
    UPROPERTY()
	FString Necklace_ClanWarrior = "None";
    UPROPERTY()
	FString Boots_ClanWarrior = "None";
	UPROPERTY()
	FString Forearm_L_ClanWarrior = "None";
	UPROPERTY()
    FString Forearm_R_ClanWarrior = "None";
    UPROPERTY()
    FString Shoulder_L_ClanWarrior = "None";
    UPROPERTY()
    FString Shoulder_R_ClanWarrior = "None";
    UPROPERTY()
    FString LegProtection_L_ClanWarrior = "None";
	UPROPERTY()
	FString LegProtection_R_ClanWarrior = "None";

    UPROPERTY()
    FString LegProtection_L_Fighter = "None";
	UPROPERTY()
	FString LegProtection_R_Fighter = "None";
    UPROPERTY()
    FString Shoulder_L_Fighter = "None";
	UPROPERTY()
	FString Shoulder_R_Fighter = "None";
    UPROPERTY()
    FString Arm_L_Fighter = "None";
	UPROPERTY()
	FString Arm_R_Fighter = "None";
    UPROPERTY()
    FString Forearm_L_Fighter = "None";
	UPROPERTY()
	FString Forearm_R_Fighter = "None";
	UPROPERTY()
	FString Shirt_Fighter = "None";
    UPROPERTY()
	FString Pants_Fighter = "None";
    UPROPERTY()
	FString Boots_Fighter = "None";
    UPROPERTY()
	FString Fur_Fighter = "None";	
    UPROPERTY()
	FString Belt_Fighter = "None";	
    UPROPERTY()
	FString UnderBelt_Fighter = "None";	
    UPROPERTY()
	FString Tassets_Fighter = "None";
    UPROPERTY()
	FString Skirt_Fighter = "None";
    UPROPERTY()
	FString Necklace_Fighter = "None";
    UPROPERTY()
	FString Accessories_Fighter = "None";

    UPROPERTY()
	FString Shirt_Scout = "None";
    UPROPERTY()
	FString Skirt_Scout = "None";
    UPROPERTY()
	FString Accessories_Scout = "None";
    UPROPERTY()
	FString Boots_Scout = "None";
    UPROPERTY()
	FString Pants_Scout = "None";
    UPROPERTY()
	FString Belt_Scout = "None";
    UPROPERTY()
	FString Necklace_Scout = "None";
    UPROPERTY()
	FString Arm_L_Scout = "None";
    UPROPERTY()
	FString Arm_R_Scout = "None";
    UPROPERTY()
	FString Forearm_L_Scout = "None";
    UPROPERTY()
	FString Forearm_R_Scout = "None";
    UPROPERTY()
	FString LegProtection_R_Scout = "None";
	UPROPERTY()
    FString LegProtection_L_Scout = "None";

    UPROPERTY()
	FString Shirt_Hunter = "None";
	UPROPERTY()
	FString Skirt_Hunter = "None";
    UPROPERTY()
	FString Arm_L_Hunter = "None";
    UPROPERTY()
	FString Arm_R_Hunter = "None";
    UPROPERTY()
	FString Forearm_L_Hunter = "None";
    UPROPERTY()
	FString Forearm_R_Hunter = "None";
    UPROPERTY()
	FString Belt_Hunter = "None";
    UPROPERTY()
	FString Boots_Hunter = "None";
    UPROPERTY()
	FString Accessories_Hunter = "None";
    UPROPERTY()
	FString Fur_Hunter = "None";
    UPROPERTY()
	FString Necklace_Hunter = "None";
    UPROPERTY()
	FString Pants_Hunter = "None";
    UPROPERTY()
	FString LegProtection_L_Hunter = "None";
    UPROPERTY()
	FString LegProtection_R_Hunter = "None";

    UPROPERTY()
	FString Head_BlackSmith = "None";
    UPROPERTY()
	FString Shirt_BlackSmith = "None";
    UPROPERTY()
	FString Shoulders_BlackSmith = "None";
    UPROPERTY()
	FString Hands_BlackSmith = "None";
    UPROPERTY()
	FString Belt_BlackSmith = "None";
    UPROPERTY()
	FString Skirt_BlackSmith = "None";
    UPROPERTY()
	FString Pants_BlackSmith = "None";
    UPROPERTY()
	FString Boots_BlackSmith = "None";
    UPROPERTY()
	FString Accessories_BlackSmith = "None";

    UPROPERTY()
	FString Head_Drummer = "None";
    UPROPERTY()
	FString Skirt_Drummer = "None";
	UPROPERTY()
	FString Arms_Drummer = "None";
	UPROPERTY()
	FString Forearms_Drummer = "None";
	UPROPERTY()
	FString Belt_Drummer = "None";
	UPROPERTY()
	FString UnderBelt_Drummer = "None";
	UPROPERTY()
	FString Pants_Drummer = "None";
	UPROPERTY()
	FString Boots_Drummer = "None";
	UPROPERTY()
	FString Necklace_Drummer = "None";
	UPROPERTY()
	FString Accessories_Drummer = "None";

    UPROPERTY()
	FString Arms_Dancer = "None";
	UPROPERTY()
	FString Forearms_Dancer = "None";
	UPROPERTY()
	FString Belt_Dancer = "None";
	UPROPERTY()
	FString UnderBelt_Dancer = "None";
    UPROPERTY()
	FString Skirt_Dancer = "None";
    UPROPERTY()
	FString Pants_Dancer = "None";
    UPROPERTY()
	FString Head_Dancer = "None";
	UPROPERTY()
	FString Boots_Dancer = "None";
	UPROPERTY()
	FString Accessories_Dancer = "None";
	UPROPERTY()
	FString Necklace_Dancer = "None";    
}

UCLASS(Abstract)
class UArmorVisualsDefinition_Orcs_Undead : UArmorVisualsDefinition
{
    default m_MutableAsset = "MO_OrcM_Undead";
    default m_MutableAssetPath = "/Game/Assets/Characters/Orcs/Mutable/Man/";
    default m_PreBakedSKsPath = "/Game/Assets/Characters/Orcs/Prebaked/";

    UPROPERTY()
    FString Clothes = "None";
    UPROPERTY()
    FString Body = "None";

    UPROPERTY()
    FString Head_Varrag = "None";
    UPROPERTY()
    FString Shoulders_Varrag = "None";
}