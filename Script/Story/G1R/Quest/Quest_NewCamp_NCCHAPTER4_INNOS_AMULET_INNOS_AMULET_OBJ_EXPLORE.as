#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_EXPLORE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_EXPLORE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Book_Innos, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000f7), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_OBJECTS.StartQuest();
                DC(int64(0x000000f7), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_EXPLORE GetNewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_EXPLORE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_EXPLORE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_EXPLORE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */