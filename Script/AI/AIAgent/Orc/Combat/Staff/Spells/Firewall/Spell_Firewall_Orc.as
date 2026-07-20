
UCLASS()
class UFirewallSpellConfig_Orc : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(-1.f, 0.25f, .0f, UGA_Spell_Firewall_Orc::StaticClass());

    // UPROPERTY(BlueprintReadWrite)
    // float m_LifeSpan = 300.f;
    // UPROPERTY(BlueprintReadWrite)
    // float m_RotationVelocity = 5.f;
    // UPROPERTY(BlueprintReadWrite)
    // float m_HeightOffset = 120.f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Fire;
}