#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldCampGlossary_OldCampEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_OldCampGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasListenedTo(LocText("DIA_GRD_218_FIRSTIN_07_00"));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OldCamp, Document::UDocumentSegment_Glossary_OldCamp_Entry3);
            }
        }
        
        
        UQuest_Locations_OldCampGlossary_OldCampEntry3 GetLocations_OldCampGlossary_OldCampEntry3() property
        {
            return Cast<UQuest_Locations_OldCampGlossary_OldCampEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldCampGlossary_OldCampEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */