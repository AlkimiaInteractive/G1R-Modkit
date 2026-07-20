#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_RICELORDJOB_Intro : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDJOB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DAMPHUL_20250603_164657"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDJOB_Tavern : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDJOB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DAMPHUL_20250603_165131"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDJOB_Violent : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDJOB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DAMPHUL_20250603_165227"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDJOB_Peaceful : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDJOB;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DAMPHUL_20250603_165329"));
            }
        }
        
        
        class UDocument_CH1_RICELORDJOB : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_RICELORDJOB : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_RICELORDJOB;
        }
    }
}
#endif /* WITH_STORY_G1R */