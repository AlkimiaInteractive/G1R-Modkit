#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_FISKNEWDEALER_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FISKNEWDEALER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_FISKNEWDEALER_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_FISKNEWDEALER_Cipher : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FISKNEWDEALER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKNOSLJ_20250528_114242"));
            }
        }
        
        
        class UDocumentSegment_CH1_FISKNEWDEALER_Sharky : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FISKNEWDEALER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKNOSLJ_20250528_115728"));
            }
        }
        
        
        class UDocumentSegment_CH1_FISKNEWDEALER_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FISKNEWDEALER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_FISKNEWDEALER_ENTRY_1"));
            }
        }
        
        
        class UDocument_CH1_FISKNEWDEALER : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_FISKNEWDEALER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_FISKNEWDEALER;
        }
    }
}
#endif /* WITH_STORY_G1R */