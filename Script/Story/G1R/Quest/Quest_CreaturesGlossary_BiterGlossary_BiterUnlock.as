#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_BiterGlossary_BiterUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_BiterGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Biter, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000d), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_BiterGlossary_BiterEntry2.StartQuest();
                DC(int64(0x0000000d), EConversationDebugInfo::Done);
                DC(int64(0x0000000e), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_BiterGlossary_BiterEntry3.StartQuest();
                DC(int64(0x0000000e), EConversationDebugInfo::Done);
                DC(int64(0x0000000f), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_BiterGlossary_BiterEntry4.StartQuest();
                DC(int64(0x0000000f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Biter, Document::UDocumentSegment_Glossary_Biter_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_BiterGlossary_BiterUnlock GetCreaturesGlossary_BiterGlossary_BiterUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_BiterGlossary_BiterUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_BiterGlossary_BiterUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */