#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_FIGHTER_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIGHTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_113113"));
            }
        }
        
        
        class UDocumentSegment_CH1_FIGHTER_Return : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIGHTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_115753"));
            }
        }
        
        
        class UDocumentSegment_CH1_FIGHTER_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIGHTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_115829"));
            }
        }
        
        
        class UDocument_CH1_FIGHTER : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_FIGHTER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_FIGHTER;
        }
    }
}
#endif /* WITH_STORY_G1R */