#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_MERCHANTSPRICE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MERCHANTSPRICE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_165307"));
            }
        }
        
        
        class UDocumentSegment_CH1_MERCHANTSPRICE_Deed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MERCHANTSPRICE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_165837"));
            }
        }
        
        
        class UDocumentSegment_CH1_MERCHANTSPRICE_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MERCHANTSPRICE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_USOBSJK_20250718_170155"));
            }
        }
        
        
        class UDocument_CH1_MERCHANTSPRICE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_MERCHANTSPRICE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_MERCHANTSPRICE;
        }
    }
}
#endif /* WITH_STORY_G1R */