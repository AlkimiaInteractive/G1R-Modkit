UCLASS()
class UCharacterDefinition_UL_Wolf_Cohsel : UCharacterDefinition_Creature_Wolf
{
	default m_UniqueName = n"Dandy";

	default m_Species = GameplayTag::Species_Creature_Wolf_Cohsel;
	default m_AbilitiesEffect = UGE_Wolf_AI_Cohsel::StaticClass();
}