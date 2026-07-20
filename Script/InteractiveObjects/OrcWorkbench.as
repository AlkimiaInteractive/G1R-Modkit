UCLASS()
class UIO_OrcWorkbench: UDefaultInteractive
{
	default m_Name = "OrcWorkbench";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Workbench;
	default m_Tags.Add("Space.Workbench");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default m_UsableByPlayer = false;
};