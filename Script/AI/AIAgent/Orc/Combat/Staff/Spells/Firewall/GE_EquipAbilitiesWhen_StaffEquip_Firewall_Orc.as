// Its define the properties of the cast
class USpellConfigurationContainer_Staff_Firewall_Orc : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UFirewallSpellConfig_Orc::StaticClass(); // Define the type of spell itself
    default m_SpellTag = GameplayTag::Spell_Firewall;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

	default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
	default m_SuperArmorResistanceMultiplier = 3.0f;
}

class USpellActionKeywords_Firewall_Orc : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Firewall;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Circle);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Kill);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_StaffEquip_Firewall_Orc::StaticClass();
    
}

class UGE_EquipAbilitiesWhen_StaffEquip_Firewall_Orc : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    default AddAbility(UGA_CastSpell_Firewall_Orc::StaticClass(), EAbilityInputID::Attack);
}