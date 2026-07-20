#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_CHROMANIN_Book1 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CHROMANIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_161536"));
            }
        }
        
        
        class UDocumentSegment_CH1_CHROMANIN_Book2 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CHROMANIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_161616"));
            }
        }
        
        
        class UDocumentSegment_CH1_CHROMANIN_Book3 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CHROMANIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_161639"));
            }
        }
        
        
        class UDocumentSegment_CH1_CHROMANIN_Book4 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CHROMANIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_161718"));
            }
        }
        
        
        class UDocumentSegment_CH1_CHROMANIN_Book5 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CHROMANIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_161744"));
            }
        }
        
        
        class UDocumentSegment_CH1_CHROMANIN_Book6 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CHROMANIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_161818"));
            }
        }
        
        
        class UDocument_CH1_CHROMANIN : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_CHROMANIN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_CHROMANIN;
        }
    }
}
#endif /* WITH_STORY_G1R */