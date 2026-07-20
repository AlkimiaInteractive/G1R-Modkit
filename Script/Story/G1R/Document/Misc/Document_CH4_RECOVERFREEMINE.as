#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_RECOVERFREEMINE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_RECOVERFREEMINE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WVUDSGD_20250620_152928"));
            }
        }
        
        
        class UDocumentSegment_CH4_RECOVERFREEMINE_Recovered : UDocumentSegment
        {
            default InDocument = UDocument_CH4_RECOVERFREEMINE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WVUDSGD_20250620_155824"));
            }
        }
        
        
        class UDocumentSegment_CH4_RECOVERFREEMINE_Wolf : UDocumentSegment
        {
            default InDocument = UDocument_CH4_RECOVERFREEMINE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WVUDSGD_20250620_155754"));
            }
        }
        
        
        class UDocument_CH4_RECOVERFREEMINE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_RECOVERFREEMINE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_RECOVERFREEMINE;
        }
    }
}
#endif /* WITH_STORY_G1R */