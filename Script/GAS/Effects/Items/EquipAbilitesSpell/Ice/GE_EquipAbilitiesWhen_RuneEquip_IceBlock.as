class USpellConfigurationContainer_Rune_IceBlock : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UIceBlockSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_IceBlock;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}

class USpellConfigurationContainer_Scroll_IceBlock : USpellConfigurationContainer_Rune_IceBlock
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_IceBlock;
}

class UGE_EquipAbilitiesWhen_RuneEquip_IceBlock : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_IceBlock::StaticClass(), EAbilityInputID::Attack);
}

class UGE_EquipAbilitiesWhen_ScrollEquip_IceBlock : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_Scroll_IceBlock::StaticClass(), EAbilityInputID::Attack);
}