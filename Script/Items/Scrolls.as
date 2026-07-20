
UCLASS()
class UScrollItem : URuneSpellContainer_Base
{
	default m_Name = "Scroll";
	default m_MaxStack = 15;
   	default SetItemType(GameplayTag::Item_Weapon_Scroll);
	default AddItemSpec(GameplayTag::Item_Property_Equipable);
	default AddItemSpec(GameplayTag::Item_Property_TriggersTutorial);

	default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Default::StaticClass();
}


/**
 * 
   _____                _ _     
  / ____|              | | |    
 | (___   ___ _ __ ___ | | |___ 
  \___ \ / __| '__/ _ \| | / __|
  ____) | (__| | | (_) | | \__ \
 |_____/ \___|_|  \___/|_|_|___/
                                
                                            
 * Scroll container
 */

UCLASS()
class UItAr_Scroll_BallLightning_Base : UScrollItem
{
	default m_Name = "BallLightning_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_BallLightning);
	
	default AddItemSpec(GameplayTag::Item_Range_Long);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_BallLightning::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_BallLightning::StaticClass());

	default m_WeaponsDefinitions.Add(UBallLightningDefinition_Lvl1::StaticClass());
	default m_WeaponsDefinitions.Add(UBallLightningDefinition_Lvl2::StaticClass());
	default m_WeaponsDefinitions.Add(UBallLightningDefinition_Lvl3::StaticClass());
	default m_WeaponsDefinitions.Add(UBallLightningDefinition_Lvl4::StaticClass());
}

UCLASS()
class UItAr_Scroll_ChainLightning_Base: UScrollItem
{
	default m_AutoTarget = true;
	default m_Name = "ChainLightning_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_ChainLightning);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_ChainLightning::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_ChainLightning::StaticClass());

	default m_WeaponsDefinitions.Add(ULightningRayDefinition_Base::StaticClass());
}

UCLASS()
class UItAr_Scroll_Charm_Base : UScrollItem
{
	default m_AutoTarget = true;
	default m_Name = "Charm_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Charm);
	//default m_SpellConfig = UCharmSpellConfig::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_LowThreat);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Charm::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Charm::StaticClass());

	default m_TargetConfigClass = UCharacterTargetMindSpellConfig::StaticClass();
}

UCLASS()
class UItAr_Scroll_Control_Base : UScrollItem
{
	default m_AutoTarget = true;
	default m_Name = "Control_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Control);

	default AddItemSpec(GameplayTag::Item_Property_LowThreat);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Control::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Control::StaticClass());

	default m_TargetConfigClass = UCharacterTargetMindSpellConfig::StaticClass();
}

UCLASS()
class UItAr_Scroll_DeathToTheUndead_Base : UScrollItem
{
	default m_Name = "DeathToTheUndead_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_DeathToTheUndead);

	default AddItemSpec(GameplayTag::Item_Range_Area);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_DeathToTheUndead::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_DeathToTheUndead::StaticClass());

	default m_WeaponsDefinitions.Add(UDeathToTheUndeadDefinition::StaticClass());
}

UCLASS()
class UItAr_Scroll_Fear_Base : UScrollItem
{
	default m_Name = "Fear_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Fear);

	default AddItemSpec(GameplayTag::Item_Range_Area);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Fear::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Fear::StaticClass());
}

UCLASS()
class UItAr_Scroll_FistOfWind_Base : UScrollItem
{
	default m_Name = "FistOfWind_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_FistOfWind);

	default AddItemSpec(GameplayTag::Item_Range_FrontArea);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_FistOfWind::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_FistOfWind::StaticClass());

	default m_WeaponsDefinitions.Add(UWindFistDefinition::StaticClass());
}

UCLASS()
class UItAr_Scroll_FireBolt_Base : UScrollItem
{
	default m_Name = "FireBolt_Scroll";  
	default SetItemType(GameplayTag::Item_Weapon_Scroll_FireBolt);

	default AddItemSpec(GameplayTag::Item_Range_Long);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_FireBolt::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_FireBolt::StaticClass());

	default m_WeaponsDefinitions.Add(UFireBoltProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Scroll_FireBall_Base : UScrollItem
{
	default m_Name = "FireBall_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_FireBall);
	
	default AddItemSpec(GameplayTag::Item_Range_Long);	

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_FireBall::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_FireBall::StaticClass());

	default m_WeaponsDefinitions.Add(UFireBallProjectileDefinition_Lvl1::StaticClass());
	default m_WeaponsDefinitions.Add(UFireBallProjectileDefinition_Lvl2::StaticClass());
	default m_WeaponsDefinitions.Add(UFireBallProjectileDefinition_Lvl3::StaticClass());
}

UCLASS()
class UItAr_Scroll_FireRain_Base : UScrollItem
{
	default m_Name = "FireRain_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_FireRain);
		
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default AddItemSpec(GameplayTag::Item_Range_Area);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_FireRain::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_FireRain::StaticClass());

	default m_WeaponsDefinitions.Add(UFireRainDefinition::StaticClass());
}


UCLASS()
class UItAr_Scroll_Heal_Base : UScrollItem
{
	default m_AutoTarget = true;
	default m_Name = "Heal_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Heal);
	
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Heal::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Heal::StaticClass());

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);

	default m_TargetConfigClass = UCharacterTargetHealSpellConfig::StaticClass();
}

UCLASS()
class UItAr_Scroll_IceBolt_Base : UScrollItem
{
	default m_Name = "IceBolt_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_IceBolt);
	
	default AddItemSpec(GameplayTag::Item_Range_Long);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_IceBolt::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_IceBolt::StaticClass());

	default m_WeaponsDefinitions.Add(UIceBoltProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Scroll_IceBlock_Base : UScrollItem
{
	default m_Name = "IceBlock_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_IceBlock);
	
	default AddItemSpec(GameplayTag::Item_Range_FrontArea);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_IceBlock::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_IceBlock::StaticClass());

	default m_WeaponsDefinitions.Add(UIceBlockProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Scroll_IceWave_Base : UScrollItem
{
	default m_Name = "IceWave_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_IceWave);

	default AddItemSpec(GameplayTag::Item_Range_Area);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_IceWave::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_IceWave::StaticClass());

	default m_WeaponsDefinitions.Add(UIceWaveProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Scroll_InnosPray_Base : UScrollItem
{
	default m_Name = "InnosPray_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_InnosPray);
	
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_InnosPray::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_InnosPray::StaticClass());
}

UCLASS()
class UItAr_Scroll_Light_Base: UScrollItem
{
	default m_Name = "Light_Scroll";
	default m_CanEquipAfterUse = false;
	
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Light);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Light::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Light::StaticClass());

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_Pyrokinesis_Base : UScrollItem
{
	default m_AutoTarget = true;
	default m_Name = "Pyrokinesis_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Pyrokinesis);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Pyrokinesis::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Pyrokinesis::StaticClass());

	default m_WeaponsDefinitions.Add(UPyrokinesisProjectileDefinition::StaticClass());
}

UCLASS()
class UItAr_Scroll_Shrink_Base : UScrollItem
{
	default m_AutoTarget = true;
	default m_Name = "Shrink_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Shrink);
	//default m_SpellConfig = USleepSpellConfig::StaticClass();

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Shrink::StaticClass();
}

UCLASS()
class UItAr_Scroll_Sleep_Base : UScrollItem
{
	default m_AutoTarget = true;
	default m_Name = "Sleep_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Sleep);
	//default m_SpellConfig = USleepSpellConfig::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_LowThreat);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Sleep::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Sleep::StaticClass());

	default m_TargetConfigClass = UCharacterTargetMindSpellConfig::StaticClass();
}

UCLASS()
class UItAr_Scroll_StormFist_Base : UScrollItem
{
	default m_Name = "StormFist_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_StormFist);

	default AddItemSpec(GameplayTag::Item_Range_Area);

	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_StormFist::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_StormFist::StaticClass());

	default m_WeaponsDefinitions.Add(UStormFistDefinition::StaticClass());
}

UCLASS()
class UItAr_Scroll_StormOfFire_Base: UScrollItem
{
	default m_Name = "StormOfFire_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_StormOfFire);
	
	default AddItemSpec(GameplayTag::Item_Range_Long);
		
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_StormOfFire::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_StormOfFire::StaticClass());

	default m_WeaponsDefinitions.Add(UStormOfFireDefinition::StaticClass());
}

UCLASS()
class UItAr_Scroll_SummonDemon_Base : UScrollItem
{
	default m_Name = "Sum_Demon_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Summon_Demon);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Summon_Demon::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Summon_Demon::StaticClass());
}

UCLASS()
class UItAr_Scroll_SummonGolem_Base : UScrollItem
{
	default m_Name = "Sum_Golem_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Summon_Golem);
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Summon_Golem::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Summon_Golem::StaticClass());
}

UCLASS()
class UItAr_Scroll_SummonSkeletons_Base : UScrollItem
{
	default m_Name = "Sum_Skeletons_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Summon_Skeletons);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Summon_Skeletons::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Summon_Skeletons::StaticClass());
}

UCLASS()
class UItAr_Scroll_SummonArmyOfDarkness_Base : UScrollItem
{
	default m_Name = "Sum_ArmyOfDarkness_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Summon_ArmyOfDarkness);
	
	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Summon_ArmyOfDarkness::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_Summon_ArmyOfDarkness::StaticClass());
}

UCLASS()
class UItAr_Scroll_Telekinesis_Base : UScrollItem
{
	default m_AutoTarget = true;
	//default m_TargetFilterClass = AItemVisualWorld::StaticClass();
	default m_TargetConfigClass = UTelekinesisItemVisualWorldTargetConfig::StaticClass();

	default m_Name = "Telekinesis_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Telekinesis);

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Telekinesis::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);

	default m_IsTargetingIndicatorEnabled = false;
}

UCLASS()
class UItAr_Scroll_TransformMeatbug_Base : UScrollItem
{
	default m_Name = "Trans_Meatbug_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Meatbug);
	default m_SpellConfig = UTransformMeatbugSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Meatbug::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformScavenger_Base : UScrollItem
{
	default m_Name = "Trans_Scavenger_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Scavenger);
	default m_SpellConfig = UTransformScavengerSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Scavenger::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformMolerat_Base : UScrollItem
{
	default m_Name = "Trans_Molerat_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Molerat);
	default m_SpellConfig = UTransformMoleratSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Molerat::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformBloodfly_Base : UScrollItem
{
	default m_Name = "Trans_Bloodfly_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Bloodfly);
	default m_SpellConfig = UTransformBloodflySpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Bloodfly::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformWolf_Base : UScrollItem
{
	default m_Name = "Trans_Wolf_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Wolf);
	default m_SpellConfig = UTransformWolfSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Wolf::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformLizard_Base : UScrollItem
{
	default m_Name = "Trans_Lizard_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Lizard);
	default m_SpellConfig = UTransformLizardSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Lizard::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformLurker_Base : UScrollItem
{
	default m_Name = "Trans_Lurker_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Lurker);
	default m_SpellConfig = UTransformLurkerSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Lurker::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformOrcDog_Base : UScrollItem
{
	default m_Name = "Trans_OrcDog_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_OrcDog);
	default m_SpellConfig = UTransformOrcDogSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_OrcDog::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformMinecrawler_Base : UScrollItem
{
	default m_Name = "Trans_Minecrawler_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Minecrawler);
	default m_SpellConfig = UTransformMinecrawlerSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Minecrawler::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformSnapper_Base : UScrollItem
{
	default m_Name = "Trans_Snapper_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Snapper);
	default m_SpellConfig = UTransformSnapperSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Snapper::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformShadowbeast_Base : UScrollItem
{
	default m_Name = "Trans_Shadowbeast_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Shadowbeast);
	default m_SpellConfig = UTransformShadowbeastSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Shadowbeast::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformBiter_Base : UScrollItem
{
	default m_Name = "Trans_Biter_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Biter);
	default m_SpellConfig = UTransformBiterSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Biter::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformRazor_Base : UScrollItem
{
	default m_Name = "Trans_Razor_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Razor);
	default m_SpellConfig = UTransformRazorSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Razor::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformBloodhound_Base : UScrollItem
{
	default m_Name = "Trans_Bloodhound_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Bloodhound);
	default m_SpellConfig = UTransformBloodhoundSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Bloodhound::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformHarpy_Base : UScrollItem
{
	default m_Name = "Trans_Harpy_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Harpy);
	default m_SpellConfig = UTransformHarpySpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Harpy::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformSwampshark_Base : UScrollItem
{
	default m_Name = "Trans_Swampshark_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Swampshark);
	default m_SpellConfig = UTransformSwampsharkSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Swampshark::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItAr_Scroll_TransformFireLizard_Base : UScrollItem
{
	default m_Name = "Trans_FireLizard_Scroll";
	default SetItemType(GameplayTag::Item_Weapon_Scroll_Transform_Firelizard);
	default m_SpellConfig = UTransformFireLizardSpellConfig::StaticClass();
	default m_CanEquipAfterUse = false;

	default m_OnEquipEffect = UGE_EquipAbilitiesWhen_ScrollEquip_Transform_FireLizard::StaticClass();

	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}
