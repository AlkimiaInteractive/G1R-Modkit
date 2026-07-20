class UCharacterDefinition_Human_OC_VLK_Shmud : UCharacterDefinition_Human_OldCamp_Digger
{
	default m_LightType = 3;
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 5);
	default SetAttributeValue("AttributeSet_LevelProgression.Experience", 0);
	default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 0);
	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 50);
	default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty", 50);
	default SetAttributeValue("AttributeSet_Health.Health", 88);
	default SetAttributeValue("AttributeSet_Health.MaxHealth", 88);
	default SetAttributeValue("AttributeSet_Armor.SuperArmor", 40);
	default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 40);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
	default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);
	default SetAttributeValue("AttributeSet_Strength.Strength", 20);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 5);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 5);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 0);
	default AddToInventory(UItMw_1H_Mace_Club_01, 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItFo_Apple, 99, EInventoryTypes::MainContainer);
	default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_VLK_Digger02_502;
	default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Digger_OC;

	default m_UniqueName = n"OC_VLK_Shmud";
}

class UDailyRoutine_OC_VLK_Shmud : UAIState_DailyRoutine_Human
{
	default Schedule(0, 0, UAIState_Stand(), n"FP_OC_RAINSHELTER_15", 500);
}


class UAIAgentConfig_Human_OC_VLK_Shmud : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Shmud;
}


class USpawnAIAgentDefinition_OC_VLK_Shmud : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_Human_OC_VLK_Shmud;
	default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}



// New WorldPoint script to actually spawn Shmud ----------------------------------------------------------------------

class UWP_Example_Shmud : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OC_VLK_Shmud);
	}
}

class UGothicModExt_ExampleNewHumanCharacter : UGothicModExt_WorldPoints
{
	default WorldPointManagerConfigToExtend = UWorldpointManagerConfig_MainMap;

	// Position does not really matter here, as the daily routine will simulate him where he needs to be
	default Points.AddWorldPoint(n"Spawner_Example_Shmud");
	default Points.AddWorldPosition(FRotator::ZeroRotator, FVector(112152, -98631, -4939));
	default Points.AddScriptDefinition(UWP_Example_Shmud);
}



// Conversation ------------------------------------------------------------------------------------------------------

class UChoiceShmud_Hello : UConversationTopic
{
	default ForCharacter = n"OC_VLK_Shmud"; // Self
	default WithCharacter = n"Hero";        // Other

	default Caption = LocText("OC_VLK_Shmud_Hello_Hero_1");

	AGothicCharacterState GetShmud() const property { return Self; }
	AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }

	UFUNCTION(BlueprintOverride)
	void Act()
	{
		Hero.AI.Say(LocText("OC_VLK_Shmud_Hello_Hero_1"));
		Shmud.AI.Say(LocText("OC_VLK_Shmud_Hello_Shmud_2"));
		Hero.AI.Say(LocText("OC_VLK_Shmud_Hello_Hero_3"));

		EndConversation();
	}
}

