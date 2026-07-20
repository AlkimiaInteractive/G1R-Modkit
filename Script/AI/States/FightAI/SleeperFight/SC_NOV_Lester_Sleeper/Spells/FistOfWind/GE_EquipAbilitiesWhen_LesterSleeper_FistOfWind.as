class USpellConfigurationContainer_LesterSleeper_FistOfWind : USpellConfigurationContainer_Rune_FistOfWind
{
    default m_SpellConfigClass = UFistOfWindSpellConfig_LesterSleeper::StaticClass();
    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;
}


class USpellActionKeywords_LesterSleeper_FistOfWind : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_FistOfWind;
	default m_Keywords.AddTag(GameplayTag::Item_Range_FrontArea);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_LesterSleeper_FistOfWind::StaticClass();
    
}




class UGE_EquipAbilitiesWhen_LesterSleeper_FistOfWind : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_LesterSleeper_FistOfWind::StaticClass(), EAbilityInputID::Attack);
}
