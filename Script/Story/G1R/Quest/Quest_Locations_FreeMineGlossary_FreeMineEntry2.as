#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_FreeMineGlossary_FreeMineEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_FreeMineGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasListenedTo(LocText("DIA_SLD_752_OKYL_INTRO_INFO_11_01"));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FreeMine, Document::UDocumentSegment_Glossary_FreeMine_Entry2);
            }
        }
        
        
        UQuest_Locations_FreeMineGlossary_FreeMineEntry2 GetLocations_FreeMineGlossary_FreeMineEntry2() property
        {
            return Cast<UQuest_Locations_FreeMineGlossary_FreeMineEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_FreeMineGlossary_FreeMineEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */