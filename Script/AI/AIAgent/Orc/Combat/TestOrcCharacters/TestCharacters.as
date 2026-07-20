class USpawnAIAgentDefinition_TestOrc_S1H : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_S1H::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestOrc_A1H : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_A1H::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestOrc_M1H : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_M1H::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/TestBPs/AIAgentCharacter_TestOrcSimple_TempleWarrior.AIAgentCharacter_TestOrcSimple_TempleWarrior_C'";
}

class USpawnAIAgentDefinition_TestOrc_Fists : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_Fists::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestOrc_Sff1H_Shaman : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_Sff1H_Shaman::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestOrc_Sff1H_VHashor : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_Sff1H_VHashor::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestOrc_Sff1H_VKasorg : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_Sff1H_VKasorg::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestOrc_DemonLesser_VKasorg : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Demon_Lesser_VKasorg::StaticClass();
    default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Demon/AIAgentCharacter_DemonLesser.AIAgentCharacter_DemonLesser_C'";
}

class USpawnAIAgentDefinition_TestOrc_Sff1H_VUnhilqt : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_Sff1H_VUnhilqt::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestOrc_Sff1H_VRuuushk : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_Sff1H_VRuuushk::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestOrc_Sff1H_GVArushat : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_Sff1H_GVArushat::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestOrc_Conversation : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_TestOrc_Conversation::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_TestDemon_Conversation : USpawnAIAgentDefinition_XT_XardasDemon
{
    default AIAgentConfigClass = UAIAgentConfig_TestDemon_Conversation::StaticClass();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UCharacterDefinition_TestOrc : UCharacterDefinition_Orc
{
    // default SetAttributeValue("AttributeSet_Health.Health", 500);
    // default SetAttributeValue("AttributeSet_Health.MaxHealth", 500);
    // default SetAttributeValue("AttributeSet_Armor.SuperArmor", 80);
    // default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 80);
    // default SetAttributeValue("AttributeSet_Strength.Strength", 100); 

    default SetAttributeValue("AttributeSet_Health.Health", 3200);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 3200);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
    default SetAttributeValue("AttributeSet_Strength.Strength", 50); 

    default SetAttributeValue("AttributeSet_Mana.Mana", 10000);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 10000);

    default m_InitialGuildEffect = UGE_Guild_Orc_Shaman::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Omniperception::StaticClass();
}

UCLASS()
class UCharacterDefinition_TestOrc_S1H : UCharacterDefinition_TestOrc
{
    default m_UniqueName = n"AITestOrc_S1H";
    default AddToInventory(UItMw_2H_Sword_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSC_OrcScoutM01_2021::StaticClass();
}

UCLASS()
class UCharacterDefinition_TestOrc_A1H : UCharacterDefinition_TestOrc
{
    default m_UniqueName = n"AITestOrc_A1H";
    default AddToInventory(UItMw_2H_Axe_Orc_02_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OWR_OrcFighterM01_2003::StaticClass();
}

UCLASS()
class UCharacterDefinition_TestOrc_M1H : UCharacterDefinition_TestOrc
{
    default m_UniqueName = n"AITestOrc_M1H";  
    default AddToInventory(UItMw_2H_Mace_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrc_Fists : UCharacterDefinition_TestOrc
{
    default m_UniqueName = n"AITestOrc_Fists";

    FGameplayTagContainer QuickSlotItemCategories;
    default QuickSlotItemCategories.AddTag(GameplayTag::Item);
    default CreateInventory(EInventoryTypes::Pouch, QuickSlotItemCategories, 0);
    default AddToInventory(UHumanFist_NoWeapon::StaticClass(), 1);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OPS_OrcPeasantM01_2068::StaticClass();
}

UCLASS()
class UCharacterDefinition_TestOrc_Sff1H_Shaman : UCharacterDefinition_TestOrc
{
    default m_UniqueName = n"AITestOrc_Sff1H_Shaman";    
    default m_AIAbility = UGameplayAbility_CharacterAI_TestOrc_Sff1H_Shaman::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Orc_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSM_OrcShamanM01_2064::StaticClass();
}

UCLASS()
class UCharacterDefinition_TestOrc_Sff1H_Varrags : UCharacterDefinition_OrcUndead
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Undead_Shaman;
    // Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 30);
	default SetAttributeValue("AttributeSet_Strength.Strength", 190);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 190);
    default SetAttributeValue("AttributeSet_Health.Health", 350); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 350);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100);
	default SetAttributeValue("AttributeSet_Mana.Mana", 75);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 75);

	//default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100); //9999
	//default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100); //9999
	//default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 100); //9999
	//default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 10); //9999
	//default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 150);
	//default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 150);
	//default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 150);
	// protection[PROT_FLY] = 9999;

    // default AddToInventory(UItMw_2H_Staff_Unorc_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrc_Sff1H_VHashor : UCharacterDefinition_TestOrc_Sff1H_Varrags
{
    default m_UniqueName = n"AITestOrc_Sff1H_VHashor";    
    default m_AIAbility = UGameplayAbility_CharacterAI_TestOrc_Sff1H_VHashor::StaticClass();
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragHashor::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_VHashor_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrc_Sff1H_VKasorg : UCharacterDefinition_TestOrc_Sff1H_Varrags
{
    default m_UniqueName = n"AITestOrc_Sff1H_VKasorg";    
    default m_AIAbility = UGameplayAbility_CharacterAI_TestOrc_Sff1H_VKasorg::StaticClass();
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragKasorg::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_VKasorg_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrc_Sff1H_VUnhilqt : UCharacterDefinition_TestOrc_Sff1H_Varrags
{
    default m_UniqueName = n"AITestOrc_Sff1H_VUnhilqt";    
    default m_AIAbility = UGameplayAbility_CharacterAI_TestOrc_Sff1H_VUnhilqt::StaticClass();
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragUnhilqt::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_VUnhilqt_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrc_Sff1H_VRuuushk : UCharacterDefinition_TestOrc_Sff1H_Varrags
{
    default m_UniqueName = n"AITestOrc_Sff1H_VRuuushk";    
    default m_AIAbility = UGameplayAbility_CharacterAI_TestOrc_Sff1H_VRuuushk::StaticClass();
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragRuuushk::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_VRuuushk_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrc_Sff1H_GVArushat : UCharacterDefinition_TestOrc_Sff1H_Varrags
{
    default m_UniqueName = n"AITestOrc_Sff1H_GVArushat";    
    default m_AIAbility = UGameplayAbility_CharacterAI_TestOrc_Sff1H_GVArushat::StaticClass();
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragArushat::StaticClass();
    default AddToInventory(UItMw_2H_Staff_Unorc_GVArushat_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot);
}

UCLASS()
class UCharacterDefinition_TestOrc_Conversation: UCharacterDefinition_TestOrc
{
    default m_UniqueName = n"AITestOrc_Conversation";
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSC_OrcScoutM01_2021::StaticClass();
}

UCLASS()
class UCharacterDefinition_TestDemon_Conversation: UCharacterDefinition_Creature_XT_XardasDemon
{
    // NOTE: Inheriting from xardas demon since it's the only one we want to talk to
    default m_UniqueName = n"AITestDemon_Conversation";
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS(abstract)
class UAIAgentConfig_TestOrc : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_TestOrc::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Orc::StaticClass();
	default m_AnimConfig = UAnimConfig_Orc::StaticClass();	

	
	default  m_NavigationConfig = UAIAgentConfig_Navigation_Orc::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_S1H : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_S1H::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_A1H : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_A1H::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_M1H : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_M1H::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_Fists : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_Fists::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_Sff1H_Shaman : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_Sff1H_Shaman::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_Sff1H_VHashor : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_Sff1H_VHashor::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_Sff1H_VKasorg : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_Sff1H_VKasorg::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_Sff1H_VUnhilqt : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_Sff1H_VUnhilqt::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_Sff1H_VRuuushk : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_Sff1H_VRuuushk::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_Sff1H_GVArushat : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_Sff1H_GVArushat::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestOrc_Conversation : UAIAgentConfig_TestOrc
{
    default m_CharacterDefinition = UCharacterDefinition_TestOrc_Conversation::StaticClass();
}

UCLASS()
class UAIAgentConfig_TestDemon_Conversation : UAIAgentConfig_Demon_Lesser
{
    default m_CharacterDefinition = UCharacterDefinition_TestDemon_Conversation::StaticClass();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UGameplayAbility_CharacterAI_TestOrc : UGameplayAbility_CharacterAI_Gothic
{
    /// ITEM SCORING
    /// Melee Weapon Scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_MeleeWeapon_BasePriorityBySkill());
    /// Ranged weapon scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_BasePriorityBySkill());
    /// Misc item scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_ActualWeaponBonus());

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Orc_Generic::StaticClass());

    default AssessmentModuleClass = UAIARM_TestCharacterSimple;
}

UCLASS()
class UGameplayAbility_CharacterAI_TestOrc_Sff1H_Shaman : UGameplayAbility_CharacterAI_TestOrc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Orc_Sff1H_Shaman::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_TestOrc_Sff1H_VHashor : UGameplayAbility_CharacterAI_TestOrc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Varrag_Hashor::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_TestOrc_Sff1H_VKasorg : UGameplayAbility_CharacterAI_TestOrc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Varrag_Kasorg::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_TestOrc_Sff1H_VUnhilqt : UGameplayAbility_CharacterAI_TestOrc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Varrag_Unhilqt::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_TestOrc_Sff1H_VRuuushk : UGameplayAbility_CharacterAI_TestOrc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Varrag_Ruuushk::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_TestOrc_Sff1H_GVArushat : UGameplayAbility_CharacterAI_TestOrc
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Varrag_Arushat::StaticClass());
}