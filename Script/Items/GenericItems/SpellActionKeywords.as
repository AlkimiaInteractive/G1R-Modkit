class USpellActionKeywords_Charm : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Charm;
    
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Banned_AgainstPlayer);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Charm);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_AffectedEntities_Humans);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_Charm::StaticClass();
}

class USpellActionKeywords_Sleep : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Sleep;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Banned_AgainstPlayer);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Sleep);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_AffectedEntities_Humans);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_Sleep::StaticClass();
}

class USpellActionKeywords_Control : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Control;
    
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Banned_Always);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Target_Other);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ManaCost_TargetLevel);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_AffectedEntities_Humans);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_Control::StaticClass();
}

class USpellActionKeywords_Fear : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Fear;
    
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Banned_AgainstPlayer);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Cone);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_Fear::StaticClass();
}

class USpellActionKeywords_DeathToTheUndead : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_DeathToTheUndead;
    
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_AffectedEntities_Undead);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Circle_OnCaster);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Kill);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_DeathToTheUndead::StaticClass();
}

class USpellActionKeywords_BallLightning : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_BallLightning;

	default m_Keywords.AddTag(GameplayTag::Item_Range_Long);
    default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Charged);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Paralize);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Slow);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_BallLightning::StaticClass();
}

class USpellActionKeywords_ChainLightning : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_ChainLightning;
    
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Target_Other);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Sustained);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Paralize);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Chain);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_ChainLightning::StaticClass();
}

class USpellActionKeywords_FireBall : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Fireball;
    
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Charged);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Burn);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Fast);
	default m_Keywords.AddTag(GameplayTag::Item_Range_Long);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_FireBall::StaticClass();
}

class USpellActionKeywords_FireBolt : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Firebolt;
    
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Combo);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Burn);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Fast);
	default m_Keywords.AddTag(GameplayTag::Item_Range_Long);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_FireBolt::StaticClass();
}

class USpellActionKeywords_FireRain : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Firerain;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Charged);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Circle_OnCaster);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_FireRain::StaticClass();
}

class USpellActionKeywords_InnosPray : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_InnosPray;

	//default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Charged);
	//default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Circle_OnCaster);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_ScrollEquip_InnosPray::StaticClass();
}

class USpellActionKeywords_Pyrokinesis : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Pyrokinesis;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Sustained);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Target_Other);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Slow);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_Pyrokinesis::StaticClass();
}

class USpellActionKeywords_StormOfFire : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_StormOfFire;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Fire);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Charged);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Burn);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Slow);
	default m_Keywords.AddTag(GameplayTag::Item_Range_Long);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_StormOfFire::StaticClass();
}

class USpellActionKeywords_Heal : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Heal;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Healing);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Target_Self);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Heal);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_AffectedEntities_Humans);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_Heal::StaticClass();
}

class USpellActionKeywords_IceBlock : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_IceBlock;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Freeze);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Cone);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_IceBlock::StaticClass();
}

class USpellActionKeywords_IceBolt : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_IceBolt;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Combo);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Freeze);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ProjectileSpeed_Fast);
	default m_Keywords.AddTag(GameplayTag::Item_Range_Long);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_IceBolt::StaticClass();
}

class USpellActionKeywords_IceWave : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_IceWave;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Freeze);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Circle_OnCaster);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_IceWave::StaticClass();
}

class USpellActionKeywords_Light : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Light;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Utility);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Light);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Target_Self);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Duration);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Circle_OnCaster);

	// TODO: Remove after testing
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_Light::StaticClass();
}

class USpellActionKeywords_Telekinesis : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Telekinesis;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Utility);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Banned_Always);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Telekinesis);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Target_Other);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Sustained);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_Telekinesis::StaticClass();
}

class USpellActionKeywords_UrizielWaveOfDeath : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_UrizielWaveOfDeath;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Circle_OnCaster);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Kill);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_UrizielWaveOfDeath::StaticClass();
}

class USpellActionKeywords_BreathOfDeath : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_BreathOfDeath;
    
    default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Magic);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_ImmuneEntities_Undead);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Cone);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Kill);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_BreathOfDeath::StaticClass();
}

class USpellActionKeywords_FistOfWind : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_FistOfWind;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Charged);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Wind);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Knockback);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Cone);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_FistOfWind::StaticClass();
}

class USpellActionKeywords_StormFist : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_StormFist;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Damage);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Control);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Charged);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Damage_Wind);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Effect_Knockback);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Area_Circle_OnCaster);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_StormFist::StaticClass();
}

class USpellActionKeywords_Summon_ArmyOfDarkness : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Summon_ArmyOfDarkness;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Summon);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_StormFist::StaticClass();
}

class USpellActionKeywords_Summon_Demon : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Summon_Demon;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Summon);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_StormFist::StaticClass();
}

class USpellActionKeywords_Summon_Golem : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Summon_Golem;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Summon);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_StormFist::StaticClass();
}

class USpellActionKeywords_Summon_Skeletons : USpellActionKeywords
{
    default m_ActionTag = GameplayTag::Spell_Summon_Skeletons;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Summon);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_StormFist::StaticClass();
}

class USpellActionKeywords_Teleport : USpellActionKeywords
{
	default m_ActionTag = GameplayTag::Spell_Teleport;

	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Usage_Utility);
	default m_Keywords.AddTag(GameplayTag::AISpellKeywords_Casting_Single);

    default m_OnEquipActionEffect = UGE_EquipAbilitiesWhen_RuneEquip_StormFist::StaticClass();
}