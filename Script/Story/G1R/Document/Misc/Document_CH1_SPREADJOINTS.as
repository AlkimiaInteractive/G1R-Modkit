#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_SPREADJOINTS_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SPREADJOINTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SPREADJOINTS_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_SPREADJOINTS_Complete : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SPREADJOINTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SPREADJOINTS_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_SPREADJOINTS_Report : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SPREADJOINTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_142733"));
            }
        }
        
        
        class UDocument_CH1_SPREADJOINTS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_SPREADJOINTS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_SPREADJOINTS;
        }
    }
}
#endif /* WITH_STORY_G1R */