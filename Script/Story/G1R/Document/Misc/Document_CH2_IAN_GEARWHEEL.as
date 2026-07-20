#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_IAN_GEARWHEEL_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_IAN_GEARWHEEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_103949"));
            }
        }
        
        
        class UDocumentSegment_CH2_IAN_GEARWHEEL_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_IAN_GEARWHEEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_111905"));
            }
        }
        
        
        class UDocument_CH2_IAN_GEARWHEEL : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_IAN_GEARWHEEL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_IAN_GEARWHEEL;
        }
    }
}
#endif /* WITH_STORY_G1R */