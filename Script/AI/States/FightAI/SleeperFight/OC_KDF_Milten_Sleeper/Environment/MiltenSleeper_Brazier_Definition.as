UCLASS()
class UMiltenSleeper_Brazier_Definition : UGothicBaseConfig
{    
    UPROPERTY()
    TSubclassOf<UGameplayEffect> m_DamageGameplayEffect = UGE_Brazier_Damage::StaticClass();
}