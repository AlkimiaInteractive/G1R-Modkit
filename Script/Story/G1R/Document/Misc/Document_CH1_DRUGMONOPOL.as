#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_DRUGMONOPOL_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DRUGMONOPOL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DRUGMONOPOL_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_DRUGMONOPOL_SecretCave : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DRUGMONOPOL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DRUGMONOPOL_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_DRUGMONOPOL_Templars : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DRUGMONOPOL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DRUGMONOPOL_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH1_DRUGMONOPOL_SmartTalking : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DRUGMONOPOL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DRUGMONOPOL_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH1_DRUGMONOPOL_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DRUGMONOPOL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DRUGMONOPOL_ENTRY_1"));
            }
        }
        
        
        class UDocument_CH1_DRUGMONOPOL : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_DRUGMONOPOL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_DRUGMONOPOL;
        }
    }
}
#endif /* WITH_STORY_G1R */