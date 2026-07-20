#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SnapperGlossary_SnapperUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_SnapperGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Snapper, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000011b), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_SnapperGlossary_SnapperEntry2.StartQuest();
                DC(int64(0x0000011b), EConversationDebugInfo::Done);
                DC(int64(0x0000011c), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_SnapperGlossary_SnapperEntry3.StartQuest();
                DC(int64(0x0000011c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Snapper, Document::UDocumentSegment_Glossary_Snapper_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_SnapperGlossary_SnapperUnlock GetCreaturesGlossary_SnapperGlossary_SnapperUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_SnapperGlossary_SnapperUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SnapperGlossary_SnapperUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */