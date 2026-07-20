#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_KALOMSRECIPE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_KALOMSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_KALOMSRECIPE_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_KALOMSRECIPE_Location : UDocumentSegment
        {
            default InDocument = UDocument_CH1_KALOMSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_KALOMSRECIPE_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH1_KALOMSRECIPE_Pretend : UDocumentSegment
        {
            default InDocument = UDocument_CH1_KALOMSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_KALOMSRECIPE_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_KALOMSRECIPE_Chest : UDocumentSegment
        {
            default InDocument = UDocument_CH1_KALOMSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_KALOMSRECIPE_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_KALOMSRECIPE_ImpressedOC : UDocumentSegment
        {
            default InDocument = UDocument_CH1_KALOMSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_KALOMSRECIPE_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH1_KALOMSRECIPE_ImpressedOutsider : UDocumentSegment
        {
            default InDocument = UDocument_CH1_KALOMSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_KALOMSRECIPE_ENTRY_7"));
            }
        }
        
        
        class UDocument_CH1_KALOMSRECIPE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_KALOMSRECIPE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_KALOMSRECIPE;
        }
    }
}
#endif /* WITH_STORY_G1R */