#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_HarpyGlossary_HarpyUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_HarpyGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Harpy, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000008f), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_HarpyGlossary_HarpyEntry2.StartQuest();
                DC(int64(0x0000008f), EConversationDebugInfo::Done);
                DC(int64(0x00000090), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_HarpyGlossary_HarpyEntry3.StartQuest();
                DC(int64(0x00000090), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Harpy, Document::UDocumentSegment_Glossary_Harpy_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_HarpyGlossary_HarpyUnlock GetCreaturesGlossary_HarpyGlossary_HarpyUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_HarpyGlossary_HarpyUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_HarpyGlossary_HarpyUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */