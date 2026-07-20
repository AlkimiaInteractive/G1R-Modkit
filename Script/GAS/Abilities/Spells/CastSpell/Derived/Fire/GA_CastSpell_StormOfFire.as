class UGA_CastSpell_StormOfFire : UGA_CastSpell_ChargeByDuration
{
    //@DE - Added here to improve performance with asset preload.
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_StormOfFire.BP_StormOfFire_C'";
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_StormOfFire::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable()
    {
        return false;
    }
}

class UGA_CastSpell_Scroll_StormOfFire : UGA_CastSpell_StormOfFire
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_StormOfFire::StaticClass();
}