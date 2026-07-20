#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_FireLizardGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Lizard_Fire, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000036), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_FireLizardGlossary_FireLizardEntry2.StartQuest();
                DC(int64(0x00000036), EConversationDebugInfo::Done);
                DC(int64(0x00000037), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_FireLizardGlossary_FireLizardEntry3.StartQuest();
                DC(int64(0x00000037), EConversationDebugInfo::Done);
                DC(int64(0x00000038), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_FireLizardGlossary_FireLizardEntry4.StartQuest();
                DC(int64(0x00000038), EConversationDebugInfo::Done);
                DC(int64(0x00000039), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_FireLizardGlossary_FireLizardEntry5.StartQuest();
                DC(int64(0x00000039), EConversationDebugInfo::Done);
                DC(int64(0x0000003a), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_FireLizardGlossary_FireLizardEntry6.StartQuest();
                DC(int64(0x0000003a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FireLizard, Document::UDocumentSegment_Glossary_FireLizard_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardUnlock GetCreaturesGlossary_FireLizardGlossary_FireLizardUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */