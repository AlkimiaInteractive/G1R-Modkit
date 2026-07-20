UCLASS(Abstract)
class URemoveAllEffectsPreset : UPlayerPreset
{
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_MandibleMineCrawler);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_TongueOfFire);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_ShadowbeastHorn);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_StingsBloodfly);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_SkinSwampshark);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_HornTroll);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_TeethSwampshark);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Spines);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_SkullArmor);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Scutes);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Organ);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Fins);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_MCPlate);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Claw);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Skin);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Teeth);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Secretion);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Fur);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_Stings);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Hunting_UluMulu);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Bow);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_CrossBow);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Fists);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_OneHanded);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_TwoHanded);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Pickpocket);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Mining);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Picklock);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Orcish);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Sneak);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Acrobatics);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Wallclimbing);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Diving);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Mage_Circle);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Crafting_Blacksmith);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Crafting_Inscription);
    default TagsToRemove.AddTag(GameplayTag::GE_Skill_Crafting_Alchemy);

    default MaxHealth = 100;
    default MaxMana = 10;
    default Strength = 10;
    default Dexterity = 10;
    default Toughness = 20;
    default Experience = 0;
    default Level = 1;
    default SkillPoints = 0;
    default MaxSuperArmor = 20;
}

UCLASS()
class UStartPreset : URemoveAllEffectsPreset
{
    default EffectsToApply.Add(UGE_Skill_Melee_Fists_Untrained);
    default EffectsToApply.Add(UGE_Skill_Melee_Orc_Untrained);
    default EffectsToApply.Add(UGE_Skill_Melee_OneHanded_Untrained);
    default EffectsToApply.Add(UGE_Skill_Melee_TwoHanded_Untrained);
    default EffectsToApply.Add(UGE_Skill_Ranged_Bow_Untrained);
    default EffectsToApply.Add(UGE_Skill_Ranged_Crossbow_Untrained);
    default EffectsToApply.Add(UGE_Skill_Pickpocket_Untrained);
    default EffectsToApply.Add(UGE_Skill_Picklock_Untrained);
    default EffectsToApply.Add(UGE_Skill_Mining_Untrained);
    default EffectsToApply.Add(UGE_Skill_Mage_Circle_Untrained);
    default EffectsToApply.Add(UGE_Skill_Crafting_Blacksmith_Untrained);
    default EffectsToApply.Add(UGE_Skill_Orcish_Untrained);

    default MaxHealth = 40;
    default MaxMana = 10;
    default Strength = 10;
    default Dexterity = 10;
    default Toughness = 20;
    default Experience = 0;
    default Level = 1;
    default SkillPoints = 0;
    default MaxSuperArmor = 20;
}

UCLASS()
class UEarlyPreset : URemoveAllEffectsPreset
{
    default EffectsToApply.Add(UGE_Skill_Melee_Fists_Untrained);
    default EffectsToApply.Add(UGE_Skill_Melee_Orc_Untrained);
    default EffectsToApply.Add(UGE_Skill_Melee_OneHanded_Trained);
    default EffectsToApply.Add(UGE_Skill_Melee_TwoHanded_Untrained);
    default EffectsToApply.Add(UGE_Skill_Ranged_Bow_Trained);
    default EffectsToApply.Add(UGE_Skill_Ranged_Crossbow_Untrained);
    default EffectsToApply.Add(UGE_Skill_Pickpocket_Untrained);
    default EffectsToApply.Add(UGE_Skill_Picklock_Untrained);
    default EffectsToApply.Add(UGE_Skill_Mining_Untrained);
    default EffectsToApply.Add(UGE_Skill_Mage_Circle_Untrained);
    default EffectsToApply.Add(UGE_Skill_Crafting_Blacksmith_Untrained);
    default EffectsToApply.Add(UGE_Skill_Orcish_Untrained);

    default EffectsToApply.Add(UGE_Skill_Hunting_Claw_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Teeth_Trained);

    default MaxHealth = 88;
    default MaxMana = 10;
    default Strength = 24;
    default Dexterity = 14;
    default Toughness = 20;
    default Experience = 0;
    default Level = 4;
    default SkillPoints = 0;
    default MaxSuperArmor = 20;
}

UCLASS()
class UMidPreset : URemoveAllEffectsPreset
{
    default EffectsToApply.Add(UGE_Skill_Melee_Fists_Trained);
    default EffectsToApply.Add(UGE_Skill_Melee_Orc_Trained);
    default EffectsToApply.Add(UGE_Skill_Melee_OneHanded_Trained);
    default EffectsToApply.Add(UGE_Skill_Melee_TwoHanded_Trained);
    default EffectsToApply.Add(UGE_Skill_Ranged_Bow_Trained);
    default EffectsToApply.Add(UGE_Skill_Ranged_Crossbow_Trained);
    default EffectsToApply.Add(UGE_Skill_Pickpocket_Skilled);
    default EffectsToApply.Add(UGE_Skill_Picklock_Skilled);
    default EffectsToApply.Add(UGE_Skill_Mining_Skilled);
    default EffectsToApply.Add(UGE_Skill_Mage_Circle_3);
    default EffectsToApply.Add(UGE_Skill_Crafting_Blacksmith_Trained);
    default EffectsToApply.Add(UGE_Skill_Orcish_Skilled);

    default EffectsToApply.Add(UGE_Skill_Diving);
    default EffectsToApply.Add(UGE_Skill_Acrobatics);
    default EffectsToApply.Add(UGE_Skill_Sneak);

    default EffectsToApply.Add(UGE_Skill_Hunting_Claw_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Skin_Trained);

    default MaxHealth = 340;
    default MaxMana = 100;
    default Strength = 50;
    default Dexterity = 25;
    default Toughness = 475;
    default Experience = 500;
    default Level = 25;
    default SkillPoints = 500;
    default MaxSuperArmor = 40;
}

UCLASS()
class UEndgamePreset : URemoveAllEffectsPreset
{
    default EffectsToApply.Add(UGE_Skill_Melee_Fists_Master);
    default EffectsToApply.Add(UGE_Skill_Melee_Orc_Master);
    default EffectsToApply.Add(UGE_Skill_Melee_OneHanded_Master);
    default EffectsToApply.Add(UGE_Skill_Melee_TwoHanded_Master);
    default EffectsToApply.Add(UGE_Skill_Ranged_Bow_Master);
    default EffectsToApply.Add(UGE_Skill_Ranged_Crossbow_Master);
    default EffectsToApply.Add(UGE_Skill_Pickpocket_Master);
    default EffectsToApply.Add(UGE_Skill_Picklock_Master);
    default EffectsToApply.Add(UGE_Skill_Mining_Master);
    default EffectsToApply.Add(UGE_Skill_Mage_Circle_6);
    default EffectsToApply.Add(UGE_Skill_Crafting_Blacksmith_Master);
    default EffectsToApply.Add(UGE_Skill_Orcish_Master);

    default EffectsToApply.Add(UGE_Skill_Diving);
    default EffectsToApply.Add(UGE_Skill_Acrobatics);
    default EffectsToApply.Add(UGE_Skill_Sneak);
    default EffectsToApply.Add(UGE_Skill_Wallclimbing);

    default EffectsToApply.Add(UGE_Skill_Crafting_Inscription);
    default EffectsToApply.Add(UGE_Skill_Crafting_Alchemy);

    default EffectsToApply.Add(UGE_Skill_Hunting_Claw_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Skin_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Teeth_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Scutes_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Organ_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Fins_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Secretion_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Fur_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_UluMulu_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Spines_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_SkullArmor_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_TongueOfFire_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Stings_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_MandibleMineCrawler_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_MCPlate_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_SkinSwampshark_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_TeethSwampshark_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_StingsBloodfly_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_ShadowbeastHorn_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_TrollHorn_Trained);

    default MaxHealth = 460;
    default MaxMana = 200;
    default Strength = 80;
    default Dexterity = 70;
    default Toughness = 50;
    default Experience = 999;
    default Level = 35;
    default SkillPoints = 999;
    default MaxSuperArmor = 125;
}

UCLASS()
class UGodPreset : URemoveAllEffectsPreset
{
    default EffectsToApply.Add(UGE_Skill_Melee_Fists_Master);
    default EffectsToApply.Add(UGE_Skill_Melee_Orc_Master);
    default EffectsToApply.Add(UGE_Skill_Melee_OneHanded_Master);
    default EffectsToApply.Add(UGE_Skill_Melee_TwoHanded_Master);
    default EffectsToApply.Add(UGE_Skill_Ranged_Bow_Master);
    default EffectsToApply.Add(UGE_Skill_Ranged_Crossbow_Master);
    default EffectsToApply.Add(UGE_Skill_Pickpocket_Master);
    default EffectsToApply.Add(UGE_Skill_Picklock_Master);
    default EffectsToApply.Add(UGE_Skill_Mining_Master);
    default EffectsToApply.Add(UGE_Skill_Mage_Circle_6);
    default EffectsToApply.Add(UGE_Skill_Crafting_Blacksmith_Master);
    default EffectsToApply.Add(UGE_Skill_Orcish_Master);

     default EffectsToApply.Add(UGE_Skill_Diving);
    default EffectsToApply.Add(UGE_Skill_Acrobatics);
    default EffectsToApply.Add(UGE_Skill_Sneak);
    default EffectsToApply.Add(UGE_Skill_Wallclimbing);

    default EffectsToApply.Add(UGE_Skill_Crafting_Inscription);
    default EffectsToApply.Add(UGE_Skill_Crafting_Alchemy);
    
    default EffectsToApply.Add(UGE_Skill_Hunting_Claw_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Skin_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Teeth_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Scutes_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Organ_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Fins_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Secretion_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Fur_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_UluMulu_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Spines_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_SkullArmor_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_TongueOfFire_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Stings_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_MandibleMineCrawler_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_MCPlate_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_SkinSwampshark_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_TeethSwampshark_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_StingsBloodfly_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_ShadowbeastHorn_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_TrollHorn_Trained);
    default EffectsToApply.Add(UGE_Skill_Riding);
    


    default MaxHealth = 99999;
    default MaxMana = 99999;
    default Strength = 100;
    default Dexterity = 100;
    default Toughness = 999;
    default Experience = 999;
    default Level = 999;
    default SkillPoints = 999;
    default MaxSuperArmor = 100000;
}

UCLASS()
class UWarriorPreset : URemoveAllEffectsPreset
{
    //default EffectsToApply.Add(UGE_Skill_Melee_OneHanded_Trained);
    default EffectsToApply.Add(UGE_Skill_Melee_TwoHanded_Trained);
    //default EffectsToApply.Add(UGE_Skill_Ranged_Bow_Trained);
    //default EffectsToApply.Add(UGE_Skill_Ranged_Crossbow_Trained);
    default EffectsToApply.Add(UGE_Skill_Pickpocket_Skilled);
    default EffectsToApply.Add(UGE_Skill_Picklock_Skilled);
    default EffectsToApply.Add(UGE_Skill_Mining_Skilled);
    //default EffectsToApply.Add(UGE_Skill_Mage_Circle_3);
    default EffectsToApply.Add(UGE_Skill_Crafting_Blacksmith_Trained);
    default EffectsToApply.Add(UGE_Skill_Orcish_Skilled);

    default EffectsToApply.Add(UGE_Skill_Diving);
    default EffectsToApply.Add(UGE_Skill_Acrobatics);
    default EffectsToApply.Add(UGE_Skill_Sneak);

    default EffectsToApply.Add(UGE_Skill_Hunting_Claw_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Skin_Trained);

    default MaxHealth = 124;
    default MaxMana = 5;
    default Strength = 36;
    default Dexterity = 10;
    default Toughness = 34;
    default Experience = 500;
    default Level = 7;
    default SkillPoints = 70;
    default MaxSuperArmor = 41;
}

UCLASS()
class UMagePreset : URemoveAllEffectsPreset
{
    //default EffectsToApply.Add(UGE_Skill_Melee_OneHanded_Trained);
    //default EffectsToApply.Add(UGE_Skill_Melee_TwoHanded_Trained);
    //default EffectsToApply.Add(UGE_Skill_Ranged_Bow_Trained);
    //default EffectsToApply.Add(UGE_Skill_Ranged_Crossbow_Trained);
    default EffectsToApply.Add(UGE_Skill_Pickpocket_Skilled);
    default EffectsToApply.Add(UGE_Skill_Picklock_Skilled);
    default EffectsToApply.Add(UGE_Skill_Mining_Skilled);
    default EffectsToApply.Add(UGE_Skill_Mage_Circle_6);
    default EffectsToApply.Add(UGE_Skill_Crafting_Blacksmith_Trained);
    default EffectsToApply.Add(UGE_Skill_Orcish_Skilled);

    default EffectsToApply.Add(UGE_Skill_Diving);
    default EffectsToApply.Add(UGE_Skill_Acrobatics);
    default EffectsToApply.Add(UGE_Skill_Sneak);

    default EffectsToApply.Add(UGE_Skill_Hunting_Claw_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Skin_Trained);

    default MaxHealth = 124;
    default MaxMana = 100;
    default Strength = 10;
    default Dexterity = 10;
    default Toughness = 34;
    default Experience = 500;
    default Level = 20;
    default SkillPoints = 70;
    default MaxSuperArmor = 41;
}

UCLASS()
class URoguePreset : URemoveAllEffectsPreset
{
    default EffectsToApply.Add(UGE_Skill_Melee_OneHanded_Trained);
    //default EffectsToApply.Add(UGE_Skill_Melee_TwoHanded_Trained);
    default EffectsToApply.Add(UGE_Skill_Ranged_Bow_Trained);
    //default EffectsToApply.Add(UGE_Skill_Ranged_Crossbow_Trained);
    default EffectsToApply.Add(UGE_Skill_Pickpocket_Skilled);
    default EffectsToApply.Add(UGE_Skill_Picklock_Skilled);
    default EffectsToApply.Add(UGE_Skill_Mining_Skilled);
    //default EffectsToApply.Add(UGE_Skill_Mage_Circle_3);
    default EffectsToApply.Add(UGE_Skill_Crafting_Blacksmith_Trained);
    default EffectsToApply.Add(UGE_Skill_Orcish_Skilled);

    default EffectsToApply.Add(UGE_Skill_Diving);
    default EffectsToApply.Add(UGE_Skill_Acrobatics);
    default EffectsToApply.Add(UGE_Skill_Sneak);

    default EffectsToApply.Add(UGE_Skill_Hunting_Claw_Trained);
    default EffectsToApply.Add(UGE_Skill_Hunting_Skin_Trained);

    default MaxHealth = 124;
    default MaxMana = 5;
    default Strength = 15;
    default Dexterity = 25;
    default Toughness = 34;
    default Experience = 500;
    default Level = 7;
    default SkillPoints = 70;
    default MaxSuperArmor = 41;
}