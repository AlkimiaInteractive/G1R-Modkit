UCLASS()
class UCharacterDefinition_Human_ST_VLK_Mud_Sleeper : UCharacterDefinition_Human_OldCamp_Digger
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Digger;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",5);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",0);
    default SetAttributeValue("AttributeSet_Health.Health",88);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",88);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",40);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",40);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",20);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    //default m_AbilitiesEffect = UGE_Mud_Sleeper::StaticClass();
    default AddToInventory(UItMw_1H_Mace_Club_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_ST_VLK_Mud_Sleeper::StaticClass();
    default m_InitialGuildEffect = UGE_SleeperTemple_Mud::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Brave::StaticClass();
    default m_AIAbility = UGameplayAbility_CharacterAI_Mud::StaticClass();
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"ST_VLK_Mud_Sleeper";
    default m_AbilitiesEffect = UGE_Human_AI_Mud_Sleeper::StaticClass();

    
}

UCLASS()
class UGE_Human_AI_Mud_Sleeper : UGE_Human_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Killable);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Charm);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Fear);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Heal_OnlyWasteMana);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Sleep);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);

    FConditionalGameplayEffect conditionalGE;
	default conditionalGE.EffectClass = UGE_Dissolve::StaticClass(); 
    default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalGE); 

    default AddAbility(UGA_Mud_Sleeper_Invulnerability::StaticClass());
    default AddAbility(UGA_Mud_Sleeper_Teleport_ToCheerPlace::StaticClass());
    default AddAbility(UGA_Mud_Sleeper_Teleport_ToSecondPlace::StaticClass());
    default AddAbility(UGA_Mud_Sleeper_Teleport_ToEnd::StaticClass());
    default AddAbility(UGA_Mud_Sleeper_WallController::StaticClass());
    default AddAbility(UGA_BossHealthBar::StaticClass());

    default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Dissolve::StaticClass());

}

UCLASS()
class UCharacterVisualsDefinition_Human_ST_VLK_Mud_Sleeper : UCharacterVisualsDefinition_Human_OC_VLK_Mud_574
{
    default m_TagsToAdd.AddTag(GameplayTag::Visuals_DeathDissolve);
}

UCLASS()
class UAIAgentConfig_Human_ST_VLK_Mud_Sleeper : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_VLK_Mud_Sleeper::StaticClass();
    default m_SpawnSettings.MaxSignificanceRadius = 35000.f;
}

class USpawnAIAgentDefinition_ST_VLK_Mud_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Human_ST_VLK_Mud_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}


UCLASS()
class UDailyRoutine_ST_VLK_Mud_Sleeper_Guide : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_ST_VLK_Mud_Sleeper_GuideDream01(), NAME_None);
}

UCLASS()
class UDailyRoutine_ST_VLK_Mud_Sleeper_Guide02 : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_ST_VLK_Mud_Sleeper_GuideDream02(), NAME_None);
}

UCLASS()
class UDailyRoutine_ST_VLK_Mud_Sleeper_Cheer : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_ArenaGreetings(), n"FP_SD_MUD_CHEER");
}

UCLASS()
class UAIState_ST_VLK_Mud_Sleeper_GuideDream02 : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero"; 

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_06", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_07", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_08", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_09", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_10", EWalkSpeed::Running)); 
}

class UAIValueSet_MudSleeperGuide : UAIValueSet
{
    /** Set once Mud has a body and starts guiding, so loading a save mid-guide doesn't snap him back to start. */
    UPROPERTY(SaveGame)
    bool bGuideStarted = false;
}

UCLASS()
class UAIState_ST_VLK_Mud_Sleeper_GuideDream01 : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_Start", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_02", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_03", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_04", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Mud_Sleeper_05", EWalkSpeed::Running));

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        auto MudStorage = AI.PermanentStorage(UAIValueSet_MudSleeperGuide);

        // If Mud's body spawns late, while simulated, the guide task would walk him along the path.
        // So we don't start guiding until he has a body.
        while (IsInDailyRoutineSimulation() && !bShouldExitState)
        {
            if (!MudStorage.bGuideStarted)
                SnapToGuideStart();

            ReportTimeSkipWhateverIsLeft();
            WaitSeconds(0.5f);
        }

        ReportTimeSkipWhateverIsLeft();
        MudStorage.bGuideStarted = true;

        Super::DoTask();
    }

    void SnapToGuideStart()
    {
        FInteractionSpotHandle StartSpot(GoAlongFreepoints[0].FreepointName);
        if (!StartSpot.IsValid())
            return;

        CharacterState.SetCharacterLocationAndDirection(StartSpot.Location, StartSpot.Transform.Rotator().Vector());
    }
}

UCLASS()
class UDailyRoutine_ST_VLK_Mud_Sleeper_Teleport : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Teleport_Mud(false), n"FP_SD_MUD_CHEER", 200);
}

UCLASS()
class UDailyRoutine_ST_VLK_Mud_Sleeper_Teleport02 : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Teleport_Mud(true), n"Guide_Path_Mud_Sleeper_Start2", 200);
}

class UAIState_Teleport_Mud : UGothicCharacterSimulateableAIState
{
    UPROPERTY()
    bool bToSecondLocation = false;

    UAIState_Teleport_Mud(bool InToSecondLocation)
    {
        bToSecondLocation = InToSecondLocation;
    }


    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if(!bToSecondLocation)
        {
            auto abComp = Cast<UGothicAbilitySystemComponent>(AbilitySystemComponent);
            //abComp.GiveAbility(UGA_Mud_Sleeper_Teleport_ToCheerPlace::StaticClass(), 1, -1, nullptr);
            abComp.SendGameplayEvent(GameplayTag::Event_Teleport_Scripted_MudSleeper_ToCheer, FGameplayEventData());
        }
        else
        {
            auto abComp = Cast<UGothicAbilitySystemComponent>(AbilitySystemComponent);
            abComp.SendGameplayEvent(GameplayTag::Event_Teleport_Scripted_MudSleeper_ToGuide, FGameplayEventData());
            //abComp.GiveAbility(UGA_Mud_Sleeper_Teleport_ToSecondPlace::StaticClass(), 1, -1, nullptr);
        }
    }
}