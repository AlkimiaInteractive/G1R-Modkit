UCLASS()
class UIO_OrcWhetstone: UDefaultInteractive
{
	default m_Name = "OrcWhetStone";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_OrcWhetstone;
	default m_Tags.Add("Space.WhetStone");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default m_UsableByPlayer = true;
};