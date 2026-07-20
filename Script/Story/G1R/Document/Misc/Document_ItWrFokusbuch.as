#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrFokusbuch_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrFokusbuch;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_BRKDUKF_20240327_154426"));
                AddSectionHeading(LocText("TEXT_WIP_BRKDUKF_20240327_154438"));
                AddParagraph(LocText("TEXT_WIP_BRKDUKF_20240327_154448"));
                AddParagraph(LocText("TEXT_WIP_BRKDUKF_20240327_154623"));
            }
        }
        
        
        class UDocument_ItWrFokusbuch : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrFokusbuch_Initial);
            default Title = "Document-ItWrFokusbuch-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrFokusbuch : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrFokusbuch;
        }
    }
}
#endif /* WITH_STORY_G1R */