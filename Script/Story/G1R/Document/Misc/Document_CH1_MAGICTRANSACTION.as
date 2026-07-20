#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_MAGICTRANSACTION_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MAGICTRANSACTION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKNOSLJ_20250528_170133"));
            }
        }
        
        
        class UDocumentSegment_CH1_MAGICTRANSACTION_Materials : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MAGICTRANSACTION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKNOSLJ_20250528_180041"));
            }
        }
        
        
        class UDocumentSegment_CH1_MAGICTRANSACTION_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MAGICTRANSACTION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKNOSLJ_20250528_171805"));
            }
        }
        
        
        class UDocument_CH1_MAGICTRANSACTION : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_MAGICTRANSACTION : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_MAGICTRANSACTION;
        }
    }
}
#endif /* WITH_STORY_G1R */