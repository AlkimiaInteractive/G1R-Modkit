#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_NV_Base_Diving_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_NV_Base_Diving;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111009"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111026"));
                AddParagraph(LocText("TEXT_WIP_AOZFMND_20260417_170058"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111038"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111047"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111103"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_111131"));
            }
        }
        
        
        class UDocument_Tut_NV_Base_Diving : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_NV_Base_Diving_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_101821";
            default m_SortOrder = 2;
            default Metadata.Add(n"SortOrder", "2");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_NV_Base_Diving : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_NV_Base_Diving;
        }
    }
}
#endif /* WITH_STORY_G1R */