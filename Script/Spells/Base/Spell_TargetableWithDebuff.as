

UCLASS()
class UTargetableWithDebuffSpellConfig : USpellTraceConfigBase
{
    TSubclassOf<UScriptGameplayEffect> m_DebuffEffect;
}