#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_OrcdogGlossary_OrcdogUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_OrcdogGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Orcdog, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000cc), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_OrcdogGlossary_OrcdogEntry2.StartQuest();
                DC(int64(0x000000cc), EConversationDebugInfo::Done);
                DC(int64(0x000000cd), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_OrcdogGlossary_OrcdogEntry3.StartQuest();
                DC(int64(0x000000cd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OrcDog, Document::UDocumentSegment_Glossary_OrcDog_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_OrcdogGlossary_OrcdogUnlock GetCreaturesGlossary_OrcdogGlossary_OrcdogUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_OrcdogGlossary_OrcdogUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_OrcdogGlossary_OrcdogUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */