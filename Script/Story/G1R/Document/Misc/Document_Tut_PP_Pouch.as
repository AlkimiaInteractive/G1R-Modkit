#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PP_Pouch_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PP_Pouch;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173001"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/pickpocketing_pouch_indicator"), LocText("TEXT_WIP_DABMKKF_20260223_154622"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173009"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173016"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173025"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173040"));
            }
        }
        
        
        class UDocument_Tut_PP_Pouch : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PP_Pouch_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_172948";
            default m_SortOrder = 1103;
            default Metadata.Add(n"SortOrder", "1103");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PP_Pouch : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PP_Pouch;
        }
    }
}
#endif /* WITH_STORY_G1R */