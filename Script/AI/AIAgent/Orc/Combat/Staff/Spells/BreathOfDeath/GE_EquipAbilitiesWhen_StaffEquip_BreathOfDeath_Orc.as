// Its define the properties of the cast
class USpellConfigurationContainer_Staff_BreathOfDeath : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UBreathOfDeathSpellConfig_Orc::StaticClass(); // Define the type of spell itself
    default m_SpellTag = GameplayTag::Spell_BreathOfDeath;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 3.0f;
}

class USpellActionKeywords_BreathOfDeath_Orc : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_BreathOfDeath;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ImmuneEntities_Undead);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Cone);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Kill);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_StaffEquip_BreathOfDeath_Orc::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_StaffEquip_BreathOfDeath_Orc : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_BreathOfDeath::StaticClass(), UGA_CastSpell_ChargeByDuration::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_BreathOfDeath_Orc::StaticClass(), EAbilityInputID::Attack);
}