
UCLASS()
class UCrw_Armor_H: UBaseArmorDefinition
{
    default m_Name = "Crw_Armor_H";
    default m_Description = "Crw_Armor_H_description";
    default m_Weight = 18;
    default m_Value = 2250;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Crw_Armor_H::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Crw_Armor_H_Visual.BP_Crw_Armor_H_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Crw_Armor_H_World.BP_Crw_Armor_H_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Crw_Armor_H.T_ItemIcon_Crw_Armor_H";
    default m_ArmorVisualDefinition = UCrw_Armor_H_VisualsDefinition::StaticClass();
}

UCLASS()
class UDmb_Armor_M: UBaseArmorDefinition
{
    default m_Name = "Dmb_Armor_M";
    default m_Description = "Dmb_Armor_M_description";
    default m_Weight = 12;
    default m_Value = 3550;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Dmb_Armor_M::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Dmb_Armor_M_Visual.BP_Dmb_Armor_M_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Dmb_Armor_M_World.BP_Dmb_Armor_M_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Dmb_Armor_M.T_ItemIcon_Dmb_Armor_M";
    default m_ArmorVisualDefinition = UDmb_Armor_M_VisualsDefinition::StaticClass();
    default m_EventWhenPickUp = GameplayTag::Message_TunicParticles_End;
    default AddItemSpec(GameplayTag::Guild_Human_DemonSummoner);
}

UCLASS()
class UEbr_Armor_H_01: UBaseArmorDefinition
{
    default m_Name = "Ebr_Armor_H_01";
    default m_Description = "Ebr_Armor_H_01_description";
    default m_Weight = 30;
    default m_Value = 2350;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Ebr_Armor_H_01::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Ebr_Armor_H_01_Visual.BP_Ebr_Armor_H_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Ebr_Armor_H_01_World.BP_Ebr_Armor_H_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Ebr_Armor_H_01.T_ItemIcon_Ebr_Armor_H_01";
    default m_ArmorVisualDefinition = UEbr_Armor_H_01_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_OreBaron);
}

UCLASS()
class UEbr_Armor_H_02: UBaseArmorDefinition
{
    default m_Name = "Ebr_Armor_H_02";
    default m_Description = "Ebr_Armor_H_02_description";
    default m_Weight = 24;
    default m_Value = 2220;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Ebr_Armor_H_02::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Ebr_Armor_H_02_Visual.BP_Ebr_Armor_H_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Ebr_Armor_H_02_World.BP_Ebr_Armor_H_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Ebr_Armor_H_02.T_ItemIcon_Ebr_Armor_H_02";
    default m_ArmorVisualDefinition = UEbr_Armor_H_02_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_OreBaron);
}

UCLASS()
class UEbr_Armor_M: UBaseArmorDefinition
{
    default m_Name = "Ebr_Armor_M";
    default m_Description = "Ebr_Armor_M_description";
    default m_Weight = 8;
    default m_Value = 2010;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Ebr_Armor_M::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Ebr_Armor_M_Visual.BP_Ebr_Armor_M_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Ebr_Armor_M_World.BP_Ebr_Armor_M_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Ebr_Armor_M.T_ItemIcon_Ebr_Armor_M";
    default m_ArmorVisualDefinition = UEbr_Armor_M_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_OreBaron);
}

UCLASS()
class UGrd_Armor: UBaseArmorDefinition
{
    default m_Name = "Grd_Armor";
    default m_Description = "Grd_Armor_description";
    default m_Weight = 6;
    default m_Value = 420;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Grd_Armor::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Grd_Armor_Visual.BP_Grd_Armor_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Grd_Armor_World.BP_Grd_Armor_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Grd_Armor.T_ItemIcon_Grd_Armor";
    default m_UpperBody_Light01_ArmorUpgrade = UGrd_Armor_Top_L_01::StaticClass();
    default m_UpperBody_Light02_ArmorUpgrade = UGrd_Armor_Top_L_02::StaticClass();
    default m_UpperBody_Mid01_ArmorUpgrade = UGrd_Armor_Top_M_01::StaticClass();
    default m_UpperBody_Mid02_ArmorUpgrade = UGrd_Armor_Top_M_02::StaticClass();
    default m_UpperBody_Heavy01_ArmorUpgrade = UGrd_Armor_Top_H_01::StaticClass();
    default m_UpperBody_Heavy02_ArmorUpgrade = UGrd_Armor_Top_H_02::StaticClass();
    default m_MidBody_Light01_ArmorUpgrade = UGrd_Armor_Mid_L_01::StaticClass();
    default m_MidBody_Light02_ArmorUpgrade = UGrd_Armor_Mid_L_02::StaticClass();
    default m_MidBody_Mid01_ArmorUpgrade = UGrd_Armor_Mid_M_01::StaticClass();
    default m_MidBody_Mid02_ArmorUpgrade = UGrd_Armor_Mid_M_02::StaticClass();
    default m_MidBody_Heavy01_ArmorUpgrade = UGrd_Armor_Mid_H_01::StaticClass();
    default m_MidBody_Heavy02_ArmorUpgrade = UGrd_Armor_Mid_H_02::StaticClass();
    default m_LowerBody_Light01_ArmorUpgrade = UGrd_Armor_Bot_L_01::StaticClass();
    default m_LowerBody_Light02_ArmorUpgrade = UGrd_Armor_Bot_L_02::StaticClass();
    default m_LowerBody_Mid01_ArmorUpgrade = UGrd_Armor_Bot_M_01::StaticClass();
    default m_LowerBody_Mid02_ArmorUpgrade = UGrd_Armor_Bot_M_02::StaticClass();
    default m_LowerBody_Heavy01_ArmorUpgrade = UGrd_Armor_Bot_H_01::StaticClass();
    default m_LowerBody_Heavy02_ArmorUpgrade = UGrd_Armor_Bot_H_02::StaticClass();
    default m_ArmorVisualDefinition = UGrd_Armor_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_Guard);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class UGur_Armor_H: UBaseArmorDefinition
{
    default m_Name = "Gur_Armor_H";
    default m_Description = "Gur_Armor_H_description";
    default m_Weight = 12;
    default m_Value = 2300;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Gur_Armor_H::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Gur_Armor_H_Visual.BP_Gur_Armor_H_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Gur_Armor_H_World.BP_Gur_Armor_H_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Gur_Armor_H.T_ItemIcon_Gur_Armor_H";
    default m_ArmorVisualDefinition = UGur_Armor_H_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_SwampCamp_Guru);
}

UCLASS()
class UGur_Armor_M: UBaseArmorDefinition
{
    default m_Name = "Gur_Armor_M";
    default m_Description = "Gur_Armor_M_description";
    default m_Weight = 8;
    default m_Value = 1980;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Gur_Armor_M::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Gur_Armor_M_Visual.BP_Gur_Armor_M_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Gur_Armor_M_World.BP_Gur_Armor_M_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Gur_Armor_M.T_ItemIcon_Gur_Armor_M";
    default m_ArmorVisualDefinition = UGur_Armor_M_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_SwampCamp_Guru);
}

UCLASS()
class UKdf_Armor_H: UBaseArmorDefinition
{
    default m_Name = "Kdf_Armor_H";
    default m_Description = "Kdf_Armor_H_description";
    default m_Weight = 10;
    default m_Value = 1700;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Kdf_Armor_H::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Kdf_Armor_H_Visual.BP_Kdf_Armor_H_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Kdf_Armor_H_World.BP_Kdf_Armor_H_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Kdf_Armor_H.T_ItemIcon_Kdf_Armor_H";
    default m_ArmorVisualDefinition = UKdf_Armor_H_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_FireMage);
    default AddItemSpec(GameplayTag::Conversation_BuyItem_Kdf_Armor_H);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class UKdf_Armor_L: UBaseArmorDefinition
{
    default m_Name = "Kdf_Armor_L";
    default m_Description = "Kdf_Armor_L_description";
    default m_Weight = 8;
    default m_Value = 1300;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Kdf_Armor_L::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Kdf_Armor_L_Visual.BP_Kdf_Armor_L_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Kdf_Armor_L_World.BP_Kdf_Armor_L_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Kdf_Armor_L.T_ItemIcon_Kdf_Armor_L";
    default m_ArmorVisualDefinition = UKdf_Armor_L_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_FireMage);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class UKdw_Armor_H: UBaseArmorDefinition
{
    default m_Name = "Kdw_Armor_H";
    default m_Description = "Kdw_Armor_H_description";
    default m_Weight = 12;
    default m_Value = 2600;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Kdw_Armor_H::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Kdw_Armor_H_Visual.BP_Kdw_Armor_H_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Kdw_Armor_H_World.BP_Kdw_Armor_H_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Kdw_Armor_H.T_ItemIcon_Kdw_Armor_H";
    default m_ArmorVisualDefinition = UKdw_Armor_H_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_NewCamp_WaterMage);
    default AddItemSpec(GameplayTag::Conversation_BuyItem_Kdw_Armor_H);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class UKdw_Armor_L: UBaseArmorDefinition
{
    default m_Name = "Kdw_Armor_L";
    default m_Description = "Kdw_Armor_L_description";
    default m_Weight = 8;
    default m_Value = 2250;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Kdw_Armor_L::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Kdw_Armor_L_Visual.BP_Kdw_Armor_L_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Kdw_Armor_L_World.BP_Kdw_Armor_L_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Kdw_Armor_L.T_ItemIcon_Kdw_Armor_L";
    default m_ArmorVisualDefinition = UKdw_Armor_L_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_NewCamp_WaterMage);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class ULaw_Armor: UBaseArmorDefinition
{
    default m_Name = "Law_Armor";
    default m_Description = "Law_Armor_description";
    default m_Weight = 4;
    default m_Value = 570;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Law_Armor::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Law_Armor_Visual.BP_Law_Armor_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Law_Armor_World.BP_Law_Armor_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Law_Armor.T_ItemIcon_Law_Armor";
    default m_ArmorVisualDefinition = ULaw_Armor_VisualsDefinition::StaticClass();
}

UCLASS()
class UNH_Armor: UBaseArmorDefinition
{
    default m_Name = "NH_Armor";
    default m_Weight = 0;
    default m_Value = 50;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_NH_Armor::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_NH_Armor_Visual.BP_NH_Armor_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_NH_Armor_World.BP_NH_Armor_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_NH_Armor.T_ItemIcon_NH_Armor";
    default m_ArmorVisualDefinition = UNH_Armor_VisualsDefinition::StaticClass();
}

UCLASS()
class UNov_Armor: UBaseArmorDefinition
{
    default m_Name = "Nov_Armor";
    default m_Description = "Nov_Armor_description";
    default m_Weight = 1;
    default m_Value = 300;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Nov_Armor::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Nov_Armor_Visual.BP_Nov_Armor_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Nov_Armor_World.BP_Nov_Armor_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Nov_Armor.T_ItemIcon_Nov_Armor";
    default m_UpperBody_Mid01_ArmorUpgrade = UNov_Armor_Top_M_01::StaticClass();
    default m_UpperBody_Heavy01_ArmorUpgrade = UNov_Armor_Top_H_01::StaticClass();
    default m_MidBody_Mid01_ArmorUpgrade = UNov_Armor_Mid_M_01::StaticClass();
    default m_LowerBody_Light01_ArmorUpgrade = UNov_Armor_Bot_L_01::StaticClass();
    default m_ArmorVisualDefinition = UNov_Armor_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_SwampCamp_Novice);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class UOre_Armor_H: UBaseArmorDefinition
{
    default m_Name = "Ore_Armor_H";
    default m_Description = "Ore_Armor_H_description";
    default m_Weight = 30;
    default m_Value = 3250;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Ore_Armor_H::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Ore_Armor_H_Visual.BP_Ore_Armor_H_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Ore_Armor_H_World.BP_Ore_Armor_H_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Ore_Armor_H.T_ItemIcon_Ore_Armor_H";
    default m_ArmorVisualDefinition = UOre_Armor_H_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
}

UCLASS()
class UOre_Armor_M: UBaseArmorDefinition
{
    default m_Name = "Ore_Armor_M";
    default m_Description = "Ore_Armor_M_description";
    default m_Weight = 30;
    default m_Value = 2900;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Ore_Armor_M::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Ore_Armor_M_Visual.BP_Ore_Armor_M_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Ore_Armor_M_World.BP_Ore_Armor_M_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Ore_Armor_M.T_ItemIcon_Ore_Armor_M";
    default m_ArmorVisualDefinition = UOre_Armor_M_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
}

UCLASS()
class UOrg_Armor: UBaseArmorDefinition
{
    default m_Name = "Org_Armor";
    default m_Description = "Org_Armor_description";
    default m_Weight = 2;
    default m_Value = 360;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Org_Armor::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Org_Armor_Visual.BP_Org_Armor_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Org_Armor_World.BP_Org_Armor_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Org_Armor.T_ItemIcon_Org_Armor";
    default m_UpperBody_Light01_ArmorUpgrade = UOrg_Armor_Top_L_01::StaticClass();
    default m_UpperBody_Light02_ArmorUpgrade = UOrg_Armor_Top_L_02::StaticClass();
    default m_UpperBody_Mid01_ArmorUpgrade = UOrg_Armor_Top_M_01::StaticClass();
    default m_UpperBody_Mid02_ArmorUpgrade = UOrg_Armor_Top_M_02::StaticClass();
    default m_UpperBody_Heavy01_ArmorUpgrade = UOrg_Armor_Top_H_01::StaticClass();
    default m_UpperBody_Heavy02_ArmorUpgrade = UOrg_Armor_Top_H_02::StaticClass();
    default m_MidBody_Light01_ArmorUpgrade = UOrg_Armor_Mid_L_01::StaticClass();
    default m_MidBody_Light02_ArmorUpgrade = UOrg_Armor_Mid_L_02::StaticClass();
    default m_MidBody_Mid01_ArmorUpgrade = UOrg_Armor_Mid_M_01::StaticClass();
    default m_MidBody_Mid02_ArmorUpgrade = UOrg_Armor_Mid_M_02::StaticClass();
    default m_MidBody_Heavy01_ArmorUpgrade = UOrg_Armor_Mid_H_01::StaticClass();
    default m_MidBody_Heavy02_ArmorUpgrade = UOrg_Armor_Mid_H_02::StaticClass();
    default m_LowerBody_Light01_ArmorUpgrade = UOrg_Armor_Bot_L_01::StaticClass();
    default m_LowerBody_Light02_ArmorUpgrade = UOrg_Armor_Bot_L_02::StaticClass();
    default m_LowerBody_Mid01_ArmorUpgrade = UOrg_Armor_Bot_M_01::StaticClass();
    default m_LowerBody_Mid02_ArmorUpgrade = UOrg_Armor_Bot_M_02::StaticClass();
    default m_LowerBody_Heavy01_ArmorUpgrade = UOrg_Armor_Bot_H_01::StaticClass();
    default m_LowerBody_Heavy02_ArmorUpgrade = UOrg_Armor_Bot_H_02::StaticClass();
    default m_ArmorVisualDefinition = UOrg_Armor_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_NewCamp_Rogue);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class URyl_Armor: UBaseArmorDefinition
{
    default m_Name = "Ryl_Armor";
    default m_Description = "Ryl_Armor_description";
    default m_Weight = 11;
    default m_Value = 1380;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Ryl_Armor::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Ryl_Armor_Visual.BP_Ryl_Armor_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Ryl_Armor_World.BP_Ryl_Armor_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Ryl_Armor.T_ItemIcon_Ryl_Armor";
    default m_ArmorVisualDefinition = URyl_Armor_VisualsDefinition::StaticClass();
}

UCLASS()
class USfb_Armor_L: UBaseArmorDefinition
{
    default m_Name = "Sfb_Armor_L";
    default m_Description = "Sfb_Armor_L_description";
    default m_Weight = 2;
    default m_Value = 300;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Sfb_Armor_L::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Sfb_Armor_L_Visual.BP_Sfb_Armor_L_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Sfb_Armor_L_World.BP_Sfb_Armor_L_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Sfb_Armor_L.T_ItemIcon_Sfb_Armor_L";
    default m_ArmorVisualDefinition = USfb_Armor_L_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_NewCamp_Scraper);
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_Digger);
}

UCLASS()
class USld_Armor: UBaseArmorDefinition
{
    default m_Name = "Sld_Armor";
    default m_Description = "Sld_Armor_description";
    default m_Weight = 4;
    default m_Value = 600;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Sld_Armor::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Sld_Armor_Visual.BP_Sld_Armor_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Sld_Armor_World.BP_Sld_Armor_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Sld_Armor.T_ItemIcon_Sld_Armor";
    default m_UpperBody_Light01_ArmorUpgrade = USld_Armor_Top_L_01::StaticClass();
    default m_UpperBody_Light02_ArmorUpgrade = USld_Armor_Top_L_02::StaticClass();
    default m_UpperBody_Mid01_ArmorUpgrade = USld_Armor_Top_M_01::StaticClass();
    default m_UpperBody_Mid02_ArmorUpgrade = USld_Armor_Top_M_02::StaticClass();
    default m_UpperBody_Heavy01_ArmorUpgrade = USld_Armor_Top_H_01::StaticClass();
    default m_UpperBody_Heavy02_ArmorUpgrade = USld_Armor_Top_H_02::StaticClass();
    default m_MidBody_Light01_ArmorUpgrade = USld_Armor_Mid_L_01::StaticClass();
    default m_MidBody_Light02_ArmorUpgrade = USld_Armor_Mid_L_02::StaticClass();
    default m_MidBody_Mid01_ArmorUpgrade = USld_Armor_Mid_M_01::StaticClass();
    default m_MidBody_Mid02_ArmorUpgrade = USld_Armor_Mid_M_02::StaticClass();
    default m_MidBody_Heavy01_ArmorUpgrade = USld_Armor_Mid_H_01::StaticClass();
    default m_MidBody_Heavy02_ArmorUpgrade = USld_Armor_Mid_H_02::StaticClass();
    default m_LowerBody_Light01_ArmorUpgrade = USld_Armor_Bot_L_01::StaticClass();
    default m_LowerBody_Light02_ArmorUpgrade = USld_Armor_Bot_L_02::StaticClass();
    default m_LowerBody_Mid01_ArmorUpgrade = USld_Armor_Bot_M_01::StaticClass();
    default m_LowerBody_Mid02_ArmorUpgrade = USld_Armor_Bot_M_02::StaticClass();
    default m_LowerBody_Heavy01_ArmorUpgrade = USld_Armor_Bot_H_01::StaticClass();
    default m_LowerBody_Heavy02_ArmorUpgrade = USld_Armor_Bot_H_02::StaticClass();
    default m_ArmorVisualDefinition = USld_Armor_VisualsDefinition::StaticClass();    
    default AddItemSpec(GameplayTag::Guild_Human_NewCamp_Mercenary);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class UStt_Armor: UBaseArmorDefinition
{
    default m_Name = "Stt_Armor";
    default m_Description = "Stt_Armor_description";
    default m_Weight = 2;
    default m_Value = 360;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Stt_Armor::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Stt_Armor_Visual.BP_Stt_Armor_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Stt_Armor_World.BP_Stt_Armor_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Stt_Armor.T_ItemIcon_Stt_Armor";
    default m_UpperBody_Light01_ArmorUpgrade = UStt_Armor_Top_L_01::StaticClass();
    default m_UpperBody_Light02_ArmorUpgrade = UStt_Armor_Top_L_02::StaticClass();
    default m_UpperBody_Mid01_ArmorUpgrade = UStt_Armor_Top_M_01::StaticClass();
    default m_UpperBody_Mid02_ArmorUpgrade = UStt_Armor_Top_M_02::StaticClass();
    default m_UpperBody_Heavy01_ArmorUpgrade = UStt_Armor_Top_H_01::StaticClass();
    default m_UpperBody_Heavy02_ArmorUpgrade = UStt_Armor_Top_H_02::StaticClass();
    default m_MidBody_Light01_ArmorUpgrade = UStt_Armor_Mid_L_01::StaticClass();
    default m_MidBody_Light02_ArmorUpgrade = UStt_Armor_Mid_L_02::StaticClass();
    default m_MidBody_Mid01_ArmorUpgrade = UStt_Armor_Mid_M_01::StaticClass();
    default m_MidBody_Mid02_ArmorUpgrade = UStt_Armor_Mid_M_02::StaticClass();
    default m_MidBody_Heavy01_ArmorUpgrade = UStt_Armor_Mid_H_01::StaticClass();
    default m_MidBody_Heavy02_ArmorUpgrade = UStt_Armor_Mid_H_02::StaticClass();
    default m_LowerBody_Light01_ArmorUpgrade = UStt_Armor_Bot_L_01::StaticClass();
    default m_LowerBody_Light02_ArmorUpgrade = UStt_Armor_Bot_L_02::StaticClass();
    default m_LowerBody_Mid01_ArmorUpgrade = UStt_Armor_Bot_M_01::StaticClass();
    default m_LowerBody_Mid02_ArmorUpgrade = UStt_Armor_Bot_M_02::StaticClass();
    default m_LowerBody_Heavy01_ArmorUpgrade = UStt_Armor_Bot_H_01::StaticClass();
    default m_LowerBody_Heavy02_ArmorUpgrade = UStt_Armor_Bot_H_02::StaticClass();
    default m_ArmorVisualDefinition = UStt_Armor_VisualsDefinition::StaticClass();    
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_Shadow);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class UTpl_Armor: UBaseArmorDefinition
{
    default m_Name = "Tpl_Armor";
    default m_Description = "Tpl_Armor_description";
    default m_Weight = 4;
    default m_Value = 600;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Tpl_Armor::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Tpl_Armor_Visual.BP_Tpl_Armor_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Tpl_Armor_World.BP_Tpl_Armor_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Tpl_Armor.T_ItemIcon_Tpl_Armor";
    default m_UpperBody_Light01_ArmorUpgrade = UTpl_Armor_Top_L_01::StaticClass();
    default m_UpperBody_Mid01_ArmorUpgrade = UTpl_Armor_Top_M_01::StaticClass();
    default m_UpperBody_Heavy01_ArmorUpgrade = UTpl_Armor_Top_H_01::StaticClass();
    default m_MidBody_Light01_ArmorUpgrade = UTpl_Armor_Mid_L_01::StaticClass();
    default m_MidBody_Mid01_ArmorUpgrade = UTpl_Armor_Mid_M_01::StaticClass();
    default m_MidBody_Heavy01_ArmorUpgrade = UTpl_Armor_Mid_H_01::StaticClass();
    default m_LowerBody_Light01_ArmorUpgrade = UTpl_Armor_Bot_L_01::StaticClass();
    default m_LowerBody_Heavy01_ArmorUpgrade = UTpl_Armor_Bot_H_01::StaticClass();
    default m_ArmorVisualDefinition = UTpl_Armor_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_SwampCamp_Templar);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

UCLASS()
class UVlk_Armor_L: UBaseArmorDefinition
{
    default m_Name = "Vlk_Armor_L";
    default m_Description = "Vlk_Armor_L_description";
    default m_Weight = 2;
    default m_Value = 300;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Vlk_Armor_L::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Vlk_Armor_L_Visual.BP_Vlk_Armor_L_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Vlk_Armor_L_World.BP_Vlk_Armor_L_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Vlk_Armor_L.T_ItemIcon_Vlk_Armor_L";
    default m_ArmorVisualDefinition = UVlk_Armor_L_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_NewCamp_Scraper);
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_Digger);
}

UCLASS()
class UVlk_Armor_M: UBaseArmorDefinition
{
    default m_Name = "Vlk_Armor_M";
    default m_Description = "Vlk_Armor_M_description";
    default m_Weight = 3;
    default m_Value = 400;
    default m_CanBeSpawned = true;
    default m_OnEquipEffect = UGE_Vlk_Armor_M::StaticClass();
    default m_ItemVisual = n"Blueprint'/Game/Items/Armor/BP_Vlk_Armor_M_Visual.BP_Vlk_Armor_M_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Armor/BP_Vlk_Armor_M_World.BP_Vlk_Armor_M_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Vlk_Armor_M.T_ItemIcon_Vlk_Armor_M";
    default m_ArmorVisualDefinition = UVlk_Armor_M_VisualsDefinition::StaticClass();
    default AddItemSpec(GameplayTag::Guild_Human_NewCamp_Scraper);
    default AddItemSpec(GameplayTag::Guild_Human_OldCamp_Digger);
}

