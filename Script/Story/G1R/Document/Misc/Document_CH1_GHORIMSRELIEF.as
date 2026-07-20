#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_GHORIMSRELIEF_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_GHORIMSRELIEF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_GHORIMSRELIEF_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_GHORIMSRELIEF_Lazy : UDocumentSegment
        {
            default InDocument = UDocument_CH1_GHORIMSRELIEF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_GHORIMSRELIEF_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_GHORIMSRELIEF_Beated : UDocumentSegment
        {
            default InDocument = UDocument_CH1_GHORIMSRELIEF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_GHORIMSRELIEF_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH1_GHORIMSRELIEF_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_GHORIMSRELIEF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_GHORIMSRELIEF_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_GHORIMSRELIEF_Fail : UDocumentSegment
        {
            default InDocument = UDocument_CH1_GHORIMSRELIEF;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MZURCZK_20260113_144509"));
            }
        }
        
        
        class UDocument_CH1_GHORIMSRELIEF : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_GHORIMSRELIEF : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_GHORIMSRELIEF;
        }
    }
}
#endif /* WITH_STORY_G1R */