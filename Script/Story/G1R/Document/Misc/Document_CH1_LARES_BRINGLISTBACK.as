#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_LARES_BRINGLISTBACK_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_BRINGLISTBACK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GAMPHUL_20250606_115225"));
            }
        }
        
        
        class UDocumentSegment_CH1_LARES_BRINGLISTBACK_GivenToDiego : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_BRINGLISTBACK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GAMPHUL_20250606_115728"));
            }
        }
        
        
        class UDocumentSegment_CH1_LARES_BRINGLISTBACK_Success : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_BRINGLISTBACK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GAMPHUL_20250606_115340"));
            }
        }
        
        
        class UDocument_CH1_LARES_BRINGLISTBACK : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_LARES_BRINGLISTBACK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_LARES_BRINGLISTBACK;
        }
    }
}
#endif /* WITH_STORY_G1R */