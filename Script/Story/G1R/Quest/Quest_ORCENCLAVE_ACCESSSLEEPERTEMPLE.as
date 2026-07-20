#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_ORCENCLAVE;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-ORCENCLAVE_ACCESSSLEEPERTEMPLE-DESCRIPTION";
            default NameText = "QUEST-ORCENCLAVE_ACCESSSLEEPERTEMPLE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH5_ACCESSSLEEPERTEMPLE;
            default QuestKind = EQuestKind::Main;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000008), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE.StartQuest();
                DC(int64(0x00000008), EConversationDebugInfo::Done);
                DC(int64(0x00000009), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OE_ACCESSSLEEPERTEMPLE_COMPLETE);
                DC(int64(0x00000009), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE GetORCENCLAVE_ACCESSSLEEPERTEMPLE() property
        {
            return Cast<UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */