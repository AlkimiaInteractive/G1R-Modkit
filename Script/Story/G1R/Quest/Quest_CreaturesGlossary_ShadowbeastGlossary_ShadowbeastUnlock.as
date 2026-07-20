#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_ShadowbeastGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Shadowbeast, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000f5), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry2.StartQuest();
                DC(int64(0x000000f5), EConversationDebugInfo::Done);
                DC(int64(0x000000f6), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry3.StartQuest();
                DC(int64(0x000000f6), EConversationDebugInfo::Done);
                DC(int64(0x000000f7), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry4.StartQuest();
                DC(int64(0x000000f7), EConversationDebugInfo::Done);
                DC(int64(0x000000f8), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry5.StartQuest();
                DC(int64(0x000000f8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Shadowbeast, Document::UDocumentSegment_Glossary_Shadowbeast_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastUnlock GetCreaturesGlossary_ShadowbeastGlossary_ShadowbeastUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */