class USpellConfigurationContainer_GolemWeapon_IceWave_IceGolem : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UIceWaveSpellConfig_IceGolem::StaticClass();
    default m_SpellTag = GameplayTag::Spell_IceWave_IceGolem;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;

	default m_OnLaunchSpellCastFinishByAnimNotify = true;
}


class USpellActionKeywords_GolemWeapon_IceWave_IceGolem : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_IceWave_IceGolem;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Freeze);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Cone);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_GolemWeaponEquip_IceWave_IceGolem::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_GolemWeaponEquip_IceWave_IceGolem : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
	default AddAbility(UGA_CastSpell_IceWave_IceGolem::StaticClass(), EAbilityInputID::Attack);
}
