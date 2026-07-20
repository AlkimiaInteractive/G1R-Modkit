#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_NV_Base_BasicMovement_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_NV_Base_BasicMovement;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WQHNQN_20260128_163030"));
                AddParagraph(LocText("TEXT_WIP_WQHNQN_20260128_163109"));
                AddParagraph(LocText("TEXT_WIP_HRKNBMD_20260401_150032"));
                AddParagraph(LocText("TEXT_WIP_WQHNQN_20260128_163132"));
                AddParagraph(LocText("TEXT_WIP_WQHNQN_20260128_163145"));
                AddParagraph(LocText("TEXT_WIP_WQHNQN_20260128_163202"));
                AddParagraph(LocText("TEXT_WIP_WQHNQN_20260128_163216"));
            }
        }
        
        
        class UDocument_Tut_NV_Base_BasicMovement : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_NV_Base_BasicMovement_Initial);
            default Title = "TEXT_WIP_WQHNQN_20260128_162956";
            default m_SortOrder = 1;
            default Metadata.Add(n"SortOrder", "1");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_NV_Base_BasicMovement : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_NV_Base_BasicMovement;
        }
    }
}
#endif /* WITH_STORY_G1R */