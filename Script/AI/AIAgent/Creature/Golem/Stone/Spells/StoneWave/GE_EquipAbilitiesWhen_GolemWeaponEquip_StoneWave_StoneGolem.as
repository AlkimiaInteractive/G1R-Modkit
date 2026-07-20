class USpellConfigurationContainer_GolemWeapon_StoneWave_StoneGolem : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UStoneWaveSpellConfig_StoneGolem::StaticClass();
    default m_SpellTag = GameplayTag::Spell_StoneWave;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 100.f;

	default m_OnLaunchSpellCastFinishByAnimNotify = true;
}


class USpellActionKeywords_GolemWeapon_StoneWave_StoneGolem : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_StoneWave;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Wind);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Knockback);
	//default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Cone);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_GolemWeapon_StoneWave_StoneGolem::StaticClass();
    
}

class USpellActionKeywords_GolemWeapon_StoneWave_StoneGolem_Small : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_StoneWave;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Wind);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Knockback);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Cone);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_GolemWeapon_StoneWave_StoneGolem::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_GolemWeapon_StoneWave_StoneGolem : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
	default AddAbility(UGA_CastSpell_StoneWave_StoneGolem::StaticClass(), EAbilityInputID::Attack);
}

