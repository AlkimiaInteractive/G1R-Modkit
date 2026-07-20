#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_SleeperTempleGlossary_SleeperTempleEntry2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_SleeperTempleGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.AfterCinematic_Sleeper != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SleeperTemple, Document::UDocumentSegment_Glossary_SleeperTemple_Entry2);
            }
        }
        
        
        UQuest_Locations_SleeperTempleGlossary_SleeperTempleEntry2 GetLocations_SleeperTempleGlossary_SleeperTempleEntry2() property
        {
            return Cast<UQuest_Locations_SleeperTempleGlossary_SleeperTempleEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_SleeperTempleGlossary_SleeperTempleEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */