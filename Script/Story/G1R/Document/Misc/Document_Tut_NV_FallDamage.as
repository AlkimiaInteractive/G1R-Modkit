#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_NV_FallDamage_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_NV_FallDamage;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_102017"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_102029"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_102041"));
            }
        }
        
        
        class UDocument_Tut_NV_FallDamage : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_NV_FallDamage_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_101939";
            default m_SortOrder = 101;
            default Metadata.Add(n"SortOrder", "101");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_NV_FallDamage : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_NV_FallDamage;
        }
    }
}
#endif /* WITH_STORY_G1R */