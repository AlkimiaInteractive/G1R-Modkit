#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldMineGlossary_OldMineEntry3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_OldMineGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.Tunnel_Opened != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OldMine, Document::UDocumentSegment_Glossary_OldMine_Entry3);
            }
        }
        
        
        UQuest_Locations_OldMineGlossary_OldMineEntry3 GetLocations_OldMineGlossary_OldMineEntry3() property
        {
            return Cast<UQuest_Locations_OldMineGlossary_OldMineEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldMineGlossary_OldMineEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */