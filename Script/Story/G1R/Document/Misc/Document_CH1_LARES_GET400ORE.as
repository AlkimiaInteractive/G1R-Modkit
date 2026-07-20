#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_LARES_GET400ORE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_GET400ORE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_154929"));
            }
        }
        
        
        class UDocumentSegment_CH1_LARES_GET400ORE_Success : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_GET400ORE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_155019"));
            }
        }
        
        
        class UDocumentSegment_CH1_LARES_GET400ORE_KaganPlan : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_GET400ORE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_155108"));
            }
        }
        
        
        class UDocumentSegment_CH1_LARES_GET400ORE_IsidroInfo : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_GET400ORE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_155157"));
            }
        }
        
        
        class UDocumentSegment_CH1_LARES_GET400ORE_IsidroPlan : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_GET400ORE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_155241"));
            }
        }
        
        
        class UDocumentSegment_CH1_LARES_GET400ORE_IsidroSip : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_GET400ORE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_155335"));
            }
        }
        
        
        class UDocumentSegment_CH1_LARES_GET400ORE_IsidroNot : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_GET400ORE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_155439"));
            }
        }
        
        
        class UDocumentSegment_CH1_LARES_GET400ORE_IsidroBar : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LARES_GET400ORE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_155527"));
            }
        }
        
        
        class UDocument_CH1_LARES_GET400ORE : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_LARES_GET400ORE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_LARES_GET400ORE;
        }
    }
}
#endif /* WITH_STORY_G1R */