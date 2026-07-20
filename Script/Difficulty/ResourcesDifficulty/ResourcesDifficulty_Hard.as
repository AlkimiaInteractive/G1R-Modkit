UCLASS()
class UResourcesDifficultySettings_Hard : UResourcesDifficultySettings 
{
    default m_settingsName = "ui_difficulty_hard";
    default m_uiSortingPriority = 2.0f;

    default m_PlayerBuyModifier = 1.0f;
    default m_PlayerSellModifier = 0.4f;

	default m_RegenTime = 5.0f;
	default m_SurPlusValueModifier = 0.2f;
	default m_OreSpendingThreshold = 0.35f;
	default m_MiniumPurchasePower = 10.0f;
	default m_MaterialsGuaranteedRatio = 0.2f;
	default m_ConsumablesGuaranteedRatio = 0.1f;    
}