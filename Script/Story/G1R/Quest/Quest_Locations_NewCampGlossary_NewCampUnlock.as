#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_NewCampGlossary_NewCampUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_NewCampGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_NewCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000007c), EConversationDebugInfo::Executing);
                Quest::Locations_NewCampGlossary_NewCampEntry2.StartQuest();
                DC(int64(0x0000007c), EConversationDebugInfo::Done);
                DC(int64(0x0000007d), EConversationDebugInfo::Executing);
                Quest::Locations_NewCampGlossary_NewCampEntry3.StartQuest();
                DC(int64(0x0000007d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NewCamp, Document::UDocumentSegment_Glossary_NewCamp_Unlock);
            }
        }
        
        
        UQuest_Locations_NewCampGlossary_NewCampUnlock GetLocations_NewCampGlossary_NewCampUnlock() property
        {
            return Cast<UQuest_Locations_NewCampGlossary_NewCampUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_NewCampGlossary_NewCampUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */