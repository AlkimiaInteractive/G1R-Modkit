#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_SwampCampGlossary_SwampCampUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_SwampCampGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000087), EConversationDebugInfo::Executing);
                Quest::Locations_SwampCampGlossary_SwampCampEntry2.StartQuest();
                DC(int64(0x00000087), EConversationDebugInfo::Done);
                DC(int64(0x00000088), EConversationDebugInfo::Executing);
                Quest::Locations_SwampCampGlossary_SwampCampEntry3.StartQuest();
                DC(int64(0x00000088), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SwampCamp, Document::UDocumentSegment_Glossary_SwampCamp_Unlock);
            }
        }
        
        
        UQuest_Locations_SwampCampGlossary_SwampCampUnlock GetLocations_SwampCampGlossary_SwampCampUnlock() property
        {
            return Cast<UQuest_Locations_SwampCampGlossary_SwampCampUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_SwampCampGlossary_SwampCampUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */