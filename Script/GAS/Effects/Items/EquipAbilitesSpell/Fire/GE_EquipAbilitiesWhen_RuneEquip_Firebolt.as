
class USpellConfigurationContainer_Rune_FireBolt : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UProjectileSpellConfig_FireBolt::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_FireBolt;
	default m_AnimatorDirectorClass = USpellLaunchAnimationRepeatableDirector::StaticClass();
    
    default m_SetStateLockMovementOnCast = false;
    default m_SetStateLockMovementOnSpell = false;
}

class USpellConfigurationContainer_Scroll_Firebolt : USpellConfigurationContainer_Rune_FireBolt
{
     default m_SpellTag = GameplayTag::Item_Weapon_Scroll_FireBolt;
}


class UGE_EquipAbilitiesWhen_RuneEquip_FireBolt : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    //default AddAbilityWithSpellConfiguration( USpellConfigurationContainer_Rune_FireBolt::StaticClass(), UGA_CastSpell_Repeatable::StaticClass(),  EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_Firebolt::StaticClass(),  EAbilityInputID::Attack);
}

class UGE_EquipAbilitiesWhen_ScrollEquip_FireBolt : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
     default AddAbility(UGA_CastSpell_Scroll_Firebolt::StaticClass(), EAbilityInputID::Attack);
    
}