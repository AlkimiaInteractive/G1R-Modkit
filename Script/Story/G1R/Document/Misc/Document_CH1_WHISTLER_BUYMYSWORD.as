#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_QuestStart : UDocumentSegment
        {
            default InDocument = UDocument_CH1_WHISTLER_BUYMYSWORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_SKNOSLJ_20250521_144645"));
            }
        }
        
        
        class UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_ExtraNuggets : UDocumentSegment
        {
            default InDocument = UDocument_CH1_WHISTLER_BUYMYSWORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_UKNOSLJ_20250523_112922"));
            }
        }
        
        
        class UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_FailJOINOC : UDocumentSegment
        {
            default InDocument = UDocument_CH1_WHISTLER_BUYMYSWORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_SKNOSLJ_20250521_144939"));
            }
        }
        
        
        class UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_FailOtherCamp : UDocumentSegment
        {
            default InDocument = UDocument_CH1_WHISTLER_BUYMYSWORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_SKNOSLJ_20250521_145018"));
            }
        }
        
        
        class UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_CompleteJOINOC : UDocumentSegment
        {
            default InDocument = UDocument_CH1_WHISTLER_BUYMYSWORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_SKNOSLJ_20250521_145055"));
            }
        }
        
        
        class UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_CompleteOtherCamp : UDocumentSegment
        {
            default InDocument = UDocument_CH1_WHISTLER_BUYMYSWORD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_SKNOSLJ_20250521_145110"));
            }
        }
        
        
        class UDocument_CH1_WHISTLER_BUYMYSWORD : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_WHISTLER_BUYMYSWORD : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_WHISTLER_BUYMYSWORD;
        }
    }
}
#endif /* WITH_STORY_G1R */