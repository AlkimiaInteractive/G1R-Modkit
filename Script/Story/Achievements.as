#ifdef WITH_STORY_G1R

UCLASS()
class UGothicAchievement_CompleteChapter : UGothicAchievement
{
    default RequiredMemoryTag = GameplayTag::Memory_Chapter_Completed;
    
    UClass RequiredClass = G1R::UStoryG1R;
	int32 Chapter = 0;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        if (!CanBeUnlocked(LongTermMemoryComponent))
            return 0;
        

        if (LongTermMemoryComponent.Filter().WithTag(RequiredMemoryTag).WithMagnitude(float(Chapter)).WithClass(RequiredClass).Count == 0)
            return 0;

        return 1;
    }
    
    UFUNCTION()
    bool CanBeUnlocked(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        return true;
    }
}


UCLASS()
class UGothicAchievement_UnlockWithRequiredMemory : UGothicAchievement
{
    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        return LongTermMemoryComponent.Filter().WithTag(RequiredMemoryTag).Count;
    }
}

UCLASS()
class UGothicAchievement_JoinGuild : UGothicAchievement
{
    default RequiredMemoryTag = GameplayTag::Memory_Guild_Joined;
    FGameplayTag GuildTag = FGameplayTag::Empty;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        if(LongTermMemoryComponent.Filter().WithTag(RequiredMemoryTag).WithTag(GuildTag).Count == 0)
            return 0;

        return 1;
    }   
}

UCLASS()
class UGothicAchievement_LessonsLearned : UGothicAchievement
{
    default RequiredMemoryTag = GameplayTag::Memory_Learned_Skill;
    FGameplayTagContainer RequiredSkills;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        int32 ObtainedSkills = 0;

        auto CharacterState = LongTermMemoryComponent.GetOwningCharacterState();

        if (!IsValid(CharacterState))
            return 0;

        FGameplayTagContainer PlayerSkills = GetSkillTags(CharacterState);

        for (FGameplayTag Skill : RequiredSkills.GameplayTags)
        {
            if(CheckForSkill(PlayerSkills, Skill))
            {
                ObtainedSkills++;
            }
        }

        return ObtainedSkills;
    }

    FGameplayTagContainer GetSkillTags(AGothicCharacterState CharacterState) const
    {
        FGameplayTagContainer SkillTagFilter = GameplayTag::Skill.SingleTagContainer;

        auto AbilitySystemComponent = CharacterState.AbilitySystemComponent;

        FGameplayTagContainer PotentialSkilltags;
        AbilitySystemComponent.GetOwnedGameplayTags(PotentialSkilltags);

        return PotentialSkilltags.Filter(SkillTagFilter);
    }

    bool CheckForSkill(FGameplayTagContainer Skilltags, FGameplayTag SkillTag) const
    {
        if (Skilltags.HasTag(SkillTag))
            return true;

        FString SkillTagString = SkillTag.ToString();
        TArray<FString> Parts;
        SkillTagString.ParseIntoArray(Parts, ".");

        if(Parts.Contains("Trained"))
        {
            FGameplayTagContainer Filter = SkillTag.RequestDirectParent().SingleTagContainer;
            FGameplayTagContainer PotentiallyMasterSkill = Skilltags.Filter(Filter);

            for (FGameplayTag PotentialMasterSkillTag : PotentiallyMasterSkill.GameplayTags)
            {
                FString MasterSkillTagString = PotentialMasterSkillTag.ToString();
                TArray<FString> MasterSkillTagStringParts;
                MasterSkillTagString.ParseIntoArray(MasterSkillTagStringParts, ".");

                if(MasterSkillTagStringParts.Contains("Master"))
                    return true;
            }
        } 

        if(Parts.Contains("Mage") && Parts.Contains("Circle"))
        {
            if(Parts.Contains("First"))
            {
                if(Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Second) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Third) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Fourth) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Fifth) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Sixth))
                    return true;
            }

            if(Parts.Contains("Second"))
            {
                if(Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Third) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Fourth) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Fifth) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Sixth))
                    return true;
            }

            if(Parts.Contains("Third"))
            {
                if(Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Fourth) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Fifth) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Sixth))
                    return true;
            }

            if(Parts.Contains("Fourth"))
            {
                if(Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Fifth) ||
                    Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Sixth))
                    return true;
            }

            if(Parts.Contains("Fifth"))
            {
                if(Skilltags.HasTag(GameplayTag::Skill_Mage_Circle_Sixth))
                    return true;
            }
        }

        return false;
    }
}

UCLASS()
class UGothicAchievement_LessonsLearned_Persistent : UGothicAchievement_LessonsLearned
{
    FGameplayTagContainer GetSkillTags(AGothicCharacterState CharacterState) const override
    {
        auto AchievementSystem = UGothicAchievementSubsystem::Get(CharacterState);

        if(IsValid(AchievementSystem))
        {
            return AchievementSystem.GetLearnedLessons();
        }

        return Super::GetSkillTags(CharacterState);
    }
}

UCLASS()
class UGothicAchievement_QuestSucceeded : UGothicAchievement
{
    default RequiredMemoryTag = GameplayTag::Memory_Quest_Succeeded;
    TArray<TSubclassOf<UQuest>> RequiredQuests;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {

        int32 SucceededQuests = 0;

        for (auto QuestClass : RequiredQuests)
        {
            if(LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Quest_Succeeded).WithClass(QuestClass).Count != 0)
            {
                SucceededQuests++;
            }
        }

        return SucceededQuests;
    }
}

UCLASS()
class UGothicAchievement_ItemsObtained : UGothicAchievement
{
    default RequiredMemoryTag = GameplayTag::Memory_Item_Obtained;
    TArray<TSubclassOf<UItemDefinition>> RequiredItems;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        int32 ObtainedItems = 0;

        for (TSubclassOf<UItemDefinition> Item : RequiredItems)
        {
            if(LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Item_Obtained).WithClass(Item).Count != 0)
            {
                ObtainedItems++;
            }
        }

        return ObtainedItems;
    }
}

UCLASS()
class UGothicAchievement_ItemsCrafted : UGothicAchievement
{
    default RequiredMemoryTag = GameplayTag::Memory_Item_Crafted;
    FGameplayTagContainer ConsideredItemTypes;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        int32 CraftedItems = 0;

        for (auto MemorizedEvent : LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Item_Crafted).Array)
        {
            auto ObtionalClass = MemorizedEvent.OptionalClass1.Get();

            if(!IsValid(ObtionalClass))
                continue;

            FString ClassName = ObtionalClass.Get().Name.ToString();
            TArray<FString> Parts;
            ClassName.ParseIntoArray(Parts, "_");

            if(Parts.Contains("Smith"))
                continue; 

            auto ItemDefinition = Cast<UItemDefinition>(ObtionalClass.DefaultObject);

            if(!IsValid(ItemDefinition))
                continue;

            if (ConsideredItemTypes.IsEmpty() || ItemDefinition.ItemType.MatchesAny(ConsideredItemTypes))
            {
                CraftedItems += Math::FloorToInt(MemorizedEvent.Magnitude);
            }                      
        }

        return CraftedItems;
    }
}


UCLASS()
class UGothicAchievement_Story01 : UGothicAchievement_CompleteChapter
{
    default Id = "ACH_STORY_01";
	default Description = "Complete Chapter 2";
    default Chapter = 2;
}

UCLASS()
class UGothicAchievement_Story02 : UGothicAchievement_CompleteChapter
{
    default Id = "ACH_STORY_02";
	default Description = "Complete Chapter 3";
    default Chapter = 3;
}

UCLASS()
class UGothicAchievement_Story03 : UGothicAchievement_CompleteChapter
{
    default Id = "ACH_STORY_03";
	default Description = "Complete Chapter 4";
    default Chapter = 4;
}

UCLASS()
class UGothicAchievement_Story04 : UGothicAchievement_CompleteChapter
{
    default Id = "ACH_STORY_04";
	default Description = "Complete Chapter 5";
    default Chapter = 5;
}

UCLASS()
class UGothicAchievement_Story05 : UGothicAchievement_CompleteChapter
{
    default Id = "ACH_STORY_05";
	default Description = "Complete Chapter 6";
    default Chapter = 6;
}

UCLASS()
class UGothicAchievement_Story06 : UGothicAchievement
{
    default Id = "ACH_STORY_06";
	default Description = "Enter the Sleeper Temple";
    
    default RequiredMemoryTag = GameplayTag::Area_SleeperTemple;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        if (LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Area_Entered).WithTag(GameplayTag::Area_SleeperTemple).Count != 0)
        {
            return 1;
        }
        
        return 0;
    }
}

// // ------- COMPLETIST ACHIEVEMENTS -------- 

UCLASS()
class UGothicAchievement_Camp_01 : UGothicAchievement_JoinGuild
{
    default Id = "ACH_Camp_01";
	default Description = "Join Old Camp";

    default GuildTag = GameplayTag::Guild_Human_OldCamp;
}

UCLASS()
class UGothicAchievement_Camp_02 : UGothicAchievement_JoinGuild
{
    default Id = "ACH_Camp_02";
	default Description = "Join New Camp";
    default GuildTag = GameplayTag::Guild_Human_NewCamp;
}

UCLASS()
class UGothicAchievement_Camp_03 : UGothicAchievement_JoinGuild
{
    default Id = "ACH_Camp_03";
	default Description = "Join Swamp Camp";
    default GuildTag = GameplayTag::Guild_Human_SwampCamp;
}

UCLASS()
class UGothicAchievement_Rank_01 : UGothicAchievement
{
    default Id = "ACH_Rank_01";
	default Description = "Rank up in any guild";
    default RequiredMemoryTag = GameplayTag::Memory_Guild_Joined;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        FGameplayTagContainer RankedUpGuilds;
        RankedUpGuilds.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
        RankedUpGuilds.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
        RankedUpGuilds.AddTag(GameplayTag::Guild_Human_NewCamp_Mercenary);
        RankedUpGuilds.AddTag(GameplayTag::Guild_Human_NewCamp_WaterMage);
        RankedUpGuilds.AddTag(GameplayTag::Guild_Human_SwampCamp_Templar);

        if(LongTermMemoryComponent.Filter().WithTag(RequiredMemoryTag).HavingAnyMatchingTag(RankedUpGuilds).Count == 0)
            return 0;

        return 1;
    }
}

UCLASS()
class UGothicAchievement_Maps_01 : UGothicAchievement_ItemsObtained
{
    default Id = "ACH_Maps_01";
    default StatId = "STAT_Maps_01";
    default Description = "Get all the Maps";
    default MaxAmount = 12;
    
    default RequiredItems.Add(UItWr_Map_Cliff);
    default RequiredItems.Add(UItWr_Map_Focus);
    default RequiredItems.Add(UItWr_Map_NewCamp);
    default RequiredItems.Add(UItWr_Map_OldCamp);
    default RequiredItems.Add(UItWr_Map_OldMine);
    default RequiredItems.Add(UItWr_Map_OldMineSC);
    default RequiredItems.Add(UItWr_Map_Orc);
    default RequiredItems.Add(UItWr_Map_SwampCamp);
    default RequiredItems.Add(UItWr_Map_Temple);
    default RequiredItems.Add(UItWr_Map_World);
    default RequiredItems.Add(UItWr_Map_WorldComplete);
    default RequiredItems.Add(UItWr_Map_Lighthouse);
}

UCLASS()
class UGothicAchievement_Weapons_01 : UGothicAchievement_LessonsLearned
{
    default Id = "ACH_Weapons_01";
    default StatId = "STAT_Weapons_01";
    default Description = "Get master in all Melee Weapons";
    default MaxAmount = 4.0f;

    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_Fists_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_Orc_Master);
}

UCLASS()
class UGothicAchievement_Weapons_02 : UGothicAchievement_LessonsLearned
{
    default Id = "ACH_Weapons_02";
    default StatId = "STAT_Weapons_02";
    default Description = "Get master in all Ranged Weapons";
    default MaxAmount = 2.0f;

    default RequiredSkills.AddTag(GameplayTag::Skill_Ranged_Bow_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Ranged_Crossbow_Master);
}

UCLASS()
class UGothicAchievement_Mage_01 : UGothicAchievement_LessonsLearned
{
    default Id = "ACH_Mage_01";
    default Description = "Get the 6th Magic Circle";

    default RequiredSkills.AddTag(GameplayTag::Skill_Mage_Circle_Sixth);
}

UCLASS()
class UGothicAchievement_Armor_01 : UGothicAchievement_ItemsObtained
{
    default Id = "ACH_Armor_01";
    default Description = "Get Ore Amor";
    default RequiredItems.Add(UOre_Armor_M);
}

UCLASS()
class UGothicAchievement_Armor_02 : UGothicAchievement
{
    default Id = "ACH_Armor_02";
    default Description = "Get all the mods for an Armor";
    default RequiredMemoryTag = GameplayTag::Memory_ArmorUpgrade;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        auto ArmorUpgradeMemory = LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_ArmorUpgrade).Array;

        for (auto MemoryEvent : ArmorUpgradeMemory)
        {
            FBoughtArmorUpgrades EventData;
            MemoryEvent.Payload.Get(EventData);

            bool bFoundMissingUpgrade = false;
            for(auto Upgrade : EventData.AvailableUpgrades)
            {
                if(!EventData.BoughtUpgrades.Contains(Upgrade))
                {
                    bFoundMissingUpgrade = true;
                    break;
                }
            }

            if(!bFoundMissingUpgrade)
                return 1;
        }
        
        return 0;
    }
}

UCLASS()
class UGothicAchievement_Mage_02 : UGothicAchievement
{
    default Id = "ACH_Mage_02";
    default StatId = "STAT_Mage_02";
    default Description = "Transform in all creatures";
    default RequiredMemoryTag = GameplayTag::Memory_Transformation;
    default MaxAmount = 17;

    FGameplayTagContainer RequiredSpeciesTags;
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Meatbug);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Scavenger);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Molerat);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Bloodfly);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Wolf);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Lizard);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Lizard_Fire);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Orcdog);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Minecrawler);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Snapper);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Biter);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Razor);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Bloodhound);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Harpy);
    default RequiredSpeciesTags.AddTag(GameplayTag::Species_Creature_Swampshark);

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        int32 PerformedTransformations = 0;

        for (FGameplayTag Skill : RequiredSpeciesTags.GameplayTags)
        {
            if(LongTermMemoryComponent.Filter().WithTagExact(RequiredMemoryTag).WithTagExact(Skill).Count != 0)
            {
                PerformedTransformations++;
            }
        }

        return PerformedTransformations;
    }

}

UCLASS()
class UGothicAchievement_Thief_01 : UGothicAchievement_UnlockWithRequiredMemory
{
    default Id = "ACH_Thief_01";
    default StatId = "STAT_Thief_01";
    default Description = "Pickpocket from 20 Characters";
    
    default RequiredMemoryTag = GameplayTag::Memory_Crime_Pickpocket;
    default MaxAmount = 20;
}

UCLASS()
class UGothicAchievement_Thief_02 : UGothicAchievement_UnlockWithRequiredMemory
{
    default Id = "ACH_Thief_02";
    default StatId = "STAT_Thief_02";
    default Description = "Unlock 20 locks with lockpicking";
    
    default RequiredMemoryTag = GameplayTag::Memory_Crime_Lockpick;
    default MaxAmount = 20;
}

UCLASS()
class UGothicAchievement_Crafter_01 : UGothicAchievement_ItemsCrafted
{
    default Id = "ACH_Crafter_01";
    default Description = "Craft your first item";
}


UCLASS()
class UGothicAchievement_All : UGothicAchievement
{
    default Id = "ACH_All";
    default Description = "Get all achievements";

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        auto PendingAchievements =  UGothicAchievementSubsystem::Get(LongTermMemoryComponent.Owner).PendingAchievements;
        
        for (UGothicAchievement Achievement : PendingAchievements)
        {
            if(Achievement.Id != "ACH_All" && Achievement.Id != "ACH_AllPlus")
                return 0;
        }

        return 1;

    }
}

UCLASS()
class UGothicAchievement_AllPlus : UGothicAchievement
{
    default Id = "ACH_AllPlus";
    default Description = "Get all achievements";

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        auto AchievementSystem = UGothicAchievementSubsystem::Get(LongTermMemoryComponent.Owner);

        if(!AchievementSystem.IsDemoAchievementUnlocked())
                return 0;

        auto PendingAchievements =  AchievementSystem.PendingAchievements;
        
        for (UGothicAchievement Achievement : PendingAchievements)
        {
            if(Achievement.Id != "ACH_All" && Achievement.Id != "ACH_AllPlus")
                return 0;
        }

        return 1;

    }
}

// // ------- HIDDEN ACHIEVEMENTS -------- 

UCLASS()
class UGothicAchievement_Secret01 : UGothicAchievement
{
    default Id = "ACH_Secret_01";
    default Description = "Sneak in the Old Camp from chapter 4";
    default RequiredMemoryTag = GameplayTag::Memory_Area_Entered;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        auto CompletedChapter3Memory = LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Chapter_Completed).WithMagnitude(3).ArrayNewestToOldest;

        if(CompletedChapter3Memory.IsEmpty())
            return 0;

        auto CompletedChapter3Time = CompletedChapter3Memory.Last().Time;

        if (LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Area_Entered).WithTag(GameplayTag::Area_OldCamp_Castle).AfterTime(CompletedChapter3Time).Count != 0)
        {
            return 1;
        }

        return 0;
    }
}

UCLASS()
class UGothicAchievement_Secret02 : UGothicAchievement
{
    default Id = "ACH_Secret_02";
    default Description = "Visit Xardas room";
    default RequiredMemoryTag = GameplayTag::Area_XardasTower_Bedroom;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        if (LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Area_Entered).WithTag(GameplayTag::Area_XardasTower_Bedroom).Count != 0)
        {
            return 1;
        }
        
        return 0;
    }
}

UCLASS()
class UGothicAchievement_Story07 : UGothicAchievement_LessonsLearned
{
    default Id = "ACH_Story_07";
    default Description = "Learn orcish Level 2";

    default RequiredSkills.AddTag(GameplayTag::Skill_Orcish_Master);
}

UCLASS()
class UGothicAchievement_Story08 : UGothicAchievement_QuestSucceeded
{
    default Id = "ACH_Story_08";
    default Description = "Complete 'Escape Plan' Quest";

    default RequiredQuests.Add(G1R::Quest::UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN);
}

UCLASS()
class UGothicAchievement_Story11 : UGothicAchievement
{
    default Id = "ACH_Story_11";
    default Description = "Spare Gomez's life";
    default RequiredMemoryTag = GameplayTag::Memory_StoryEvent;
    FName StoryEventName = n"GomezEscaped";

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        auto Memories = LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_StoryEvent).Array;

        for (auto Memory : Memories)
        {
            FStoryEventPayload EventData;
            Memory.Payload.Get(EventData);

            if (EventData.EventName == StoryEventName)
                return 1;
        }

        return 0;
    }
}
// // ------- CHALLENGE ACHIEVEMENTS -------- 


UCLASS()
class UGothicAchievement_Fight_01 : UGothicAchievement
{
    default Id = "ACH_Fight_01";
    default StatId = "STAT_Fight_01";
    default Description = "Defeat 10 enemies using your fists";
    default RequiredMemoryTag = GameplayTag::Memory_Character_Defeated;
    default MaxAmount = 10;
        

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        AGothicCharacter OwnerCharacter = LongTermMemoryComponent.OwningCharacterState.Character;

        if(!IsValid(OwnerCharacter))
            return 0;

        TArray<FName> DefeatedCharacters;

        for (auto MemoryEvent : LongTermMemoryComponent.Filter().WithTag(GameplayTag::Item_Weapon_Fist).WithTag(GameplayTag::Memory_Character_Defeated).Array)
        {
            if(MemoryEvent.EventTags.HasTag(GameplayTag::Memory_Execution))
                continue;

            if (MemoryEvent.AffectedCharacterGlobalId == OwnerCharacter.CharacterGlobalId)
                continue;

            if(DefeatedCharacters.Contains(MemoryEvent.AffectedCharacterGlobalId))
                continue;

            DefeatedCharacters.Add(MemoryEvent.AffectedCharacterGlobalId);
        }

        return DefeatedCharacters.Num();
    }
}

UCLASS()
class UGothicAchievement_Crafter_02 : UGothicAchievement_ItemsCrafted
{
    default Id = "ACH_Crafter_02";
    default StatId = "STAT_Crafter_02";
    default Description = "Craft 5 weapons";
    
    default ConsideredItemTypes.AddTag(GameplayTag::Item_Weapon_Axe);
    default ConsideredItemTypes.AddTag(GameplayTag::Item_Weapon_Sword);
    default ConsideredItemTypes.AddTag(GameplayTag::Item_Weapon_Mace);
    default ConsideredItemTypes.AddTag(GameplayTag::Item_Weapon_Bow);
    default ConsideredItemTypes.AddTag(GameplayTag::Item_Weapon_Crossbow);
    default ConsideredItemTypes.AddTag(GameplayTag::Item_Weapon_Orc);
    default MaxAmount = 5.0f;
}

UCLASS()
class UGothicAchievement_Crafter_03 : UGothicAchievement_ItemsCrafted
{
    default Id = "ACH_Crafter_03";
    default StatId = "STAT_Crafter_03";
    default Description = "Craft 10 potions";
    
    default ConsideredItemTypes.AddTag(GameplayTag::Item_Potion);
    default MaxAmount = 10;
}

UCLASS()
class UGothicAchievement_Crafter_04 : UGothicAchievement_ItemsCrafted
{
    default Id = "ACH_Crafter_04";
    default StatId = "STAT_Crafter_04";
    default Description = "Craft 1 Scroll";
    default ConsideredItemTypes.AddTag(GameplayTag::Item_Weapon_Scroll);
}

UCLASS()
class UGothicAchievement_Story_09 : UGothicAchievement_QuestSucceeded
{
    default Id = "ACH_Story_09";
    default StatId = "STAT_Story_09";
    
    default Description = "Complete Cavalorn Books Quests";
    default MaxAmount = 5.0f;

    default RequiredQuests.Add(G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1);
    default RequiredQuests.Add(G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2);
    default RequiredQuests.Add(G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3);
    default RequiredQuests.Add(G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_4);
    default RequiredQuests.Add(G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_5);
}

UCLASS()
class UGothicAchievement_Story_10 : UGothicAchievement_QuestSucceeded
{
    
    default Id = "ACH_Story_10";
    default Description = "Complete Chromanin Quests";

    default RequiredQuests.Add(G1R::Quest::UQuest_ValleyOfMines_CHROMANIN);
}

UCLASS()
class UGothicAchievement_Mage_03 : UGothicAchievement
{
    default Id = "ACH_Mage_03";
    default Description = "Deal the 3 elemental damage types to the same enemy";
    default RequiredMemoryTag = GameplayTag::Memory_Character_Debuffed;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        auto DebuffEvents = LongTermMemoryComponent.Filter().WithTag(RequiredMemoryTag).WithTag(GameplayTag::Debuff).Array;
        TArray<FName> DebuffedCharacters;

        for (auto Event : DebuffEvents)
        {
            DebuffedCharacters.Add(Event.AffectedCharacterGlobalId);
        }

        for (auto CharacterName : DebuffedCharacters)
        {
            FInGameTime EarliestDebuff;
            FInGameTime LatestDebuff;

            auto BurnEvents = LongTermMemoryComponent.Filter().WithTag(RequiredMemoryTag).Affecting(CharacterName).WithTag(GameplayTag::Debuff_Burn).ArrayNewestToOldest;
            
            if(BurnEvents.IsEmpty())
                continue;

            EarliestDebuff = BurnEvents[0].Time;
            LatestDebuff = BurnEvents[0].Time;

            auto FreezeEvents = LongTermMemoryComponent.Filter().WithTag(RequiredMemoryTag).Affecting(CharacterName).WithTag(GameplayTag::Debuff_Freeze).ArrayNewestToOldest;
            
            if(FreezeEvents.IsEmpty())
                continue;

            EarliestDebuff = FreezeEvents[0].Time < EarliestDebuff ? FreezeEvents[0].Time : EarliestDebuff;
            LatestDebuff = FreezeEvents[0].Time > LatestDebuff ? FreezeEvents[0].Time : LatestDebuff;

            auto ElectrifiedEvents = LongTermMemoryComponent.Filter().WithTag(RequiredMemoryTag).Affecting(CharacterName).WithTag(GameplayTag::Debuff_Electrified).ArrayNewestToOldest;
            
            if(ElectrifiedEvents.IsEmpty())
                continue;

            EarliestDebuff = ElectrifiedEvents[0].Time < EarliestDebuff ? ElectrifiedEvents[0].Time : EarliestDebuff;
            LatestDebuff = ElectrifiedEvents[0].Time > LatestDebuff ? ElectrifiedEvents[0].Time : LatestDebuff;

            if(EarliestDebuff.Day != LatestDebuff.Day)
                continue;

            auto DefeatEvents = LongTermMemoryComponent.Filter().Affecting(CharacterName).WithTag(GameplayTag::Memory_Character_Defeated).BeforeTime(LatestDebuff).AfterTime(EarliestDebuff).ArrayNewestToOldest;

            if(DefeatEvents.IsEmpty())
                return 1;

        }

        return 0;
    }

}

UCLASS()
class UGothicAchievement_Funny_02 : UGothicAchievement
{
    default Id = "ACH_Funny_02";
    default Description = "Kill an enemy by falling damage";
    default RequiredMemoryTag = GameplayTag::Memory_Character_Defeated;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        AGothicCharacter OwnerCharacter = LongTermMemoryComponent.OwningCharacterState.Character;

        if(!IsValid(OwnerCharacter))
            return 0;
        
        auto DefeatedEvents = LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Character_Defeated)
            .WithTag(GameplayTag::Item_Weapon_Environment_Impact_Fall)
            .NotAffecting(OwnerCharacter.CharacterGlobalId)
            .CausedBy(OwnerCharacter.CharacterGlobalId).Array;
       
       for(auto Event : DefeatedEvents)
       {
        
            if (Event.AffectedCharacterGlobalId == Event.InstigatorGlobalId)
                continue;

            if (Event.EventTags.HasTag(GameplayTag::State_Transformed))
                continue;

            return 1;
       }

        return 0;
    }
}

UCLASS()
class UGothicAchievement_Fight_02 : UGothicAchievement
{
    default Id = "ACH_Fight_02";
    default Description = "Parry an enemy 5 times witout dodging or recieving damage.";
    default RequiredMemoryTag = GameplayTag::Memory_Combat_Parry;
    int32 RequiredParrySeries = 5;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        auto ParryEvents = LongTermMemoryComponent.Filter().WithTag(RequiredMemoryTag).Array;

        for (auto Event : ParryEvents)
        {
            if(Event.Magnitude >= 5)
                return 1;
        }

        return 0;
    }
}



UCLASS()
class UGothicAchievement_Teacher_01 : UGothicAchievement_LessonsLearned_Persistent
{
    default Id = "ACH_Teacher_01";
    default StatId = "STAT_Teacher_01";
    
    default Description = "Learn all the lessons";
    default MaxAmount = 46.0f;

    default RequiredMemoryTag = FGameplayTag();

    //Meele skills
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_Fists_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_Fists_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_Orc_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Melee_Orc_Master);

    //Ranged skills
    default RequiredSkills.AddTag(GameplayTag::Skill_Ranged_Bow_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Ranged_Bow_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Ranged_Crossbow_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Ranged_Crossbow_Master);

    //Magic skills
    default RequiredSkills.AddTag(GameplayTag::Skill_Mage_Circle_First);
    default RequiredSkills.AddTag(GameplayTag::Skill_Mage_Circle_Second);
    default RequiredSkills.AddTag(GameplayTag::Skill_Mage_Circle_Third);
    default RequiredSkills.AddTag(GameplayTag::Skill_Mage_Circle_Fourth);
    default RequiredSkills.AddTag(GameplayTag::Skill_Mage_Circle_Fifth);
    default RequiredSkills.AddTag(GameplayTag::Skill_Mage_Circle_Sixth);

    //Crime skills
    default RequiredSkills.AddTag(GameplayTag::Skill_Pickpocketing_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Pickpocketing_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Lockpicking_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Lockpicking_Trained);

    //Crafting skills
    default RequiredSkills.AddTag(GameplayTag::Skill_Crafting_Blacksmith_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Crafting_Blacksmith_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Crafting_Inscription);
    default RequiredSkills.AddTag(GameplayTag::Skill_Crafting_Alchemy);

    //Miscellaneous skills
    default RequiredSkills.AddTag(GameplayTag::Skill_Orcish_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Orcish_Master);
    default RequiredSkills.AddTag(GameplayTag::Skill_Diving_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Acrobatics_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_WallClimbing_Trained);
    default RequiredSkills.AddTag(GameplayTag::Skill_Riding);

    //Hunting skills (from NPCs)
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Teeth);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Fur);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Claw);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Skin);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_MCPlate);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Secretion);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_UluMulu);

    //Hunting skills (from Books)
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Stings);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_SkinSwampshark);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Spines);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_SkullArmor);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Scutes);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Fins);
    default RequiredSkills.AddTag(GameplayTag::Skill_Hunting_Organ);
}

UCLASS()
class UGothicAchievement_Ranged_01 : UGothicAchievement
{
    default Id = "ACH_Ranged_01";
    default StatId = "STAT_Ranged_01";
    default Description = "Kill 10 enemies by headshot";
    
    default RequiredMemoryTag = GameplayTag::Memory_Headshot;
    default MaxAmount = 10;
        
    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        AGothicCharacter OwnerCharacter = LongTermMemoryComponent.OwningCharacterState.Character;

        if(!IsValid(OwnerCharacter))
            return 0;

        TArray<FName> DefeatedCharacters;

        for (auto MemoryEvent : LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Headshot).Array)
        {
            if(DefeatedCharacters.Contains(MemoryEvent.AffectedCharacterGlobalId))
                continue;

            DefeatedCharacters.Add(MemoryEvent.AffectedCharacterGlobalId);
        }

        return DefeatedCharacters.Num();
    }
}

UCLASS()
class UGothicAchievement_Challenge_01 : UGothicAchievement_CompleteChapter
{
    default Id = "ACH_Challenge_01";
    default Description = "Complete the Game without sleeping";
    default Chapter = 6;

    bool CanBeUnlocked(ULongTermMemoryComponent LongTermMemoryComponent) const override
    {
        return LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Sleep).Count == 0;
    }
}

UCLASS()
class UGothicAchievement_Challenge_02 : UGothicAchievement_CompleteChapter
{
    default Id = "ACH_Challenge_02";
    default Description = "Complete the Game in permadeath mode";
    default Chapter = 6;

    bool CanBeUnlocked(ULongTermMemoryComponent LongTermMemoryComponent) const override
    {
        return UPersistentDataSubsystem::Get().CheckIsPermaDeath();
        //return UDifficultyManager::Get().PermaDeathState;
    }
}

// // ------- FUNNY ACHIEVEMENTS -------- 

UCLASS()
class UGothicAchievement_Funny_01 : UGothicAchievement
{
    default Id = "ACH_Funny_01";
    default StatId = "STAT_Funny_01";
    default Description = "Exaust all Mud dialogue options";
    default RequiredMemoryTag = GameplayTag::Memory_StoryEvent;

    default MaxAmount = 24.0f;

    TArray<FName> RequiredStoryEventNames;
    default RequiredStoryEventNames.Add(n"MudVoiceline1");
    default RequiredStoryEventNames.Add(n"MudVoiceline2");
    default RequiredStoryEventNames.Add(n"MudVoiceline3");
    default RequiredStoryEventNames.Add(n"MudVoiceline4");
    default RequiredStoryEventNames.Add(n"MudVoiceline5");
    default RequiredStoryEventNames.Add(n"MudVoiceline6");
    default RequiredStoryEventNames.Add(n"MudVoiceline7");
    default RequiredStoryEventNames.Add(n"MudVoiceline8");
    default RequiredStoryEventNames.Add(n"MudVoiceline9");
    default RequiredStoryEventNames.Add(n"MudVoiceline10");
    default RequiredStoryEventNames.Add(n"MudVoiceline11");
    default RequiredStoryEventNames.Add(n"MudVoiceline12");
    default RequiredStoryEventNames.Add(n"MudVoiceline13");
    default RequiredStoryEventNames.Add(n"MudVoiceline14");
    default RequiredStoryEventNames.Add(n"MudVoiceline15");
    default RequiredStoryEventNames.Add(n"MudVoiceline16");
    default RequiredStoryEventNames.Add(n"MudVoiceline17");
    default RequiredStoryEventNames.Add(n"MudVoiceline18");
    default RequiredStoryEventNames.Add(n"MudVoiceline19");
    default RequiredStoryEventNames.Add(n"MudVoiceline20");
    default RequiredStoryEventNames.Add(n"MudIn");
    default RequiredStoryEventNames.Add(n"MudOut");
    default RequiredStoryEventNames.Add(n"MudQuiet");
    default RequiredStoryEventNames.Add(n"MudGetLost");

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        auto Memories = LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_StoryEvent).Array;
        
        TArray<FName> FoundStoryEventNames;
        int32 MatchingEventNameCount = 0;

        for (auto Memory : Memories)
        {
            FStoryEventPayload EventData;
            Memory.Payload.Get(EventData);
            FoundStoryEventNames.Add(EventData.EventName);
        }

        for (FName EventName : RequiredStoryEventNames) 
        {
            if(FoundStoryEventNames.Contains(EventName))
            {
                MatchingEventNameCount += 1;
            }
        }

        return MatchingEventNameCount;
    }
}

UCLASS()
class UGothicAchievemenet_Hidden_01 : UGothicAchievement
{
    default Id = "ACH_Hidden_01";
    default StatId = "STAT_Hidden_01";
    default Description = "Read 10 books";
    
    default RequiredMemoryTag = GameplayTag::Memory_Document_Read;
    default MaxAmount = 10;

    UFUNCTION(BlueprintOverride)
    int32 GetProgress(ULongTermMemoryComponent LongTermMemoryComponent) const
    {
        TArray<UWritingDefinition> ReadBooks;

        for (auto MemorizedEvent : LongTermMemoryComponent.Filter().WithTag(GameplayTag::Memory_Document_Read).WithTag(GameplayTag::Item_Property_Book).Array)
        {
            auto ObtionalClass = MemorizedEvent.OptionalClass1.Get();

            if(!IsValid(ObtionalClass))
                continue;

            auto WritingDefinition = Cast<UWritingDefinition>(ObtionalClass.DefaultObject);
            
            if (!ReadBooks.Contains(WritingDefinition))
            {
                ReadBooks.Add(WritingDefinition);
            }
        }

        return ReadBooks.Num();

    }
}

#endif