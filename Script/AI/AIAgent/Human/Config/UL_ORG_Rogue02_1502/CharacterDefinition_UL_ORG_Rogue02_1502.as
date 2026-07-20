UCLASS()
class UCharacterDefinition_Human_UL_ORG_Rogue02_1502: UCharacterDefinition_Human_NewCamp_Rogue
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Rogue;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",9);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",90);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",90);
    default SetAttributeValue("AttributeSet_Health.Health",295);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",295);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",100);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",35);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",13);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default AddToInventory(UItMw_1H_Sword_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22, EInventoryTypes::Pouch); 
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_UL_ORG_Rogue02_1502::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Rogue_World::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"UL_ORG_Rogue02_1502";
}
