class USpellConfigurationContainer_GolemWeapon_BreakFloor_FireGolem : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UBreakFloorSpellConfig_FireGolem::StaticClass();
    default m_SpellTag = GameplayTag::Spell_BreakFloor;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
    default m_SuperArmorResistanceMultiplier = 100.f;

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}

class UGE_EquipAbilitiesWhen_GolemWeapon_BreakFloor_FireGolem : UGE_EquipAbilitiesWhen_RuneEquip_Base
{

    //default AddAbilityWithSpellConfiguration( USpellConfigurationContainer_Rune_FireRain::StaticClass(), UGA_CastSpell_Default::StaticClass(),  EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_BreakFloor_FireGolem::StaticClass(),  EAbilityInputID::Attack);

}


class USpellActionKeywords_GolemWeapon_BreakFloor_FireGolem : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_BreakFloor;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Cone);


    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_GolemWeapon_BreakFloor_FireGolem::StaticClass();
}