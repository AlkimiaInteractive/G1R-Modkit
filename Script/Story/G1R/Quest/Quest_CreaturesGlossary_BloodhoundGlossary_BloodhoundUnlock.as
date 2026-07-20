#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_BloodhoundGlossary_BloodhoundUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_BloodhoundGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Bloodhound, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000002b), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_BloodhoundGlossary_BloodhoundEntry2.StartQuest();
                DC(int64(0x0000002b), EConversationDebugInfo::Done);
                DC(int64(0x0000002c), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_BloodhoundGlossary_BloodhoundEntry3.StartQuest();
                DC(int64(0x0000002c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Bloodhound, Document::UDocumentSegment_Glossary_Bloodhound_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_BloodhoundGlossary_BloodhoundUnlock GetCreaturesGlossary_BloodhoundGlossary_BloodhoundUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_BloodhoundGlossary_BloodhoundUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_BloodhoundGlossary_BloodhoundUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */