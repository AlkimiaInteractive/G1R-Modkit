UCLASS()
class UIntermediateSwordH1Basic: UIntermediateObjectDefinition
{
	default m_Name = "Intermediate Sword";
	default m_Value = 1;
	default m_Icon = "Apfel2DIcon";
	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItLs_Torchburned_Visual.BP_ItLs_Torchburned_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItLs_Torchburned_World.BP_ItLs_Torchburned_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;
};

UCLASS()
class USwordBladeHot: UIntermediateObjectDefinition
{
	default m_Name = "Sword Blade Hot";
	default m_Value = 1;
	default m_Icon = "Apfel2DIcon";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Smith_Swordbladehot_Visual.BP_ItMi_Smith_Swordbladehot_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Smith_Swordbladehot_World.BP_ItMi_Smith_Swordbladehot_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;
};

UCLASS()
class USwordBlade: UIntermediateObjectDefinition
{
	default m_Name = "Sword Blade";
	default m_Value = 1;
	default m_Icon = "Apfel2DIcon";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Smith_Swordblade_Visual.BP_ItMi_Smith_Swordblade_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Smith_Swordblade_World.BP_ItMi_Smith_Swordblade_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;
};