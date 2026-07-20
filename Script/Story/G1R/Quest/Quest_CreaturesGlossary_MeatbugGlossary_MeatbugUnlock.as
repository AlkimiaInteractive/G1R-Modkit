#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_MeatbugGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Meatbug, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000aa), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_MeatbugGlossary_MeatbugEntry2.StartQuest();
                DC(int64(0x000000aa), EConversationDebugInfo::Done);
                DC(int64(0x000000ab), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_MeatbugGlossary_MeatbugEntry3.StartQuest();
                DC(int64(0x000000ab), EConversationDebugInfo::Done);
                DC(int64(0x000000ac), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_MeatbugGlossary_MeatbugEntry4.StartQuest();
                DC(int64(0x000000ac), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Meatbug, Document::UDocumentSegment_Glossary_Meatbug_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugUnlock GetCreaturesGlossary_MeatbugGlossary_MeatbugUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */