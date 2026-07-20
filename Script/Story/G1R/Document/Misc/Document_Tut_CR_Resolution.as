#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CR_Resolution_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CR_Resolution;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125351"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_111804"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125406"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_111813"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125441"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_111819"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125455"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_111826"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125515"));
                AddSectionHeading(LocText("TEXT_WIP_WGTYQVI_20260331_173115"));
                AddParagraph(LocText("TEXT_WIP_WGTYQVI_20260331_173153"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_125522"));
            }
        }
        
        
        class UDocument_Tut_CR_Resolution : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CR_Resolution_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_125340";
            default m_SortOrder = 1009;
            default Metadata.Add(n"SortOrder", "1009");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CR_Resolution : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CR_Resolution;
        }
    }
}
#endif /* WITH_STORY_G1R */