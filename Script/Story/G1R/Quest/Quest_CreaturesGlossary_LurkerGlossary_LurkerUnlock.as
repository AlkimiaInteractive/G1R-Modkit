#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_LurkerGlossary_LurkerUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_LurkerGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Lurker, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000009a), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_LurkerGlossary_LurkerEntry2.StartQuest();
                DC(int64(0x0000009a), EConversationDebugInfo::Done);
                DC(int64(0x0000009b), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_LurkerGlossary_LurkerEntry3.StartQuest();
                DC(int64(0x0000009b), EConversationDebugInfo::Done);
                DC(int64(0x0000009c), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_LurkerGlossary_LurkerEntry4.StartQuest();
                DC(int64(0x0000009c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Lurker, Document::UDocumentSegment_Glossary_Lurker_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_LurkerGlossary_LurkerUnlock GetCreaturesGlossary_LurkerGlossary_LurkerUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_LurkerGlossary_LurkerUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_LurkerGlossary_LurkerUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */