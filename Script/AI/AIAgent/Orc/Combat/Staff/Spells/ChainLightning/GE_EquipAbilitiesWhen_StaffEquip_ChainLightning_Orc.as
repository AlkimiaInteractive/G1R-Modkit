class USpellConfigurationContainer_Staff_ChainLightning_Orc : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UChainLightningSpellConfig_Orc::StaticClass();
    default m_SpellTag = GameplayTag::Spell_ChainLightning;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 3.0f;
}

class USpellActionKeywords_ChainLightning_Orc : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_ChainLightning;

	/** ChainLightning Keywords */
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Target_Other);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Sustained);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Paralize);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Chain);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_StaffEquip_ChainLightning_Orc::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_StaffEquip_ChainLightning_Orc : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_ChainLightning::StaticClass(), UGA_CastSpell_ChainLightning::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_CastSpell_ChainLightning_Orc::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_TraceTarget_ChainLightning::StaticClass());
    default AddAbility(UGA_Spell_ChainLightning_Orc::StaticClass());
}

