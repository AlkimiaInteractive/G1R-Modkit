class USpellConfigurationContainer_MiltenSleeper_Teleport: USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTeleportSpellConfig_MiltenSleeper::StaticClass();
    default m_SpellTag = GameplayTag::Item_Spell_Sleeper_Teleport_Milten;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();//USpellCastAnimatorVariableInSectionDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;

}

class USpellActionKeywords_MiltenSleeper_Teleport : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Item_Spell_Sleeper_Teleport_Milten;
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Teleport);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_MiltenSleeper_Teleport::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_MiltenSleeper_Teleport : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
	default AddAbility(UGA_CastSpell_Teleport_MiltenSleeper::StaticClass(), EAbilityInputID::Attack);
}

