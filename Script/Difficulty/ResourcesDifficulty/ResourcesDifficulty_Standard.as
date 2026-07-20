UCLASS()
class UResourcesDifficultySettings_Standard : UResourcesDifficultySettings 
{
    default m_settingsName = "ui_difficulty_standard";
    default m_uiSortingPriority = 1.0f;

    default m_PlayerBuyModifier = 1.0f;
    default m_PlayerSellModifier = 0.5f;

    default m_RegenTime = 3.0f;
	default m_SurPlusValueModifier = 0.2f;
	default m_OreSpendingThreshold = 0.25f;
	default m_MiniumPurchasePower = 10.0f;
	default m_MaterialsGuaranteedRatio = 0.3f;
	default m_ConsumablesGuaranteedRatio = 0.2f;    
}