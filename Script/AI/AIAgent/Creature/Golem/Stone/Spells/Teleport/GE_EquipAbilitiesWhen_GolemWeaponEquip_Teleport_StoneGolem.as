class USpellConfigurationContainer_GolemWeapon_Teleport_StoneGolem : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTeleportSpellConfig_StoneGolem::StaticClass();
    default m_SpellTag = GameplayTag::Spell_Teleport_StoneGolem;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;
}


class USpellActionKeywords_GolemWeapon_Teleport_StoneGolem : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Teleport_StoneGolem;
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Teleport);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_GolemWeaponEquip_Teleport_StoneGolem::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_GolemWeaponEquip_Teleport_StoneGolem : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
	default AddAbility(UGA_CastSpell_Teleport_StoneGolem::StaticClass(), EAbilityInputID::Attack);
}

