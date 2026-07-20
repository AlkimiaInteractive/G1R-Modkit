#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_TrollGlossary_TrollUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_TrollGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Troll, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000131), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_TrollGlossary_TrollEntry2.StartQuest();
                DC(int64(0x00000131), EConversationDebugInfo::Done);
                DC(int64(0x00000132), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_TrollGlossary_TrollEntry3.StartQuest();
                DC(int64(0x00000132), EConversationDebugInfo::Done);
                DC(int64(0x00000133), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_TrollGlossary_TrollEntry4.StartQuest();
                DC(int64(0x00000133), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Troll, Document::UDocumentSegment_Glossary_Troll_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_TrollGlossary_TrollUnlock GetCreaturesGlossary_TrollGlossary_TrollUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_TrollGlossary_TrollUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_TrollGlossary_TrollUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */