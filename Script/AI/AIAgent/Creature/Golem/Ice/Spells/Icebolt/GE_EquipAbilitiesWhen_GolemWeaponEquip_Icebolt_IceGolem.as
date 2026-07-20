class USpellConfigurationContainer_GolemWeapon_IceBolt_IceGolem : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UProjectileSpellConfig_IceBolt_IceGolem::StaticClass();
    default m_SpellTag = GameplayTag::Spell_IceBolt_IceGolem;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;
}


class USpellActionKeywords_GolemWeapon_IceBolt_IceGolem : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_IceBolt_IceGolem;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Freeze);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Fast);
	default m_Keywords.AddTag(GameplayTag::Item_Range_Long);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_GolemWeaponEquip_IceBolt_IceGolem::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_GolemWeaponEquip_IceBolt_IceGolem : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
	default AddAbility(UGA_CastSpell_IceBolt_IceGolem::StaticClass(), EAbilityInputID::Attack);
}
