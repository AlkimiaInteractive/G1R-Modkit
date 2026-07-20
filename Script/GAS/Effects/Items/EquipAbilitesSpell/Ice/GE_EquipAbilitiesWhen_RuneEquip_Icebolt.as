class USpellConfigurationContainer_Rune_IceBolt : USpellConfigurationContainer_Repeatable_Base
{
    default m_SpellConfigClass = UProjectileSpellConfig_IceBolt::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_IceBolt;
	default m_AnimatorDirectorClass = USpellLaunchAnimationRepeatableDirector::StaticClass();

    default m_SetStateLockMovementOnCast = false;
    default m_SetStateLockMovementOnSpell = false;
}

class USpellConfigurationContainer_Scroll_IceBolt : USpellConfigurationContainer_Rune_IceBolt
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_IceBolt;
}

class UGE_EquipAbilitiesWhen_RuneEquip_IceBolt : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_IceBolt::StaticClass(), EAbilityInputID::Attack);
}

class UGE_EquipAbilitiesWhen_ScrollEquip_IceBolt : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_Scroll_IceBolt::StaticClass(), EAbilityInputID::Attack);
}