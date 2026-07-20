#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldCampGlossary_OldCampUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_OldCampGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_OldCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000041), EConversationDebugInfo::Executing);
                Quest::Locations_OldCampGlossary_OldCampEntry2.StartQuest();
                DC(int64(0x00000041), EConversationDebugInfo::Done);
                DC(int64(0x00000042), EConversationDebugInfo::Executing);
                Quest::Locations_OldCampGlossary_OldCampEntry3.StartQuest();
                DC(int64(0x00000042), EConversationDebugInfo::Done);
                DC(int64(0x00000043), EConversationDebugInfo::Executing);
                Quest::Locations_OldCampGlossary_OldCampEntry4.StartQuest();
                DC(int64(0x00000043), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OldCamp, Document::UDocumentSegment_Glossary_OldCamp_Unlock);
            }
        }
        
        
        UQuest_Locations_OldCampGlossary_OldCampUnlock GetLocations_OldCampGlossary_OldCampUnlock() property
        {
            return Cast<UQuest_Locations_OldCampGlossary_OldCampUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldCampGlossary_OldCampUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */