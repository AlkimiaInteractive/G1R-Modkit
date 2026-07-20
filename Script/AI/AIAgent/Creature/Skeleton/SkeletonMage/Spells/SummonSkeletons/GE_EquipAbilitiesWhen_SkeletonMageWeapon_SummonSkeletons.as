class USpellConfigurationContainer_SkeletonMageWeapon_SummonSkeletons : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = USummonSkeletonSpellConfig_SkeletonMage::StaticClass();
    default m_SpellTag = GameplayTag::Spell_Summon_Skeletons_SkeletonMage;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
    default m_SuperArmorResistanceMultiplier = 100.f;

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}

class UGE_EquipAbilitiesWhen_SkeletonMageWeapon_SummonSkeletons : UGE_EquipAbilitiesWhen_RuneEquip_Base
{

   default AddAbility(UGA_CastSpell_SummonSkeletons_SkeletonMage::StaticClass(),  EAbilityInputID::Attack);

}


class USpellActionKeywords_SkeletonMageWeapon_SummonSkeletons : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Summon_Skeletons_SkeletonMage;
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Summon);


    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_SkeletonMageWeapon_SummonSkeletons::StaticClass();
}