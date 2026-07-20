#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_MCPLATEARMOR_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_MCPLATEARMOR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_MCPLATEARMOR_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH4_MCPLATEARMOR_Enough : UDocumentSegment
        {
            default InDocument = UDocument_CH4_MCPLATEARMOR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_MCPLATEARMOR_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH4_MCPLATEARMOR_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH4_MCPLATEARMOR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_MCPLATEARMOR_ENTRY_2"));
            }
        }
        
        
        class UDocument_CH4_MCPLATEARMOR : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_MCPLATEARMOR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_MCPLATEARMOR;
        }
    }
}
#endif /* WITH_STORY_G1R */