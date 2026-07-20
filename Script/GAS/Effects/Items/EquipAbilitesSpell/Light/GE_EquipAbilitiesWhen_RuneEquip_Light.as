class USpellConfigurationContainer_Rune_Light : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = ULightSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Light;
    default m_SpellCancelTag = GameplayTag::Item_Weapon_Rune_Light_Cancel;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    default m_SetStateLockMovementOnCast = false;
    default m_SetStateLockMovementOnSpell = false;
}

class USpellConfigurationContainer_Scroll_Light : USpellConfigurationContainer_Rune_Light
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Light;
    default m_SpellCancelTag = GameplayTag::Item_Weapon_Scroll_Light_Cancel;
}

class UGE_EquipAbilitiesWhen_RuneEquip_Light : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
   default AddAbility(UGA_CastSpell_Light::StaticClass(), EAbilityInputID::Attack);
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Light : UGE_EquipAbilitiesWhen_ScrollEquip_Base
{
    default AddAbility(UGA_CastSpell_Scroll_Light::StaticClass(), EAbilityInputID::Attack);
}
