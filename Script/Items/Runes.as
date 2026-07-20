
UCLASS()
class URuneSpellContainer_Base : URuneSpellContainer
{
	default m_TargetConfigClass = USpellCharacterTargetConfig::StaticClass();
}
UCLASS()
class URuneItem : URuneSpellContainer_Base
{
	default m_Name = "Rune";
    default SetItemType(GameplayTag::Item_Weapon_Rune);
	default AddItemSpec(GameplayTag::Item_Property_Equipable);
	default AddItemSpec(GameplayTag::Item_Property_TriggersTutorial);

    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Default::StaticClass();

	default m_CrosshairWidget = n"WidgetBlueprint'/Game/UI/Crosshair/BP_CrosshairWidget.BP_CrosshairWidget_C'";
}

/**
 * 
  _____                       
 |  __ \                      
 | |__) |   _ _ __   ___  ___ 
 |  _  / | | | '_ \ / _ \/ __|
 | | \ \ |_| | | | |  __/\__ \
 |_|  \_\__,_|_| |_|\___||___/
                              
                              
 * Rune containers
 * 
*/

UCLASS()
class UItAr_Rune_BallLightning_Base : URuneItem
{
	default m_Name = "BallLightning_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_BallLightning);
	default RequiredMagicCircleLevel = 2;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	default AddItemSpec(GameplayTag::Item_Range_Long);
	
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_BallLightning::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_BallLightning::StaticClass());

	default m_WeaponsDefinitions.Add(UBallLightningDefinition_Lvl1::StaticClass());
	default m_WeaponsDefinitions.Add(UBallLightningDefinition_Lvl2::StaticClass());
	default m_WeaponsDefinitions.Add(UBallLightningDefinition_Lvl3::StaticClass());
	default m_WeaponsDefinitions.Add(UBallLightningDefinition_Lvl4::StaticClass());
}

UCLASS()
class UItAr_Rune_BreathOfDeath_Base : URuneItem
{
	default m_Name = "BreathOfDeath_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_BreathOfDeath);
	default RequiredMagicCircleLevel = 6;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	default AddItemSpec(GameplayTag::Item_Range_FrontArea);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_BreathOfDeath::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_BreathOfDeath::StaticClass());

	default m_WeaponsDefinitions.Add(UBreathOfDeathDefinition);
}

UCLASS()
class UItAr_Rune_ChainLightning_Base: URuneItem
{
	default m_AutoTarget = true;
	default m_Name = "ChainLightning_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_ChainLightning);
	default RequiredMagicCircleLevel = 4;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	//default m_SpellConfig = UChainLightningSpellConfig::StaticClass();

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_ChainLightning::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_ChainLightning::StaticClass());

	default m_WeaponsDefinitions.Add(ULightningRayDefinition_Base::StaticClass());
}

UCLASS()
class UItAr_Rune_Charm_Base : URuneItem
{
	default m_AutoTarget = true;
	default m_Name = "Charm_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_Charm);
	//default m_SpellConfig = UCharmSpellConfig::StaticClass();
	default RequiredMagicCircleLevel = 3;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Charm::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Charm::StaticClass());
	default m_TargetConfigClass = UCharacterTargetMindSpellConfig::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_LowThreat);
}

UCLASS()
class UItAr_Rune_Control_Base : URuneItem
{
	default m_AutoTarget = true;
	default m_Name = "Control_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_Control);
	default RequiredMagicCircleLevel = 4;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Control::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Control::StaticClass());

	default m_TargetConfigClass = UCharacterTargetMindSpellConfig::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_LowThreat);
}

UCLASS()
class UItAr_Rune_DeathToTheUndead_Base : URuneItem
{
	default m_Name = "DeathToTheUndead_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_DeathToTheUndead);
	default RequiredMagicCircleLevel = 4;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	default AddItemSpec(GameplayTag::Item_Range_Area);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_DeathToTheUndead::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_DeathToTheUndead::StaticClass());

	default m_WeaponsDefinitions.Add(UDeathToTheUndeadDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_FireBall_Base : URuneItem
{
	default m_Name = "FireBall_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_FireBall);
	default RequiredMagicCircleLevel = 3;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	default AddItemSpec(GameplayTag::Item_Range_Long);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_FireBall::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_FireBall::StaticClass());

	default m_WeaponsDefinitions.Add(UFireBallProjectileDefinition_Lvl1::StaticClass());
	default m_WeaponsDefinitions.Add(UFireBallProjectileDefinition_Lvl2::StaticClass());
	default m_WeaponsDefinitions.Add(UFireBallProjectileDefinition_Lvl3::StaticClass());
}

UCLASS()
class UItAr_Rune_FireBolt_Base : URuneItem
{
	default m_Name = "FireBolt_Rune";  
	default SetItemType(GameplayTag::Item_Weapon_Rune_FireBolt);
	default RequiredMagicCircleLevel = 0;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	default AddItemSpec(GameplayTag::Item_Range_Long);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_FireBolt::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_FireBolt::StaticClass());

	default m_WeaponsDefinitions.Add(UFireBoltProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_FireRain_Base : URuneItem
{
	default m_Name = "FireRain_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_FireRain);
	default RequiredMagicCircleLevel = 5;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default AddItemSpec(GameplayTag::Item_Range_Area);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_FireRain::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_FireRain::StaticClass());

	default m_WeaponsDefinitions.Add(UFireRainDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_FistOfWind_Base : URuneItem
{
	default m_Name = "FistOfWind_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_FistOfWind);
	default RequiredMagicCircleLevel = 1;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	//default m_SpellConfig = UFistOfWindSpellConfig::StaticClass();

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default AddItemSpec(GameplayTag::Item_Range_FrontArea);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_FistOfWind::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_FistOfWind::StaticClass());

	default m_WeaponsDefinitions.Add(UWindFistDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_Heal_Base : URuneItem
{
	default m_AutoTarget = true;
	default m_Name = "Heal_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_Heal);
	default RequiredMagicCircleLevel = 0;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	//default m_SpellConfig = UHealSpellConfig::StaticClass();

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Heal::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Heal::StaticClass());

	default m_TargetConfigClass = UCharacterTargetHealSpellConfig::StaticClass();
}

UCLASS()
class UItAr_Rune_IceBlock_Base : URuneItem
{
	default m_Name = "IceBlock_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_IceBlock);
	default RequiredMagicCircleLevel = 3;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	default AddItemSpec(GameplayTag::Item_Range_FrontArea);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_IceBlock::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_IceBlock::StaticClass());

	default m_WeaponsDefinitions.Add(UIceBlockProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_IceBolt_Base : URuneItem
{
	default m_Name = "IceBolt_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_IceBolt);
	default RequiredMagicCircleLevel = 1;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	
	default AddItemSpec(GameplayTag::Item_Range_Long);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_IceBolt::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_IceBolt::StaticClass());

	default m_WeaponsDefinitions.Add(UIceBoltProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_IceWave_Base : URuneItem
{
	default m_Name = "IceWave_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_IceWave);
	default RequiredMagicCircleLevel = 5;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	//default m_SpellConfig = UIceWaveSpellConfig::StaticClass();

	default AddItemSpec(GameplayTag::Item_Range_Area);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_IceWave::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_IceWave::StaticClass());

	default m_WeaponsDefinitions.Add(UIceWaveProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_Light_Base: URuneItem
{
	default m_Name = "Light_Rune";
	default m_CanEquipAfterUse = false;
	
	default SetItemType(GameplayTag::Item_Weapon_Rune_Light);
	default RequiredMagicCircleLevel = 1;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Light::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Light::StaticClass());
}

UCLASS()
class UItAr_Rune_Pyrokinesis_Base : URuneItem
{
	default m_AutoTarget = true;
	default m_Name = "Pyrokinesis_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_Pyrokinesis);
	default RequiredMagicCircleLevel = 3;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	//default m_SpellConfig = UPyrokinesisSpellConfig::StaticClass();
	
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Pyrokinesis::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Pyrokinesis::StaticClass());

	default m_WeaponsDefinitions.Add(UPyrokinesisProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_Sleep_Base : URuneItem
{
	default m_AutoTarget = true;
	default m_Name = "Sleep_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_Sleep);
	//default m_SpellConfig = USleepSpellConfig::StaticClass();
	default RequiredMagicCircleLevel = 2;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Sleep::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Sleep::StaticClass());

	default m_TargetConfigClass = UCharacterTargetMindSpellConfig::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_LowThreat);
}

UCLASS()
class UItAr_Rune_StormFist_Base : URuneItem
{
	default m_Name = "StormFist_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_StormFist);
	default RequiredMagicCircleLevel = 4;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	
	default AddItemSpec(GameplayTag::Item_Range_Area);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_StormFist::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_StormFist::StaticClass());

	default m_WeaponsDefinitions.Add(UStormFistDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_StormOfFire_Base: URuneItem
{
	default m_Name = "StormOfFire_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_StormFire);
	default RequiredMagicCircleLevel = 4;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	
	default AddItemSpec(GameplayTag::Item_Range_Long);
	
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_StormOfFire::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_StormOfFire::StaticClass());

	default m_WeaponsDefinitions.Add(UStormOfFireDefinition::StaticClass());
}

UCLASS()
class UItAr_Rune_Telekinesis_Base : URuneItem
{
	default m_AutoTarget = true;
	default m_TargetConfigClass = UTelekinesisItemVisualWorldTargetConfig::StaticClass();

	default m_Name = "Telekinesis_Rune";
	default SetItemType(GameplayTag::Item_Weapon_Rune_Telekinesis);
	default RequiredMagicCircleLevel = 3;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	//default m_SpellConfig = UTelekinesisSpellConfig::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Telekinesis::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Telekinesis::StaticClass());

	default m_IsTargetingIndicatorEnabled = false;
}

UCLASS()
class URuneItem_Teleport_Base : URuneItem
{
	default SetItemType(GameplayTag::Item_Weapon_Rune_Teleport);
	default RequiredMagicCircleLevel = -1;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	/** Teleport Keywords */
	default AddItemSpec(GameplayTag::AISpellKeywords_Usage_Teleport);

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);

	default m_ActionsKeywords.Add(USpellActionKeywords_Teleport::StaticClass());
}

UCLASS()
class UItAr_Rune_TeleportToMagiciansOfFire_Base : URuneItem_Teleport_Base
{
	default m_Name = "Teleport_MagiciansOfFire_Rune";
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_TeleportToMagiciansOfFire::StaticClass();

	/** TeleportToMagiciansOfFire Keywords */
}

UCLASS()
class UItAr_Rune_TeleportToSwampCamp_Base : URuneItem_Teleport_Base
{
	default m_Name = "Teleport_SwampCamp_Rune";
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_TeleportToSwampCamp::StaticClass();

	/** TeleportToSwampCamp Keywords */
}

UCLASS()
class UItAr_Rune_TeleportToMagiciansOfWater_Base : URuneItem_Teleport_Base
{
	default m_Name = "Teleport_MagiciansOfWater_Rune";
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_TeleportToMagiciansOfWater::StaticClass();

	/** TeleportToMagiciansOfWater Keywords */
}

UCLASS()
class UItAr_Rune_TeleportToNecromancer_Base : URuneItem_Teleport_Base
{
	default m_Name = "Teleport_Necromancer_Rune";
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_TeleportToNecromancer::StaticClass();

	/** TeleportToNecromancer Keywords */
}

UCLASS()
class UItAr_Rune_TeleportToSunkenTower_Base : URuneItem_Teleport_Base
{
	default m_Name = "Teleport_SunkenTower_Rune";
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_TeleportToSunkenTower::StaticClass();

	/** TeleportToSunkenTower Keywords */
}

UCLASS()
class UItAr_Rune_UrizielWaveOfDeath_Base : URuneItem
{
	default m_Name = "UrizielWaveOfDeath_Rune";
	default m_CanEquipAfterUse = false;
	default SetItemType(GameplayTag::Item_Weapon_Rune_UrizielWaveOfDeath);
	default RequiredMagicCircleLevel = 6;
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default AddItemSpec(GameplayTag::Item_Range_Area);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_UrizielWaveOfDeath::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_UrizielWaveOfDeath::StaticClass());

	default m_WeaponsDefinitions.Add(UUrizielWaveOfDeathVisualDefinition::StaticClass());
}
