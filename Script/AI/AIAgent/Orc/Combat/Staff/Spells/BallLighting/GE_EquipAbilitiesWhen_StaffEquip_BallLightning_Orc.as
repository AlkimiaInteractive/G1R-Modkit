class USpellConfigurationContainer_Staff_BallLightning_Orc : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UProjectileSpellConfig_BallLightning_Orc::StaticClass();
    default m_SpellTag = GameplayTag::Spell_BallLightning;
	default m_AnimatorDirectorClass = USpellCastAnimationRechargeableDirector::StaticClass();

    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 3.0f;
}

class USpellActionKeywords_BallLightning_Orc : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_BallLightning;

    default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Charged);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Paralize);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Slow);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_StaffEquip_BallLightning_Orc::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_StaffEquip_BallLightning_Orc : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{

    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_BallLightning::StaticClass(), UGA_CastSpell_RechargeableWithoutTransitions::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_CastSpell_BallLightning_Orc::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_Spell_BallLightning_Orc::StaticClass());
   
}