#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ScavengerGlossary_ScavengerUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_ScavengerGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Scavenger, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000e2), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_ScavengerGlossary_ScavengerEntry2.StartQuest();
                DC(int64(0x000000e2), EConversationDebugInfo::Done);
                DC(int64(0x000000e3), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_ScavengerGlossary_ScavengerEntry3.StartQuest();
                DC(int64(0x000000e3), EConversationDebugInfo::Done);
                DC(int64(0x000000e4), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_ScavengerGlossary_ScavengerEntry4.StartQuest();
                DC(int64(0x000000e4), EConversationDebugInfo::Done);
                DC(int64(0x000000e5), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_ScavengerGlossary_ScavengerEntry5.StartQuest();
                DC(int64(0x000000e5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Scavenger, Document::UDocumentSegment_Glossary_Scavenger_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_ScavengerGlossary_ScavengerUnlock GetCreaturesGlossary_ScavengerGlossary_ScavengerUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_ScavengerGlossary_ScavengerUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ScavengerGlossary_ScavengerUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */