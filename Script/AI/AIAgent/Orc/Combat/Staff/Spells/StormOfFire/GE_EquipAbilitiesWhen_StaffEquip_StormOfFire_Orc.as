// Its define the properties of the cast
class USpellConfigurationContainer_Staff_StormOfFire : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UStormOfFireSpellConfig_Orc::StaticClass(); // Define the type of spell itself
    default m_SpellTag = GameplayTag::Spell_StormOfFire; 
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 3.0f;
}

class USpellActionKeywords_StormOfFire_Orc : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_StormOfFire;

    default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Charged);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Burn);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Slow);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_StaffEquip_StormOfFire_Orc::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_StaffEquip_StormOfFire_Orc : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{

    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_StormOfFire::StaticClass(), UGA_CastSpell_ChargeByDuration::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_StormOfFire_Orc::StaticClass(), EAbilityInputID::Attack);
    
}