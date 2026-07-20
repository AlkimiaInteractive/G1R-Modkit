#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_BOWARTISAN_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BOWARTISAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_144644"));
            }
        }
        
        
        class UDocumentSegment_CH1_BOWARTISAN_OakWood : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BOWARTISAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_145435"));
            }
        }
        
        
        class UDocumentSegment_CH1_BOWARTISAN_Willow : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BOWARTISAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_145453"));
            }
        }
        
        
        class UDocumentSegment_CH1_BOWARTISAN_IronWood : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BOWARTISAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_145514"));
            }
        }
        
        
        class UDocumentSegment_CH1_BOWARTISAN_Success : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BOWARTISAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_145537"));
            }
        }
        
        
        class UDocument_CH1_BOWARTISAN : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_BOWARTISAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_BOWARTISAN;
        }
    }
}
#endif /* WITH_STORY_G1R */