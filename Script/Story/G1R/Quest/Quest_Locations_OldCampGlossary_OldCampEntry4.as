#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldCampGlossary_OldCampEntry4 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_OldCampGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_OldCamp_Castle_Room_Dungeons);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OldCamp, Document::UDocumentSegment_Glossary_OldCamp_Entry4);
            }
        }
        
        
        UQuest_Locations_OldCampGlossary_OldCampEntry4 GetLocations_OldCampGlossary_OldCampEntry4() property
        {
            return Cast<UQuest_Locations_OldCampGlossary_OldCampEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldCampGlossary_OldCampEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */