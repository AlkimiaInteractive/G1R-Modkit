class USpellConfigurationContainer_SkeletonMageWeapon_Teleport: USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTeleportSpellConfig_SkeletonMage::StaticClass();
    default m_SpellTag = GameplayTag::Spell_Teleport_SkeletonMage;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();//USpellCastAnimatorVariableInSectionDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;
}


class USpellActionKeywords_SkeletonMageWeapon_Teleport : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Teleport_SkeletonMage;
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Teleport);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_SkeletonMageWeapon_Teleport::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_SkeletonMageWeapon_Teleport : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
	default AddAbility(UGA_CastSpell_Teleport_SkeletonMage::StaticClass(), EAbilityInputID::Attack);
}

