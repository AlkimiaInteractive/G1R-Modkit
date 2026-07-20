#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_FreeMineGlossary_FreeMineEntry4 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_FreeMineGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_RECOVER != nullptr && Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_RECOVER.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FreeMine, Document::UDocumentSegment_Glossary_FreeMine_Entry4);
            }
        }
        
        
        UQuest_Locations_FreeMineGlossary_FreeMineEntry4 GetLocations_FreeMineGlossary_FreeMineEntry4() property
        {
            return Cast<UQuest_Locations_FreeMineGlossary_FreeMineEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_FreeMineGlossary_FreeMineEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */