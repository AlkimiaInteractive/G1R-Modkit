#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_DemonGlossary_DemonUnlock : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary_DemonGlossary;
            default bExternalSuccessTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000007e), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_DemonGlossary_DemonEntry2.StartQuest();
                DC(int64(0x0000007e), EConversationDebugInfo::Done);
                DC(int64(0x0000007f), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_DemonGlossary_DemonEntry3.StartQuest();
                DC(int64(0x0000007f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Demon, Document::UDocumentSegment_Glossary_Demon_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_DemonGlossary_DemonUnlock GetCreaturesGlossary_DemonGlossary_DemonUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_DemonGlossary_DemonUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_DemonGlossary_DemonUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */