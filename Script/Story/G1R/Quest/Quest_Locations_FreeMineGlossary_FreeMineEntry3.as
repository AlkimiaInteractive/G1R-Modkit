#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_FreeMineGlossary_FreeMineEntry3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_FreeMineGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R != nullptr && G1R.IsDoorOpen(n"MainDoorEntranceFreeMineGate");
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FreeMine, Document::UDocumentSegment_Glossary_FreeMine_Entry3);
            }
        }
        
        
        UQuest_Locations_FreeMineGlossary_FreeMineEntry3 GetLocations_FreeMineGlossary_FreeMineEntry3() property
        {
            return Cast<UQuest_Locations_FreeMineGlossary_FreeMineEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_FreeMineGlossary_FreeMineEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */