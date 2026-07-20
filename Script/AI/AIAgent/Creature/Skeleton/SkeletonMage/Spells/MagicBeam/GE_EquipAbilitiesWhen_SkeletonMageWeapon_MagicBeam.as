class USpellConfigurationContainer_SkeletonMageWeapon_MagicBeam : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UMagicBeamSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Spell_MagicBeam;
    default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;

    default m_SetStateLockMovementOnCast = false;
    default m_SetStateLockMovementOnSpell = false;
}

class USpellActionKeywords_MagicBeam_SkeletonMage : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_MagicBeam;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Sustained);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_SkeletonMageWeapon_MagicBeam::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_SkeletonMageWeapon_MagicBeam : UGE_EquipAbilitiesWhen_RuneEquip_Base
{

    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_BallLightning::StaticClass(), UGA_CastSpell_RechargeableWithoutTransitions::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_CastSpell_MagicBeam_SkeletonMage::StaticClass(), EAbilityInputID::Attack);   
}