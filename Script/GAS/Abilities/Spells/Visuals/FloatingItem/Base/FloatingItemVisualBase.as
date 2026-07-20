UCLASS()
class AFloatingItemVisualBase_AS : AFloatingItemActor
{
    default bNeverApplyTickOptimizations = true;
    
     UFUNCTION(BlueprintOverride)
    void OnLaunchSpellOnServer_Scriptable()
    {
        PlayEffect(GameplayTag::FX_Magic_Rune_Floating);
    }
    
    UFUNCTION(BlueprintOverride)
    void OnCancelSpellOnServer_Scriptable()
    {
        StopEffect(GameplayTag::FX_Magic_Rune_Floating);
    }
    
    UFUNCTION(BlueprintCallable)
    void DoDestroyEffect()
    {
        StopEffect(GameplayTag::FX_Magic_Rune_Floating);
    }
}
