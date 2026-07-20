#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_OBJECTS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_OBJECTS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Book_Innos, 1, 0) && Hero != nullptr && Hero.HasItem(UItAt_Amulet_Innos, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000fe), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_COMPLETE.StartQuest();
                DC(int64(0x000000fe), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_OBJECTS GetNewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_OBJECTS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_OBJECTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_OBJECTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */