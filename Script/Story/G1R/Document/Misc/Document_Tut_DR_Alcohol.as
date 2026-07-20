#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_DR_Alcohol_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_DR_Alcohol;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_170336"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/alcohol_items"), LocText("TEXT_WIP_DABMKKF_20260223_154330"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_170339"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_112432"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_170408"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_112438"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_170428"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_112444"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_170446"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_170454"));
            }
        }
        
        
        class UDocument_Tut_DR_Alcohol : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_DR_Alcohol_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_165933";
            default m_SortOrder = 1206;
            default Metadata.Add(n"SortOrder", "1206");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_DR_Alcohol : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_DR_Alcohol;
        }
    }
}
#endif /* WITH_STORY_G1R */