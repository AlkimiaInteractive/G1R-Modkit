
UCLASS()
class UHealSpellConfig : UTargetableWithDebuffSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::FocusedOrCaster; 
    default m_SpellManaUsage = ESpellManaUsage::Continuous;
    default AddSpellLevel(2.f, 0.1, 1.0f, UGA_Spell_Heal::StaticClass());

    default m_DebuffEffect = UGE_Heal::StaticClass();

    //Distance to trace the target
    default m_AreaRange = 1500.f;
    //Radius of the detection cylinder 
    default m_TraceRadius = 5.f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Mind;

    UPROPERTY()
    float32 m_UndeadManaCostSeconds = 2.f;

    UPROPERTY()
    TMap<FGameplayTag, float> m_HealAmountByMagicCircle;

	default m_HealAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Untrained, 4);
	default m_HealAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Amateur, 4);
	default m_HealAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_First, 4);
	default m_HealAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Second, 6);
	default m_HealAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Third, 10);
	default m_HealAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Fourth, 15);
	default m_HealAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Fifth, 20);
	default m_HealAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Sixth, 30);

    UPROPERTY()
    TMap<FGameplayTag, float> m_UndeadHealDamageAmountByMagicCircle;

	default m_UndeadHealDamageAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Untrained, 1);
	default m_UndeadHealDamageAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Amateur, 3);
	default m_UndeadHealDamageAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_First, 4);
	default m_UndeadHealDamageAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Second, 6);
	default m_UndeadHealDamageAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Third, 8);
	default m_UndeadHealDamageAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Fourth, 10);
	default m_UndeadHealDamageAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Fifth, 12);
	default m_UndeadHealDamageAmountByMagicCircle.Add(GameplayTag::Skill_Mage_Circle_Sixth, 15);
    
}