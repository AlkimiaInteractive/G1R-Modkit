#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_MinecrawlerGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Minecrawler, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000b9), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry2.StartQuest();
                DC(int64(0x000000b9), EConversationDebugInfo::Done);
                DC(int64(0x000000ba), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry3.StartQuest();
                DC(int64(0x000000ba), EConversationDebugInfo::Done);
                DC(int64(0x000000bb), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry4.StartQuest();
                DC(int64(0x000000bb), EConversationDebugInfo::Done);
                DC(int64(0x000000bc), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_MinecrawlerGlossary_MinecrawlerEntry5.StartQuest();
                DC(int64(0x000000bc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Minecrawler, Document::UDocumentSegment_Glossary_Minecrawler_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerUnlock GetCreaturesGlossary_MinecrawlerGlossary_MinecrawlerUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MinecrawlerGlossary_MinecrawlerUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */