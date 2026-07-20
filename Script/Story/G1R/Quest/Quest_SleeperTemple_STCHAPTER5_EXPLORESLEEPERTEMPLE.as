#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_EXPLORESLEEPERTEMPLE-DESCRIPTION";
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_EXPLORESLEEPERTEMPLE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH5_EXPLORESLEEPERTEMPLE;
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Start);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000010), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_ST_EXPLORESLEEPERTEMPLE_COMPLETE);
                DC(int64(0x00000010), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE GetSleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */