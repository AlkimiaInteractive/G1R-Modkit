#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_WolfGlossary_WolfUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_WolfGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Wolf, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000140), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_WolfGlossary_WolfEntry2.StartQuest();
                DC(int64(0x00000140), EConversationDebugInfo::Done);
                DC(int64(0x00000141), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_WolfGlossary_WolfEntry3.StartQuest();
                DC(int64(0x00000141), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Wolf, Document::UDocumentSegment_Glossary_Wolf_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_WolfGlossary_WolfUnlock GetCreaturesGlossary_WolfGlossary_WolfUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_WolfGlossary_WolfUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_WolfGlossary_WolfUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */