#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MoleratGlossary_MoleratUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_MoleratGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Molerat, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000002), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_MoleratGlossary_MoleratEntry2.StartQuest();
                DC(int64(0x00000002), EConversationDebugInfo::Done);
                DC(int64(0x00000003), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_MoleratGlossary_MoleratEntry3.StartQuest();
                DC(int64(0x00000003), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Molerat, Document::UDocumentSegment_Glossary_Molerat_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_MoleratGlossary_MoleratUnlock GetCreaturesGlossary_MoleratGlossary_MoleratUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_MoleratGlossary_MoleratUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MoleratGlossary_MoleratUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */