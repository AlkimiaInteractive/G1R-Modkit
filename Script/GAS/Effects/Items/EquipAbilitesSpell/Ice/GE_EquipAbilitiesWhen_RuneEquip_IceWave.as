class USpellConfigurationContainer_Rune_IceWave : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UIceWaveSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_IceWave;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}

class USpellConfigurationContainer_Scroll_IceWave : USpellConfigurationContainer_Rune_IceWave
{
   default m_SpellTag = GameplayTag::Item_Weapon_Scroll_IceWave;
}

class UGE_EquipAbilitiesWhen_RuneEquip_IceWave : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
  default AddAbility(UGA_CastSpell_IceWave::StaticClass(), EAbilityInputID::Attack);
}

class UGE_EquipAbilitiesWhen_ScrollEquip_IceWave : UGE_EquipAbilitiesWhen_ScrollEquip_Base
{
  default AddAbility(UGA_CastSpell_Scroll_IceWave::StaticClass(), EAbilityInputID::Attack);
}