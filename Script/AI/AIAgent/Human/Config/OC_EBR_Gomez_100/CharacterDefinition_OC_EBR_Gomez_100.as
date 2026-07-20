UCLASS()
class UCharacterDefinition_Human_OC_EBR_Gomez_100: UCharacterDefinition_Human_OldCamp_OreBaron
{
    default m_CharacterType = GameplayTag::AIAgent_Human_OreBaron;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",100);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",1000);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",1000);
    default SetAttributeValue("AttributeSet_Health.Health",1000);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1000);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",250);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",250);
    default SetAttributeValue("AttributeSet_Mana.Mana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Strength.Strength",95);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",80);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",65);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",65);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",55);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",40);
    default AddToInventory(UItMw_2H_Sword_Innos::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItAt_Amulet_Power::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Ring_Total_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItKe_Gomez_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItKe_GomezCastleMaster::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 32, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_EBR_Gomez_100::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_OreBaronLeader::StaticClass();
    default m_AIAbility = UGameplayAbility_CharacterAI_Gomez::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_EBR_Gomez_100";
}
