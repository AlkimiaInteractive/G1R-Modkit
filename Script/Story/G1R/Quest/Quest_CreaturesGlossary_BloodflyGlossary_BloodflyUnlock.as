#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_BloodflyGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Bloodfly, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000001c), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_BloodflyGlossary_BloodflyEntry2.StartQuest();
                DC(int64(0x0000001c), EConversationDebugInfo::Done);
                DC(int64(0x0000001d), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_BloodflyGlossary_BloodflyEntry3.StartQuest();
                DC(int64(0x0000001d), EConversationDebugInfo::Done);
                DC(int64(0x0000001e), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_BloodflyGlossary_BloodflyEntry4.StartQuest();
                DC(int64(0x0000001e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Bloodfly, Document::UDocumentSegment_Glossary_Bloodfly_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyUnlock GetCreaturesGlossary_BloodflyGlossary_BloodflyUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */