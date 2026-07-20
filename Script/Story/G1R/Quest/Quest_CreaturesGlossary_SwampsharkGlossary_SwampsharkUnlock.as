#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SwampsharkGlossary_SwampsharkUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_SwampsharkGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Swampshark, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000126), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_SwampsharkGlossary_SwampsharkEntry2.StartQuest();
                DC(int64(0x00000126), EConversationDebugInfo::Done);
                DC(int64(0x00000127), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_SwampsharkGlossary_SwampsharkEntry3.StartQuest();
                DC(int64(0x00000127), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Swampshark, Document::UDocumentSegment_Glossary_Swampshark_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_SwampsharkGlossary_SwampsharkUnlock GetCreaturesGlossary_SwampsharkGlossary_SwampsharkUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_SwampsharkGlossary_SwampsharkUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SwampsharkGlossary_SwampsharkUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */