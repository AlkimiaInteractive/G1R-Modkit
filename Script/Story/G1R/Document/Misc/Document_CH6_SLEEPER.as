#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH6_SLEEPER_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH6_SLEEPER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH6_SLEEPER_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH6_SLEEPER_Xardas : UDocumentSegment
        {
            default InDocument = UDocument_CH6_SLEEPER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_145509"));
            }
        }
        
        
        class UDocument_CH6_SLEEPER : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH6_SLEEPER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH6_SLEEPER;
        }
    }
}
#endif /* WITH_STORY_G1R */