
class USpellConfigurationContainer_Rune_Firebolt_XardasSleeper : USpellConfigurationContainer_Rune_FireBolt
{
    default m_SpellConfigClass = UProjectileSpellConfig_Firebolt_XardasSleeper::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_FireBolt;
	default m_AnimatorDirectorClass = USpellLaunchAnimationRepeatableDirector::StaticClass();
    
    default m_SetStateLockMovementOnCast = false;
    default m_SetStateLockMovementOnSpell = false;
}

class USpellActionKeywords_Firebolt_XardasSleeper : USpellActionKeywords
{
    // default m_ActionTag = GameplayTag::Spell_BallLightning;
    default m_ActionTag = GameplayTag::Spell_Firebolt;

    default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Combo);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Burn);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Fast);
	default m_Keywords.AddTag(GameplayTag::Item_Range_Long);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_Firebolt_XardasSleeper::StaticClass();
    
}


class UGE_EquipAbilitiesWhen_RuneEquip_Firebolt_XardasSleeper : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    //default AddAbilityWithSpellConfiguration( USpellConfigurationContainer_Rune_FireBolt::StaticClass(), UGA_CastSpell_Repeatable::StaticClass(),  EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_Firebolt_XardasSleeper::StaticClass(),  EAbilityInputID::Attack);
}