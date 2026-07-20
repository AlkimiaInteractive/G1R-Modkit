#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_BULLYFORBULLIT_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BULLYFORBULLIT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPWCOUK_20250710_152745"));
            }
        }
        
        
        class UDocumentSegment_CH2_BULLYFORBULLIT_Beated : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BULLYFORBULLIT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DTOBSJK_20250711_120951"));
            }
        }
        
        
        class UDocumentSegment_CH2_BULLYFORBULLIT_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BULLYFORBULLIT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DTOBSJK_20250711_121127"));
            }
        }
        
        
        class UDocument_CH2_BULLYFORBULLIT : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_BULLYFORBULLIT : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_BULLYFORBULLIT;
        }
    }
}
#endif /* WITH_STORY_G1R */