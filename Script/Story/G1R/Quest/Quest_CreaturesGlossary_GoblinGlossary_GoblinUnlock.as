#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_GoblinGlossary_GoblinUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_GoblinGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Goblin, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000004d), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_GoblinGlossary_GoblinEntry2.StartQuest();
                DC(int64(0x0000004d), EConversationDebugInfo::Done);
                DC(int64(0x0000004e), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_GoblinGlossary_GoblinEntry3.StartQuest();
                DC(int64(0x0000004e), EConversationDebugInfo::Done);
                DC(int64(0x0000004f), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_GoblinGlossary_GoblinEntry4.StartQuest();
                DC(int64(0x0000004f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Goblin, Document::UDocumentSegment_Glossary_Goblin_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_GoblinGlossary_GoblinUnlock GetCreaturesGlossary_GoblinGlossary_GoblinUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_GoblinGlossary_GoblinUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_GoblinGlossary_GoblinUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */