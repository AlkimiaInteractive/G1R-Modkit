#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_SwampCampGlossary_SwampCampEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_SwampCampGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YPUISQL_20240425_123230_2238"));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SwampCamp, Document::UDocumentSegment_Glossary_SwampCamp_Entry3);
            }
        }
        
        
        UQuest_Locations_SwampCampGlossary_SwampCampEntry3 GetLocations_SwampCampGlossary_SwampCampEntry3() property
        {
            return Cast<UQuest_Locations_SwampCampGlossary_SwampCampEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_SwampCampGlossary_SwampCampEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */