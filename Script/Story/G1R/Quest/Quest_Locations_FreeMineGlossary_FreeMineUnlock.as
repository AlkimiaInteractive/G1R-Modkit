#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_FreeMineGlossary_FreeMineUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_FreeMineGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_FreeMine_Interior);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000023), EConversationDebugInfo::Executing);
                Quest::Locations_FreeMineGlossary_FreeMineEntry2.StartQuest();
                DC(int64(0x00000023), EConversationDebugInfo::Done);
                DC(int64(0x00000024), EConversationDebugInfo::Executing);
                Quest::Locations_FreeMineGlossary_FreeMineEntry3.StartQuest();
                DC(int64(0x00000024), EConversationDebugInfo::Done);
                DC(int64(0x00000025), EConversationDebugInfo::Executing);
                Quest::Locations_FreeMineGlossary_FreeMineEntry4.StartQuest();
                DC(int64(0x00000025), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FreeMine, Document::UDocumentSegment_Glossary_FreeMine_Unlock);
            }
        }
        
        
        UQuest_Locations_FreeMineGlossary_FreeMineUnlock GetLocations_FreeMineGlossary_FreeMineUnlock() property
        {
            return Cast<UQuest_Locations_FreeMineGlossary_FreeMineUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_FreeMineGlossary_FreeMineUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */