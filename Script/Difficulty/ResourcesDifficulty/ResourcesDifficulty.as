UCLASS()
class UScriptResourcesDifficultySettings : UResourcesDifficultySettings 
{
    float32 m_DefaultPlayerSellModifier = 0.5f;
    float32 m_DefaultPlayerBuyModifier = 1.0f;

    float GetPlayerSellModifier() { return m_DefaultPlayerSellModifier; }
    float GetPlayerBuyModifier() { return m_DefaultPlayerBuyModifier; }

}