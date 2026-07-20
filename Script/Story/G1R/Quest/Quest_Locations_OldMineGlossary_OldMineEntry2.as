#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldMineGlossary_OldMineEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_OldMineGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasSaid(LocText("STT_301_IAN_HI_INFO_15_01"));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OldMine, Document::UDocumentSegment_Glossary_OldMine_Entry2);
            }
        }
        
        
        UQuest_Locations_OldMineGlossary_OldMineEntry2 GetLocations_OldMineGlossary_OldMineEntry2() property
        {
            return Cast<UQuest_Locations_OldMineGlossary_OldMineEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldMineGlossary_OldMineEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */