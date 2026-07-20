#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MP_Unlock_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MP_Unlock;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132525"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132532"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132540"));
                AddParagraph(LocText("TEXT_WIP_EBBFEBC_20260205_132548"));
            }
        }
        
        
        class UDocument_Tut_MP_Unlock : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MP_Unlock_Initial);
            default Title = "TEXT_WIP_EBBFEBC_20260205_132432";
            default m_SortOrder = 901;
            default Metadata.Add(n"SortOrder", "901");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MP_Unlock : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MP_Unlock;
        }
    }
}
#endif /* WITH_STORY_G1R */