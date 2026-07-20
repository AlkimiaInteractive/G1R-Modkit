class USpellConfigurationContainer_SkeletonMageWeapon_SoulHarvest : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UProjectileSpellConfig_SoulHarvest_SkeletonMage::StaticClass();
    default m_SpellTag = GameplayTag::Spell_SoulHarvest;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;
}


class USpellActionKeywords_SkeletonMageWeapon_SoulHarvest : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_SoulHarvest;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Slow);
	default m_Keywords.AddTag(GameplayTag::Item_Range_Long);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_SkeletonMageWeapon_SoulHarvest::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_SkeletonMageWeapon_SoulHarvest : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
	default AddAbility(UGA_CastSpell_SoulHarvest_SkeletonMage::StaticClass(), EAbilityInputID::Attack);
}
