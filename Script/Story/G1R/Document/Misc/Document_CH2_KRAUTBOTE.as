#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_KRAUTBOTE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_KRAUTBOTE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_KRAUTBOTE_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH2_KRAUTBOTE_Thorus : UDocumentSegment
        {
            default InDocument = UDocument_CH2_KRAUTBOTE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_KRAUTBOTE_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH2_KRAUTBOTE_Bartholo : UDocumentSegment
        {
            default InDocument = UDocument_CH2_KRAUTBOTE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_KRAUTBOTE_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH2_KRAUTBOTE_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_KRAUTBOTE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_KRAUTBOTE_ENTRY_3"));
            }
        }
        
        
        class UDocument_CH2_KRAUTBOTE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_KRAUTBOTE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_KRAUTBOTE;
        }
    }
}
#endif /* WITH_STORY_G1R */