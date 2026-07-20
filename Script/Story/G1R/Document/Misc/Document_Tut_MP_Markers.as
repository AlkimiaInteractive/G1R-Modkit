#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MP_Markers_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MP_Markers;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132820"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/map_markers_menu"), LocText("TEXT_WIP_DABMKKF_20260223_155154"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132826"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132837"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/map_marker_placed"), LocText("TEXT_WIP_DABMKKF_20260223_155208"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132848"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132856"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132903"));
            }
        }
        
        
        class UDocument_Tut_MP_Markers : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MP_Markers_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_132812";
            default m_SortOrder = 903;
            default Metadata.Add(n"SortOrder", "903");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MP_Markers : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MP_Markers;
        }
    }
}
#endif /* WITH_STORY_G1R */