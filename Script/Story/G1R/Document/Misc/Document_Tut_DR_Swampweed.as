#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_DR_Swampweed_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_DR_Swampweed;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_165748"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/swampweed_joint_item"), LocText("TEXT_WIP_DABMKKF_20260223_154226"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_165758"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_112456"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_165813"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_112503"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_165829"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_112509"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_165854"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_165903"));
            }
        }
        
        
        class UDocument_Tut_DR_Swampweed : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_DR_Swampweed_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_165720";
            default m_SortOrder = 1207;
            default Metadata.Add(n"SortOrder", "1207");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_DR_Swampweed : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_DR_Swampweed;
        }
    }
}
#endif /* WITH_STORY_G1R */