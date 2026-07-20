class USpellConfigurationContainer_Repeatable_Base : USpellConfigurationContainer_Scriptable
{
    default m_ShouldRestoreCameraBehaviour = true;
}

class USpellConfigurationContainer_Rune_FireBall : USpellConfigurationContainer_Repeatable_Base
{
    default m_SpellConfigClass = UProjectileSpellConfig_FireBall::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_FireBall;
	default m_AnimatorDirectorClass = USpellCastAnimationRechargeableDirector::StaticClass();
    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;
}

class USpellConfigurationContainer_Scroll_FireBall : USpellConfigurationContainer_Rune_FireBall
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_FireBall;
}

class UGE_EquipAbilitiesWhen_RuneEquip_FireBall : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_FireBall::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_Spell_Fireball::StaticClass());   
}

class UGE_EquipAbilitiesWhen_ScrollEquip_FireBall : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_Scroll_FireBall::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_Spell_Fireball::StaticClass());   
}