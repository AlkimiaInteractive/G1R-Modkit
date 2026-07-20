#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_SCAVENGERRAIDER_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SCAVENGERRAIDER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XXAISVL_20250616_141823"));
            }
        }
        
        
        class UDocumentSegment_CH1_SCAVENGERRAIDER_Material : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SCAVENGERRAIDER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XXAISVL_20250616_142053"));
            }
        }
        
        
        class UDocumentSegment_CH1_SCAVENGERRAIDER_Wait : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SCAVENGERRAIDER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XXAISVL_20250616_142111"));
            }
        }
        
        
        class UDocumentSegment_CH1_SCAVENGERRAIDER_Success : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SCAVENGERRAIDER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XXAISVL_20250616_142126"));
            }
        }
        
        
        class UDocument_CH1_SCAVENGERRAIDER : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_SCAVENGERRAIDER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_SCAVENGERRAIDER;
        }
    }
}
#endif /* WITH_STORY_G1R */