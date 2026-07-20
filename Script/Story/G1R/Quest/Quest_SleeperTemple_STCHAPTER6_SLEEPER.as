#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER6_SLEEPER : UG1RQuest
        {
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER6;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SLEEPERTEMPLE_STCHAPTER6_SLEEPER-DESCRIPTION";
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER6_SLEEPER-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH6_SLEEPER;
            default QuestKind = EQuestKind::Main;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH6_SLEEPER, Document::UDocumentSegment_CH6_SLEEPER_Start);
            }
        }
        
        
        UQuest_SleeperTemple_STCHAPTER6_SLEEPER GetSleeperTemple_STCHAPTER6_SLEEPER() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER6_SLEEPER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER6_SLEEPER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */