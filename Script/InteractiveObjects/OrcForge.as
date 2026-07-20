UCLASS()
class UIO_OrcForge: UDefaultInteractive
{
	default m_Name = "OrcForge";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_OrcForge;
	default m_Tags.Add("Space.Forge");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default m_ExtraTags.Add(n"NoRecipesNeeded");
};