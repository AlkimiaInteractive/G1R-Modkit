class USpellConfigurationContainer_Rune_BallLightning : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UProjectileSpellConfig_BallLightning::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_BallLightning;
	default m_AnimatorDirectorClass = USpellCastAnimationRechargeableDirector::StaticClass();
    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;
}

class USpellConfigurationContainer_Scroll_BallLightning : USpellConfigurationContainer_Rune_BallLightning
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_BallLightning;
}

class UGE_EquipAbilitiesWhen_RuneEquip_BallLightning : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_BallLightning::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_Spell_BallLightning::StaticClass());   
}

class UGE_EquipAbilitiesWhen_ScrollEquip_BallLightning : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
   default AddAbility(UGA_CastSpell_Scroll_BallLightning::StaticClass(), EAbilityInputID::Attack );
   default AddAbility(UGA_Spell_BallLightning::StaticClass());
}