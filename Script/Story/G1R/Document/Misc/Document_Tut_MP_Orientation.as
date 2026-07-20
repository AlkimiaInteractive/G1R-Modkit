#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MP_Orientation_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MP_Orientation;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132647"));
                AddParagraph(LocText("TEXT_WIP_AOZFMND_20260417_171147"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/map_player_position"), LocText("TEXT_WIP_DABMKKF_20260223_155132"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132654"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132700"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132706"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132735"));
            }
        }
        
        
        class UDocument_Tut_MP_Orientation : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MP_Orientation_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_132635";
            default m_SortOrder = 902;
            default Metadata.Add(n"SortOrder", "902");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MP_Orientation : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MP_Orientation;
        }
    }
}
#endif /* WITH_STORY_G1R */