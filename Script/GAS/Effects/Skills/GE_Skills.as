class UGE_IncreaseExperience : UScriptGameplayEffect
{
    default AddCallerValueToAttribute(UAttributeSet_LevelProgression::StaticClass(), n"Experience", GameplayTag::GE_Param_Experience);
	default DurationPolicy = EGameplayEffectDurationType::Instant;
}

mixin FGameplayEffectSpecHandle GE_IncreaseExperience(UAbilitySystemComponent ASC, float Experience)
{
    return ASC.MakeEffectSpecWithParam(UGE_IncreaseExperience::StaticClass(), GameplayTag::GE_Param_Experience, Experience);
}

class UGE_Skill_Generic : UGameplayEffect_SkillGeneric
{
	default m_SPCost = 0;
    default OreCost = 0;
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
}

class UGE_Skill_Hunting_MandibleMineCrawler_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_MandibleMineCrawler);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_MandibleMineCrawler);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_MCMandibles);
}

/*class UGE_Skill_Hunting_WarPlatesMineCrawler_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_WarPlatesMineCrawler);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_WarPlatesMineCrawler);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_MCWarPlates);
}*/

class UGE_Skill_Hunting_TongueOfFire_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_TongueOfFire);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_TongueOfFire);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_TongueOfFire);
}

class UGE_Skill_Hunting_ShadowbeastHorn_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_ShadowbeastHorn);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_ShadowbeastHorn);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_ShadowbeastHorn);
}

class UGE_Skill_Hunting_StingsBloodfly_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_StingsBloodfly);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_StingsBloodfly);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_BloodflyStings);
}

class UGE_Skill_Hunting_SkinSwampshark_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_SkinSwampshark);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_SkinSwampshark);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_SkinSwampshark);
}

class UGE_Skill_Hunting_TrollHorn_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_HornTroll);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_HornTroll);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_TrollHorn);
}

class UGE_Skill_Hunting_TeethSwampshark_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_TeethSwampshark);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_TeethSwampshark);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_SwampsharkTeeth);
}

class UGE_Skill_Hunting_Spines_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Spines);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Spines);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Spines);
}

class UGE_Skill_Hunting_SkullArmor_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_SkullArmor);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_SkullArmor);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_SkullArmor);
}

class UGE_Skill_Hunting_Scutes_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Scutes);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Scutes);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Scutes);
}

class UGE_Skill_Hunting_Scutes_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Scutes_Master);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Scutes_Master);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Scutes_Master);
}

class UGE_Skill_Hunting_Organ_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Organ);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Organ);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Organ);
}

class UGE_Skill_Hunting_Fins_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Fins);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Fins);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Fins);
}

class UGE_Skill_Hunting_MCPlate_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_MCPlate);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_MCPlate);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_MCPlate);
}

class UGE_Skill_Hunting_Claw_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Claw);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Claw);

    default m_SPCost = 1;
    default OreCost = 150;
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Claw);
}

class UGE_Skill_Hunting_Skin_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Skin);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Skin);

    default m_SPCost = 1;
    default OreCost = 250;
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Skin);
}

class UGE_Skill_Hunting_Teeth_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Teeth);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Teeth);
    
    default m_SPCost = 1;
    default OreCost = 175;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Teeth);
}

class UGE_Skill_Hunting_Secretion_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Secretion);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Secretion);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Secretion);
}

class UGE_Skill_Hunting_Fur_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Fur);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Fur);
    
    default m_SPCost = 1;
    default OreCost = 250;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Fur);
}

class UGE_Skill_Hunting_Stings_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Stings);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Stings);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Stings);
}

class UGE_Skill_Hunting_Reptiles_Trained : UGE_Skill_Generic //TO BE DONE. PLACEHOLDER TAGS
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_Stings);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_Stings);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_Stings);
}

class UGE_Skill_Hunting_UluMulu_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Hunting_UluMulu);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Hunting_UluMulu);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Hunting_UluMulu);
}

class UGE_Skill_Ranged_Bow_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Bow);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Bow);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Ranged_Bow_Untrained);
}

class UGE_Skill_Ranged_Bow_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Bow);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Bow);

    default m_SPCost = 10;
    default OreCost = 50;
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Ranged_Bow_Trained);
}

class UGE_Skill_Ranged_Bow_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Bow);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Bow);

    default m_SPCost = 20;
    default OreCost = 150;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Ranged_Bow_Master);
}

class UGE_Skill_Ranged_Crossbow_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_CrossBow);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_CrossBow);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Ranged_Crossbow_Untrained);
}

class UGE_Skill_Ranged_Crossbow_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_CrossBow);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_CrossBow);

    default m_SPCost = 10;
    default OreCost = 200;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Ranged_Crossbow_Trained);
}

class UGE_Skill_Ranged_Crossbow_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_CrossBow);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_CrossBow);

    default m_SPCost = 20;
    default OreCost = 300;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Ranged_Crossbow_Master);
}

class UGE_Skill_Melee_Fists_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Fists);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Fists);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_Fists_Untrained);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_Fists", 1.0f);
}

class UGE_Skill_Melee_Fists_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Fists);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Fists);

    default m_SPCost = 5;
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_Fists_Trained);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_Fists", 5.0f);
}

class UGE_Skill_Melee_Fists_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Fists);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Fists);

    default m_SPCost = 10;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_Fists_Master);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_Fists", 10.0f);
}

class UGE_Skill_Melee_OneHanded_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_OneHanded);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_OneHanded);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_OneHanded_Untrained);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_OneHand", 1.0f);
}

class UGE_Skill_Melee_OneHanded_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_OneHanded);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_OneHanded);

    default m_SPCost = 10;
    default OreCost = 50;
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_OneHand", 3.0f);
}

class UGE_Skill_Melee_OneHanded_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_OneHanded);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_OneHanded);

    default m_SPCost = 20;
    default OreCost = 200;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_OneHand", 5.0f);
}

class UGE_Skill_Melee_TwoHanded_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_TwoHanded);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_TwoHanded);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_TwoHanded_Untrained);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_TwoHand", 1.0f);
}

class UGE_Skill_Melee_TwoHanded_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_TwoHanded);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_TwoHanded);

    default m_SPCost = 30;
    default OreCost = 200;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_TwoHand", 3.0f);
}

class UGE_Skill_Melee_TwoHanded_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_TwoHanded);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_TwoHanded);

    default m_SPCost = 40;
    default OreCost = 300;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_TwoHand", 5.0f);
}

class UGE_Skill_Melee_Orc_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Orc);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Orc);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_Orc_Untrained);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_Orc", 1.0f);
}

class UGE_Skill_Melee_Orc_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Orc);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Orc);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_Orc_Trained);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_Orc", 3.0f);
}

class UGE_Skill_Melee_Orc_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Orc);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Orc);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Melee_Orc_Master);

    default SetAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_Orc", 5.0f);
}

class UGE_Skill_Pickpocket_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Pickpocket);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Pickpocket);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Pickpocketing_Untrained);

    // default SetAttribute(...); ?
}

class UGE_Skill_Pickpocket_Skilled : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Pickpocket);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Pickpocket);

    default m_SPCost = 10;
    default OreCost = 80;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Pickpocketing_Trained);

    // default SetAttribute(...); ?
}

class UGE_Skill_Pickpocket_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Pickpocket);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Pickpocket);

    default m_SPCost = 20;
    default OreCost = 160;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Pickpocketing_Master);
    
    // default SetAttribute(...); ?
}

class UGE_Skill_Mining_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mining);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mining);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mining_Untrained);

    // default SetAttribute(...); ?
}

class UGE_Skill_Mining_Skilled : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mining);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mining);

    default m_SPCost = 2;
    default OreCost = 30;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mining_Trained);

    // default SetAttribute(...); ?
}

class UGE_Skill_Mining_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mining);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mining);

    default m_SPCost = 4;
    default OreCost = 50;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mining_Master);
    
    // default SetAttribute(...); ?
}

class UGE_Skill_Picklock_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Picklock);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Picklock);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Lockpicking_Untrained);
}

class UGE_Skill_Picklock_Skilled : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Picklock);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Picklock);

    default m_SPCost = 10;
    default OreCost = 100;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Lockpicking_Trained);

    // default SetAttribute(...); ?
}

class UGE_Skill_Picklock_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Picklock);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Picklock);

    default m_SPCost = 20;
    default OreCost = 200;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Lockpicking_Master);
    
    // default SetAttribute(...); ?
}

class UGE_Skill_Orcish_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Orcish);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Orcish);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Orcish_Untrained);
    //default RemoveGameplayEffectsWithTags.AddTag(GameplayTag::GE_Skill_Orcish);
    //default InheritableGameplayEffectTags.AddTag(GameplayTag::GE_Skill_Orcish);

    //default InheritableOwnedTagsContainer.AddTag(GameplayTag::Skill_Orcish_Untrained);

    // default SetAttribute(...); ?
}

class UGE_Skill_Orcish_Skilled : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Orcish);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Orcish);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Orcish_Trained);
    //default RemoveGameplayEffectsWithTags.AddTag(GameplayTag::GE_Skill_Orcish);
    //default InheritableGameplayEffectTags.AddTag(GameplayTag::GE_Skill_Orcish);

   // default InheritableOwnedTagsContainer.AddTag(GameplayTag::Skill_Orcish_Trained);

    // default SetAttribute(...); ?
}

class UGE_Skill_Orcish_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Orcish);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Orcish);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Orcish_Master);
    //default RemoveGameplayEffectsWithTags.AddTag(GameplayTag::GE_Skill_Orcish);
    //default InheritableGameplayEffectTags.AddTag(GameplayTag::GE_Skill_Orcish);

    //default InheritableOwnedTagsContainer.AddTag(GameplayTag::Skill_Orcish_Master);
    
    // default SetAttribute(...); ?
}

class UGE_Skill_Sneak : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Sneak);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Sneak);
    
    default m_SPCost = 2;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Sneak);
    
    // default SetAttribute(...); ?
}

class UGE_Skill_Acrobatics : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Acrobatics);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Acrobatics);

    default m_SPCost = 10;
    default OreCost = 60;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Acrobatics_Trained);
    
    // default SetAttribute(...); ?
}

class UGE_Skill_Wallclimbing : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Wallclimbing);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Wallclimbing);

    default m_SPCost = 5;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_WallClimbing_Trained);
    
    // default SetAttribute(...); ?
}

class UGE_Skill_Diving : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Diving);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Diving);

    default m_SPCost = 5;
    default OreCost = 30;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Diving_Trained);
    
    // default SetAttribute(...); ?
}

class UGE_Skill_Mage_Circle_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mage_Circle);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mage_Circle);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mage_Circle_Untrained);

    default SetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel", -1.0f);
}

class UGE_Skill_Mage_Circle_Amateur : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mage_Circle);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mage_Circle);

    default m_SPCost = 5;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mage_Circle_Amateur);
    
    default SetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel", 0.0f);
}

class UGE_Skill_Mage_Circle_1 : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mage_Circle);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mage_Circle);

    default m_SPCost = 10;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mage_Circle_First);
    
    default SetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel", 1.0f);
}

class UGE_Skill_Mage_Circle_2 : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mage_Circle);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mage_Circle);

    default m_SPCost = 15;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mage_Circle_Second);
    
    default SetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel", 2.0f);
}

class UGE_Skill_Mage_Circle_3 : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mage_Circle);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mage_Circle);

    default m_SPCost = 20;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mage_Circle_Third);
    
    default SetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel", 3.0f);
}

class UGE_Skill_Mage_Circle_4 : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mage_Circle);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mage_Circle);

    default m_SPCost = 25;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mage_Circle_Fourth);
    
    default SetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel", 4.0f);
}

class UGE_Skill_Mage_Circle_5 : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mage_Circle);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mage_Circle);

    default m_SPCost = 30;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mage_Circle_Fifth);
    
    default SetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel", 5.0f);
}

class UGE_Skill_Mage_Circle_6 : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Mage_Circle);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Mage_Circle);

    default m_SPCost = 40;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Mage_Circle_Sixth);
    
    default SetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel", 6.0f);
}

class UGE_Skill_Crafting_Blacksmith_Untrained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Crafting_Blacksmith);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Crafting_Blacksmith);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Crafting_Blacksmith_Untrained); 
}

class UGE_Skill_Crafting_Blacksmith_Trained : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Crafting_Blacksmith);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Crafting_Blacksmith);

    default m_SPCost = 10;
    default OreCost = 50;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Crafting_Blacksmith_Trained); 
}

class UGE_Skill_Crafting_Blacksmith_Master : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Crafting_Blacksmith);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Crafting_Blacksmith);

    default m_SPCost = 15;
    default OreCost = 150;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Crafting_Blacksmith_Master);
}

class UGE_Skill_Crafting_Inscription : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Crafting_Inscription);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Crafting_Inscription);

    default m_SPCost = 10;
    default OreCost = 100;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Crafting_Inscription);
}

class UGE_Skill_Crafting_Alchemy : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default TagsToRemoveOther.AddTag(GameplayTag::GE_Skill_Crafting_Alchemy);
    default RemoveOtherTags();
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Crafting_Alchemy);

    default m_SPCost = 10;
    default OreCost = 100;

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Crafting_Alchemy);
}

class UGE_Skill_Riding : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Riding);

    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Skill_Riding);
}

class UGE_Skill_Scavenging : UGE_Skill_Generic
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Skill_Scavenging);
}

UCLASS(Abstract)
class UGE_Skill_BuyAttribute : UGE_Skill_Generic
{
    default DurationPolicy = EGameplayEffectDurationType::Instant;
}

class UGE_Skill_BuyAttribute_Strength_1 : UGE_Skill_BuyAttribute
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_1);
    default m_SPCost = -1;
    default IncreaseAttribute(UAttributeSet_Strength::StaticClass(), n"Strength", 1);

    UFUNCTION(BlueprintOverride)
    float GetSPCost(const AGothicCharacterState CharacterState)
    {
        if (CharacterState == nullptr)
            return m_SPCost;

        return GetCostStrengthAttributePoints(CharacterState, 1);
    }
}

class UGE_Skill_BuyAttribute_Strength_5 : UGE_Skill_BuyAttribute
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_5);
    default m_SPCost = -1;
    default IncreaseAttribute(UAttributeSet_Strength::StaticClass(), n"Strength", 5);

    UFUNCTION(BlueprintOverride)
    float GetSPCost(const AGothicCharacterState CharacterState)
    {
        if (CharacterState == nullptr)
            return m_SPCost;

        return GetCostStrengthAttributePoints(CharacterState, 5);
    }
}

class UGE_Skill_BuyAttribute_Dexterity_1 : UGE_Skill_BuyAttribute
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_1);
    default m_SPCost = -1;
    default IncreaseAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity", 1);

    UFUNCTION(BlueprintOverride)
    float GetSPCost(const AGothicCharacterState CharacterState)
    {
        if (CharacterState == nullptr)
            return m_SPCost;

        return GetCostDexterityAttributePoints(CharacterState, 1);
    }
}

class UGE_Skill_BuyAttribute_Dexterity_5 : UGE_Skill_BuyAttribute
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_5);
    default m_SPCost = -1;
    default IncreaseAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity", 5);

    UFUNCTION(BlueprintOverride)
    float GetSPCost(const AGothicCharacterState CharacterState)
    {
        if (CharacterState == nullptr)
            return m_SPCost;

        return GetCostDexterityAttributePoints(CharacterState, 5);
    }
}

class UGE_Skill_BuyAttribute_MaxMana_1 : UGE_Skill_BuyAttribute
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_1);
    default m_SPCost = 1;
    default IncreaseAttribute(UAttributeSet_Mana::StaticClass(), n"MaxMana", 1);
}

class UGE_Skill_BuyAttribute_MaxMana_5 : UGE_Skill_BuyAttribute
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_5);
    default m_SPCost = 5;
    default IncreaseAttribute(UAttributeSet_Mana::StaticClass(), n"MaxMana", 5);
}
