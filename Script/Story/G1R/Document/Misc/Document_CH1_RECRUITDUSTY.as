#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_RECRUITDUSTY_TondralStart : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RECRUITDUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_RECRUITDUSTY_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_RECRUITDUSTY_MelvinStart : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RECRUITDUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_RECRUITDUSTY_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH1_RECRUITDUSTY_DustyStart : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RECRUITDUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_RECRUITDUSTY_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH1_RECRUITDUSTY_ConvinceDusty : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RECRUITDUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_RECRUITDUSTY_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH1_RECRUITDUSTY_Advice : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RECRUITDUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_RECRUITDUSTY_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH1_RECRUITDUSTY_Bribe : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RECRUITDUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_RECRUITDUSTY_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_RECRUITDUSTY_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RECRUITDUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_RECRUITDUSTY_ENTRY_2"));
            }
        }
        
        
        class UDocument_CH1_RECRUITDUSTY : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_RECRUITDUSTY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_RECRUITDUSTY;
        }
    }
}
#endif /* WITH_STORY_G1R */