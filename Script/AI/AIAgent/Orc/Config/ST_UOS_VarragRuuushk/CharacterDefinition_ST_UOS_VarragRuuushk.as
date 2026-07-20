UCLASS()
class UCharacterDefinition_Orc_ST_UOS_VarragRuuushk: UCharacterDefinition_OrcUndead_Varrag
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Undead_Shaman;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",800);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",8000);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",8000);
    default SetAttributeValue("AttributeSet_Health.Health",1000);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1000);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",1000);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",1000);
    default SetAttributeValue("AttributeSet_Mana.Mana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Strength.Strength",100);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",40);
    default m_AbilitiesEffect = UGE_VarragRuuushk_AI::StaticClass();
    default AddToInventory(UItMi_UrizielGem_04::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAr_Rune_StormOfFire::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_2H_Staff_Unorc_VRuuushk_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOS_VarragRuuushk::StaticClass();
    default m_AIAbility = UGameplayAbility_CharacterAI_Orc_ST_UOS_VarragRuuushk::StaticClass();
    default m_UniqueName = n"ST_UOS_VarragRuuushk";
}
