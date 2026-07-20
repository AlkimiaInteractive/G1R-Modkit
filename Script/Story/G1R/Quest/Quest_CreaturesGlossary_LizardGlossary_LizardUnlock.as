#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_LizardGlossary_LizardUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_LizardGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Lizard, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000006f), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_LizardGlossary_LizardEntry2.StartQuest();
                DC(int64(0x0000006f), EConversationDebugInfo::Done);
                DC(int64(0x00000070), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_LizardGlossary_LizardEntry3.StartQuest();
                DC(int64(0x00000070), EConversationDebugInfo::Done);
                DC(int64(0x00000071), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_LizardGlossary_LizardEntry4.StartQuest();
                DC(int64(0x00000071), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Lizard, Document::UDocumentSegment_Glossary_Lizard_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_LizardGlossary_LizardUnlock GetCreaturesGlossary_LizardGlossary_LizardUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_LizardGlossary_LizardUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_LizardGlossary_LizardUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */