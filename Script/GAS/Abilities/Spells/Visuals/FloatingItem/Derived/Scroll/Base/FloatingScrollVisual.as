UCLASS()
class AFloatingScrollActor_AS : AFloatingItemVisualBase_AS
{
    default m_DebuffEffectGameplayAbility = UGA_FloatingScrollEffect::StaticClass();

    UFUNCTION(BlueprintOverride, Meta=("NoSuperCall"))
    void OnLaunchSpellOnServer_Scriptable()
    {
        ActivateOnLaunchSpellVisuals();   
    }

    UFUNCTION(BlueprintCallable, BlueprintEvent)
    void ActivateOnLaunchSpellVisuals()
    {
        //PlayEffect(GameplayTag::FX_Magic_Scroll_Floating);
    }
}
