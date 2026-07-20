#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_RazorGlossary_RazorUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_RazorGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Razor, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000d7), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_RazorGlossary_RazorEntry2.StartQuest();
                DC(int64(0x000000d7), EConversationDebugInfo::Done);
                DC(int64(0x000000d8), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_RazorGlossary_RazorEntry3.StartQuest();
                DC(int64(0x000000d8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Razor, Document::UDocumentSegment_Glossary_Razor_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_RazorGlossary_RazorUnlock GetCreaturesGlossary_RazorGlossary_RazorUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_RazorGlossary_RazorUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_RazorGlossary_RazorUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */