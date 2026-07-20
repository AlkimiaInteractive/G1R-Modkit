#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_FOCUS_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FOCUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_FOCUS_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH2_FOCUS_NyrasGuide : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FOCUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MARSWDD_20250606_183952"));
            }
        }
        
        
        class UDocumentSegment_CH2_FOCUS_FocusLocation : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FOCUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MARSWDD_20250606_184340"));
            }
        }
        
        
        class UDocumentSegment_CH2_FOCUS_NyrasCrazy : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FOCUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_FOCUS_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH2_FOCUS_NyrasForgive : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FOCUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MARSWDD_20250606_190422"));
            }
        }
        
        
        class UDocumentSegment_CH2_FOCUS_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FOCUS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_FOCUS_ENTRY_3"));
            }
        }
        
        
        class UDocument_CH2_FOCUS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_FOCUS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_FOCUS;
        }
    }
}
#endif /* WITH_STORY_G1R */