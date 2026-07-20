#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_SyraRecipe_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_SyraRecipe;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HESOPYI_20250902_152042"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_132845"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_132915"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_132934"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_SyraRecipe : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_SyraRecipe_Initial);
            default Title = "TEXT_WIP_SRFQVSM_20250506_110136";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_SyraRecipe : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_SyraRecipe;
        }
    }
}
#endif /* WITH_STORY_G1R */