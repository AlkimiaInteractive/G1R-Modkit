class USpellConfigurationContainer_Staff_Pyrokinesis_Orc : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UPyrokinesisSpellConfig_Orc::StaticClass();
    default m_SpellTag = GameplayTag::Spell_Pyrokinesis;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
    default m_SuperArmorResistanceMultiplier = 3.0f;
}

class USpellActionKeywords_Pyrokinesis_Orc : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Pyrokinesis;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Sustained);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Target_Other);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Slow);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_StaffEquip_Pyrokinesis_Orc::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_StaffEquip_Pyrokinesis_Orc : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{

    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_BallLightning::StaticClass(), UGA_CastSpell_RechargeableWithoutTransitions::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_CastSpell_Pyrokinesis_Orc::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_TraceTarget_Pyrokinesis::StaticClass());
    default AddAbility(UGA_Spell_Pyrokinesis_Orc::StaticClass());
   
}