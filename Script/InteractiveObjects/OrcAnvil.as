UCLASS()
class UIO_OrcAnvil: UDefaultInteractive
{
	default m_Name = "OrcAnvil";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Anvil;
	default m_Tags.Add("Space.Anvil");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
};