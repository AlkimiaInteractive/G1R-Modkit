#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_CRONOS_MESSENGER_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_CRONOS_MESSENGER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BYAISVL_20250612_171851"));
            }
        }
        
        
        class UDocumentSegment_CH2_CRONOS_MESSENGER_Milten : UDocumentSegment
        {
            default InDocument = UDocument_CH2_CRONOS_MESSENGER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BYAISVL_20250612_172111"));
            }
        }
        
        
        class UDocumentSegment_CH2_CRONOS_MESSENGER_Reward : UDocumentSegment
        {
            default InDocument = UDocument_CH2_CRONOS_MESSENGER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BYAISVL_20250612_172122"));
            }
        }
        
        
        class UDocument_CH2_CRONOS_MESSENGER : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_CRONOS_MESSENGER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_CRONOS_MESSENGER;
        }
    }
}
#endif /* WITH_STORY_G1R */