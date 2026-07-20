#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_GREAT_INVOCATION_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GREAT_INVOCATION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_175048"));
            }
        }
        
        
        class UDocumentSegment_CH2_GREAT_INVOCATION_AfterInvocation : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GREAT_INVOCATION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FZNMDQD_20250612_091937"));
            }
        }
        
        
        class UDocumentSegment_CH2_GREAT_INVOCATION_YberionIsDead : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GREAT_INVOCATION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WGTYQVI_20260331_120112"));
            }
        }
        
        
        class UDocument_CH2_GREAT_INVOCATION : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_GREAT_INVOCATION : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_GREAT_INVOCATION;
        }
    }
}
#endif /* WITH_STORY_G1R */