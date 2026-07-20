class USpellConfigurationContainer_DiegoSleeper_Teleport: USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTeleportSpellConfig_DiegoSleeper::StaticClass();
    default m_SpellTag = GameplayTag::Item_Spell_Sleeper_Teleport_Diego;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();//USpellCastAnimatorVariableInSectionDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;

}

class USpellConfigurationContainer_DiegoSleeper_Teleport_Bow: USpellConfigurationContainer_DiegoSleeper_Teleport
{
    default m_SpellTag = GameplayTag::Item_Spell_Sleeper_Teleport_Diego_Bow;
}

class USpellConfigurationContainer_DiegoSleeper_Teleport_Sword: USpellConfigurationContainer_DiegoSleeper_Teleport
{
    default m_SpellTag = GameplayTag::Item_Spell_Sleeper_Teleport_Diego_Sword;
}


class USpellActionKeywords_DiegoSleeper_Teleport : USpellActionKeywords
{
    //default m_ActionTag = GameplayTag::Spell_Sleeper_Teleport_Diego;
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Teleport);
    
}

class USpellActionKeywords_DiegoSleeper_Teleport_Bow : USpellActionKeywords_DiegoSleeper_Teleport
{
    default m_ActionTag = GameplayTag::Item_Spell_Sleeper_Teleport_Diego_Bow;
	default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_DiegoSleeper_Teleport_Bow::StaticClass();
    
}

class USpellActionKeywords_DiegoSleeper_Teleport_Sword : USpellActionKeywords_DiegoSleeper_Teleport
{
    default m_ActionTag = GameplayTag::Item_Spell_Sleeper_Teleport_Diego_Sword;
	default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_DiegoSleeper_Teleport_Sword::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_DiegoSleeper_Teleport_Bow : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
	default AddAbility(UGA_CastSpell_Teleport_DiegoSleeper_Bow::StaticClass(), EAbilityInputID::Attack);
}

class UGE_EquipAbilitiesWhen_DiegoSleeper_Teleport_Sword : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
	default AddAbility(UGA_CastSpell_Teleport_DiegoSleeper_Sword::StaticClass(), EAbilityInputID::Attack);
}

