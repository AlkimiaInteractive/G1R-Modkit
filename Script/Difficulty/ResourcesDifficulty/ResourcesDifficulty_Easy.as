UCLASS()
class UResourcesDifficultySettings_Easy : UResourcesDifficultySettings 
{
    default m_settingsName = "ui_difficulty_easy";
    default m_uiSortingPriority = 0.0f;

    default m_PlayerBuyModifier = 1.0f;
    default m_PlayerSellModifier = 0.75f;

	default m_RegenTime = 2.0f;
	default m_SurPlusValueModifier = 0.5f;
	default m_OreSpendingThreshold = 0.15f;
	default m_MiniumPurchasePower = 10.0f;
	default m_MaterialsGuaranteedRatio = 0.3f;
	default m_ConsumablesGuaranteedRatio = 0.2f;
}